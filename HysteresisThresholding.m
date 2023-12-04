function [final_image] = HysteresisThresholding(image)
    % Get size
    [hight, widht] = size(image);
    % Make output image
    final_image = zeros([hight, widht]);

    % Define thresholds
    threshold_high = max(max(image))*0.5;
    threshold_low = threshold_high*0.5;
    
    % Define temp storage
    temp_final_image = 0;
    temp = 0;
    
    % Start infinite loop
    while (1)
        % If new image is the same as the last increment counter
        if final_image == temp_final_image
            temp = temp +1;
        end
        % If conter goes over 100 break, aka 100 pictures with no change
        if temp > 100
            break
        end
        % update temp image
        temp_final_image = final_image;
        % loop over image pixels
        for y = 2:hight-1
            for x = 2:widht-1
                % if a pixel is over the threshold add it to final image
                if image(y,x) > threshold_high
                    % also add surrounding ones 
                    sub_matrix = image(y-1:y+1,x-1:x+1);
                    selected = (sub_matrix > threshold_low);
                    final_image(y-1:y+1,x-1:x+1) = selected;
                end
            end
        end
    end
end