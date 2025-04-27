function [Z_dot, e_int, e] = MSD_dyn(~, Z, m, c, k, ref, Kp, Ki, Kd)
    x = Z(1); x_dot = Z(2);
    e_int = 0;
    u = Kp * (ref(1) - Z(1)) + Ki * e_int + Kd * (ref(2) - Z(2));% 入力
    e = ref(1) - Z(1);
    x_2dot = (u - c*x_dot - k*x)/m;
    Z_dot = [x_dot, x_2dot];
end