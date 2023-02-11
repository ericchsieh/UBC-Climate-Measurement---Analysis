% Lab 4
clear
% loading the data for this lab
data=xlsread('STRATOGEM_plankton.xls');
STRATOGEMplankton = data(:,2:end);
Date = data(:,1);

% Part 2
sumrows = nansum(STRATOGEMplankton,2);
subplot(2,1,1)
plot(Date,sumrows)
xlabel('Date')
ylabel('Plankton Counts')
title('Total Planktonplankton Counts Time Series 2002-2005 (Linear Scale)')
% Plot created
subplot(2,1,2)
plot(Date,sumrows)
set(gca, 'yscale','log')
xlabel('Date')
ylabel('Phytoplankton Counts')
title('Total Phytoplankton Count Time Series 2002-2005 (Log Scale)')

% Part 3 in shannonWiener.m

% Part 4
% calculating the index per date
swIndex = zeros(51,1);
for j=1:51
    swIndex(j) = shannonWiener(STRATOGEMplankton(j,:));
end
% Plot the sw Index vs Date
figure(2)
plot(Date,swIndex)
xlabel('Shannon-Wiener Index')
ylabel('Date')
title('Shannon-Wiener Diversity Index in the Straight of Georgia 2002-2005')


% Part 5 calculate the sw-index and the annual total phytoplankton 
figure(3);
subplot(2,1,1);
plot(Date([10:27]),sumrows([10:27]));
xlabel('Month of Year (2003)');
ylabel('Total Phytoplankton Count');
set(gca, 'yscale', 'log');
title('Total Phytoplankton Count in 2003 (Logarithmic Scale)');
 
subplot(2,1,2);
plot(Date([10:27]),swIndex([10:27]));
xlabel('Month of Year (2003)');
ylabel('SW Diversity Index');
title('SW Diversity Index in 2003');

figure(4);
subplot(2,1,1);
plot(Date([28:43]),sumrows([28:43]));
xlabel('Month of Year (2004)');
ylabel('Total Phytoplankton Count');
set(gca, 'yscale', 'log');
title('Total Phytoplankton Count in 2004 (Logarithmic Scale)');
 
subplot(2,1,2);
plot(Date([28:43]),swIndex([28:43]));
xlabel('Month of Year (2004)');
ylabel('SW Diversity Index');
title('SW Diversity Index in 2004');



