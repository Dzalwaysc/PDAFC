function tao = ctrEta(index, W, L, Eta, Etad, Etadd, Varphi1, loop)
    epos = [0, 0]; eyaw = 0; eposd = [0, 0]; eyawd = 0;
    posdd = [0, 0]; yawdd = 0; alpha = diag([0, 0, 0]);
    neighbor_node = find(L(index,:)~=0);
    
    %% 滑模面
    for j=neighbor_node
        % 计算相关变量
        epos = epos + -1 * W(index, j)*(Eta{index}(loop,1:2)-Eta{j}(loop,1:2));
        eposd = eposd + -1 * W(index, j)*(Etad{index}(loop,1:2)-Etad{j}(loop,1:2));
        
        
        Yaw_err = Eta{index}(loop,3)-Eta{j}(loop,3);
        if Yaw_err > pi
            Yaw_err = Yaw_err-2*pi;
        elseif Yaw_err <= -pi
            Yaw_err = Yaw_err+2*pi;
        end
        eyaw = eyaw + Yaw_err;
        eyawd = eyawd + (Etad{index}(loop,3)-Etad{j}(loop,3));     

        alpha = alpha + diag([W(index, j), W(index, j), -1]);

        posdd = posdd + W(index, j) * Etadd{j}(loop,1:2);
        yawdd = yawdd + (Etadd{j}(loop,3));
    end
    K = diag([2,2,5]); % 滑模面线性系数, 也是线性系统的A
    % K = diag([30,30,10]); % 滑模面线性系数, 也是线性系统的A
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
    Ac_M = 0.9*M;
    
    tao = -(-s*P'*inv(Lambda) + z*K*K - zdd + Varphi1{index}(loop,:)*alpha)*J*Ac_M'*inv(alpha);
    for i = 1:2
        if abs(tao(i))>50
            tao(i) = sign(tao(i))*50;
        end
    end
    if abs(tao(3))>10
        tao(3) = sign(tao(3))*10;
    end
    
end