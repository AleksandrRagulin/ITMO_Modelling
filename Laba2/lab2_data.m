%%
g = 10;
alpha = 13*pi/180;
m1=200;
m2=50;
ksp=20;
kdmp=2;
Fg1 = m1*g*sin(alpha);
Fg2 = m2*g*sin(alpha);
%%
M=m1+m2;
wr = sqrt(ksp*M/m1/m2)
%%
figure
subplot(2,1,1);
plot( v1(:,1),v1(:,2),'b-')
hold on
plot( v1(:,1),v1(:,3),'r--')
hold on
legend('init-model','in-state-out','SouthEast');
xlabel('time,s');
ylabel('v1,m/s');

subplot(2,1,2);
plot( v2(:,1),v2(:,2),'b-')
hold on
plot( v2(:,1),v2(:,3),'r--')
hold on
legend('init-model','in-state-out','SouthEast');
xlabel('time,s');
ylabel('v2,m/s');
%%
V1sko = sqrt(sum(((v1(:,2)-v1(:,3))).^2)/15009)
V2sko = sqrt(sum(((v2(:,2)-v2(:,3))).^3)/15009)
%%
figure
subplot(2,1,1);
plot( q1(:,1),q1(:,2),'b-')
hold on
plot( q1(:,1),q1(:,3),'rx')
hold on
legend('init-model','in-state-out','SouthEast');
xlabel('time,s');
ylabel('q1,m');

subplot(2,1,2);
plot( q2(:,1),q2(:,2),'b-')
hold on
plot( q2(:,1),q2(:,3),'rx')
hold on
legend('init-model','in-state-out','SouthEast');
xlabel('time,s');
ylabel('q2,m');


%%
Q1sko = sqrt(sum(((q1(:,2)-q1(:,3))).^2)/15009)
Q2sko = sqrt(sum(((q2(:,2)-q2(:,3))).^3)/15009)

%%
figure
w =10.^(-1:0.01:1);
%%ob_res = tf([m2 kdmp ksp],[1])*tf([1],[1 0])*tf([1],[m1*m2 M*kdmp ksp*M])
%%bode(ob_res,w)
ob_res1 = tf([1],[m1*m2 M*kdmp ksp*M])
ob_res2 = tf([1],[1 0])
bode(ob_res1,w)
hold on
bode(ob_res2,w)
grid on
hold on