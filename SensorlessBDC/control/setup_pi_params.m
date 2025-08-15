function pi_params = setup_pi_params(Kp, Ki, Ts)
    arguments
        Kp (1,1) double {mustBeFinite, mustBeNonnegative}
        Ki (1,1) double {mustBeFinite, mustBeNonnegative}
        Ts (1,1) double {mustBeFinite, mustBePositive}
    end

    pi_params.Kp = Kp;
    pi_params.Ki = Ki;
    pi_params.Ts = Ts;
end