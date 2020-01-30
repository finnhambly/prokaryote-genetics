parameters %file containing my chosen parameters
delta = [1,10,50,100,200];
time_range = [0,1000];
tiledlayout(m,1)
for i = 1:length(delta)
    nexttile
    sol = dde23(@tderivs_delay,delta(i),1,time_range); % the second argument is the delay 
    plot(sol.x,sol.y,'-') 
    hold on
    sol = dde23(@tderivs_delay,delta(i),0,time_range); % the second argument is the delay 
    plot(sol.x,sol.y,'-') 
    legend('Gene initially absent','Gene initially present');
    xlabel('Time steps')
    ylabel("Prob. of presence")
    string = strcat('Time-dependent behaviour of DDE, delay = ', num2str(delta(i)));
    title(string)
    hold off
end