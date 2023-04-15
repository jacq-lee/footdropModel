%% Simulation 1 - Control
% small pw (50 microseconds)
% frequency - 25 Hz
% no fatigue

clear
clc

% assume tibialis rest length is when the person is standing (pi/2)
resting_length_muscle = tibialis_length(pi/2)*0.6;
resting_length_tendon = tibialis_length(pi/2)*0.4;

% Swing portion of gate cycle (s), taken from research
T = 0.41; 

% Initial ankle angle is value obtained from literature 
% (107 degrees or 1.8675 rad in 355 coordinate system)
x1_initial = -0.2967;

simulation_1 = MuscleModel(52,0.0137,0.03475,3,0,12,50e-6,25,resting_length_muscle,resting_length_tendon);

[t1, state1, t_t1, t_e1] = simulate(T, simulation_1, x1_initial);

%%
% close all
plot_results(t1, state1, t_t1, t_e1);

%%
for i = 1:30:length(state1)
    ankle_geometry(state1(i,1));
end

%%
state1(:,1) = linspace(-0.2967,0.3491,length(state1));

f_t = zeros(length(state1), 1);
force_arm = zeros(length(state1),1);
for i = 1:length(state1)
    lt_norm = simulation_1.norm_tendon_length(tibialis_length(state1(i,1)), state1(i,3));
    v_m = get_velocity(state1(i,1), state1(i,2));
    f_t(i) = get_active_force(state1(i,3), v_m, state1(i,4)) + get_passive_force_series(lt_norm) + get_passive_force_parallel(state1(i,3));

    force_arm(i) = get_force_arm(state1(i,1));
end

figure();
plot(t1, f_t);
title('Active Force ft over Time')

figure();
plot(t1, force_arm);
title('Force Arm over Time')

figure;
plot(t1, f_t.*force_arm);
title('Torque t over time');

%% Simulation x 
% small pw (50 microseconds)
% frequency - 25 Hz
% no fatigue

clear
clc

% assume tibialis rest length is when the person is standing (pi/2)
resting_length_muscle = tibialis_length(pi/2)*0.6;
resting_length_tendon = tibialis_length(pi/2)*0.4;

% Swing portion of gate cycle (s), taken from research
T = 0.41; 

% Initial ankle angle is value obtained from literature 
% (107 degrees or 1.8675 rad in 355 coordinate system)
x1_initial = - 0.2967;

simulation_1 = MuscleModel(52,0.0137,0.03475,3,0,12,0,0,resting_length_muscle,resting_length_tendon);

[t1, state1, t_t1, t_e1] = simulate(T, simulation_1, x1_initial);

%%
close all
plot_results(t1, state1, t_t1, t_e1);


%% Simulation 2 - High pw
% large pw (110 microseconds)
% frequency - 25 Hz
% no fatigue

clc

% assume tibialis rest length is when the person is standing (pi/2)
resting_length_muscle = tibialis_length(pi/2)*0.6;
resting_length_tendon = tibialis_length(pi/2)*0.4;

% Swing portion of gate cycle (s), taken from research
T = 0.41; 
x1_initial = 1.876; % Value obtained from literature (radians)


simulation_2 = MuscleModel(52,0.0137,0.03475,3,0,12,110e-6,25,resting_length_muscle, resting_length_tendon);
[t2, state2, t_t2, t_e2] = simulate(T, simulation_2, x1_initial);
%%
plot_results(t2, state2, t_t2, t_e2);
% plot_compare(t1, state1, t2, state2, 'Small pw (50 ms)', 'Large pw (110 ms)');

%% Simulation 3 - High Frequency
% small pw (50 microseconds)
% frequency - 50 Hz
% no fatigue

clc

% assume tibialis rest length is when the person is standing (pi/2)
resting_length_muscle = tibialis_length(pi/2)*0.6;
resting_length_tendon = tibialis_length(pi/2)*0.4;

% Swing portion of gate cycle (s), taken from research
T = 0.41; 
x1_initial = 1.876; % Value obtained from literature (radians)

simulation_3 = MuscleModel(52,0.0137,0.03475,3,0,12,50e-6,50,resting_length_muscle,resting_length_tendon);
[t3, state3, t_t3, t_e3] = simulate(T, simulation_3, x1_initial);
%%
% plot_results(t3, state3, t_t3, t_e3);
plot_compare(t1, state1, t3, state3, '25 Hz', '50 Hz');

%% Simulation 4 - Fatigue
% small pw (50 microseconds)
% frequency - 25 Hz
% fatigue

clc

% assume tibialis rest length is when the person is standing (pi/2)
resting_length_muscle = tibialis_length(pi/2)*0.6;
resting_length_tendon = tibialis_length(pi/2)*0.4;

% Swing portion of gate cycle (s), taken from research
T = 0.41; 
x1_initial = 1.876; % Value obtained from literature (radians)

simulation_4 = MuscleModel(52,0.0137,0.03475,3,0.5,13,50e-6,25,resting_length_muscle,resting_length_tendon);
[t4, state4, t_t4, t_e4] = simulate(T, simulation_4, x1_initial);
%%
% plot_results(t4, state4, t_t4, t_e4);
plot_compare(t1, state1, t4, state4, 'No Fatigue', 'Fatigue');

%% Simulation 5 - Male (vs Female)
% Male
% small pw (50 microseconds)
% frequency - 25 Hz
% no fatigue

clc

% assume tibialis rest length is when the person is standing (pi/2)
resting_length_muscle = tibialis_length(pi/2)*0.6;
resting_length_tendon = tibialis_length(pi/2)*0.4;

% Swing portion of gate cycle (s), taken from research
T = 0.41; 
x1_initial = 1.876; % Value obtained from literature (radians)

simulation_5 = MuscleModel(81.6,0.0137,0.03475,3,0,12,50e-6,25,resting_length_muscle,resting_length_tendon);
[t5, state5, t_t5, t_e5] = simulate(T, simulation_5, x1_initial);
%%
plot_results(t5, state5, t_t5, t_e5);

%% Simulation 6 - Female (vs Male)
% Female
% small pw (50 microseconds)
% frequency - 25 Hz
% no fatigue

clc

% assume tibialis rest length is when the person is standing (pi/2)
resting_length_muscle = tibialis_length(pi/2)*0.6;
resting_length_tendon = tibialis_length(pi/2)*0.4;

% Swing portion of gate cycle (s), taken from research
T = 0.41; 
x1_initial = 1.876; % Value obtained from literature (radians)

simulation_6 = MuscleModel(66.8,0.0129,0.03475,3,0,12,50e-6,25,resting_length_muscle,resting_length_tendon);
[t6, state6, t_t6, t_e6] = simulate(T, simulation_6, x1_initial);
%%
% plot_results(t6, state6, t_t6, t_e6);
plot_compare(t5, state5, t6, state6, 'Male', 'Female');

%% Simulation 7 - MARS!
% small pw (50 microseconds)
% frequency - 25 Hz
% no fatigue

% Note: The gravity constant must be edited directly in "dynamics" - 
% other parameters will remain the same as the control simulation.

clc

% assume tibialis rest length is when the person is standing (pi/2)
resting_length_muscle = tibialis_length(pi/2)*0.6;
resting_length_tendon = tibialis_length(pi/2)*0.4;

% Swing portion of gate cycle (s), taken from research
T = 0.41; 
x1_initial = 1.876; % Value obtained from literature (radians)

simulation_7 = MuscleModel(52,0.0137,0.03475,3,0,12,50e-6,25,resting_length_muscle,resting_length_tendon);
[t7, state7, t_t7, t_e7] = simulate(T, simulation_7, x1_initial);
%%
plot_results(t7, state7, t_t7, t_e7);
plot_compare(t7, state7, t1, state1, 'Mars', 'Earth');