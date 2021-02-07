function [X_filtered, Y_filtered] = lab3sobe(img)
    T = 100;
    
    [row, col, ch] = size(img);
    if (ch == 3)
      img = rgb2gray(img);
    end
    
    img = double(img);
    x_Filter = [-1 0 1; -2 0 2; -1 0 1];
    y_Filter = [-1 -2 -1; 0 0 0; 1 2 1];
    k = 1;
    
    for i = k+1:1:row-k-1  
        for j = k+1:1:col-k-1
            window = img(i-k:i+k,j-k:j+k);
            Xvalue = sum(sum(window.*x_Filter));
            Yvalue = sum(sum(window.*y_Filter));
            x_filtered(i,j) = Xvalue;
            y_filtered(i,j) = Yvalue;
            gradient(i,j) = sqrt(Xvalue*Xvalue + Yvalue*Yvalue);
            if (gradient(i,j) > T)
               img(i,j) = 255;
            else
               img(i,j) = 0;
            end
        end 
    end
    
     img = uint8(img);
    x_filtered = uint8(x_filtered);
    y_filtered = uint8(y_filtered);
    
    
    figure;
    subplot(2,3,1)
    imshow(img)
    title('Original Image');
    subplot(2,3,2)
    imshow(uint8(x_filtered))
    title('Sobel X Filtered Image: Vertical Edgels');
    subplot(2,3,3)
    imshow(y_filtered)
    title('Sobel Y Filtered Image: Horizontal Edgels');
    
end