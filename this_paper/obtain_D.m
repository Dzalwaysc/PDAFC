function D = obtain_D(Etad)
u = Etad(1); v = Etad(2); r = Etad(3);

d11 = 0.72 + 1.33 * abs(u) + 5.87 * (u)^2;
d22 = 0.8896 + 36.5 * abs(v) + 0.805 * abs(r);
d23 = 7.25 + 0.845 * abs(v) + 3.45 * abs(r);
d32 = 0.0313 + 3.96 * abs(v) + 0.13 * abs(r);
d33 = 1.9 - 0.08 * abs(v) + 0.75 * abs(r);
D_ = [d11  0     0;
      0  d22  d23;
      0  d32  d33];

D = reshape(D_, 9, 1);
end