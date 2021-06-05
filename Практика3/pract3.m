%%
t = SimOut.w(:,1);
u = SimOut.w(:,2);
w = SimOut.w(:,3);
i = SimOut.w(:,4);
figure
grid on
hold on
plot(t,i)
plot(t,u)
%xlim([5 7.5])
%%
clear i_rez
i_rez(50000)=0;
for j=1:9
    i_rez = i_rez+i(50000*j+1:50000*(j+1))';
end
i_rez = i_rez/9;
%%
figure
grid on
hold on
%plot(t(1:50000),i(1:50000))
plot(t(1:50000),i_rez)
xlim([0 0.1])
tau = 0.0098;
A=1.03;
i_est = A*(1-exp(-t(1:50000)/tau));
plot(t(1:50000),i_est)
R = (max(u)+B*Ce)/A;
Te = tau;
L = Te*R;
%%

figure
grid on
hold on
plot(t,u)
plot(t,w)

%%
clear w_rez
w_rez(50000)=0;
for j=1:9
    w_rez = w_rez+w(50000*j+1:50000*(j+1))';
end
w_rez = w_rez/9;
%%
figure
grid on
hold on
plot(t(1:50000),w_rez)

B=0.49; %установивше скорость]
B0=0;
tau2=0.44;
w_est = B*(1-2*exp(-t(1:50000)/tau2));
plot(t(1:50000),w_est)
Ce=max(u)/B;
J = tau2*Ce^2/R;

%%
figure

subplot(2,1,1);
grid on
hold on
plot(t,u)
plot(t,i,'b')
plot(ou1(:,1),ou1(:,2),'r--','LineWidth',1)
xlim([0 5])
legend('Given step','Given current','Calculated current','SouthEast');
xlabel('time,s');
ylabel('Voltage, V, Current,A, Current,A');


subplot(2,1,2);
grid on
hold on
plot(t,w)
plot(t,u)
plot(ou1(:,1),ou1(:,4),'r--','LineWidth',1)
xlim([0 5])
legend('Given step','Given rotate speed','Calculated rotate speed','SouthEast');
xlabel('time,s');
ylabel('Voltage, V, w,rad/s, w,rad/s');

%%
clear st st2 tk
for j=1:1:1001
    st(j)=ou1(j,2);
    st2(j)=i(100*j);
    tk(j) = t(100*j);
end
%%
plot(tk,st2)
hold on
plot(tk,st)
%%
tmp = st2-st;
SKO = sqrt(sum(tmp.^2)/1001)
