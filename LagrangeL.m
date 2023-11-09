function a = LagrangeL(x,y)
n = length(x);
a = zeros(1,n);
for i = 1:n
    a = a + y(i)*LagrangePoly(x,i);
end
end 