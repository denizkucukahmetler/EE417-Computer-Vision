function [Jnew] =lab1condscale(Im,Iref)
[~,~,c] = size(Im);
%check the image
if c==3
    Im =rgb2gray(Im);
end

%check referance image
[~,~,c] = size(Iref);
if c==3
    Iref = rgb2gray(Iref);
end

%matrices
J = double(Im);
I = double(Iref);

b = std(I(:))/std(J(:)); 
a= mean(I(:))/b-mean(J(:));

Jnew = b*(J+a);
disp([ mean(I(:)), mean(J(:)),mean(Jnew(:)) ]);
disp([ std(I(:)), std(J(:)),std(Jnew(:)) ]);

Jnew=uint8(Jnew);

subplot(2,2,1),imshow(Iref); %2x2, 1.
title 'Reference Image'
subplot(2,2,3),imshow(Im);
title 'Original Image'
subplot(2,2,4),imshow(Jnew);
title 'Processed Image'
end