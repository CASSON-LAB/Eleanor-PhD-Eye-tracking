%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% Statistical Exploration and Analysis of Eye-tracking fixation durations
% and fixation counts
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


%% Mann Whitney test - PINK Chosen dress versus non chosen dress duration

clear x 
for p=1:10
x(p,:) = [participant(p).dress_choice_fixation_duration];
end

clear y
for p=1:10
y(p,:) = [participant(p).non_dress_choice_fixation_duration];
end

chosen = x(:); %converts matrix into single vector
non_chosen = y(:); 

[p_chosen_pink_dur, h_chosen_pink_dur, stats_chosen_pink_dur] = ranksum(chosen, non_chosen);


%% Mann Whitney test - BLUE Chosen dress versus non chosen dress duration

clear x 
for p=1:8
x(p,:) = [participant(p+10).dress_choice_fixation_duration];
end

clear y
for p=1:8
y(p,:) = [participant(p+10).non_dress_choice_fixation_duration];
end

chosen = x(:); %converts matrix into single vector
non_chosen = y(:); 

[p_chosen_blue_dur, h_chosen_blue_dur, stats_chosen_blue_dur] = ranksum(chosen, non_chosen);


%% Mann Whitney test - RED Chosen dress versus non chosen dress duration

clear x 
for p=1:8
x(p,:) = [participant(p+18).dress_choice_fixation_duration];
end

clear y
for p=1:8
y(p,:) = [participant(p+18).non_dress_choice_fixation_duration];
end

chosen = x(:); %converts matrix into single vector
non_chosen = y(:); 

[p_chosen_red_dur, h_chosen_red_dur, stats_chosen_red_dur] = ranksum(chosen, non_chosen);





%%%%%%%%%%%%%%%%%%%%%%% FIXATION COUNT  %%%%%%%%%%%%%%%%%%%%%%%%%% 
% Mann Whitney test - PINK Chosen dress versus non chosen dress count

clear x 
for p=1:10
x(p,:) = [participant(p).dress_choice_fixation_count];
end

clear y
for p=1:10
y(p,:) = [participant(p).non_dress_choice_fixation_count];
end

chosen = x(:); %converts matrix into single vector
non_chosen = y(:); 

[p_chosen_pink_count, h_chosen_pink_count, stats_chosen_pink_count] = ranksum(chosen, non_chosen);


%% Mann Whitney test - BLUE Chosen dress versus non chosen dress duration

clear x 
for p=1:8
x(p,:) = [participant(p+10).dress_choice_fixation_count];
end

clear y
for p=1:8
y(p,:) = [participant(p+10).non_dress_choice_fixation_count];
end

chosen = x(:); %converts matrix into single vector
non_chosen = y(:); 

[p_chosen_blue_count, h_chosen_blue_count, stats_chosen_blue_count] = ranksum(chosen, non_chosen);


%% Mann Whitney test - RED Chosen dress versus non chosen dress duration

clear x 
for p=1:8
x(p,:) = [participant(p+18).dress_choice_fixation_count];
end

clear y
for p=1:8
y(p,:) = [participant(p+18).non_dress_choice_fixation_count];
end
 
chosen = x(:); %converts matrix into single vector
non_chosen = y(:); 

[p_chosen_red_count, h_chosen_red_count, stats_chosen_red_count] = ranksum(chosen, non_chosen);



%% Print Values


p_values = [p_chosen_pink_dur p_chosen_blue_dur p_chosen_red_dur p_chosen_pink_count p_chosen_blue_count p_chosen_red_count]

h_values = [h_chosen_pink_dur h_chosen_blue_dur h_chosen_red_dur h_chosen_pink_count h_chosen_blue_count h_chosen_red_count]


