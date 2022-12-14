function [eta, etad, etadd, V, F] = platform(state, tao, step, t)
    dstate = plant(t, state, tao);
    state = state + dstate*step;
    eta = state(1:3);
    V = state(4:6);
    R = reshape(obtain_J(eta), 3, 3);
    etad = R*V;
    %% 计算Euler-Lagrange下的参数
    u = V(1); v = V(2); r = V(3);
    M = [25.8  0  0;  0  33.8  1.0115; 0  1.0948  2.76]; unk_M = 0.1*M;
    c13 = -33.8*v - 1.0115*r; c23 = 25.8*u; c31 = 33.8*v + 1.0115*r; c32 = -25.8*u;
    C = [0  0  c13;  0  0  c23;  c31  c32  0];
    d11 = 0.72 + 1.33 * abs(u) + 5.87 * (u)^2; d22 = 0.8896 + 36.5 * abs(v) + 0.805 * abs(r);
    d23 = 7.25 + 0.845 * abs(v) + 3.45 * abs(r); d32 = 0.0313 + 3.96 * abs(v) + 0.13 * abs(r);
    d33 = 1.9 - 0.08 * abs(v) + 0.75 * abs(r);
    D = [d11  0  0;  0  d22  d23;  0  d32  d33];
    
    W = [0 -r 0; r 0 0; 0 0 0]; dR = R*W;
    M_ = R*M*R'; M__ = M_(:);
    C_ = R*(C-M*R'*dR)*R'; C__ = C_(:);
    D_ = R*D*R'; D__ = D_(:);
    taod = [-2*cos(0.05*t)*cos(0.3*t)-3; 1.5*sin(0.03*t); 0.6*sin(0.05*t)*cos(0.01*t)];
    F_ = inv(M_)*(-C_*etad-D_*etad+R*taod);
    etadd = F_+inv(M_)*R*tao;
    
    F = R*W*V + R*inv(M)*taod - R*inv(M)*C*V - R*inv(M)*D*V + R*inv(unk_M)*tao;
end