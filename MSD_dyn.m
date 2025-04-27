function [Z_dot, e_int, e] = MSD_dyn(~, Z, m, c, k, ref, Kp, Ki, Kd, e_int, e_prev)
    x = Z(1);
    x_dot = Z(2);
    
    % PID制御
    e = ref - x;
    de = (e - e_prev);
    e_int = e_int + e;

    u = Kp * e + Ki * e_int + Kd * de;

    x_2dot = (u - c*x_dot - k*x)/m;
    Z_dot = [x_dot; x_2dot];
end