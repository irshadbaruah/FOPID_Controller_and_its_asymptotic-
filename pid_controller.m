clc;
clf;
clear all;
close all;
Kp = 15.2864;
Ki = 98.1268;
Kd = 1.1625;
alpha = 0.1578;
beta = 1.0148;
%  K= 0.55;
%  T = 62;
Wcr = (abs(Ki/Kd))^(1/(alpha + beta));
% Wcr1 = (abs(1/62));
w = logspace(-2 , 4, 1000);
mask = w < Wcr;
%  mask1 = w < Wcr1
% mag1 = 20*log10(Kp)*ones(size(w));
mag2 = 20*log10(Kd)*ones(size(w));
% mag3 = 20*log10(K)*ones(size(w));
mag4 =  (mask).*(20*log10(Ki/Kd)) + (~mask).*(20*(alpha + beta)*log10(w));
mag5 = -20*alpha*log10(w);
% mag6 =  (mask1).*(-20*log10(1)) + (~mask1).*(-20*log10(62*w));

% combined = mag1 + mag2 + mag3 + mag4 + mag5 + mag6 ;
 combined = mag2 + mag4 +mag5;
 
figure(1);
plot(1,1);
semilogx(w, combined,'Color','black')
xlabel('Frequency(rad/sec)');
ylabel('Magnitude dB');
grid on;
legend('Asymptotic magnitude bode plot','Location','NorthEast')


plot(1,1);
semilogx(w, combined,'Color','black','LineStyle','--')
xlabel('Frequency(rad/sec)','FontSize', 15);
ylabel('Magnitude dB','FontSize', 15);
grid on;
hold on;

 
clc;
clear 
Kp = 15.2864;
Ki = 98.1268;
Kd = 1.1625;
alpha = 0.1578;
beta = 1.0148;
%  K= 0.55;
%  T = 62;

w=logspace(-2,4,1000);
Mag=@(w) (20*log10(abs(sqrt(Kd).^2)) + 20*log10(abs(sqrt((i.*w).^(alpha+beta) + (((i.*w).^alpha)*Kp)/Kd + (Ki/Kd)).^2)) - 20*log10(abs(sqrt(i*w).^alpha).^2));   
semilogx(w,Mag(w) ,'Color','black');
hold on;
grid on;
xlabel('Frequency (rad/sec)');
ylabel('Magnitude (dB)');
legend('Asymptotic magnitude bode plot','Exact magnitude bode plot','Location','NorthEast')

