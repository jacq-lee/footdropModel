function [deriv_l_mt] = get_deriv_tibialis_length(x1)

% Inputs
% x1 (theta): body angle (up from prone horizontal)

% Output
% tibialis anterior length (m)

% Convert x1 from paper's coordinate system to this coordinate system
x1_adjusted = (pi/2) - x1;

%% DERIVE THE TA LENGTH WRT ANKLE ANGLE
% syms f(x)
% 
% % define rotation matrix
% rotation = [cos(x) -sin(x) 
%    sin(x) cos(x)];
% 
% % coordinates in global reference frame
% origin = rotation * [0.3 -0.03]';
% insertion = [0.06, -0.03]';
% 
% difference = origin - insertion;
% 
% f(x) = sqrt(difference(1)^2 + difference(2)^2);
% 
% dl_over_dtheta = diff(f,x)

% deriv_l_mt = double(dl_over_dtheta(x1));

%% PRE-DERIVED FUNCTION
deriv_l_mt = (2*((3*cos(x1_adjusted))/100 - (3*sin(x1_adjusted))/10)*((3*cos(x1_adjusted))/10 + (3*sin(x1_adjusted))/100 - 3/50) +...
    2*((3*cos(x1_adjusted))/10 + (3*sin(x1_adjusted))/100)*((3*sin(x1_adjusted))/10 - (3*cos(x1_adjusted))/100 +...
    3/100))/(2*(((3*cos(x1_adjusted))/10 + (3*sin(x1_adjusted))/100 - 3/50)^2 + ((3*sin(x1_adjusted))/10 -...
    (3*cos(x1_adjusted))/100 + 3/100)^2)^(1/2));

end
