function a = polymon(b,c)
n= length(b);
a = zeros(1,n+1);
d = zeros(1,n+1);
e = zeros(1,n+1);
for i = 1:n
    d(i) = b(i)*c(1); 
end
for i = 2:n + 1
    e(i) = b(i-1)*c(2);
end
a = d + e;
end 