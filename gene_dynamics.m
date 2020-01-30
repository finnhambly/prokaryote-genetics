parameters %file containing my chosen parameters
x0 = 1;
% using fsolve to find fixed point of system (i.e., presence of gene in a
% population)
[x,fval,exitflag,output,jacobian] = fsolve(@tderivs,x0);
x % prevelance of gene among a large population
jacobian

% Plotting time-dependent behaviour
[t,y] = ode45(@tderivs_delay,0:100,0);
plot(t,y,'-')
hold on
[t,y] = ode45(@tderivs_t,0:100,1); 
plot(t,y,'-')
legend('Gene initially absent','Gene initially present');
xlabel('Time steps')
ylabel("Probability of gene's presence")
hold off
