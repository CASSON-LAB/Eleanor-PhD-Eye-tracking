%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% Statistical Exploration and Analysis of Eye-tracking fixation durations
% and fixation counts
% 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
clc

%% Load data

% Select which data to load
% Uncomment the data wanted for analysis

run 'eye_tracking_data_intervals_start_to_exit'; %This is the whole experiment, from the first fixation, until they leave trun to leave the store. Does not include fixations made on dresses as walking out of the store.
%run 'eye_tracking_data_intervals_start_to_intervals_end'; 
%run 'eye_tracking_data_intervals_end_to_exit'; %This is at the end of the experiment, betwen the last interval and leaving the store. Possibly where the decision was made
%run 'eye_tracking_data_stop_1_3'; 
%run 'eye_tracking_data_stop_2_4';



%% Explore whether all data is normalised 
% All data is the fixation duration and the fixation counts on all of the
% dresses

x = all_dresses_fixation_duration_time1; %this is all of the fixation duration data as one vector, not linked ot individual participants
y = all_dresses_fixation_count;

% QQ plot
figure;
subplot(1,2,1)
 qqplot(x)
 title('QQ Plot of Fixation Duration Data versus Standard Normal')
subplot(1,2,2)
 qqplot(y)
 title('QQ Plot of Fixation Count Data versus Standard Normal')

 %%
%Histogram 
figure;
histogram(x)
    xlabel('Fixation Duration on a single dress (seconds)')
    ylabel('Frequency')

figure;
histogram(y)
    xlabel('Fixation count on a single dress')
    ylabel('Frequency')
 
 
 %%
 
% Normplot
% figure; normplot(x)
% figure; normplot(y)

% Kolmogorov-Smirnov Test
[KS_duration_h, KS_duration_p] = kstest(x);
[KS_count_h, KS_count_p] = kstest(y);

% Shapiro-Wilk test
%Need to download and run swtest.m - find in mathworks
[SW_duration_h, SW_duration_p, SW_duration_W] = swtest(x);
[SW_count_h, SW_count_p, SW_count_W] = swtest(y);

% Skewness test for all fixation data, not split individually for
% participants 
skew_duration = skewness(x);
skew_count = skewness(y);

kurt_duration = kurtosis(x);
kurt_count = kurtosis(y);

% Test results need confirming, but safe to assume data is not normally
% distrubuted


%% All participants fixations on all dresses box-plot

clear a
for p=1:26
a(p,:) = [participant(p).all_dress_fixation_duration];
end

figure;
boxplot(a')
xlabel('Participants')
ylabel('Fixation Duration')
title('Individual Participants Durations on All Dresses')



%% Box plot for dress choice and non-dress choice - fixation duration
clear x 
for p=1:26
x(p,:) = [participant(p).dress_choice_fixation_duration];
end

clear y
for p=1:26
y(p,:) = [participant(p).non_dress_choice_fixation_duration];
end

figure;
subplot(2,1,1)
boxplot(x')
xlabel('Participants')
ylabel('Fixation Duration')
title('Individual Participants Fixation Durations on Their Chosen Dresses')
subplot(2,1,2)
boxplot(y')
xlabel('Participants')
ylabel('Fixation Duration')
title('Individual Participants Fixation Durations on The Dresses They Did Not Choose')


%% PINK prime fixation duration
clear x1
for p=1:10
x1(p,:) = [participant(p).prime_fixation_duration];
end

% BLUE prime fixation duration
clear x2
for p=1:8
x2(p,:) = [participant(p+10).prime_fixation_duration];
end

% RED prime fixation duration
clear x3
for p=1:8
x3(p,:) = [participant(p+18).prime_fixation_duration];
end

%% PINK non-prime fixation duration
clear y1
for p=1:10
y1(p,:) = [participant(p).non_prime_fixation_duration];
end

% BLUE non-prime fixation duration
clear y2
for p=1:8
y2(p,:) = [participant(p+10).non_prime_fixation_duration];
end

% RED non-prime fixation duration
clear y3
for p=1:8
y3(p,:) = [participant(p+18).non_prime_fixation_duration];
end

%% boxplot prime and non prime together

figure;
subplot(3,2,1)
    boxplot(x1')
    title('Pink Participants Prime Fixation Duration')
    ylim([0 15])
subplot(3,2,3)
    boxplot(x2')
    title('Blue Participants Prime Fixation Duration')
    ylim([0 15])
subplot(3,2,5)
    boxplot(x3')
    title('Red Participants Prime Fixation Duration')
    ylim([0 15])
subplot(3,2,2)
    boxplot(y1')
    title('Pink Participants Non-Prime Fixation Duration')
    ylim([0 15])
subplot(3,2,4)
    boxplot(y2')
    title('Blue Participants Non-Prime Fixation Duration')
    ylim([0 15])
subplot(3,2,6)
    boxplot(y3')
    title('Red Participants Non-Prime Fixation Duration')
    ylim([0 15])
    
 





















    