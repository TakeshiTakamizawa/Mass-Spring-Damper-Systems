clc; clear; close all;

% パラメータ設定
m = 1;      % 質量 [kg]
c = 2;      % 減衰係数 [Ns/m]
k = 5;      % ばね定数 [N/m]

% PIDゲイン
Kp = 100;   % 比例ゲイン
Ki = 10;    % 積分ゲイン
Kd = 20;    % 微分ゲイン

% 目標値
x_ref = 1;  % 目標位置 [m]

% シミュレーション時間
tspan = [0 10];

% 初期状態 [x, dx]
x0 = [0; 0];

% 数値計算
[t, x] = ode45(@(t, x) spring_mass_damper_pid(t, x, x_ref, m, c, k, Kp, Ki, Kd), tspan, x0);

% 結果のプロット
figure;
plot(t, x(:,1), 'b', 'LineWidth', 2);
hold on;
yline(x_ref, 'r--', '目標値');
xlabel('時間 [s]');
ylabel('位置 [m]');
title('ばね-マス-ダンパー系のPID制御');
legend('位置', '目標値');
grid on;

% PID制御付きのばね-マス-ダンパー系の運動方程式
function dxdt = spring_mass_damper_pid(t, x, x_ref, m, c, k, Kp, Ki, Kd)
    persistent integral_error previous_error
    if isempty(integral_error), integral_error = 0; end
    if isempty(previous_error), previous_error = 0; end
    
    % 誤差計算
    error = x_ref - x(1);
    
    % PID制御
    dt = 0.01; % 数値積分の時間刻み
    integral_error = integral_error + error * dt;
    derivative_error = (error - previous_error) / dt;
    F = Kp * error + Ki * integral_error + Kd * derivative_error;
    
    % 更新
    previous_error = error;
    
    % 運動方程式
    dxdt = [x(2); (F - c*x(2) - k*x(1)) / m];
end
