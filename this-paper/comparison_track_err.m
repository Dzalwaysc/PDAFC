len = size(tr,2);
for i=1:len
    desEta{4}(i,:) = [desPos{4}(i,:), desYaw{1}(i,:)];
    desEta{5}(i,:) = [desPos{5}(i,:), desYaw{1}(i,:)];
    desEta{6}(i,:) = [desPos{6}(i,:), desYaw{1}(i,:)];
    desEta{7}(i,:) = [desPos{7}(i,:), desYaw{1}(i,:)];
  
    R4 = reshape( obtain_J([desPos{4}(i,:),desYaw{4}(i,:)]), 3, 3 );
    R5 = reshape( obtain_J([desPos{5}(i,:),desYaw{5}(i,:)]), 3, 3 );
    R6 = reshape( obtain_J([desPos{6}(i,:),desYaw{6}(i,:)]), 3, 3 );
    R7 = reshape( obtain_J([desPos{7}(i,:),desYaw{7}(i,:)]), 3, 3 );
    
    desV{4}(i,:) = [desPosd{4}(i,:), desYawd{4}(i,:)]*R4;
    desV{5}(i,:) = [desPosd{5}(i,:), desYawd{5}(i,:)]*R5;
    desV{6}(i,:) = [desPosd{6}(i,:), desYawd{6}(i,:)]*R6;
    desV{7}(i,:) = [desPosd{7}(i,:), desYawd{7}(i,:)]*R7;
    
    norm_Eta_Err{4}(i) = norm(Eta{4}(i,:)-desEta{4}(i,:));
    norm_Eta_Err{5}(i) = norm(Eta{5}(i,:)-desEta{5}(i,:));
    norm_Eta_Err{6}(i) = norm(Eta{6}(i,:)-desEta{6}(i,:));
    norm_Eta_Err{7}(i) = norm(Eta{7}(i,:)-desEta{7}(i,:));
        
    norm_V_Err{4}(i) = norm(V{4}(i,:)-desV{4}(i,:));
    norm_V_Err{5}(i) = norm(V{5}(i,:)-desV{5}(i,:));
    norm_V_Err{6}(i) = norm(V{6}(i,:)-desV{6}(i,:));
    norm_V_Err{7}(i) = norm(V{7}(i,:)-desV{7}(i,:));
    
    norm_Eta_Back_Err{4}(i) = norm(Eta_dif{4}(i,:)-desEta{4}(i,:));
    norm_Eta_Back_Err{5}(i) = norm(Eta_dif{5}(i,:)-desEta{5}(i,:));
    norm_Eta_Back_Err{6}(i) = norm(Eta_dif{6}(i,:)-desEta{6}(i,:));
    norm_Eta_Back_Err{7}(i) = norm(Eta_dif{7}(i,:)-desEta{7}(i,:));
    
    norm_V_Back_Err{4}(i) = norm(V_dif{4}(i,:)-desV{4}(i,:));
    norm_V_Back_Err{5}(i) = norm(V_dif{5}(i,:)-desV{5}(i,:));
    norm_V_Back_Err{6}(i) = norm(V_dif{6}(i,:)-desV{6}(i,:));
    norm_V_Back_Err{7}(i) = norm(V_dif{7}(i,:)-desV{7}(i,:));
end

figure(4);
subplot(2,1,1)
plot(tr, norm_Eta_Err{4}, '-', 'LineWidth', 2, 'Color', [0 0.4470 0.7410]);
hold on
plot(tr, norm_Eta_Err{5}, '-', 'LineWidth', 2, 'Color', [0.9290 0.6940 0.1250]);
hold on
plot(tr, norm_Eta_Err{6}, '-', 'LineWidth', 2, 'Color', [0.4940 0.1840 0.5560]);
hold on
plot(tr, norm_Eta_Err{7}, '-', 'LineWidth', 2, 'Color', [0.3010 0.7450 0.9330]);
hold on
plot(tr, norm_Eta_Back_Err{4}, '--', 'LineWidth', 2, 'Color', [0 0.4470 0.7410]);
hold on
plot(tr, norm_Eta_Back_Err{5}, '--', 'LineWidth', 2, 'Color', [0.9290 0.6940 0.1250]);
hold on
plot(tr, norm_Eta_Back_Err{6}, '--', 'LineWidth', 2, 'Color', [0.4940 0.1840 0.5560]);
hold on
plot(tr, norm_Eta_Back_Err{7}, '--', 'LineWidth', 2, 'Color', [0.3010 0.7450 0.9330]);
hold on
xlim([0,250]);
xlabel('$t$(s)', 'Interpreter', 'latex');
ylabel('$\|\eta_{i}-\eta_{i}^{*}\|$','Interpreter','latex');
set(gca,'FontSize', 14);
legend('i=4','i=5','i=6','i=7','i=4','i=5','i=6','i=7');

subplot(2,1,2)
plot(tr, norm_V_Err{4}, '-', 'LineWidth', 2, 'Color', [0 0.4470 0.7410]);
hold on
plot(tr, norm_V_Err{5}, '-', 'LineWidth', 2, 'Color', [0.9290 0.6940 0.1250]);
hold on
plot(tr, norm_V_Err{6}, '-', 'LineWidth', 2, 'Color', [0.4940 0.1840 0.5560]);
hold on
plot(tr, norm_V_Err{7}, '-', 'LineWidth', 2, 'Color', [0.3010 0.7450 0.9330]);
hold on
plot(tr, norm_V_Back_Err{4}, '--', 'LineWidth', 2, 'Color', [0 0.4470 0.7410]);
hold on
plot(tr, norm_V_Back_Err{5}, '--', 'LineWidth', 2, 'Color', [0.9290 0.6940 0.1250]);
hold on
plot(tr, norm_V_Back_Err{6}, '--', 'LineWidth', 2, 'Color', [0.4940 0.1840 0.5560]);
hold on
plot(tr, norm_V_Back_Err{7}, '--', 'LineWidth', 2, 'Color', [0.3010 0.7450 0.9330]);
hold on
xlim([0,250]);
xlabel('$t$(s)', 'Interpreter', 'latex');
ylabel('$\|\vartheta_{i}-\vartheta_{i}^{*}\|$','Interpreter','latex');
set(gca,'FontSize', 14);