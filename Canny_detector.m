function Canny_detector(image_name)
    input_image = imread(image_name);

    % Do Gaussian blur
    gauss_blur_image = DoGaussianBlur(input_image);
    
    % Calculate magnitude and angle of the gradient vector
    [magnitude, angle] = GetMagnitudeAndAngle(gauss_blur_image);
    
    % Non-maximum suppression
    nonmax_image = NonMaximaSuppression(magnitude, angle);
    
    % Hysteresis thresholding
    hysteresis_image = HysteresisThresholding(nonmax_image);

    final_image = hysteresis_image;
    
    % Show images
    figure
    imshow(input_image,[])
    title('Original image')
    figure
    imshow(nonmax_image,[])
    title('Image after Non Maxima Suppression')
    figure
    imshow(final_image,[])
    title('Final image')

    % Save final image
    name = erase(image_name,'.png');
    imwrite(imbinarize(final_image),append(name,'_binarized.png'));
end
