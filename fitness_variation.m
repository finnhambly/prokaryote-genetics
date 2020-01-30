global r_l r_g s

r_g = 0.01; %rate of gain of gene, s^-1
x0 = 0; %starting population presence for ode45
svals = -5:0.1:5; % range of fitness values
x = zeros(length(svals),2); 
options = optimset('Display','off');

for r_l = [ 0.01 0.1 0.5 1 ]
    i = 1;
    for s = svals
        [t, solution] = ode45(@tderivs_t,0:100,x0);
        x(i,1) = solution(end);
        x(i,2) = s;
        i = i + 1;
    end
    plot(x(:,2),x(:,1))
    hold on
end
legend('r_l=0.01','r_l=0.1','r_l=0.5','r_l=1')
title('r_g=0.01')
xlabel('s')
ylabel('x_{ss}')
hold off