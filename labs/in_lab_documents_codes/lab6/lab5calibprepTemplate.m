% start 
clear all; close all; clc;

img = imread('myobject.png');
[row, col, ch]=size(img);
if ch==3
    img_gray = rgb2gray(img);
end

img_edge = edge(img_gray,'canny');
imshow(img_edge);


% HOUGH TRANSFORM - Extract Lines

[H,theta,rho] = hough(img_edge);  % hough [H, theta, rho] =

P  = houghpeaks(H,2000,'threshold',ceil(0.3*max(H(:)))); % houghpeaks P = 
% houghlines line = 
line = houghlines(img_edge,theta,rho,P,'FillGap',10,'MinLength',10);


% PLOT HOUGHLINES  

figure 
subplot(1,2,1), imshow(img)
subplot(1,2,2), imshow(img_gray)
hold on
for k = 1:length(line)
    xy = [line(k).point1; line(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',1,'Color','green');
    plot(xy(1,1),xy(1,2),'x','MarkerSize',4,'Color','yellow');
    plot(xy(2,1),xy(2,2),'x','MarkerSize',4,'Color','red');
    len = norm(line(k).point1 - line(k).point2);
end
hold off



% SELECT TWO INTERSECTING LINES MANUALLY

Lines_B = [319 333; 266 343]; % Beginning points
Lines_E = [372 368; 285 339];% End points 

% Extract corresponding theta (T) and rho (R) values from the output of 'houghlines' function

line1_idx = 180;
line2_idx = 247;


Thetas =[];
Rhos =[];
for p = 1:2
    for k=1:length(line)
        if ismember(line(k).point1, Lines_B(p, :)) & ismember(line(k).point2, Lines_E(p, :))  % use ismember
            Thetas = [Thetas; line(k).theta];
            Rhos = [Rhos; line(k).rho];
        end
    end
end
% PLOT INTERSECTING LINES

x_v = 0:size(img,1);
x_h = 0:size(img,2);

figure
imshow(img)
hold on 

for i=1:length(Thetas)
   xPoint = x_v;
   yPoint = (Rhos(i) - xPoint*cosd(Thetas(i)))/sind(Thetas(i));
   plot(xPoint, yPoint, 'Color', 'magenta')
end

A = [cosd(Thetas(1)) , sind(Thetas(1));
     cosd(Thetas(2)) , sind(Thetas(2));
     ];
b = [Rhos(1);Rhos(2)];

C = A\b;

% HARRIS CORNERS
harris = corner(img_gray,"harris",2000);

% PLOTTING CORNERS FOR COMPARISON
plot(harris(:,1),harris(:,2),'bo',"MarkerSize",4);

plot(C(1), C(2), 'x', "MarkerSize",4,'Color', 'magenta');
    
x1 = C(1);
y1 = C(2);
x2 = 367;
y2 = 0;

distance = sqrt((x2-x1)^2+(y2-y1)^2);
disp('The distance:')
disp(distance)


