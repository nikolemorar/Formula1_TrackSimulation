function [xx, yy] = LineaRecta(p, m, long, delta)
y = sin(atan(m))*long;
x = cos(atan(m))*long; 
n = fix(x/delta);
xx = zeros(1,n);
yy = zeros(1,n);
for i= 1:n
    xx(i) = p(1) + i*delta;
    yy(i) = m*(xx(i) - p(1)) + p(2);
end
end 
