function [tao, d] = ctrEta(index, Omega, L, Eta, Etad, Etadd, V, Varphi1, loop)
    epos = [0, 0]; eyaw = 0; eposd = [0, 0]; eyawd = 0;
    posdd = [0, 0]; yawdd = 0; alpha = diag([0, 0, 0]);
    neighbor_node = find(L(index,:)~=0);
    
    %% 滑模面
    for j=neighbor_node
        % 计算相关变量
        epos = epos + -Omega(index, j)*(Eta{index}(loop,1:2)-Eta{j}(loop,1:2));
        eposd = eposd + -Omega(index, j)*(Etad{index}(loop,1:2)-Etad{j}(loop,1:2));
        eyaw = eyaw + (Eta{index}(loop,3)-Eta{j}(loop,3));
        eyawd = eyawd + (Etad{index}(loop,3)-Etad{j}(loop,3));        

        alpha = alpha + diag([Omega(index, j), Omega(index, j), -1]);

        posdd = posdd + Omega(index, j)*Etadd{j}(loop,1:2);
        yawdd = yawdd + -1*(Etadd{j}(loop,3));
    end
    K = diag([30,30,10]); % 滑模面线性系数, 也是线性系统的A
%     K = diag([100, 100, 8]); h = 100;
    z = [epos, eyaw]; zd = [eposd, eyawd]; zdd = [posdd, yawdd];
    s = zd + z*K;
    
    %% 黎卡提方程
    Gamma = diag([10, 10, 10]); % 误差权衡系数
    Lambda = diag([10, 10, 10]); % 控制力矩权衡系数
    B = diag([1, 1, 1]); % 线性系统的B
    [P,~,~] = icare(K, B, Gamma, Lambda);
    
    %% 水动力系数
    J = reshape(obtain_J(Eta{index}(loop,:)), 3, 3);
    M = reshape(obtain_M(), 3, 3);
    C = reshape(obtain_C(Etad{index}(loop,:)*J'), 3, 3);
    D = reshape(obtain_D(Etad{index}(loop,:)*J'), 3, 3);
    
    Sr = [0 -V{index}(loop,3) 0; V{index}(loop,3) 0 0; 0 0 0];
    C__ = J*(C-M*Sr)*J';
    D__ = J*D*J';
%    Ac_M = 0.9*M; unk_M = 0.1*M;    
    
    F = J*Sr*V{index}(loop,:)' - J*inv(M)*C*V{index}(loop,:)' - J*inv(M)*D*V{index}(loop,:)';
    F__ = -(Etad{index}(loop,:)*C__'+Etad{index}(loop,:)*D__')*J*inv(M)'*J';
    

%      tao = -1/alpha * (s*P'*inv(Lambda) + z*K*K - zdd + alpha*Varphi1{index}(loop,:))*J*M';
    tao = -(-s*P'*inv(Lambda) + z*K*K - zdd + Varphi1{index}(loop,:)*alpha)*J*M'*inv(alpha);
%    tao = -1/alpha * (s*P'*inv(Lambda) + z*K*K - zdd + alpha*F')*J*M';

    d = F' - Varphi1{index}(loop,:);
    for i = 1:3
        if abs(tao(i))>500
            tao(i) = sign(tao(i))*500;
        end
    end
    
    
end