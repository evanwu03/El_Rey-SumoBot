function [u, integral_out] = pi_controller(error, integral_in, params)
%PI_CONTROLLER Discrete-time PI controller
%   [u, state] = PI_CONTROLLER(error, state, params)
%   computes the control signal u based on proportional and integral terms.
%
%   Inputs:
%       error           - Control error signal (scalar)
%       integral_in  - Accumulated integral term from previous time step
%       params.Kp       - Proportional gain
%       params.Ki       - Integral gain
%       params.Ts       - Sample time
%
%   Output:
%       u               - Control output
%       integral_out - Updated integral state
arguments (Input)
    error           (1,1) double
    integral_in        (1,1) double
    params          (1,1) struct
end

arguments (Output)
    u               (1,1) double
    integral_out           (1,1) double
end
u = 0; 
integral_out = 0;

Kidt = params.Ki * params.Ts;                    % Combine Ki*Ts 
integral_out = integral_in + Kidt*error;    % Compute I term
u = params.Kp*error + integral_out;            % Calculate controller output

end