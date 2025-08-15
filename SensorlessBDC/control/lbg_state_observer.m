function [xhat_next, yhat] = lbg_state_observer(u, xhat, y, observer)
%LBG_STATE_OBSERVER Implements a discrete-time Luenberger observer
%   [xhat_next, yhat] = lbg_state_observer(u, xhat, y, observer)
%   u:      control input
%   xhat:   estimated state vector
%   y:      measured output
%   observer: struct with A, B, C, poles

arguments (Input)
    u        (:,1) double    
    xhat     (:,1) double
    y        (:,1) double
    observer  struct
end

arguments (Output)
    xhat_next (:, 1) double
    yhat      (:, 1) double
end
% Define default size for xhat_next and yhat

%assert(all(isfield(observer, {'A','B','C','D', 'L'})), ...
%    'lbg_state_observer:MissingFields', 'Required observer parameter(s) missing');

% Compute output estimate 
yhat = observer.C*xhat;

% Compute state estimate
xhat_next = observer.A*xhat + observer.B*u + observer.L*(y - yhat);
end