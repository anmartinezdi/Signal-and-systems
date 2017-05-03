[y,Fs,b]=wavread('PruebaFrec.wav');
y=y(1,:); 
T=1/Fs;                 // Tiempo de muestreo. 
L=length(y);            //Longitud de la señal. 
t=(0:L-1)*T;            //Vector de tiempo.  
NFFT=2^nextpow2(L);     //Siguiente potencia de 2 de la longitud de 'y'. 
Y=fft(y);               //Aplica Transformada de Fourier. 
f=Fs/2*linspace(0,1,NFFT/2);    //Vector de frecuencias.  
subplot(2,1,1); 
plot(t,y); 
title('Señal de Voz');
xlabel('Tiempo (segundos)');
subplot(2,1,2);
plot(f,abs(Y(1:NFFT/2))) 
title('Espector de la Señal de Voz');
xlabel('Frecuencia (Hz)'); 
ylabel('|Y(f)|'); 
