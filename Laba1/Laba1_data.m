%%
R1 = 15;
R2 = 25;
L = 3e-3;
C = 10e-6;
Em = 36;
f = 50;
%%
figure
subplot(2,1,1);
lim1 =Voltage1(:,1)<0.03;
plot( Voltage1(lim1,1),Voltage1(lim1,2),'bo')
hold on
plot( Voltage1(lim1,1),Voltage1(lim1,3),'gx')
hold on
plot( Voltage1(lim1,1),Voltage1(lim1,4),'r*')
grid on
legend('init model','in-state-out','in-out','SouthEast');
xlabel('time,s');
ylabel('Voltage,V');

subplot(2,1,2);
plot( Current1(lim1,1),Current1(lim1,2),'bo')
hold on
plot( Current1(lim1,1),Current1(lim1,3),'gx')
hold on
plot( Current1(lim1,1),Current1(lim1,4),'r*')
grid on
legend('init model','in-state-out','in-out','SouthEast');
xlabel('time,s');
ylabel('Current,A');

%%
Vsko1 = sqrt(sum(((Voltage1(:,2)-Voltage1(:,3))).^2)/5736)
Vsko2 = sqrt(sum(((Voltage1(:,2)-Voltage1(:,4))).^2)/5736)
Isko2 = sqrt(sum(((Current1(:,2)-Current1(:,4))).^2)/5736)
Isko2 = sqrt(sum(((Current1(:,2)-Current1(:,4))).^2)/5736)

%%
plot(X2,Y2,':k','LineWidth',3);
plot(X2,Y3,':b','LineWidth',3);
plot(X2,Y4,'-.','Color',[.1 .7 .7],'LineWidth',3);
%%
figure
subplot(2,1,1);
plot( Voltage2(:,1),Voltage2(:,2),'b-')
hold on
plot( Voltage2(:,1),Voltage2(:,3),'g+')
hold on
legend('init model','in-state-out','SouthEast');
xlabel('time,s');
ylabel('Voltage,V');

subplot(2,1,2);
plot( Current2(:,1),Current2(:,2),'b-')
hold on
plot( Current2(:,1),Current2(:,3),'g+')
hold on
legend('init model','in-state-out','SouthEast');
xlabel('time,s');
ylabel('Current,A');
%%
Vsko = sqrt(sum(((Voltage2(:,2)-Voltage2(:,3))).^2)/38)
Isko = sqrt(sum(((Current2(:,2)-Current2(:,3))).^2)/38)