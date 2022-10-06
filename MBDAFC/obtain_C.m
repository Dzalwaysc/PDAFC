function C = obtain_C(Etad)
u = Etad(1); v = Etad(2); r = Etad(3);

c13 = -33.8*v - 1.0115*r;
c23 = 25.8*u;
c31 = 33.8*v + 1.0115*r;
c32 = -25.8*u;
C_ = [0    0    c13;
     0    0    c23;
    c31  c32    0];

C = reshape(C_, 9, 1);
end