figure(5);
subplot(3,2,1);
plot(tr(2:end), O1{4}(:,1), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 1); hold on
plot(tr(2:end), O1{5}(:,1), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 1); hold on
plot(tr(2:end), O1{6}(:,1), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 1); hold on
plot(tr(2:end), O1{7}(:,1), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 1); hold on
set(gca,'Fontsize',14);
ylabel('$$\varpi_{0i,1}(m/s)$$', 'interpreter', 'latex');

subplot(3,2,3);
plot(tr(2:end), O1{4}(:,2), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 1); hold on
plot(tr(2:end), O1{5}(:,2), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 1); hold on
plot(tr(2:end), O1{6}(:,2), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 1); hold on
plot(tr(2:end), O1{7}(:,2), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 1); hold on
set(gca,'Fontsize',14);
ylabel('$$\varpi_{0i,2}(m/s)$$', 'interpreter', 'latex');

subplot(3,2,5);
plot(tr(2:end), O1{4}(:,3), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 1); hold on
plot(tr(2:end), O1{5}(:,3), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 1); hold on
plot(tr(2:end), O1{6}(:,3), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 1); hold on
plot(tr(2:end), O1{7}(:,3), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 1); hold on
set(gca,'Fontsize',14);
xlabel('Time(s)');
ylabel('$$\varpi_{0i,3}(rad/s)$$', 'interpreter', 'latex');

subplot(3,2,2);
plot(tr(2:end), O2{4}(:,1), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 1); hold on
plot(tr(2:end), O2{5}(:,1), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 1); hold on
plot(tr(2:end), O2{6}(:,1), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 1); hold on
plot(tr(2:end), O2{7}(:,1), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 1); hold on
set(gca,'Fontsize',14);
ylabel('$$\varpi_{1i,1}(m/ s^2)$$', 'interpreter', 'latex');

subplot(3,2,4);
plot(tr(2:end), O2{4}(:,2), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 1); hold on
plot(tr(2:end), O2{5}(:,2), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 1); hold on
plot(tr(2:end), O2{6}(:,2), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 1); hold on
plot(tr(2:end), O2{7}(:,2), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 1); hold on
set(gca,'Fontsize',14);
ylabel('$$\varpi_{1i,2}(m/ s^2)$$', 'interpreter', 'latex');

subplot(3,2,6);
plot(tr(2:end), O2{4}(:,3), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 1); hold on
plot(tr(2:end), O2{5}(:,3), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 1); hold on
plot(tr(2:end), O2{6}(:,3), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 1); hold on
plot(tr(2:end), O2{7}(:,3), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 1); hold on
set(gca,'Fontsize',14);
xlabel('Time(s)');
ylabel('$$\varpi_{1i,3}(rad/ s^2)$$', 'interpreter', 'latex');
set(gcf,'Position',[100 100 860 520]);

