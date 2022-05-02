clc; clear;close all;

A=4;
Data=randi([0 1],500,100);%[0 1 0 0 0 1 1 0 1];

Tx=((2*Data)-1)*A; % maping for 0 to be –A, 1 to be A
% the above array contains 9 elements, corresponding to the levels that will be 
%transmitted in every pulse
Tx=Tx'(:)';

m=zeros(700, 500);
t=randi([0 7], 1, 500);

inp=input("Would you like\n1-polar\n2-unipolar\n3-return to zero\n>>");
if inp==1,
  
  Tx2=repmat(Tx,7,1);
  Tx_out=reshape(Tx2,size(Tx2,1)* size(Tx2,2),1);
  Tx_out=reshape(Tx_out, 700, 500);
  
  

  for i=1:500,
    start=Tx_out(1:700-t(i), i);
    end_=Tx_out(700-t(i)+1:700, i);
    T=vertcat(end_, start);
    m(:, i)=T;
  end
  
  name="Polar Non Return to Zero";
  
% Unipolar Signaling
elseif inp==2,
   Tx=Data*A;
   Tx=Tx';
   Tx=Tx(:);
   Tx=Tx';
   %transmitted in every pulse
   Tx2=repmat(Tx,7,1);
   Tx_out=reshape(Tx2,size(Tx2,1)* size(Tx2,2),1);
    
   Tx_out=reshape(Tx_out, 700, 500);
   

   for i=1:500,
     start=Tx_out(1:700-t(i), i);
     end_=Tx_out(700-t(i)+1:700, i);
     T=vertcat(end_, start);
     m(:, i)=T;
   end
    
   name="Unipolar Signaling";

% Return to Zero
elseif inp==3,
  Tx2=repmat(Tx,4,1);
  Tx3=zeros(3, 50000);
  Tx2=[Tx2;Tx3];
  Tx_out=reshape(Tx2,size(Tx2,1)* size(Tx2,2),1);
  Tx_out=reshape(Tx_out, 700, 500);
  
  for i=1:500,
    start=Tx_out(1:700-t(i), i);
    end_=Tx_out(700-t(i)+1:700, i);
    T=vertcat(end_, start);
    m(:, i)=T;
  end
  name="Return to Zero";
else
  error("Please, enter 1, 2 or 3");
  
end

% Draw waveform
plt(m, name);
  
% Get statistics and time mean and draw them
statistical_time_mean(m, name);
    
% Get autocorrelation of the ensemble
auc=autocorr(m);

% Get total power(power spectral density)
N=length(auc(1, :));
% Get fast fourier transform
X=fft(auc(1,:), N);
% To get positive and negative
n=-N/2:N/2-1;
figure
plot(n, fftshift(abs(auc(1, :))))
xlabel(strcat("Autocorrelation of ",name));

figure
% Draw the PSD
plot(n*100/N, fftshift(abs(X)));
xlabel(strcat("Power spectral density of ", name));

xlim([-700 700])



%Tx2(1)=Tx(1);
%{
i=2
for j=2:2*length(Tx)
  if mod(j,2)==0,
    Tx2(j)=0;
  else
    Tx2(j)=Tx(i);
    i=i+1;
  end
end

%transmitted in every pulse


figure
 for i=6:6:6*5,
    % Polar Non Return to Zero
    subplot(5,1, i/6);
    stairs(Tx_out(max(1/100,(i-6))*100:i*100));
    set(gca, 'ylim', [-5 5]);
  end
xlabel("Return to Zero")

disp(strcat("Statistics of Return to Zero")); 
  % The statistical mean
  stat_mean=zeros(size(Tx_out)(1)/(500*6)+1, 1);
  time_mean=zeros(size(Tx_out)(1)/(100*6), 1);
  i=1
  
  % Loop until there is no waveform
  while i+100*6<length(Tx_out),
    % Loop over the waveform
    for j=1:100*6,
      i=i+1;
      stat_mean(int8(j/6)+1)=stat_mean(int8(j/6)+1)+Tx_out(i);
    end
  end
  stat_mean=stat_mean/(500*6)
  time_mean(1)=mean(Tx_out(1:6*100));

  for i=6:6:500*6,
    time_mean(mod(i, 600)+1)=mean(Tx_out(max(0,(i-6))*100+1:i*100));
  end
  
=
1- 
2- Is the random process stationary?
3- Determine the ensemble autocorrelation function Rx(?). 
4- The time mean and autocorrelation function for one waveform.
5- Is the random process Ergodic?
6- What is the bandwidth of the transmitted signal. 
%}
