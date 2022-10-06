function [tao] = ctrEta(index, Omega, L, Eta, Etad, Etadd, M__, C__, D__, loop)
    epos = [0, 0]; eyaw = 0; eposd = [0, 0]; eyawd = 0;
    posdd = [0, 0]; yawdd = 0; alpha = 0;
    neighbor_node = find(L(index,:)~=0);
    

    for j=neighbor_node
        % 计算相关变量
        epos = epos + -Omega(index, j)*(Eta{index}(loop,1:2)-Eta{j}(loop,1:2));
        eposd = eposd + -Omega(index, j)*(Etad{index}(loop,1:2)-Etad{j}(loop,1:2));
        eyaw = eyaw + Eta{index}(loop,3)-Eta{j}(loop,3);
        eyawd = eyawd + Etad{index}(loop,3)-Etad{j}(loop,3);
        
        alpha = alpha + diag([Omega(index, j), Omega(index, j), -1]);
        posdd = posdd + Omega(index, j)*Etadd{j}(end,1:2);
        yawdd = yawdd + -1*Etadd{j}(end,3);
    end
    k1 = diag([30,30,10]); h = 100;
    z = [epos, eyaw]; zd = [eposd, eyawd]; zdd = [posdd, yawdd];
    s = zd + z*k1;
    
    M__ = reshape(M__{index}(loop,:), 3, 3);
    C__ = reshape(C__{index}(loop,:), 3, 3);
    D__ = reshape(D__{index}(loop,:), 3, 3);
    
    tao = Etad{index}(loop,:) * C__' + Etad{index}(loop,:) * D__' ...
        + (zdd + h*s) * M__' * inv(alpha);

    for i = 1:3
        if abs(tao(i))>500
            tao(i) = sign(tao(i))*500;
        end
    end
end