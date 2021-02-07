function [GaussianFiltered, Filtered_img] = lab2medfilt(img, k)

    [row, col , ch] = size(img);
    if (ch == 3)        %convert 
       img = rgb2gray(img); 
    end
    
    img = double(img);
    Filtered_img = zeros(size(img));
    GaussianFiltered = lab2gaussfilt(img);
    
    for i = k+1:1:row-k-1
        for j = k+1:1:col-k-1
            Window = img(i-k:i+k, j-k:j+k);
            value = myMedian(Window);
            Filtered_img(i,j) = value;
            
        end
    end

    img = uint8(img);
    Filtered_img = uint8(Filtered_img);

end