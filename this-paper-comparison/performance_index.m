%% 性能指标计算，把误差累加
len = size(Tao{4},1);
Theorem1_IAE{4}(1) = 0; Theorem1_IAE{5}(1) = 0;
Theorem1_IAE{6}(1) = 0; Theorem1_IAE{7}(1) = 0;
Theorem1_IAE_dif{4}(1) = 0; Theorem1_IAE_dif{5}(1) = 0;
Theorem1_IAE_dif{6}(1) = 0; Theorem1_IAE_dif{7}(1) = 0;
for i=2:len-1
    Theorem1_IAE{4}(i) = Theorem1_IAE{4}(i-1) + norm(Tao{4}(i,:));
    Theorem1_IAE{5}(i) = Theorem1_IAE{5}(i-1) + norm(Tao{5}(i,:));
    Theorem1_IAE{6}(i) = Theorem1_IAE{6}(i-1) + norm(Tao{6}(i,:));
    Theorem1_IAE{7}(i) = Theorem1_IAE{7}(i-1) + norm(Tao{7}(i,:));
    
    Theorem1_IAE_dif{4}(i) = Theorem1_IAE_dif{4}(i-1) + norm(Tao_dif{4}(i,:));
    Theorem1_IAE_dif{5}(i) = Theorem1_IAE_dif{5}(i-1) + norm(Tao_dif{5}(i,:));
    Theorem1_IAE_dif{6}(i) = Theorem1_IAE_dif{6}(i-1) + norm(Tao_dif{6}(i,:));
    Theorem1_IAE_dif{7}(i) = Theorem1_IAE_dif{7}(i-1) + norm(Tao_dif{7}(i,:));
end


figure(4);
xx = [0, 50, 100, 150, 200, 250];
yy1 = [0, Theorem1_IAE{4}(50), Theorem1_IAE{4}(100), Theorem1_IAE{4}(150), Theorem1_IAE{4}(200), Theorem1_IAE{4}(250)];
yy2 = [0, Theorem1_IAE{5}(50), Theorem1_IAE{5}(100), Theorem1_IAE{5}(150), Theorem1_IAE{5}(200), Theorem1_IAE{5}(250)];
yy3 = [0, Theorem1_IAE{6}(50), Theorem1_IAE{6}(100), Theorem1_IAE{6}(150), Theorem1_IAE{6}(200), Theorem1_IAE{6}(250)];
yy4 = [0, Theorem1_IAE{7}(50), Theorem1_IAE{7}(100), Theorem1_IAE{7}(150), Theorem1_IAE{7}(200), Theorem1_IAE{7}(250)];
plot(xx, yy1, '-', 'LineWidth', 2, 'Color', [0 0.4470 0.7410]);
hold on
plot(xx, yy2, '-', 'LineWidth', 2, 'Color', [0.9290 0.6940 0.1250]);
hold on
plot(xx, yy3, '-', 'LineWidth', 2, 'Color', [0.4940 0.1840 0.5560]);
hold on
plot(xx, yy4, '-', 'LineWidth', 2, 'Color', [0.3010 0.7450 0.9330]);
hold on

yy1 = [0, Theorem1_IAE_dif{4}(50), Theorem1_IAE_dif{4}(100), Theorem1_IAE_dif{4}(150), Theorem1_IAE_dif{4}(200), Theorem1_IAE_dif{4}(250)];
yy2 = [0, Theorem1_IAE_dif{5}(50), Theorem1_IAE_dif{5}(100), Theorem1_IAE_dif{5}(150), Theorem1_IAE_dif{5}(200), Theorem1_IAE_dif{5}(250)];
yy3 = [0, Theorem1_IAE_dif{6}(50), Theorem1_IAE_dif{6}(100), Theorem1_IAE_dif{6}(150), Theorem1_IAE_dif{6}(200), Theorem1_IAE_dif{6}(250)];
yy4 = [0, Theorem1_IAE_dif{7}(50), Theorem1_IAE_dif{7}(100), Theorem1_IAE_dif{7}(150), Theorem1_IAE_dif{7}(200), Theorem1_IAE_dif{7}(250)];
plot(xx, yy1, '--', 'LineWidth', 2, 'Color', [0 0.4470 0.7410]);
hold on
plot(xx, yy2, '--', 'LineWidth', 2, 'Color', [0.9290 0.6940 0.1250]);
hold on
plot(xx, yy3, '--', 'LineWidth', 2, 'Color', [0.4940 0.1840 0.5560]);
hold on
plot(xx, yy4, '--', 'LineWidth', 2, 'Color', [0.3010 0.7450 0.9330]);
hold on
xlim([0,250]);
xlabel('Time(s)', 'Interpreter', 'latex');
ylabel('$\int_{0}^{t}{\left\| {{\tau }_{i}} \right\|dt}$','Interpreter','latex');
set(gca,'FontSize', 14);
legend('i=4','i=5','i=6','i=7','i=4','i=5','i=6','i=7');
