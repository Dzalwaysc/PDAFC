function [desYaw,desYawd,desYawdd] = dytraj(desPosd, tr, dt)
    % 艏向
    for i=1:length(tr)
        for j=1:size(desPosd,2)
            desYaw{j}(i,1) = atan2(desPosd{j}(i,2), desPosd{j}(i,1));
            if desYaw{j}(i,1) < 0         % 将所得艏向规定在[0,360)
                desYaw{j}(i,1) = desYaw{j}(i,1) + 2*pi;
            end
        end   
    end
    
    % 艏向的一阶导
%     for j=1:size(desPosd,2)
%         desYawd{j} = [diff(desYaw{j})./dt; zeros(1)];
%     end
    % 艏向的一阶导
    for j=1:size(desPosd,2)
        temp = diff(desYaw{j});
        for k=1:size(temp,1) % 将所得艏向误差规定在[-180,180]
            if temp(k) > pi
                temp(k) = temp(k) - 2*pi;
            elseif temp(k) < -pi
                temp(k) = temp(k) + 2*pi;
            end
        end
        desYawd{j} = [temp./dt; zeros(1)];
    end
    
    % 艏向的二阶导
    for j=1:size(desPosd,2)
        desYawdd{j} = [diff(desYawd{j})./dt; zeros(1)];
    end
end