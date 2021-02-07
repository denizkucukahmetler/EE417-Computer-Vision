function [Inew] = lab1inscale(Im)

[h,w,c] = size(Im)
if c==3
    Im = rgb2gray(Im);
end

I = double(Im);

a = -min(I(:)); %make the matrix as a column matrix
Gmax = 255;

b = Gmax / ( max(I(:))-min(I(:)) );

%calculate new image with old image(I)
Inew = b*(I+a);

Inew = uint8(Inew);
subplot(2,2,1),imshow(Im); %2x2, 1.
title 'Original Image'
subplot(2,2,2),imshow(Inew);
title 'Scaled Image'
subplot(2,2,3),histogram(Im);
subplot(2,2,4),histogram(Inew);
end
