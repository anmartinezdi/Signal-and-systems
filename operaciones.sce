[y,Fs,b]=wavread("anita.wav");
y=y(1,:);

[x,Fs,b]=wavread("Hello.wav");
x=x(1,:);

[a,Fs,b]=wavread("adele.wav");
a=a(1,:);

function origin(y)
    // nombre del archivo como variable
    sound(y,Fs);
    disp("Original reproducido");
    dibujo(y,0);
endfunction

function [yt]=inver(y)
    disp(length(y),"Tamaño")
    for i=1:length(y)
        yt(length(y)-i+1)=y(i);
    end
    yt=yt';
    sound(yt,Fs);
    dibujo(y,yt);
endfunction

function [yt]=lento(y)
    disp(length(y),"Tamaño")
    for i=1:length(y)
        yt(i*2)=y(i);
    end
    yt=yt';
    sound(yt,Fs);
    dibujo(y,yt);
endfunction

function [yt]=rapido(y)
    disp(length(y),"Tamaño")
    for i=1:length(y)/2
        yt(i)=y(i*2);
    end
    yt=yt';
    sound(yt,Fs);
    dibujo(y,yt);
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

function simultaneo(x,y)
    //stamaño=lent
endfunction
function transformada(y)
    f=fft(y);
endfunction
