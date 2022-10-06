function dstate = plant(t, state, tao)
%% In
phi = state(3);
u = state(4); v = state(5); r = state(6); V = state(4:6);

%% Newton-form
M = reshape(obtain_M(), 3, 3);
C = reshape(obtain_C([u,v,r]), 3, 3);
D = reshape(obtain_D([u,v,r]), 3, 3);
J = reshape(obtain_J(state(1:3)), 3, 3);

taod = [-2*cos(0.05*t)*cos(0.3*t)-3; 1.5*sin(0.03*t); 0.6*sin(0.05*t)*cos(0.01*t)];

R = [cos(phi) -sin(phi)  0;
     sin(phi)  cos(phi)  0;
        0        0       1];
deta = J*V;
dV = inv(M)*(tao-C*V-D*V+taod);

dstate = [deta; dV];