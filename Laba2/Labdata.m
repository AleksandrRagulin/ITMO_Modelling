M = 10;
J = 30;
ksp = 12;
kdmp =1.5;
%%
wt = sqrt(ksp/J)
%%
plot( omegares(:,1),omegares(:,2),'r')
hold on
grid on
legend('w(M) = w(res)','SouthEast');
xlabel('time,s');
ylabel('Omega,rad/s');
%%
s12 = roots([J kdmp ksp])
w0 = abs(imag(s12(1)))

%%
figure
subplot(2,1,1);
plot( omega(:,1),omega(:,2),'b-')
hold on
plot( omega(:,1),omega(:,3),'rx')
hold on
legend('init model','in-state-out','SouthEast');
xlabel('time,s');
ylabel('Omega,rad/s');

subplot(2,1,2);
plot( Angle(:,1),Angle(:,2),'b-')
hold on
plot( Angle(:,1),Angle(:,3),'rx')
hold on
legend('init model','in-state-out','SouthEast');
xlabel('time,s');
ylabel('Angle,rad');
%%
Osko = sqrt(sum(((omega(:,2)-omega(:,3))).^2)/2003)
Asko = sqrt(sum(((Angle(:,2)-Angle(:,3))).^2)/2003)
%%
wt = sqrt(kdmp^2-4*J*ksp)/2/J;
wt = abs(imag(wt(1)))

