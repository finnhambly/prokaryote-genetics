function dx_dt = tderivs_delay(t,x,Z)
%TDERIVS Summary of this function goes here
%   Detailed explanation goes here
global r_l r_g s
delta = 1; % non-negative delay
dx_dt = r_g.*(1-x) + s.*x.*(1-x) - r_l.*Z(:,delta);
% Z approximates x(t-delta)
end
