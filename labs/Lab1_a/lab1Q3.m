% clears the command window
clc
% close all opened windows/figures
close all

% Omit values in T that are -9999
T(T == -9999) = NaN;
figure(1)
% plotting graph of T against -D 
mask = D <= 250;
% set the permitted values to be D->lim(d<=250)
D(mask) = NaN;
% plotting Temperature vs Depth Graph 
plot(T, -D, 'k.')
% Label for x-axis
xlabel('Temperature (degrees Celsius)')
% Label for y-axis
ylabel('Depth (meters)')
% Label for title
title('Temperature vs Depth Graph')