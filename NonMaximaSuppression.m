function Image_magnitude_final = NonMaximaSuppression(Image_magnitude, Image_angle)
[hight, widht] = size(Image_magnitude);

Image_magnitude_final = Image_magnitude;

for y = 2:hight-1
  for x = 2:widht-1
    angle = Image_angle(y, x);
    % Horizontal edge
    if (-22.5 <= angle && angle < 22.5) || (157.5 <= angle || angle < -157.5)
        if Image_magnitude_final(y, x) < Image_magnitude (y, x-1) || Image_magnitude_final(y, x) < Image_magnitude (y, x+1)
            Image_magnitude_final(y, x) = 0;
        end
    end
    % Vertical edge
    if (67.5 <= angle && angle < 112.5) || (-112.5 <= angle && angle < -67.5)
        if Image_magnitude_final(y, x) < Image_magnitude (y, x-1) || Image_magnitude_final(y, x) < Image_magnitude (y+1, x)
            Image_magnitude_final(y, x) = 0;
        end
    end
    % + 45deg edge
    if (22.5 <= angle && angle < 67.5) || (-157.5 <= angle && angle < -112.5)
        if Image_magnitude_final(y, x) < Image_magnitude (y-1, x-1) || Image_magnitude_final(y, x) < Image_magnitude (y+1, x+1)
            Image_magnitude_final(y, x) = 0;
        end
    end
    % -45deg edge
    if (112.5 <= angle && angle < 157.5) || (-67.5 <= angle && angle < -22.5)
        if Image_magnitude_final(y, x) < Image_magnitude (y+1, x-1) || Image_magnitude_final(y, x) < Image_magnitude (y-1, x+1)
            Image_magnitude_final(y, x) = 0;
        end
    end
  end
end