function [Varphi0, Varphi1] = adaptive(Eta, Etad, Varphi0, Varphi1, Tao, loop, index, dt)
eta = Eta{index}(loop,:); 
Etad = Etad{index}(loop,:);

Varphi0 = Varphi0{index}(loop,:); 
Varphi1 = Varphi1{index}(loop,:);

tao = Tao{index}(loop,:);

J = reshape( obtain_J(eta), 3, 3);
M = reshape( obtain_M(), 3, 3);

% Mu0 = -12/8*sig(Varphi0-Etad, 1/2) + Varphi1;
alpha1 = diag([3.5, 4.5, 5]);
alpha2 = diag([3.5, 4.5, 5]);
Mu0 = -sig(Varphi0-Etad, 1/2)*alpha1 + Varphi1;

dVarphi0 = tao*inv(0.9*M)'*J' + Mu0;
dVarphi1 = -sig(Varphi1-Mu0, 1) * alpha2;

Varphi0 = Varphi0 + dVarphi0*dt;
Varphi1 = Varphi1 + dVarphi1*dt;
end