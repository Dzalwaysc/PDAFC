%% T1 = [tan(pi/4), 1; 1, tan(pi/4)]基于原点的剪切至共线
%% T1 = [tan(pi/4), 1; 0, 0)]基于y轴的剪切至共线
%% T1 = [0  0; tan(pi/4), 1)]基于x轴的剪切至共线
%% 若想任意共线，则我们可以使用基于原点共线的T1，再给个其他的剪切去避免两艇重叠，比如
%% T1 = [tan(pi/4), 1; 1, tan(pi/4)]*[0.0001,0;0,1] 首先实现基于原点的共线，并用后续的剪切[0.0001,0;0,1]避免两艇重叠
%% 然后T2 = rot2(45*pi/180)实现45度角共线

function via_ = sttraj2(r, edge, m)
    via = [  0,   0;
             0,  50;
             0, 100;
             100*cos(15/16*pi)+100, 100*sin(15/16*pi)+100;
             100*cos(14/16*pi)+100, 100*sin(14/16*pi)+100;
             100*cos(13/16*pi)+100, 100*sin(13/16*pi)+100;
%              100*cos(12/16*pi)+100, 100*sin(12/16*pi)+100;
%              100*cos(11/16*pi)+100, 100*sin(11/16*pi)+100;
%              100*cos(10/16*pi)+100, 100*sin(10/16*pi)+100;
%              100*cos(9/16*pi)+100,  100*sin(9/16*pi)+100;
%              100*cos(8/16*pi)+100,  100*sin(8/16*pi)+100;
%              100*cos(7/16*pi)+100,  100*sin(7/16*pi)+100;
%              100*cos(6/16*pi)+100,  100*sin(6/16*pi)+100;
%              100*cos(5/16*pi)+100,  100*sin(5/16*pi)+100;
%              100*cos(4/16*pi)+100,  100*sin(4/16*pi)+100;
%              100*cos(3/16*pi)+100,  100*sin(3/16*pi)+100;
%              100*cos(2/16*pi)+100,  100*sin(2/16*pi)+100;
%              100*cos(1/16*pi)+100,  100*sin(1/16*pi)+100;
%              100*cos(0/16*pi)+100,  100*sin(0/16*pi)+100;
%              100*cos(-1/16*pi)+100, 100*sin(-1/16*pi)+100;
%              100*cos(-2/16*pi)+100, 100*sin(-2/16*pi)+100;
];

    for j=1:size(via,1)
        if j==1
            T1 = eye(1);
            T2 = rot2(1*pi/2);
        elseif j==2
            T1 = eye(1);
            T2 = rot2(1*pi/2);
%             T1 = 0.5*[1  0; -1/2, 1];
%             T2 = rot2(1*pi/2);
            % T2 = rot2(0*pi/180);
        elseif j==3
            T1 = 3/4*eye(1);
            T2 = rot2(1*pi/2);
%             T1 = 0.5*[1  0; -1/2, 1];
%             T2 = rot2(1*pi/2);
%             T2 = rot2(0*pi/180);
        elseif j==4
            T1 = 3/4*eye(1);
            T2 = rot2((15/16-1/2)*pi);
        elseif j==5
            T1 = 3/4*eye(1);
            T2 = rot2((14/16-1/2)*pi);
        elseif j==6
            T1 = 3/4*eye(1);
            T2 = rot2((13/16-1/2)*pi);
        elseif j==7
            T1 = 3/4*eye(1);
            T2 = rot2((12/16-1/2)*pi);
        elseif j==8
            T1 = 3/4*eye(1);
            T2 = rot2((11/16-1/2)*pi);
        elseif j==9
            T1 = 3/4*eye(1);
            T2 = rot2((10/16-1/2)*pi);
        elseif j==10
            T1 = 3/4*eye(1);
            T2 = rot2((9/16-1/2)*pi);
        elseif j==11
            T1 = 3/4*eye(1);
            T2 = rot2((8/16-1/2)*pi);
        elseif j==12
            T1 = 3/4*eye(1);
            T2 = rot2((7/16-1/2)*pi);    
        elseif j==13
            T1 = 2/4*eye(1);
            T2 = rot2((6/16-1/2)*pi);
        elseif j==14
            T1 = 2/4*eye(1);
            T2 = rot2((5/16-1/2)*pi);
        elseif j==15
            T1 = 2/4*eye(1);
            T2 = rot2((4/16-1/2)*pi);
        elseif j==16
            T1 = 2/4*eye(1);
            T2 = rot2((3/16-1/2)*pi);
        elseif j==17
            T1 = 2/4*eye(1);
            T2 = rot2((2/16-1/2)*pi);
        elseif j==18
            T1 = 2/4*eye(1);
            T2 = rot2((1/16-1/2)*pi);
        elseif j==19
            T1 = 2/4*eye(1);
            T2 = rot2((0/16-1/2)*pi);
        elseif j==20
            T1 = 2/4*eye(1);
            T2 = rot2((-1/16-1/2)*pi);
        else
            T1 = 2/4*eye(1);
            T2 = rot2((-2/16-1/2)*pi);
        end
        via_(j,:) = [vec(T1*T2)', via(j,:)];
        
%         % 查看轨迹具体情况
%         figure(1);
%         trashape{j} = r*T2'*T1' + via(j,:);    
%         for i=1:m
%           plot(trashape{j}(edge(:,i),1), trashape{j}(edge(:,i),2), 'k', 'LineWidth', 2); hold on;
%         end
    end
end