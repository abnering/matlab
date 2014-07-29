%solving g(x) = x (finding fixed point)
%fixed point theorem: assume that: 
%   - g',g is in C[a;b]
%   - K = const > 0
%   - p0 is in (a;b)
%   - g(x) is in (a;b) for all x, then
%   1) if |g'(x)| <= K < 1 for all x in [a;b], then iteration
%   p(n)=g(p(n-1)) is converges to P in [a;b]
clc;
clear;

figure(1); clf; hold on;
    x = 1:0.1:15;
    plot(x, 2*(x - 1).^0.5);
    plot(x, x);

p0 = 10;
P(1) = p0; %root estimate
process_plot=[p0 0];
for (i=2:50)
   z = P(i-1);
   P(i) = 2*(z - 1)^0.5;
   process_plot=[process_plot; [z P(i)] ];
   process_plot=[process_plot; [P(i) P(i)] ];
   err = abs(P(i) - P(i-1));
   plot(z, P(i), 'r.');
end;

plot(process_plot(:,1), process_plot(:,2),'color','green');