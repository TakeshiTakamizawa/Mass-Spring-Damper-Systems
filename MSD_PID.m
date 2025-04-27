close all;clear all
% dbstop if error
m = 100;
k = 10;
c = 20;
tspan = [0, 100];
dt = 0.1;
Z0 = [100; 0];
A = [0, 1;
    -k/m, -c/m];

solve = RK_func(@(t,Z)MSD_dyn(t,Z,A),tspan,Z0,dt);

subplot(1,2,1);
plot(solve(3,:),solve(1,:)); grid on
subplot(1,2,2);
plot(solve(3,:),solve(2,:)); grid on

function dZdt = MSD_dyn(~,Z,A)
x_com = 0; v_com = 0;
Kp = 5; Kd = 2;
dZdt = A*Z + [0; Kp*(x_com - Z(1)) + Kd*(v_com-Z(2))];
end

function solve = RK_func(MSD_dyn,tspan,Z0,dt)
N = (tspan(2)-tspan(1))/dt;
t = tspan(1):dt:tspan(2);
Z(:,1) = Z0; %1行目に位置、2行目に速度

for i = 1:N
    k1 = MSD_dyn(t(i), Z(:,i));
    k2 = MSD_dyn(t(i)+dt/2, Z(:,i)+k1*dt/2);
    k3 = MSD_dyn(t(i)+dt/2, Z(:,i)+k2*dt/2);
    k4 = MSD_dyn(t(i)+dt, Z(:,i)+k3*dt);
    Z(:,i+1) = Z(:,i) + (k1+2*k2+2*k3+k4)*dt/6;
end
solve = [Z;t];
end 