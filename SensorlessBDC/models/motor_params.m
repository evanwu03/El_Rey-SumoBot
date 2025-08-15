function motor = motor_params(params)
%MOTOR_PARAMS Takes a motor struct and appends state-space matrices
% Initialize state-space matrices

arguments (Input)
    params (1,1) struct
    %{
    params.Rs   (1,1) double {mustBeFinite, mustBePositive}
    params.Ls    (1,1) double {mustBePositive}
    params.J    (1,1) double {mustBePositive}
    params.b    (1,1) double {mustBeNonnegative}
    params.k_e  (1,1) double
    params.k_t  (1,1) double
    params.Ts   (1,1) double {mustBePositive}
    %}

end

arguments (Output)
    motor (1,1) struct
end

assert(all(isfield(params, {'Rs','Ls','J','b','k_e','k_t','Ts'})), ...
    'motor_params:MissingFields', 'Required motor parameter(s) missing');

motor.params = params;
motor.Ad = [];
motor.Bd = [];
motor.Cd = [];
motor.Dd = [];

% State space model for DC motor
% i_dot = Ax + Bu
% y(t)  = Cx + Du


% A = [-Rs/Ls  k_e/Ls ; -k_t/J -b/J];
% B = [  1/Ls;   0 ]
% C = [  1,    0  ]
% D = 0
A = [-params.Rs/params.Ls,     -params.k_e/params.Ls;
    params.k_t/params.J,  -params.b/params.J];
B = [1/params.Ls; 0];
C = [1, 0];
D = 0; % No feedforward


% Discretize using specified sample time
sys_d = c2d(ss(A,B,C,D), params.Ts, 'zoh');
[motor.Ad, motor.Bd, motor.Cd, motor.Dd] = ssdata(sys_d);

end
