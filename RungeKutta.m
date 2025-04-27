function Z=RungeKutta(func,n,h,Y0)
%Xは積分前
%Yは積分後
%hは刻み幅
%nは区間数

Y = Y0;

for t=(1:1.0:n)

    k1 = h*feval(func,Y); %feval関数を評価する
    k2 = h*(feval(func,Y)+k1/2);
    k3 = h*(feval(func,Y)+k2/2);
    k4 = h*(feval(func,Y)+k3);

    Y = Y + (1/6)*(k1 + 2*k2 + 2*k3 + k4);

    Z(t,:) = Y;

end