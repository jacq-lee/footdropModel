function [] = simulate(T, muscle_model)
% Runs a simulation of the model and plots results.

% Inputs
% T: total time to simulate, in seconds
% muscle_model: The MuscleModel object

% assume tibialis rest length is when the person is standing (pi/2)
rest_length_tibialis = tibialis_length(pi/2); 

% MDM: Do we need something like the line below???
% tibialis = HillTypeMuscle(2000, 0.6*rest_length_tibialis, 0.4*rest_length_tibialis);


f = @(t, x) dynamics(x, muscle_model);
tspan = [0 T];

% MDM: Figure out initial conditions for states
% [ ankle angle, angular velocity, TA normalized length, activation ] 

lopt = tibialis_length(1.919862177) % TA length at 110 degrees (optimal length for force generation)
x1_initial = 1.876; % (radians)
norm_ta_initial = (tibialis_length(x1_initial))/lopt;

initialCondition = [x1_initial, 0, norm_ta_initial, 0];

options = odeset('RelTol', 1e-3, 'AbsTol', 1e-8);
[time, state] = ode45(f, tspan, initialCondition, options);


ankle_angle = (state(:,1));
angular_velocity = state(:,2);
TA_normalized_length = state(:,3);
activation = state(:,4); 

%%% Plotting
figure()
LineWidth = 1.5;
% Your plotting code should be here
plot(time, ankle_angle, 'r', 'LineWidth', LineWidth), hold on
plot(time, angular_velocity, 'g','LineWidth', LineWidth)
plot(time, TA_normalized_length, 'b', 'LineWidth',LineWidth)
plot(time, activation, 'k', 'LineWidth', LineWidth), hold off

legend('Ankle Angle', 'Angular Velocity', 'Normalized TA Length', 'FEA Activaton');

figure()
plot(time, TA_normalized_length, 'b', 'LineWidth',LineWidth)

end