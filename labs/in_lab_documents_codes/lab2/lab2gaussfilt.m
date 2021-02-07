function [Filtered_img]= lab2gaussfilt(img)
 
    [row, col , ch] = size(img);
    if (ch == 3)
       img = rgb2gray(img); 
    end
    
    
    Gaussian_matrix = (1/273.)*[1, 4,  7,  4,  1;
                                4, 16, 26, 16, 4; 
                                7, 26, 41, 26, 7;
                                4, 16, 26, 16, 4; 
                                1, 4,  7,  4, 1];

    Filtered_img = zeros(size(img));                        
    img= double(img);
    k = 2;
    % method 1
     for i = k+1:1:row-k-1
         for j = k+1:1:col-k-1
             Window = img(i-k:i+k,j-k:j+k);
             value = sum(sum(Window.*Gaussian_matrix));
             Filtered_img(i, j) = value;
         end
     end
    
    % method 2
    %Filtered_img = conv2(img, Gaussian_matrix, 'full');
    
    img = uint8(img);
    Filtered_img = uint8(Filtered_img);
 
end
