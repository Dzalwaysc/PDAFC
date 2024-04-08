%% 控制律 - 1
figure(50);
plot(tr(1:size(Tao{4},1)), Tao{4}(:,1), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(1:size(Tao{4},1)), Tao{5}(:,1), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(1:size(Tao{4},1)), Tao{6}(:,1), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(1:size(Tao{4},1)), Tao{7}(:,1), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on

xlim([0,1250]);
set(gca,'Fontsize',14);
xlabel('Time$(s)$', 'interpreter', 'latex');
ylabel('$\tau_{i1}(N)$', 'interpreter', 'latex');
legend('i=4', 'i=5', 'i=6', 'i=7', 'NumColumns', 4, 'Location', 'northoutside');

subpos = [0.2, 0.25, 0.45, 0.2]; % [left bottom width height]
axes('Position', subpos);
plot(tr(1:500), Tao{4}(1:500,1), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(1:500), Tao{5}(1:500,1), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(1:500), Tao{6}(1:500,1), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(1:500), Tao{7}(1:500,1), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([0,5]);
set(gca,'Fontsize',10);

subpos = [0.4, 0.7, 0.45, 0.2];
axes('Position', subpos);
plot(tr(70000:70100), Tao{4}(70000:70100,1), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(70000:70100), Tao{5}(70000:70100,1), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(70000:70100), Tao{6}(70000:70100,1), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(70000:70100), Tao{7}(70000:70100,1), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([700,700.1]);
set(gca,'Fontsize',10);

%% 控制律 - 2
figure(51);
plot(tr(1:size(Tao{4},1)), Tao{4}(:,2), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(1:size(Tao{4},1)), Tao{5}(:,2), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(1:size(Tao{4},1)), Tao{6}(:,2), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(1:size(Tao{4},1)), Tao{7}(:,2), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on

xlim([0,1250]);
set(gca,'Fontsize',14);
xlabel('Time$(s)$', 'interpreter', 'latex');
ylabel('$\tau_{i2}(N)$', 'interpreter', 'latex');
legend('i=4', 'i=5', 'i=6', 'i=7', 'NumColumns', 4, 'Location', 'northoutside');

subpos = [0.2, 0.25, 0.45, 0.2]; % [left bottom width height]
axes('Position', subpos);
plot(tr(1:500), Tao{4}(1:500,2), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(1:500), Tao{5}(1:500,2), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(1:500), Tao{6}(1:500,2), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(1:500), Tao{7}(1:500,2), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([0,5]);
set(gca,'Fontsize',10);

subpos = [0.4, 0.7, 0.45, 0.2];
axes('Position', subpos);
plot(tr(70000:70100), Tao{4}(70000:70100,2), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(70000:70100), Tao{5}(70000:70100,2), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(70000:70100), Tao{6}(70000:70100,2), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(70000:70100), Tao{7}(70000:70100,2), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([700,700.1]);
set(gca,'Fontsize',10);

%% 控制律 - 3
figure(52);
plot(tr(1:size(Tao{4},1)), Tao{4}(:,3), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(1:size(Tao{4},1)), Tao{5}(:,3), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(1:size(Tao{4},1)), Tao{6}(:,3), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(1:size(Tao{4},1)), Tao{7}(:,3), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on

xlim([0,1250]);
ylim([-10,8]);
set(gca,'Fontsize',14);
xlabel('Time$(s)$', 'interpreter', 'latex');
ylabel('$\tau_{i3}(Nm)$', 'interpreter', 'latex');
legend('i=4', 'i=5', 'i=6', 'i=7', 'NumColumns', 4, 'Location', 'northoutside');

subpos = [0.18, 0.2, 0.45, 0.2]; % [left bottom width height]
axes('Position', subpos);
plot(tr(1:300), Tao{4}(1:300,3), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(1:300), Tao{5}(1:300,3), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(1:300), Tao{6}(1:300,3), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(1:300), Tao{7}(1:300,3), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([0,3]);
set(gca,'Fontsize',10);

subpos = [0.42, 0.48, 0.45, 0.2];
axes('Position', subpos);
plot(tr(70000:70100), Tao{4}(70000:70100,3), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(70000:70100), Tao{5}(70000:70100,3), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(70000:70100), Tao{6}(70000:70100,3), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(70000:70100), Tao{7}(70000:70100,3), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([700,700.1]);
set(gca,'Fontsize',10);

