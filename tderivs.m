function dx_dt = tderivs(x)
%TDERIVS Summary of this function goes here
%   Detailed explanation goes here
global r_l r_g s

dx_dt = r_g.*(1-x) + s.*x.*(1-x) - r_l.*x;
end
