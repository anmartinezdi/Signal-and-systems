[y,Fs,b]=wavread("Goodbye.wav");
y=y(1,:);

[x,Fs,b]=wavread("Hello.wav");
x=x(1,:);

[a,Fs,b]=wavread("adele.wav");
a=a(1,:);

function [yt,r,p]=transformada(y)
    yt=fftshift(fft(y));
    for i=1:length(y)
        r(i)=abs(yt(i));     //magnitud
        p(i)=atan( imag(yt(i)) / real(yt(i)) );     //fase
    end
    r=r';
    p=p';
    plotear(yt,r,p);
endfunction

function plotear(yt,r,p)
    subplot(3,1,1);
    plot2d(yt);
    title("Señal transformada");
    subplot(3,1,2);
    plot2d(r);
    title("Magnitud");
    subplot(3,1,3);
    plot2d(p);
    title("Fase");
endfunction

function [gt]=confu(x,y)
    g = convol(x,y);
    gt=fftshift(fft(g));
endfunction

function respuesta(x,y)
    Y = confu(x,y);
    X = fftshift(fft(x));
    for i=1:length(Y)
        H(i)= Y(i)/X(i);
    end
    //h = fft(H,1);
    dibujo(H,Y);
endfunction

function dibujo(y,yt)
    disp("Dibujando");
    tf1=length(y);
    t1=0:1/Fs:(tf1-1)/Fs;
    tf2=length(yt);
    t2=0:1/Fs:(tf2-1)/Fs;
    if yt==0 then
        plot2d(t1,y) // first channel
    else
        subplot(2,1,1)
        plot2d(t1,y) // first channel 
        subplot(2,1,2)
        plot2d(t2,yt)
    end
endfunction
