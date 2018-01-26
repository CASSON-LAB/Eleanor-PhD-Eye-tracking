%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% Extract Data
% 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
clc

%% Import eye-tracking fixation data

filename{1} = 'AOI_total_fixation_duration_intervals_start_to_intervals_end'; %Excel file, created from Tobii export,includes zeros
filename{2} = 'AOI_total_fixation_count_intervals_start_to_intervals_end.xlsx';


addpath = '\\nasr.man.ac.uk\epsrss$\snapped\replicated\casson\individual_areas\eleanor\Data\Eye_tracking_data\Tobii_exports\';

pathname = '\\nasr.man.ac.uk\epsrss$\snapped\replicated\casson\individual_areas\eleanor\Data\Eye_tracking_data\Tobii_exports\';

    
[num,txt,raw1] = xlsread([pathname '\' filename{1}]); %fixation duration (inc zeros)
[num,txt,raw2] = xlsread([pathname '\' filename{2}]); %fixation count (inc zeros)

new_raw1 = raw1(3:28,3:33); %cutting out the text
new_raw2 = raw2(3:28,3:33);

%% find dress choice and non-dress choice

filename{3} = 'dress_choice2.xlsx'; %excel file with participant number and chosen dress AOI numbers
filename{4} = 'non_dress_choice3.xlsx'; %excel file with participant number and non-chosen dress AOI numbers (does not include non-dress AOIs)

[num,txt,raw3] = xlsread([pathname '\' filename{3}]);
[num,txt,raw4] = xlsread([pathname '\' filename{4}]);


%% Chosen dress fixation duration 
n=1;
for L=1:1:26
	for i = 1:1:3 
    		
	y = raw3{n,2};
	
	participant(L).dress_choice_fixation_duration(i) = new_raw1{L,y};
    n=n+1;

    end
end

%% Chosen dress fixation count 
n=1;
for L=1:1:26
	for i = 1:1:3 
    		
	y = raw3{n,2};
	
	participant(L).dress_choice_fixation_count(i) = new_raw2{L,y};
    n=n+1;

    end
end


%% Non-chosen dress fixation duration

n=1;
for L=1:1:26
	for i = 1:1:20 
    		
	y = raw4{n,2};
	
	participant(L).non_dress_choice_fixation_duration(i) = new_raw1{L,y};
    n=n+1;

    end
end

%% Non-chosen dress fixation count
n=1;
for L=1:1:26
	for i = 1:1:20 
    		
	y = raw4{n,2};
	
	participant(L).non_dress_choice_fixation_count(i) = new_raw2{L,y};
    n=n+1;

    end
end



%% find prime and non-prime

filename{5} = 'prime2.xlsx'; %excel file with participant number and prime dress AOI numbers
filename{6} = 'non_prime3.xlsx'; %excel file with participant number and non-prime dress AOI numbers (does not include non-dress AOIs)

[num,txt,raw5] = xlsread([pathname '\' filename{5}]); %excel file containing participant numbers matched with participant prime AOI numbers
[num,txt,raw6] = xlsread([pathname '\' filename{6}]); %excel file containing participant numbers matched with participant non-prime AOI numbers


%% Prime fixation duration
% Three different colours have three different amounts of prime dresses in
% the room 
% pink = 3 prime dresses
% blue = 9 prime dresses
% red = 6 prime dresses

% pink participants = 1:1:10
n=1;
for L=1:1:10
	for i = 1:1:3 
    		
	y = raw5{n,2};
	
	participant(L).prime_fixation_duration(i) = new_raw1{L,y};
    n=n+1;

    end
end

% blue participants = 11:1:18
for L=11:1:18
	for i = 1:1:9 
    		
	y = raw5{n,2};
	
	participant(L).prime_fixation_duration(i) = new_raw1{L,y};
    n=n+1;

    end
end

% red participants = 19:1:26
for L=19:1:26
	for i = 1:1:6 
    		
	y = raw5{n,2};
	
	participant(L).prime_fixation_duration(i) = new_raw1{L,y};
    n=n+1;

    end
end

%% Prime fixation count

% pink participants = 1:1:10
n=1;
for L=1:1:10
	for i = 1:1:3 
    		
	y = raw5{n,2};
    
	participant(L).prime_fixation_count(i) = new_raw2{L,y};
    n=n+1;

    end
end

% blue participants = 11:1:18
for L=11:1:18
	for i = 1:1:9 
    		
	y = raw5{n,2};
	
	participant(L).prime_fixation_count(i) = new_raw2{L,y};
    n=n+1;

    end
end

% blue participants = 11:1:18
for L=19:1:26
	for i = 1:1:6 
    		
	y = raw5{n,2};
	
	participant(L).prime_fixation_count(i) = new_raw2{L,y};
    n=n+1;

    end
end

%% Non Prime fixation duration

% pink participants = 1:1:10
n=1;
for L=1:1:10
	for i = 1:1:20 
    		
	y = raw6{n,2};
	
	participant(L).non_prime_fixation_duration(i) = new_raw1{L,y};
    n=n+1;

    end
end

% blue participants = 11:1:18
for L=11:1:18
	for i = 1:1:14 
    		
	y = raw6{n,2};
	
	participant(L).non_prime_fixation_duration(i) = new_raw1{L,y};
    n=n+1;

    end
end

% red participants = 19:1:26
for L=19:1:26
	for i = 1:1:17 
    		
	y = raw6{n,2};
	
	participant(L).non_prime_fixation_duration(i) = new_raw1{L,y};
    n=n+1;

    end
end

%% Non Prime fixation count

% pink participants = 1:1:10
n=1;
for L=1:1:10
	for i = 1:1:20 
    		
	y = raw6{n,2};
	
	participant(L).non_prime_fixation_count(i) = new_raw2{L,y};
    n=n+1;

    end
end

% blue participants = 11:1:18
for L=11:1:18
	for i = 1:1:14 
    		
	y = raw6{n,2};
	
	participant(L).non_prime_fixation_count(i) = new_raw2{L,y};
    n=n+1;

    end
end

% red participants = 19:1:26
for L=19:1:26
	for i = 1:1:17 
    		
	y = raw6{n,2};
	
	participant(L).non_prime_fixation_count(i) = new_raw2{L,y};
    n=n+1;

    end
end

%% All Dress AOI's for all participants

filename{7} = 'all_dress_AOIs.xlsx'; %excel file with participant number and all dress AOI numbers

[num,txt,raw7] = xlsread([pathname '\' filename{7}]);


%% Dress choice fixation duration and fixation count

L7 = length(raw7); % length of excel file with participant number and chosen dress AOI numbers (26*3 = 78, 6 participants, 3 chosen dresses each)

for L = 1:1:L7 
    
x = raw7{L,1};
y = raw7{L,2};

all_dresses_fixation_duration(L) = new_raw1{x,y}; % vector of all participants fixation durations on all dresses

end

for l = 1:1:L7
    
x = raw7{l,1};
y = raw7{l,2};

all_dresses_fixation_count(l) = new_raw2{x,y}; % vector of all participants fixation count on all dresses

end

%% Link participants numbers to their fixations on all dresses

% Link participants to their fixation duration
n=1;
for L=1:1:26
	for i = 1:1:23 
    		
	y = raw7{n,2};
	
	participant(L).all_dress_fixation_duration(i) = new_raw1{L,y};
    n=n+1;

    end
end

%Link participants to their fixation count

n=1;
for L=1:1:26
	for i = 1:1:23 
    		
	y = raw7{n,2};
	
	participant(L).all_dress_fixation_count(i) = new_raw2{L,y};
    n=n+1;

    end
end


%% First choice dress

filename{8} = 'first_choice_dress.xlsx'; %excel file with participant number and chosen dress AOI numbers
[num,txt,raw8] = xlsread([pathname '\' filename{8}]);


%% First choice dress fixation duration 
n=1;
for L=1:1:26
    
	y = raw8{n,2};
	
	participant(L).first_choice_fixation_duration = new_raw1{L,y};
    n=n+1;
  
end

%% First choice dress fixation count 
n=1;
for L=1:1:26
	
    y = raw8{n,2};
	
	participant(L).first_choice_fixation_count = new_raw2{L,y};
    n=n+1;
   
end


%% First choice dress

filename{8} = 'first_choice_dress.xlsx'; %excel file with participant number and chosen dress AOI numbers
[num,txt,raw8] = xlsread([pathname '\' filename{8}]);


%% First choice dress fixation duration 
n=1;
for L=1:1:26
    
	y = raw8{n,2};
	
	participant(L).first_choice_fixation_duration = new_raw1{L,y};
    n=n+1;
  
end

%% First choice dress fixation count 
n=1;
for L=1:1:26
	
    y = raw8{n,2};
	
	participant(L).first_choice_fixation_count = new_raw2{L,y};
    n=n+1;
   
end





clearvars -except participant all_dresses_fixation_duration all_dresses_fixation_count


