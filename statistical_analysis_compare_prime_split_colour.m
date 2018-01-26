%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% Statistical Exploration and Analysis of Eye-tracking fixation durations
% and fixation counts
% 
% Prime values only - separatd into colour condition groups
% 
% Statistical comparisons - Mann Whitney Test
% Outputs of interest are h and p values
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
clc

%% Load data

% Select which data to load
% Uncomment the data wanted for analysis

run 'eye_tracking_data_intervals_start_to_exit'; %This is the whole experiment, from the first fixation, until they leave trun to leave the store. Does not include fixations made on dresses as walking out of the store.



%% Fixation duration

% PINK prime fixation duration
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

% Prime fixation duration values
x1_dur = x1(:);
x2_dur = x2(:);
x3_dur = x3(:);


% BLUE non-prime fixation duration
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


% Non-Prime fixation duration values
y1_dur = y1(:);
y2_dur = y2(:);
y3_dur = y3(:); 

clear x1 x2 x3 y1 y2 y3;

%% Fixation Count

% PINK prime fixation count
clear x1
for p=1:10
x1(p,:) = [participant(p).prime_fixation_count];
end

% BLUE prime fixation count
clear x2
for p=1:8
x2(p,:) = [participant(p+10).prime_fixation_count];
end

% RED prime fixation count
clear x3
for p=1:8
x3(p,:) = [participant(p+18).prime_fixation_count];
end

% Prime fixation count values
x1_count = x1(:);
x2_count = x2(:);
x3_count = x3(:);


% PINK non-prime fixation count
clear y1
for p=1:10
y1(p,:) = [participant(p).non_prime_fixation_count];
end

% BLUE non-prime fixation count
clear y2
for p=1:8
y2(p,:) = [participant(p+10).non_prime_fixation_count];
end

% RED non-prime fixation count
clear y3
for p=1:8
y3(p,:) = [participant(p+18).non_prime_fixation_count];
end


% Non-Prime fixation count values
y1_count = y1(:);
y2_count = y2(:);
y3_count = y3(:); 

clear x1 x2 x3 y1 y2 y3;
%% %%%%%%%%%% DURATION %%%%%%%%%% %% 

prime_all_dur(1:30,1) = x1_dur;
prime_all_dur(31:102,1) = x2_dur;
prime_all_dur(103:150,1) = x3_dur;
non_prime_all_dur(1:200,1) = y1_dur;
non_prime_all_dur(201:312,1) = y2_dur;
non_prime_all_dur(313:448,1) = y3_dur;

prime  = prime_all_dur;
non_prime = non_prime_all_dur;

[p_dur_all, h, s] = ranksum(prime, non_prime);

% Duration - pink participants
prime = x1_dur;
non_prime = y1_dur;
[p_dur_pink, h, s] = ranksum(prime, non_prime);

% Duration - blue participants
prime = x2_dur;
non_prime = y2_dur;
[p_dur_blue, h, s] = ranksum(prime, non_prime);

% Duration - red participants
prime = x3_dur;
non_prime = y3_dur;
[p_dur_red, h, s] = ranksum(prime, non_prime);

% Plot
duration = [p_dur_all, p_dur_pink, p_dur_blue, p_dur_red]

bar(duration)
    title ('Fixation Duration')
    ylabel('p value')
    hold on
    plot(xlim, [1 1]*0.05, '-r')
    hold off


%% %%%%%%%%%% COUNT %%%%%%%%%% %% 

% All Participants
prime_all_count(1:30,1) = x1_count;
prime_all_count(31:102,1) = x2_count;
prime_all_count(103:150,1) = x3_count;
non_prime_all_count(1:200,1) = y1_count;
non_prime_all_count(201:312,1) = y2_count;
non_prime_all_count(313:448,1) = y3_count;

prime  = prime_all_count;
non_prime = non_prime_all_count;

[p_count_all, h, s] = ranksum(prime, non_prime);

% Pink participants
prime = x1_count;
non_prime = y1_count;
[p_count_pink, h, s] = ranksum(prime, non_prime);

% Blue participants
prime = x2_count;
non_prime = y2_count;
[p_count_blue, h, s] = ranksum(prime, non_prime);

% Red participants
prime = x3_count;
non_prime = y3_count;
[p_count_red, h, s] = ranksum(prime, non_prime);

% Plot
count = [p_count_all, p_count_pink, p_count_blue, p_count_red]

figure; bar(count)
    title ('Fixation Count')
    ylabel('p value')
    hold on
    plot(xlim, [1 1]*0.05, '-r')
    hold off
