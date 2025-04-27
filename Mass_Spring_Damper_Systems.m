clc;clear;close all

h = 0.01; 
t_start = 0; t_final = 100.0;
m = 100; c = 20; k = 10;
x0 = 0; xdot0 = 100;
Kp = 5; Ki = 2; Kd = 3;

x(1,1) = x0; x(1,2) = xdot0;

ref = [5; 0];

% MSD_dyn_func = @(t, Z)MSD_dyn(t,Z(1),Z(2),m,c,k);
[T, Z] = RK4(@(t, Z) MSD_dyn(t, Z, m, c, k, ref, Kp, Ki, Kd), [t_start t_final], h, x);
deta_plot(T,Z)