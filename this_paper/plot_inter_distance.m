inter_45 = Eta{4} - Eta{5};
inter_46 = Eta{4} - Eta{6};
inter_47 = Eta{4} - Eta{7};
inter_56 = Eta{5} - Eta{6};
inter_57 = Eta{5} - Eta{7};
inter_67 = Eta{6} - Eta{7};

for i = 1:size(inter_45, 1)
    dis_45(i) = norm(inter_45(i,1:2));
    dis_46(i) = norm(inter_46(i,1:2));
    dis_47(i) = norm(inter_47(i,1:2));
    dis_56(i) = norm(inter_56(i,1:2));
    dis_57(i) = norm(inter_57(i,1:2));
    dis_67(i) = norm(inter_67(i,1:2));
end

figure(21)
plot(tr, dis_45, tr, dis_46, tr, dis_47, tr, dis_56, tr, dis_57, tr, dis_67, 'LineWidth', 2); hold on
xlabel('Time$(s)$', 'Interpreter', 'latex');
ylabel('Distance$(m)$', 'Interpreter', 'latex');
xlim([0,1250]);

l_min = 4*ones(1,size(tr,2));

plot(tr, l_min, ':', 'LineWidth', 2);

legend('$\|p_{4}-p_{5}\|$', '$\|p_{4}-p_{6}\|$', '$\|p_{4}-p_{7}\|$', ...
    '$\|p_{5}-p_{6}\|$', '$\|p_{5}-p_{7}\|$', '$\|p_{6}-p_{7}\|$','Interpreter', 'latex', 'NumColumns', 2)
set(gca, 'Fontsize', 14)

subpos = [0.58, 0.41, 0.3, 0.15];
axes('Position', subpos);
plot(tr, dis_45, tr, dis_46, tr, dis_47, tr, dis_56, tr, dis_57, tr, dis_67, 'LineWidth', 2); hold on
xlim([0,3]);
ylim([12,18]);
set(gca, 'Fontsize', 10)

subpos = [0.58, 0.64, 0.3, 0.15];
axes('Position', subpos);
plot(tr, dis_45, tr, dis_46, tr, dis_47, tr, dis_56, tr, dis_57, tr, dis_67, 'LineWidth', 2); hold on
xlim([0,3]);
ylim([29,33]);
set(gca, 'Fontsize', 10)