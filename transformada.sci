[y,Fs,b]=wavread("Goodbye.wav");
y=y(1,:);

[x,Fs,b]=wavread("Hello.wav");
x=x(1,:);

[a,Fs,b]=wavread("adele.wav");
a=a(1,:);

function [yt,r]=transformada(y)
    yt=fft(y);
    for i=1:length(y)
    end
    r=r';
endfunction
