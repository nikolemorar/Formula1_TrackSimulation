function a = PolyDer(x)
a = zeros(1,length(x) - 1);
for i = 1:length(a)    
    a(i) = (length(x) - i)*x(i);
end
end 
