function a = Curvatura(x,L)
a = zeros(1, length(x));
f1 = zeros(1, length(x));
f2 = zeros(1, length(x)); 
dL= PolyDer(L);
ddL = PolyDer(dL);

for i = 1:length(dL)
   f1 = f1 + dL(i)*x.^(length(dL)-i); 
end

f1 = (1 + f1.^2).^(3/2);

for i = 1:length(ddL)
   f2 = f2 + ddL(i)*x.^(length(ddL)-i); 
end

f2 = abs(f2) ; 

a = f2./f1;
end