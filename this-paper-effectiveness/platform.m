function [eta, etad, V] = platform(state, tao, step, t)
%     % start stage
%     dstate = plant(t, state, tao);
%     K1 = dstate;
%     
%     % middle stage
%     state_ = state + (step/2)*K1;
%     dstate_ = plant(t, state_, tao);
%     K2 = dstate_;
%     
%     % middle stage
%     state_ = state + (step/2)*K2;
%     dstate_ = plant(t, state_, tao);
%     K3 = dstate_;
%     
%     % final stage
%     state_ = state + (step/2)*K3;
%     dstate_ = plant(t, state_, tao);
%     K4 = dstate_;
%     
%     state = state + (step/6)*(K1+2*K2+2*K3+K4);
%     
%     eta = state(1:3);
%     V = state(4:6);
%     J = reshape(obtain_J(eta), 3, 3);
%     etad = J*V;

    dstate = plant(t, state, tao);
    state = state + dstate*step;
    eta = state(1:3);
    V = state(4:6);
    J = reshape(obtain_J(eta), 3, 3);
    etad = J*V;
end