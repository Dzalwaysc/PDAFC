% clear all
% %% topology graph
% [r, edge, A, Omega] = affineGraph();
% % 
% %% trajectory xr = Ar+b
% via_ = sttraj();
% dt = 0.01; acc = 100;
% [rTra, rTrad, rTradd, tr] = mstraj_(via_, ones(1,6), dt, acc);
% [desPos, desPosd, desPosdd] = dptraj(r, rTra, rTrad, rTradd, tr);
% [desYaw, desYawd, desYawdd] = dytraj(desPosd, tr, dt);

%% initial position
for i=1:3
    Eta_dif{i}(1,:) = [desPos{i}(1,:), desYaw{i}(1)];
    Etad_dif{i}(1,:) = [desPosd{i}(1,:), desYawd{i}(1)];
    Etadd_dif{i}(1,:) = [desPosdd{i}(1,:), desYawdd{i}(1)];
end

Pos_dif{4}(1,:) = [0 15]; Yaw_dif{4}(1) = 30*pi/180;
Pos_dif{5}(1,:) = [0 -17]; Yaw_dif{5}(1) = -30*pi/180;
Pos_dif{6}(1,:) = [-10 10]; Yaw_dif{6}(1) = 145*pi/180;
Pos_dif{7}(1,:) = [-16 -16]; Yaw_dif{7}(1) = 5*pi/180;
for i=4:7
    Eta_dif{i}(1,:) = obEta(Pos_dif{i}(1,:), Yaw_dif{i}(1));
    V_dif{i}(1,:) = zeros(1,3);
    Tao_dif{i}(1,:) = zeros(1,3); 
    [Eta_dif{i}(1,:), Etad_dif{i}(1,:), Etadd_dif{i}(1,:), V_dif{i}(1,:), C__dif{i}(1,:), D__dif{i}(1,:), M__dif{i}(1,:)] = ...
            platform([Eta_dif{i}(1,:)'; V_dif{i}(1,:)'], Tao_dif{i}(1,:)', dt, 0);   
end

%% simulation
loop = 0;
for t=tr(1):dt:tr(end-1)
    loop = loop+1;
        
    for i=1:3
        Eta_dif{i}(loop+1,:) = [desPos{i}(loop+1,:), desYaw{1}(loop+1)]; 
        Etad_dif{i}(loop+1,:) = [desPosd{i}(loop+1,:), desYawd{1}(loop+1)];
        Etadd_dif{i}(loop+1,:) = [desPosdd{i}(loop+1,:), desYawdd{1}(loop+1)];
    end        
    
    for i=4:7
        tao_dif = ctrEta(i, Omega, A, Eta_dif, Etad_dif, Etadd_dif, M__dif, C__dif, D__dif, loop);
        Tao_dif{i}(loop,:) = tao_dif;
        [Eta_dif{i}(loop+1,:), Etad_dif{i}(loop+1,:), Etadd_dif{i}(1,:), V_dif{i}(loop+1,:), C__dif{i}(loop+1,:), D__dif{i}(loop+1,:), M__dif{i}(loop+1,:)] = ...
            platform([Eta_dif{i}(loop,:)'; V_dif{i}(loop,:)'], Tao_dif{i}(loop,:)', dt, t);
    end
    fprintf('The time is %f\n', t);
end
