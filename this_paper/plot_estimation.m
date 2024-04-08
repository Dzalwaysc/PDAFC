%% 观测误差-01
figure(41)
plot(tr(2:end), O1{4}(:,1), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(2:end), O1{5}(:,1), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(2:end), O1{6}(:,1), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(2:end), O1{7}(:,1), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([0,1250]);
set(gca,'Fontsize',14);
xlabel('Time$(s)$', 'interpreter', 'latex');
ylabel('$\tilde{\varpi}_{0i1}(m/s)$', 'interpreter', 'latex');
legend('i=4', 'i=5', 'i=6', 'i=7', 'NumColumns', 4, 'Location', 'northoutside');

subpos = [0.2, 0.7, 0.45, 0.2];
axes('Position', subpos);
plot(tr(2:end), O1{4}(:,1), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(2:end), O1{5}(:,1), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(2:end), O1{6}(:,1), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(2:end), O1{7}(:,1), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([0,1]);
set(gca,'Fontsize',10);

subpos = [0.4, 0.4, 0.45, 0.2];
axes('Position', subpos);
plot(tr(2:end), O1{4}(:,1), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(2:end), O1{5}(:,1), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(2:end), O1{6}(:,1), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(2:end), O1{7}(:,1), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([600,600.1]);
set(gca,'Fontsize',10);

%% 观测误差-02
figure(42)
plot(tr(2:end), O1{4}(:,2), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(2:end), O1{5}(:,2), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(2:end), O1{6}(:,2), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(2:end), O1{7}(:,2), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([0,1250]);
set(gca,'Fontsize',14);
xlabel('Time$(s)$', 'interpreter', 'latex');
ylabel('$\tilde{\varpi}_{0i2}(m/s)$', 'interpreter', 'latex');
legend('i=4', 'i=5', 'i=6', 'i=7', 'NumColumns', 4, 'Location', 'northoutside');

subpos = [0.2, 0.7, 0.45, 0.2];
axes('Position', subpos);
plot(tr(2:end), O1{4}(:,2), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(2:end), O1{5}(:,2), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(2:end), O1{6}(:,2), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(2:end), O1{7}(:,2), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([0,1]);
set(gca,'Fontsize',10);

subpos = [0.4, 0.4, 0.45, 0.2];
axes('Position', subpos);
plot(tr(2:end), O1{4}(:,2), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(2:end), O1{5}(:,2), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(2:end), O1{6}(:,2), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(2:end), O1{7}(:,2), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([600,600.1]);
set(gca,'Fontsize',10);

%% 观测误差-03
figure(43)
plot(tr(2:end), O1{4}(:,3), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(2:end), O1{5}(:,3), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(2:end), O1{6}(:,3), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(2:end), O1{7}(:,3), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([0,1250]);
set(gca,'Fontsize',14);
xlabel('Time$(s)$', 'interpreter', 'latex');
ylabel('$\tilde{\varpi}_{0i3}(rad/s)$', 'interpreter', 'latex');
legend('i=4', 'i=5', 'i=6', 'i=7', 'NumColumns', 4, 'Location', 'northoutside');

subpos = [0.2, 0.7, 0.45, 0.2];
axes('Position', subpos);
plot(tr(2:end), O1{4}(:,3), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(2:end), O1{5}(:,3), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(2:end), O1{6}(:,3), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(2:end), O1{7}(:,3), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([0,1]);
set(gca,'Fontsize',10);

subpos = [0.4, 0.4, 0.45, 0.2];
axes('Position', subpos);
plot(tr(2:end), O1{4}(:,3), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(2:end), O1{5}(:,3), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(2:end), O1{6}(:,3), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(2:end), O1{7}(:,3), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([600,600.1]);
set(gca,'Fontsize',10);

%% 观测误差-11
figure(44)
plot(tr(2:end), O2{4}(:,1), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(2:end), O2{5}(:,1), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(2:end), O2{6}(:,1), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(2:end), O2{7}(:,1), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([0,1250]);
set(gca,'Fontsize',14);
xlabel('Time$(s)$', 'interpreter', 'latex');
ylabel('$\tilde{\varpi}_{1i1}(N)$', 'interpreter', 'latex');
legend('i=4', 'i=5', 'i=6', 'i=7', 'NumColumns', 4, 'Location', 'northoutside');

subpos = [0.2, 0.7, 0.45, 0.2];
axes('Position', subpos);
plot(tr(2:end), O2{4}(:,1), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(2:end), O2{5}(:,1), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(2:end), O2{6}(:,1), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(2:end), O2{7}(:,1), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([0,2.5]);
set(gca,'Fontsize',10);

subpos = [0.4, 0.25, 0.45, 0.2];
axes('Position', subpos);
plot(tr(2:end), O2{4}(:,1), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(2:end), O2{5}(:,1), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(2:end), O2{6}(:,1), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(2:end), O2{7}(:,1), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([600,600.1]);
set(gca,'Fontsize',10);

%% 观测误差-12
figure(45)
plot(tr(2:end), O2{4}(:,2), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(2:end), O2{5}(:,2), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(2:end), O2{6}(:,2), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(2:end), O2{7}(:,2), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([0,1250]);
set(gca,'Fontsize',14);
xlabel('Time$(s)$', 'interpreter', 'latex');
ylabel('$\tilde{\varpi}_{1i2}(N)$', 'interpreter', 'latex');
legend('i=4', 'i=5', 'i=6', 'i=7', 'NumColumns', 4, 'Location', 'northoutside');

subpos = [0.2, 0.5, 0.45, 0.2];
axes('Position', subpos);
plot(tr(2:end), O2{4}(:,2), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(2:end), O2{5}(:,2), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(2:end), O2{6}(:,2), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(2:end), O2{7}(:,2), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([0,3.5]);
set(gca,'Fontsize',10);

subpos = [0.4, 0.2, 0.45, 0.2];
axes('Position', subpos);
plot(tr(2:end), O2{4}(:,2), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(2:end), O2{5}(:,2), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(2:end), O2{6}(:,2), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(2:end), O2{7}(:,2), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([900,900.1]);
set(gca,'Fontsize',10);

%% 观测误差-13
figure(46)
plot(tr(2:end), O2{4}(:,3), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(2:end), O2{5}(:,3), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(2:end), O2{6}(:,3), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(2:end), O2{7}(:,3), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([0,1250]);
set(gca,'Fontsize',14);
xlabel('Time$(s)$', 'interpreter', 'latex');
ylabel('$\tilde{\varpi}_{1i3}(Nm)$', 'interpreter', 'latex');
legend('i=4', 'i=5', 'i=6', 'i=7', 'NumColumns', 4, 'Location', 'northoutside');

subpos = [0.2, 0.5, 0.45, 0.2];
axes('Position', subpos);
plot(tr(2:end), O2{4}(:,3), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(2:end), O2{5}(:,3), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(2:end), O2{6}(:,3), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(2:end), O2{7}(:,3), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([0,3.5]);
set(gca,'Fontsize',10);

subpos = [0.4, 0.2, 0.45, 0.2];
axes('Position', subpos);
plot(tr(2:end), O2{4}(:,3), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr(2:end), O2{5}(:,3), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr(2:end), O2{6}(:,3), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr(2:end), O2{7}(:,3), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([900,900.1]);
set(gca,'Fontsize',10);





