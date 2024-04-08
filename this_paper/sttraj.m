function via_ = sttraj()
    via = [  0,   0;
           50,  0;
           100,  0;
           200,  0;
           200, 100;
           200, 200
           ];

    for j=1:size(via,1)
        if j==1
            T1 = eye(1);
            T2 = rot2(0*pi/180);
        elseif j==2
%             T1 = 1/2*eye(1);
%             T2 = rot2(0*pi/180);
            T1 = [1, 1.5; 0, 0];
            T2 = rot2(0*pi/180);
        elseif j==3
            % T1 = [tan(pi/4), 1; 0, 0];
            T1 = [1, 1.5; 0, 0];
            T2 = rot2(0*pi/180);
        elseif j==4
%             T1 = [tan(pi/4), 1; 0, 0];
%             T1 = [1, 1.5; 0.2, 0];
%             T2 = rot2(0*pi/180);
            T1 = diag([0.5, 0.5]);
            T2 = rot2(0*pi/180);
        elseif j==5
            T1 = diag([0.5,0.5]);
            T2 = rot2(90*pi/180);
        else
            T1 = diag([0.5,0.5]);
            T2 = rot2(90*pi/180);            
        end
        via_(j,:) = [vec(T1*T2)', via(j,:)];
    end
    % 查看轨迹具体情况
%   figure(1);
%   trashape{j} = r*T2'*T1' + via(j,:);    
%   for i=1:m
%       plot(trashape{j}(edge(:,i),1), trashape{j}(edge(:,i),2), 'k', 'LineWidth', 2); hold on;
%   end
end