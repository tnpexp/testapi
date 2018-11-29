clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures if you have the Image Processing Toolbox.
clear;  % Erase all existing variables. Or clearvars if you want.
workspace;  % Make sure the workspace panel is showing.
format long g;
format compact;
fontSize = 18;

%===============================================================================

rgbImage = imread('grades5.jpg');

% Get the dimensions of the image.  numberOfColorBands should be = 3.
[rows, columns, numberOfColorBands] = size(rgbImage);
% Display the original color image.
subplot(3, 3, 1);
imshow(rgbImage);
%-------------------------------------x = meanf
axis on;
title('Original Color Image', 'FontSize', fontSize);
% Enlarge figure to full screen.
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
hsv = rgb2hsv(rgbImage);

h = hsv(:,:,1);
s = hsv(:,:,2);
v = hsv(:,:,3);
subplot(3, 3, 2);
imshow(hsv)
title('HSV Image', 'FontSize', fontSize);

imgray = rgb2gray(hsv);
subplot(3, 3, 3);
imshow(imgray)
title('imgray Color Image', 'FontSize', fontSize);


imjust = imadjust(imgray)
subplot(3, 3, 4);
imshow(imjust);
title('imjust Color Image', 'FontSize', fontSize);
%--------------------------------------------------------------------------------
% Display the individual color channel images.
%subplot(3, 4, 2);
%imshow(s, []);
%title('Hue Channel Image', 'FontSize', fontSize);
%--------------------------------------------------------------------------------
% Let's compute and display the histograms.


bw = im2bw(imjust);
subplot(3, 3, 5); 
imshow(bw, []);
title('black and white Image', 'FontSize', fontSize);

[count_ori, bin] = imhist(imjust);
[count_bw, bin] = imhist(bw);
subplot(3,3,6),imhist(rgbImage),title('Original Image');
subplot(3,3,9),imhist(bw),title('black and white histogram equalization');

%%%%%%%%
X = rand(1,1000);
nbins = 25;
[n,xout] = hist(X,nbins);
bin_spacing = xout(2)-xout(1);
Y = rand(1);
[min_val, index] = min(abs(xout-Y));
temp_n = zeros(size(n)); temp_n(index) = 1;
n = n + temp_n;
 A= count_bw(1,1)

if (A >= 15000)&& (A <= 20000)
    disp('GRADE 3')
    grade = '3'
elseif(A >= 20001)&& (A <= 49999)
    disp('GRADE 5')
    grade = '5'
elseif(A >= 50000)&& (A <= 52000)
    disp('GRADE 5')
    grade = '5'
else
    disp('ERROR')
    grade = 'ERROR'
end
