% 误差轨迹
for i=4:7
    for k=1:size(desPos{i},1)
       Eta_Err{i}(k,:) = [desPos{i}(k,:),desYaw{1}(k,:)]-Eta{i}(k,:); 
       if Eta_Err{i}(k,3) > pi
           Eta_Err{i}(k,3) = Eta_Err{i}(k,3) - 2*pi;
       elseif Eta_Err{i}(k,3) < -pi
           Eta_Err{i}(k,3) = Eta_Err{i}(k,3) + 2*pi;
       end       
    end    
end

for i=4:7
    for k=1:size(desPos{i},1)
        R = reshape( obtain_J([desPos{i}(k,:),desYaw{1}(k,:)]), 3, 3 ); %% 这里由于我们是考虑了一致性，故其实用的Rd是一号艇的Rd, 而不应该用各艇对应的Rd (各艇对应的Rd是由各艇期望轨迹的斜率，但不是期望艏向)
        R_now{i}(k,:) = obtain_J( Eta{i}(k,:) );
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

%% 位姿跟踪误差01
figure(31);
plot(tr, Eta_Err{4}(:,1), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr, Eta_Err{5}(:,1), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr, Eta_Err{6}(:,1), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr, Eta_Err{7}(:,1), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlabel('Time$(s)$', 'interpreter', 'latex');
ylabel('$\eta_{ei1}(m)$', 'interpreter', 'latex');
xlim([0,1250]);
legend('i=4', 'i=5', 'i=6', 'i=7', 'NumColumns', 4, 'Location', 'northoutside');
set(gca,'Fontsize',14);

subpos = [0.25, 0.7, 0.45, 0.2];
axes('Position', subpos);
plot(tr, Eta_Err{4}(:,1), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr, Eta_Err{5}(:,1), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr, Eta_Err{6}(:,1), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr, Eta_Err{7}(:,1), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([0,3.5]);
set(gca,'Fontsize',10);

subpos = [0.4, 0.25, 0.45, 0.2];
axes('Position', subpos);
plot(tr, Eta_Err{4}(:,1), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr, Eta_Err{5}(:,1), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr, Eta_Err{6}(:,1), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr, Eta_Err{7}(:,1), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([900,915]);
set(gca,'Fontsize',10);

%% 位姿跟踪误差02
figure(32);
plot(tr, Eta_Err{4}(:,2), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr, Eta_Err{5}(:,2), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr, Eta_Err{6}(:,2), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr, Eta_Err{7}(:,2), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlabel('Time$(s)$', 'interpreter', 'latex');
ylabel('$\eta_{ei2}(m)$', 'interpreter', 'latex');
xlim([0,1250]);
legend('i=4', 'i=5', 'i=6', 'i=7', 'NumColumns', 4, 'Location', 'northoutside');
set(gca,'Fontsize',14);

subpos = [0.25, 0.7, 0.45, 0.2];
axes('Position', subpos);
plot(tr, Eta_Err{4}(:,2), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr, Eta_Err{5}(:,2), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr, Eta_Err{6}(:,2), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr, Eta_Err{7}(:,2), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([0,3.5]);
set(gca,'Fontsize',10);

subpos = [0.4, 0.35, 0.45, 0.2];
axes('Position', subpos);
plot(tr, Eta_Err{4}(:,2), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr, Eta_Err{5}(:,2), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr, Eta_Err{6}(:,2), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr, Eta_Err{7}(:,2), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([900,915]);
set(gca,'Fontsize',10);

%% 位姿跟踪误差03
figure(33);
plot(tr, Eta_Err{4}(:,3), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr, Eta_Err{5}(:,3), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr, Eta_Err{6}(:,3), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr, Eta_Err{7}(:,3), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlabel('Time$(s)$', 'interpreter', 'latex');
ylabel('$\eta_{ei3}(rad)$', 'interpreter', 'latex');
xlim([0,1250]);
legend('i=4', 'i=5', 'i=6', 'i=7', 'NumColumns', 4, 'Location', 'northoutside');
set(gca,'Fontsize',14);

subpos = [0.23, 0.55, 0.45, 0.2];
axes('Position', subpos);
plot(tr, Eta_Err{4}(:,3), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr, Eta_Err{5}(:,3), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr, Eta_Err{6}(:,3), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr, Eta_Err{7}(:,3), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([0,3.5]);
set(gca,'Fontsize',10);

subpos = [0.4, 0.25, 0.45, 0.2];
axes('Position', subpos);
plot(tr, Eta_Err{4}(:,3), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr, Eta_Err{5}(:,3), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr, Eta_Err{6}(:,3), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr, Eta_Err{7}(:,3), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([900,915]);
set(gca,'Fontsize',10);

%% 航速跟踪误差01
figure(34);
plot(tr, Eta_Errd{4}(:,1), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{5}(:,1), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{6}(:,1), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{7}(:,1), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlabel('Time$(s)$', 'interpreter', 'latex');
ylabel('$\omega_{ei1}(m/s)$', 'interpreter', 'latex');
xlim([0,1250]);
legend('i=4', 'i=5', 'i=6', 'i=7', 'NumColumns', 4, 'Location', 'northoutside');
set(gca,'Fontsize',14);

subpos = [0.23, 0.65, 0.45, 0.2];
axes('Position', subpos);
plot(tr, Eta_Errd{4}(:,3), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{5}(:,3), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{6}(:,3), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{7}(:,3), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([0,3.5]);
set(gca,'Fontsize',10);

subpos = [0.4, 0.22, 0.45, 0.2];
axes('Position', subpos);
plot(tr, Eta_Errd{4}(:,3), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{5}(:,3), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{6}(:,3), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{7}(:,3), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([900,900.1]);
set(gca,'Fontsize',10);

%% 航速跟踪误差02
figure(35);
plot(tr, Eta_Errd{4}(:,2), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{5}(:,2), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{6}(:,2), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{7}(:,2), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlabel('Time$(s)$', 'interpreter', 'latex');
ylabel('$\omega_{ei2}(m/s)$', 'interpreter', 'latex');
xlim([0,1250]);
ylim([-1.3,1]);
legend('i=4', 'i=5', 'i=6', 'i=7', 'NumColumns', 4, 'Location', 'northoutside');
set(gca,'Fontsize',14);

subpos = [0.23, 0.67, 0.45, 0.2];
axes('Position', subpos);
plot(tr, Eta_Errd{4}(:,2), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{5}(:,2), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{6}(:,2), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{7}(:,2), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([0,4.5]);
set(gca,'Fontsize',10);

subpos = [0.4, 0.24, 0.45, 0.2];
axes('Position', subpos);
plot(tr, Eta_Errd{4}(:,2), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{5}(:,2), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{6}(:,2), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{7}(:,2), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([900,900.1]);
set(gca,'Fontsize',10);

%% 航速跟踪误差03
figure(35);
plot(tr, Eta_Errd{4}(:,3), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{5}(:,3), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{6}(:,3), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{7}(:,3), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlabel('Time$(s)$', 'interpreter', 'latex');
ylabel('$\omega_{ei3}(rad/s)$', 'interpreter', 'latex');
xlim([0,1250]);
legend('i=4', 'i=5', 'i=6', 'i=7', 'NumColumns', 4, 'Location', 'northoutside');
set(gca,'Fontsize',14);

subpos = [0.21, 0.55, 0.45, 0.2];
axes('Position', subpos);
plot(tr, Eta_Errd{4}(:,3), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{5}(:,3), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{6}(:,3), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{7}(:,3), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([0,4.5]);
set(gca,'Fontsize',10);

subpos = [0.4, 0.2, 0.45, 0.2];
axes('Position', subpos);
plot(tr, Eta_Errd{4}(:,3), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{5}(:,3), ':', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{6}(:,3), '-.', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); hold on
plot(tr, Eta_Errd{7}(:,3), '-', 'Color', [0.4940 0.1840 0.5560], 'LineWidth', 2); hold on
xlim([640,760]);
set(gca,'Fontsize',10);