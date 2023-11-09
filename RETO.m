clc; clear; close all; 

%Puntos que definen la curva de F1
x = [300 400 500 900];
y = [50 100 -10 50];

%delta
delta= 0.1;
%Dominio de la curva
xd = 280:delta:920;

%Rango de la curva
f    = zeros(1,length(xd));

%Curvatura de la curva en cada punto
ku   = zeros(1,length(xd));

%Fuerza de fricci髇 y fuerza de fricci髇 m帷xima
fr     = zeros(1,length(xd));
frmax  = zeros(1,length(xd)); 

%羘gulo de peralte en cada punto
alfa = zeros(1,length(xd));

% Masa del auto (Kg)
m = 789;
%Velocidad del auto (m/s)
v = 34;
%Aceleraci髇 gravitacional (m/s^2)
g = 9.81;
%Coeficiente de fricci髇
ms=0.75;
%Coeficiente de fricci髇 cinetico
mk= 0.4;
%Calculo de la longitug
long= 0.5*v.^2/(mk*g); 

%Interpolaci髇 de la curva
L = LagrangeL(x,y);
n= length(L);

%Construcci髇 de la curva
for i = 1:n
    f = f + L(i).*xd.^(n - i);
end 

%C醠culo de la curvatura
ku = Curvatura(xd, L);

%Asignaci髇 del valor del 羘gulo del peralte en cada punto de la curva
alfa = 30.*ku/max(ku);

%C醠culo de la fuerza de fricci髇 y fuerza de fricci髇 m醲ima
fr = m.*ku.*v.^2.*cosd(alfa) - m.*g.*sind(alfa); 
frmax = ms.*m.*ku.*v.^2.*sind(alfa) + ms.*m.*g.*cosd(alfa);

%Punto de derrape
xp=length(xd);
for i=1:length(xd)
    if fr(i) >= frmax(i)
        xp=i;
        break
    end
end 



%Pendiente
dL= PolyDer(L);
mm=0;
for i=1:length(dL)
    mm = dL(i).*xd(xp).^(length(dL)-i)+mm;
end

%L韓ea de derrape
[xx, yy] = LineaRecta([xd(xp) f(xp)], mm, long,delta);

figure %Gr帷fica Frs-Frsmax
plot(xd,fr,'--', LineWidth= 1.2);
hold on
plot(xd,frmax, LineWidth= 1);
title('Fuerza de fricci贸n Vs Fuerza de fricci贸n m谩xima')
xlabel('Posici贸n en X (m)')
ylabel('Magnitud (N)')
legend('Fr_s', 'Fr_sm谩x')

figure %Gr帷fica Pista-Curvatura
%tiledlayout(2,1)
%Gr醘ica del segmento de pista
nexttile
plot(xd, f, Color='k', LineWidth= 15)
title('Pista')
xlabel('Posici贸n en X (m)')
ylabel('Posici贸n en Y (m)')
hold on 
plot(xd,f, '--w', LineWidth= 2)

hold on 
car = plot(xd(1),f(1),'o',LineWidth=5,Color='r');
%t = text(230,-200,['Tiempo = ' num2str(1)]);
px = text(230,-160,['Posici贸n en X = ' num2str(xd(1))]);
py = text(230,-180,['Posici贸n en Y = ' num2str(f(1))]);

for i=2:length(xd)
    delete(car);
    %delete(t);
    delete(px);
    delete(py);
    car=plot(xd(i), f(i), 'o', LineWidth=5, Color='r'); 
    %t = text(230,-200,['Tiempo = ' num2str(i)]);
    px = text(230,-160,['Posici贸n en X = ' num2str(xd(i))]);
    py = text(230,-180,['Posici贸n en Y = ' num2str(f(i))]);
    if i>=xp
        delete(car);
        delete(px);
        delete(py);
        car=plot(xx(i-xp+1), yy(i-xp+1), 'o', LineWidth=5, Color='r');
        px = text(230,-160,['Posici贸n en X = ' num2str(xd(i))]);
        py = text(230,-180,['Posici贸n en Y = ' num2str(f(i))]);
        if i>=length(xx) + xp -1
            break;
        end
    end
  drawnow;
end
