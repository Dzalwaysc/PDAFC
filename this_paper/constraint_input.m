function [tao_contraint, d] = constraint_input(tao, max_tao)
    if max_tao == 500
        R = 1000;
        d = Pra_500(R,tao);
        tao_contraint = p0_500(R)*tao - d;
        
    else
        R = 600;
        d = Pra_300(R,tao);
        tao_contraint = p0_300(R)*tao - d;
    end
end