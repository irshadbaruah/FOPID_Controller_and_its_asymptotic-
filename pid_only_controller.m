clc;
clf;
clear all;
close all;
Kp = 15.2864;
Ki = 98.1268;
Kd = 1.1625;
mew = 0.1578;
ita = 1.0148;

Wcr = (abs(Ki/Kd))^(1/(mew+ita));

w = logspace(-2 , 2, 1000);
mask = w < Wcr;
%  mask1 = w < Wcr1
% mag1 = 20*log10(Kp)*ones(size(w));
mag2 = 20*log10(Kp)*ones(size(w));
% mag3 = 20*log10(K)*ones(size(w));
mag4 =  (mask).*(20*log10(Ki/Kp)) + (~mask).*(20*(mew + ita)*log10(w)+ 20*log10(Kd/Kp) );
mag5 = -20*mew*log10(w);
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
xlabel('Frequency(rad/sec)');
ylabel('Magnitude dB');
grid on;
hold on;

 
clc;
clear 
Kp = 15.2864;
Ki = 98.1268;
Kd = 1.1625;
mew = 0.1578;
ita = 1.0148;
%  K= 0.55;
%  T = 62;

w=logspace(-2,2,1000);
Mag=@(w) (20*log10(abs(sqrt(Kp).^2)) + 20*log10(abs(sqrt((Kd/Kp)*(i.*w).^(mew+ita) + ((i.*w).^mew) + (Ki/Kp)).^2)) - 20*log10(abs(sqrt(i*w).^mew).^2));   
semilogx(w,Mag(w) ,'Color','black');
hold on;
grid on;
xlabel('Frequency (rad/sec)');
ylabel('Magnitude (dB)');
legend('Asymptotic magnitude bode plot','Exact magnitude bode plot','Location','NorthEast')

