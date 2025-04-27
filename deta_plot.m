function deta_plot(T,Z)
figure;
subplot(2,1,1);
plot(T, Z(:,1),'b-',LineWidth=5);
title('機械振動系の解析解');
xlabel('t');
ylabel('$x$ [m]', 'Interpreter', 'latex');
legend('x(t)')
grid on;

subplot(2,1,2);
plot(T,Z(:,2),'g-',LineWidth=5);
title('機械振動系の解析解');
xlabel('t');
ylabel('$\dot{x}$ [m/s]', 'Interpreter', 'latex');
legend('x(t)')
grid on;
