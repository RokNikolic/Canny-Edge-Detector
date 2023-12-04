function [magnitude, angle] = GetMagnitudeAndAngle (image)
    % Prewitt cross
    kx = [-1 0 +1; -1 0 +1; -1 0 +1];
    ky = [-1 -1 -1; 0 0 0; +1 +1 +1];
    % Horizontal gradient
    gradient_x = conv2(image, kx, 'same');
    % Vertical gradient
    gradient_y = conv2(image, ky, 'same');
    % Gradient vector magnitude
    magnitude = sqrt(gradient_x.^2 + gradient_y.^2);
    % Gradient vector angle
    angle = atan2d(gradient_y, gradient_x);
end