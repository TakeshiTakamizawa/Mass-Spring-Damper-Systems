clc;clear;close all

h = 0.01; 
t_final = 10.0; 
tspan = [0 t_final];

m = 1000;
c = 20;
k = 10;

x0 = 4;
xdot0 = -7;
OrderOfEquation = 2;

x = zeros(1 ,OrderOfEquation);
x(1,1) = x0; x(1,2) = xdot0;

Kp = -9; Ki = 0.00001; Kd = 0.1;

ref = 0;

% MSD_dyn_func = @(t, Z)MSD_dyn(t,Z(1),Z(2),m,c,k);
[T, Z] = RK4(@(t, Z, e_int, e_prev) MSD_dyn(t, Z, m, c, k, ref, Kp, Ki, Kd, e_int, e_prev), tspan, h, x);
deta_plot(T,Z)