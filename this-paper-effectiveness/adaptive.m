function [Varphi0, Varphi1] = adaptive(Eta, Etad, Varphi0, Varphi1, Tao, loop, index, dt)
eta = Eta{index}(loop,:); 
Etad = Etad{index}(loop,:);

Varphi0 = Varphi0{index}(loop,:); 
Varphi1 = Varphi1{index}(loop,:);

tao = Tao{index}(loop,:);

J = reshape( obtain_J(eta), 3, 3);
M = reshape( obtain_M(), 3, 3);

Mu0 = -12*sig(Varphi0-Etad, 1/2) + Varphi1;
dVarphi0 = tao*inv(M)'*J' + Mu0;
dVarphi1 = -12*sign(Varphi1-Mu0);

Varphi0 = Varphi0 + dVarphi0*dt;
Varphi1 = Varphi1 + dVarphi1*dt;
end