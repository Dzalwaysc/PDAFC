% 误差轨迹
for i=4:7
    Eta_Err{i} = [desPos{i},desYaw{1}]-Eta{i};
end

for i=4:7
    desYawd{i}(45000,:) = 0; %% 莫名出现的野值
    for k=1:size(desPos{i},1)
        R = reshape( obtain_J([desPos{i}(k,:),desYaw{i}(k,:)]), 3, 3 );
        Eta_Errd{i}(k,:) = [desPosd{i}(k,:), desYawd{i}(k,:)]*R - V{i}(k,:);
    end
end

%由于最后时刻的轨迹期望突然变成0，导致误差突变，所以这里奖最后时刻的轨迹误差都直接置为上一时刻的误差
for i=4:7
    Eta_Err{i}(end,:) = Eta_Err{i}(end-1,:);
    Eta_Errd{i}(end-2,:) = 0;
    Eta_Errd{i}(end-1,:) = Eta_Errd{i}(end-2,:);
    Eta_Errd{i}(end,:) = Eta_Errd{i}(end-1,:);
end

figure(5);
subplot(3,2,1);
plot(tr/4, Eta_Err{4}(:,1), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 1); hold on
plot(tr/4, Eta_Err{5}(:,1), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 1); hold on
plot(tr/4, Eta_Err{6}(:,1), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 1); hold on
plot(tr/4, Eta_Err{7}(:,1), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 1); hold on
ylabel('$$\eta_{ei,1}(m)$$', 'interpreter', 'latex');
xlim([0,250]);
set(gca,'Fontsize',14);

subplot(3,2,3);
plot(tr/4, Eta_Err{4}(:,2), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 1); hold on
plot(tr/4, Eta_Err{5}(:,2), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 1); hold on
plot(tr/4, Eta_Err{6}(:,2), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 1); hold on
plot(tr/4, Eta_Err{7}(:,2), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 1); hold on
ylabel('$$\eta_{ei,2}(m)$$', 'interpreter', 'latex');
xlim([0,250]);
set(gca,'Fontsize',14);

subplot(3,2,5);
plot(tr/4, Eta_Err{4}(:,3), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 1); hold on
plot(tr/4, Eta_Err{5}(:,3), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 1); hold on
plot(tr/4, Eta_Err{6}(:,3), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 1); hold on
plot(tr/4, Eta_Err{7}(:,3), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 1); hold on
xlabel('Time(s)');
ylabel('$$\eta_{ei,3}(rad)$$', 'interpreter', 'latex');
xlim([0,250]);
set(gca,'Fontsize',14);

subplot(3,2,2);
plot(tr/4, Eta_Errd{4}(:,1), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 1); hold on
plot(tr/4, Eta_Errd{5}(:,1), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 1); hold on
plot(tr/4, Eta_Errd{6}(:,1), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 1); hold on
plot(tr/4, Eta_Errd{7}(:,1), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 1); hold on
ylabel('$$\vartheta_{ei,1}(m/s)$$', 'interpreter', 'latex');
xlim([0,250]);
set(gca,'Fontsize',14);

subplot(3,2,4);
plot(tr/4, Eta_Errd{4}(:,2), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 1); hold on
plot(tr/4, Eta_Errd{5}(:,2), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 1); hold on
plot(tr/4, Eta_Errd{6}(:,2), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 1); hold on
plot(tr/4, Eta_Errd{7}(:,2), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 1); hold on
ylabel('$$\vartheta_{ei,2}(m/s)$$', 'interpreter', 'latex');
xlim([0,250]);
set(gca,'Fontsize',14);

subplot(3,2,6);
plot(tr/4, Eta_Errd{4}(:,3), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 1); hold on
plot(tr/4, Eta_Errd{5}(:,3), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 1); hold on
plot(tr/4, Eta_Errd{6}(:,3), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 1); hold on
plot(tr/4, Eta_Errd{7}(:,3), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 1); hold on
xlabel('Time(s)');
ylabel('$$\vartheta_{ei,3}(rad/s)$$', 'interpreter', 'latex');
xlim([0,250]);
set(gca,'Fontsize',14);

set(gcf,'Position',[100 100 860 520]);
