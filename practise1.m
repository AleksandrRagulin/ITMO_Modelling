%% Given FC
figure
subplot(2,1,1);
plot( log10(w),Lw)
hold on
grid on
xlabel('Frequency,rad/s');
ylabel('Magnitude,dB');

subplot(2,1,2);
plot( log10(w),phi*180/pi)
hold on
xlabel('Frequency,rad/s');
ylabel('Phase,rad');

grid on
%% Calculated FC
figure
ksi=0.98;
T = 10^(-2.9672);
wsr = 1/T;
ob_res = tf([1],[T^2 2*T*ksi 1])*tf([T^2 0 1],[1]);
bode(ob_res,w)
grid on
hold on
%% Parameters
R=1;
L = ksi*T*2*R;
C = T^2/L;

%% Step reaction
figure
plot( t,y,'b')
hold on
plot( Step(:,1),Step(:,2),'r--')
hold on
legend('Given reaction','Calculated reaction','SouthEast');
xlabel('time,s');
ylabel('Voltage,V');
%% ASD
tmp = Step(:,2)-y;
SKO = sqrt(sum(tmp.^2)/501)
