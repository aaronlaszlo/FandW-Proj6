%Aaron Rosen - A20198898 - March242022
%Fields & Waves II - Project 5 - BVP 1 - Infinite Trough

syms y k x z m

Io = 10; %Voltage Potential (V)
b = 1; %trough height (m)
a = 1; %trough height (m)
epsilon = 8.854E-12;

begin = "Would you like to begin? ";
beg = input(begin);
while beg == 1




prompt = "Set N ----> ";
N = input(prompt);

func1 = ((4*Io)/pi);
func2 = sin(((2*k-1)*pi*x)/a)*sinh((((2*k-1)*pi*y)/b));
func3 = 1/((2*k-1)*sinh(((2*k-1)*pi*b)/a));
WG = symsum((func1*func2*func3), k, 1, N);
%WG = symsum((((4*Io)/((2*k-1)*pi))*exp(-((2*k-1)*pi*x)/b)*sin(((2*k-1)*pi*y)/b)), k, 1, N); 
figure
fsurf(WG, [0 a 0 b]);


WGX = -1.*gradient(WG)
WGXofX = -1.*gradient(WG, x)
WGXofY = -1.*gradient(WG, y)

[X, Y] = meshgrid(-0.1:0.01:0.1, -1:.1:1);
G1 = subs(WGX(1),[x y],{X,Y});
G2 = subs(WGX(2),[x y],{X,Y});

%X Plot
figure
quiver(X, G1);
title("Ex for N = 10");

%Y Plot
figure
quiver(G2,Y);
title("Ey for N = 10");

figure
fsurf(WGX, [0 a 0 b]);
figure
fsurf(WGXofX, [0 a 0 b]);
figure
fsurf(WGXofY, [0 a 0 b]);
figure
fsurf(norm(WGX), [0 a 0 b]);
rho = WGX(1) * 2* epsilon;
rho2 = WGX(2) * 2 * epsilon;

figure 
y = b;
fsurf(x, y, rho, [0 a 0 b])

figure
y = b;
fsurf(x, y, rho2, [0 a 0 b])
%fsurf(rho2, [0 a 0 b])




continue2 = "Would you like to continue? ";
cxnt = input(continue2); 
    if cxnt == 1
else
    break   
    end

   
end

