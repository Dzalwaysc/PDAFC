clear all
% topology graph
[r, edge, A, Omega] = affineGraph();
d = size(r,2);

% trajectory xr = Ar+b
via_ = sttraj();
dt = 0.01; acc = 100;
[rTra, rTrad, rTradd, tr] = mstraj_(via_, ones(1,6), dt, acc);
[desPos, desPosd, desPosdd] = dptraj(r, rTra, rTrad, rTradd, tr);
[desYaw, desYawd, desYawdd] = dytraj(desPosd, tr, dt);

%% initial position
for i=1:3
    Eta{i}(1,:) = [desPos{i}(1,:), desYaw{i}(1)];
    Etad{i}(1,:) = [desPosd{i}(1,:), desYawd{i}(1)];
    Etadd{i}(1,:) = [desPosdd{i}(1,:), desYawdd{i}(1)];
end

Pos{4}(1,:) = [0 15]; Yaw{4}(1) = 30*pi/180;
Pos{5}(1,:) = [0 -17]; Yaw{5}(1) = -30*pi/180;
Pos{6}(1,:) = [-10 10]; Yaw{6}(1) = 145*pi/180;
Pos{7}(1,:) = [-16 -16]; Yaw{7}(1) = 5*pi/180;
for i=4:7
    Eta{i}(1,:) = obEta(Pos{i}(1,:), Yaw{i}(1));
    V{i}(1,:) = zeros(1,3);
    Varphi0{i}(1,:) = zeros(1,3);
    Varphi1{i}(1,:) = zeros(1,3);
    Tao{i}(1,:) = zeros(1,3); 
    [Eta{i}(1,:), Etad{i}(1,:), Etadd{i}(1,:), V{i}(1,:), F{i}(1,:)] = ...
            platform([Eta{i}(1,:)'; V{i}(1,:)'], Tao{i}(1,:)', dt, 0);   
end

%% simulation
loop = 0;
for t=tr(1):dt:tr(end-1)
    loop = loop+1;
        
    for i=1:3
        Eta{i}(loop+1,:) = [desPos{i}(loop+1,:), desYaw{1}(loop+1)]; 
        Etad{i}(loop+1,:) = [desPosd{i}(loop+1,:), desYawd{1}(loop+1)];
        Etadd{i}(loop+1,:) = [desPosdd{i}(loop+1,:), desYawdd{1}(loop+1)];
    end
    
    for i=4:7
        [Varphi0{i}(loop+1,:), Varphi1{i}(loop+1,:)] = adaptive(Eta, Etad, Varphi0, Varphi1, Tao, loop, i, dt);
        Tao{i}(loop+1,:) = ctrEta(i, Omega, A, Eta, Etad, Etadd, Varphi1, loop);
        [Eta{i}(loop+1,:), Etad{i}(loop+1,:), Etadd{i}(loop+1,:), V{i}(loop+1,:), F{i}(loop+1,:)] = ...
            platform([Eta{i}(loop,:)'; V{i}(loop,:)'], Tao{i}(loop+1,:)', dt, t);
        
        O1{i}(loop,:) = Varphi0{i}(loop+1,:) - Etad{i}(loop,:);
        O2{i}(loop,:) = F{i}(loop,:) - Varphi1{i}(loop+1,:);
    end
    fprintf('The time is %f\n', t);
end
