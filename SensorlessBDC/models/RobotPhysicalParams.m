function cfg = RobotPhysicalParams()
%ROBOTPHYSICALPARAMS Summary of this function goes here
%   Detailed explanation goes here
%   Describes physical parameters of robot used for computing inverse
%   kinematics 


arguments (Output)
    cfg (1,1) struct
end

cfg.wheel_radius = 0.021;       % r in meters
cfg.wheel_base   = 0.09;       % b in meters

end