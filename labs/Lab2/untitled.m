% Lab 2
clear

[num text all]=xlsread('airtemp.xlsx');
TairAvgDaily = num(:,2);
temporary_data = num(:,2);
% filter out the header row of 'text'
Date = text(2:end, 1);
% convert datevectors [yyy mm dd ...] to computer-readable data
Date = datenum(Date);
% 1) temp_date vs temp_data graph plotted
dates = 1:21185;
dates = dates(:);
figure(1);
subplot(3,2,1)
plot(dates, TairAvgDaily);
title('Daily Mean Temperatures')
xlabel('Days')
ylabel('Air Temperature (Celsius)')

% date in vector format
dv = datevec(Date);
% years data
year_col = dv(:,1);
% months data
month = dv(:,2);

% 2) Monthly averages, standard deviation, Min, and Max
avg_monthly_temp = [];
avg_monthly_std = [];
monthly_max = [];
monthly_min = [];
for n = 1:12
    mask = (month == n);
    avg_monthly_temp(n) = nanmean(TairAvgDaily(mask));
    avg_monthly_std(n) = nanstd(TairAvgDaily(mask));
    monthly_max(n) = max(TairAvgDaily(mask));
    monthly_min(n) = min(TairAvgDaily(mask));
end
% Create a month vector
months = 1:12;
% Plotting the five curves:
%figure(2);
subplot(3,2,2)
plot(months, avg_monthly_temp);
title('Monthly Average Temperatures')
xlabel('Months')
ylabel('Air Temperature (Celsius)')
hold on
% 2. The average temperature minus one s.d.
plot(months,avg_monthly_temp - avg_monthly_std);
% 3. The average temperature plus one s.d.
plot(months,avg_monthly_temp + avg_monthly_std);
% 4. The minimum temperature
plot(months, monthly_min);
% 5. The maximum temperature
plot(months, monthly_max);
% create legend
legend('Average Temp.','Average Temp - σ', 'Average Temp + σ', 'Minimum Temp.', 'Maximum Temp.')
hold off

% Create a monthly time-series
% 3) Monthly mean temperature 
avg_temp_monthly = [];
% number of months counter
n = 0;
for yr = 1959:2016
    for m = 1:12
        mask1 = (year_col == yr);
        mask2 = (month == m);
        mask = mask1&mask2;
        n = n+1;
        avg_temp_monthly(n) = nanmean(TairAvgDaily(mask));
    end
end
% Dataset has a total of 144 months
% Find how many months in avg_temp_monthly:
sz = size(avg_temp_monthly,2);
months = 1:sz;

% 4) Monthly Temperature Anomaly Time Series
avg_temp_monthly_anom = [];
% number of months counter
n = 0;
for yr = 1959:2016
    for m = 1:12
        mask1 = (year_col == yr);
        mask2 = (month == m);
        % find the overlapping of the two masks
        mask = mask1&mask2;
        n = n+1;
        % When the average is NaN, set datapoint to NaN
        if avg_temp_monthly(n) == NaN
            avg_temp_monthly_anom(n) = NaN;
        else
            % This month's average minus the monthly average
            avg_temp_monthly_anom(n) = nanmean(TairAvgDaily(mask))-avg_monthly_temp(m);
        end
    end
end
% Create plot for Average Monthly Temperature Anomalies
% figure(3);
subplot(3,1,3)
plot(months, avg_temp_monthly_anom);
title('Average Monthly Temperature Anomaly Time Series (1959 - 2016)')
xlabel('Month')
ylabel('Air Temperature (Celsius)')



