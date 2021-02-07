function [E] = lab3log(I, T1, T2)  
    [r, c, ch] = size(I);
    if ch == 3
        I = rgb2gray(I);
    end
    
    J = imgaussfilt(I, 1.1);
    W = [0 1 0; 1 -4 1; 0 1 0];
    G = conv2(J, W, 'same');
    E = zeros(r, c);
    
    k = 1;
    for i = k+1:1:r-k-1
        for j = k+1:1:c-k-1
           if abs(G(i, j)) >= T1
               if (G(i-1, j)*G(i, j)<0 || G(i+1, j)*G(i, j)<0 || G(i, j-1)*G(i, j)<0 || G(i, j+1)*G(i, j)<0)
                   if abs(G(i-1, j) - G(i, j)) >= T2 || abs(G(i+1, j) - G(i, j)) >= T2 || abs(G(i, j-1) - G(i, j)) >= T2 || abs(G(i, j+1) - G(i, j)) >= T2 
                       E(i, j) = 255;
                   end
               end
           else 
               if (G(i-1, j)*G(i+1, j))<0 || (G(i, j-1)*G(i, j+1))<0
                   if abs(G(i, j+1) - G(i, j-1))/2 >= T2 || abs(G(i-1, j)- G(i+1, j))/2 >= T2
                       E(i, j) = 255;
                   end
               end
               
           end
        end
    end
    
    figure
    subplot(1, 3, 1)
    imshow(uint8(I))
    title('Original Image')
    
    subplot(1, 3, 2)
    imshow(G, [])
    title('Laplacian of the Image')
    
    subplot(1, 3, 3)
    imshow(E)
    title('LoG Edges')  
end