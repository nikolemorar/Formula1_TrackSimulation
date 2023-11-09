function a = LagrangePoly(x,i)
n = length(x);
a = zeros(n-1);
xx = x;
xx(i)= [];
c = [1 -xx(1)];
 for j = 2:n-1
     b = [1 -xx(j)]; 
     c = polymon(c,b);
 end
a = c;

xx = - (xx - x(i));
denominador = prod(xx);

a = a/denominador;

end 