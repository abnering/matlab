N = 4;
figure(1); clf; hold on;
p = linspace(10,10.3,N);
for (i=1:1:50)
	p
	for (j=1:N)
		if ((p(j) > 9 && p(j) < 12) == 1)
			p(j) = p(j) + 0.2;
		end;
		if (p(j) >= 12 && p(j) < 20)
			p(j) = p(j) + 1.5;
		end;
		if (p(j) >= 20 && p(j) < 25)
			p(j) = p(j) + 0.2;
		end;

	end;
				plot(p, 2, 'r.');
		axis([10 30], [10 30]); 		
	%
	drawnow;
	clf;
end;

hold off;