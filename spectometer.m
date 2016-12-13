fs=22050;
Nbits=24;
num_channels=1;


while 1
    y=audiorecorder(fs,Nbits,num_channels);
    record(y);
    pause(0.5);
    pause(y);
    myspeech=getaudiodata(y);
    L=length(myspeech);
    nfft=2^nextpow2(L);
    fourier=fft(myspeech,nfft)/L;
    w=fs/2*linspace(0,1,nfft/2+1);
    plot(w,2*abs(fourier(1:nfft/2+1)));
    xlabel('Frequency(Hz)')
    ylabel('|X(jw)|')
   
end
