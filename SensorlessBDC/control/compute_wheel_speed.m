function [omega_L,omega_R] = compute_wheel_speed(velocity, ang_speed, robot_params)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
arguments (Input)
    velocity (1,1) double
    ang_speed (1,1) double
    robot_params struct
end

arguments (Output)
    omega_L (1,1) double
    omega_R (1,1) double
end

% Calculate the wheel speeds based on the provided velocity and angular speed
omega_L = (velocity - (robot_params.wheel_base * ang_speed) / 2) / robot_params.wheel_radius;
omega_R = (velocity + (robot_params.wheel_base * ang_speed) / 2) / robot_params.wheel_radius;
end