%%
t=SimOut.y(:,1);
w=detrend(SimOut.y(t<=0.05,3));
figure
h(1)=subplot(2,1,1)
plot(SimOut.y(t<=0.05,1),SimOut.y(t<=0.05,2))
h(1)=subplot(2,1,2)
plot(SimOut.y(t<=0.05,1),w)
grid on
linkaxes(h,'x')
%%
t1=0.0015;
t2=0.01965;
Tr=(t2-t1)/3;
wr=1/Tr*2*pi;
A1=0.007129;
A2=0.00264;
delta=-log(A1/A2)/Tr/3;
Tizm=1/(sqrt(delta^2+wr^2));
ksi = -delta*Tizm;
T=Tizm;
%%
C=10^4;
mu = ksi*2*T*C;
J1=0.046;
J2 = C*T^2*J1/(J1-C*T^2);
%%
plot(SimOut.y(t<=0.05,1),w)
hold on
plot(ww(:,1),detrend(ww(:,3)),'r--');
%%
K=detrend(ww(:,2));
for i=1:1:501
    st(i)=ww(i,1);
    st2(i)=K(i);
end
figure
plot(SimOut.y(t<=0.05,1),w)
hold on
plot(st,st2,'r--');
grid on
legend('Given reaction','Calculated reaction','SouthEast');
xlabel('time,s');
ylabel('omega,rad/s');
%%
tmp = st2'-w;
SKO = sqrt(sum(tmp.^2)/501)


