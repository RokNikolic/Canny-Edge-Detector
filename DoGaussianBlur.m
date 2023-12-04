function [gauss_blur_image] = DoGaussianBlur(input_image)
    % Do Gaussian blur
    sigma = min(size(input_image))*0.005;
    gauss_blur_image = imgaussfilt(input_image, sigma);
end