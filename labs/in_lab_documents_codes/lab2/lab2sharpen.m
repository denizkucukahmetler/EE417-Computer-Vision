function [Simg] = lab2sharpen(img, lambda, M)
    [row, col, ch] = size(img);
    if (ch == 3)
        img = rgb2gray(img);
    end
   if (M == 1)
       Smoothed = lab1locbox(img,2);
   elseif(M == 2)
       Smoothed = lab2gaussfilt(img);
   elseif(M == 3)
       Smoothed = lab2medfilt(img,3);
       % k is 3
   end
   
   img = double(img);
   Smoothed = double(Smoothed);
   disp(size(img));
   disp(size(Smoothed));
   Simg = img + lambda*(img - Smoothed); %Formula
   
   img = uint8 (img);
   Smoothed = uint8(Smoothed);
   Simg = uint8(Simg);

end