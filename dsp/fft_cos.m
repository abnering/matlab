N = 32;
f = 4;
n = [0:N-1];
x = cos(2*pi*f*n/N);
x1 = [x zeros(1,N)];
x2 = [x x];
X1 = fft(x1);
X2 = fft(x2);


subplot(2,3,1);
	stem(x1,"markerfacecolor","b","color","b","markersize",4,"linewidth", 3);
	title("x1[n] - zero-padded x[n] ", "fontsize", 5);
subplot(2,3,2);
	stem(x2,"markerfacecolor","r","color","r","markersize",4,"linewidth", 3);
	title("x2[n] - repeated twice x[n]", "fontsize", 5);
subplot(2,3,4);
	stem(abs(X1),"markerfacecolor","b","color","b","markersize",4,"linewidth", 3);
	title("FFT(x1[n])", "fontsize", 5);
subplot(2,3,5);
	stem(abs(X2),"markerfacecolor","r","color","r","markersize",4,"linewidth", 3);
	title("FFT(x2[n])", "fontsize", 5);

xfs = x; %[zeros(1,N) x zeros(1,N)];
Xfs = fft(xfs, 256);
Xfs = fftshift(Xfs);
subplot(2,3,3);
	stem(xfs,"markerfacecolor","g","color","g","markersize",4,"linewidth", 3);
	title("x[n] = cos(2*pi*f*n/N), n = [0:31], N = 32", "fontsize", 5);
subplot(2,3,6);
	stem(abs(Xfs),"markerfacecolor","g","color","g","markersize",2);
	title("256 samples of DTFT(x[n]) with zero-padding", "fontsize", 5);

