function [T, Z] = RK4(func, tspan, h, Z0)
    % the fourth order Runge-Kutta method
    t0 = tspan(1); tf = tspan(2);
    T = t0:h:tf;
    n = length(T);
    Z = zeros(n, length(Z0));
    Z(1,:) = Z0; Y = Z0;
    
    for i = 1:n-1
        t = T(i);
        k1 = h * feval(func, t, Y);
        k2 = h * feval(func, t + h/2, Y + k1/2);
        k3 = h * feval(func, t + h/2, Y + k2/2);
        k4 = h * feval(func, t + h, Y + k3);
        Y = Y + (1/6) * (k1 + 2*k2 + 2*k3 + k4);
        Z(i+1,:) = Y;
    end
end

% function [T, Z] = RK4(func, tspan, h, Z0)
%     % the fourth order Runge-Kutta method
%     t0 = tspan(1); tf = tspan(2);
%     T = t0:h:tf;
%     n = length(T);
%     Z = zeros(n, length(Z0));
%     Z(1,:) = Z0; Y = Z0';
%     e_int = 0; e_prev = Z0(1);
% 
% 
%     for i = 1:n-1
%         t = T(i);
%         [k1, e_int1, e1] = func(t, Y, e_int, e_prev);
%         [k2, ~, ~] = func(t + h/2, Y + h*k1/2, e_int1, e1);
%         [k3, ~, ~] = func(t + h/2, Y + h*k2/2, e_int1, e1);
%         [k4, ~, ~] = func(t + h, Y + h*k3, e_int1, e1);
%         Y = Y + (1/6) * (k1 + 2*k2 + 2*k3 + k4);
%         Z(i+1,:) = Y(:)';
%         e_int = e_int1;
%         e_prev = e1;
%     end
% end
