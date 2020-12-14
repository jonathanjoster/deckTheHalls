function y = hi(note, len)
if strcmp(note,'g4')
    f = 391;
elseif strcmp(note,'a4')
    f = 440;
elseif strcmp(note,'bb4')
    f = 466;
elseif strcmp(note,'c5')
    f = 523;
elseif strcmp(note,'d5')
    f = 587;
elseif strcmp(note,'e5')
    f = 659;
elseif strcmp(note,'f5')
    f = 698;
elseif strcmp(note,'g5')
    f = 783;
elseif strcmp(note,'a5')
    f = 880;
elseif strcmp(note,'bb5')
    f = 932;
elseif strcmp(note,'b5')
    f = 987;
elseif strcmp(note,'c6')
    f = 1046;
elseif strcmp(note,'db6')
    f = 1108;
elseif strcmp(note,'d6')
    f = 1174;
elseif strcmp(note,'e6')
    f = 1318;
elseif strcmp(note,'f6')
    f = 1396;
elseif strcmp(note,'g6')
    f = 1567;
elseif strcmp(note,'a6')
    f = 1760;
else
    f = 0;
end
f = f/2;

unit = .5;
time = unit*4/len;

Fs = 8192;
t = (1:round(Fs*time))/Fs;
K = 10;
sum = 0;
for i=0:K
   sum = sum+((-1)^i)*sin(2*pi*(i+1)*f*t)/(i+1);
end
y = (2/pi)*sum;
% Attack Time
AT = 0.02;
% Decay Time
DT = 0.2;
% Sustain Level
SL = 0.35;
% Release Time
RT = 0.3;
E = emb(t,AT,DT,SL,RT,time);
y = E.*y;