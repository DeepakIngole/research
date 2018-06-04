function [filt_axCG filt_ayCG] = FilterAccelerationData(Wcutoff, Ts, axCG, ayCG)

Fs = 1/Ts;
Wn = Wcutoff/(Fs/2);


[Bcoeff,Acoeff] = butter(3,Wn);

filt_axCG = filtfilt(Bcoeff, Acoeff, axCG);
filt_ayCG = filtfilt(Bcoeff, Acoeff, ayCG);

end