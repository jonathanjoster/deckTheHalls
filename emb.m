% AT: Attack Time
% DT: Decay Time
% SL: Sustain Level
% RT: Release Time
function y = emb(t,AT,DT,SL,RT,time)
    y = zeros(size(t));
    a1 = 1/log(AT+1);
    e = a1*log(AT+1);
    a2 = (e-SL)*AT*DT/(DT-AT);
    b2 = SL-a2/DT;
    s = time-RT;
    a3 = SL*s*time/(time-s);
    b3 = -a3/time;
    for i=1:length(t)
        if t(i)<AT
            y(i) = a1*log(t(i)+1);
        elseif t(i)<DT
            y(i) = a2/t(i)+b2;
        elseif t(i)<s
            y(i) = SL;
        else
            y(i) = a3/t(i)+b3;
        end
    end
end