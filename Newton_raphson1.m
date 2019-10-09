function x = Newton_rapshon
%f= @(x) exp(x)-3*x;
%df= @(x) exp(x)-3;
%x0 = 1; % Initial guess
f= @(x) x + x^(4/3);  %	“@(x)-anonymous	functions”	
df= @(x) 1 + 4/3*x^(1/3);
x0 = 1; % Initial guess
N = 10; % Maximum number of iterations
tol = 1E-6; % Convergence tolerance
x = zeros(N + 1,1); % Preallocate solution vector where row => iteration
x(1) = x0;
k = 2;
nmax = N + 1; % Store final iteration if tol is reached before N iterations
 while (k <= nmax)
     x(k) = x(k-1) - (f(x(k-1))/df(x(k-1)));
     ex(k) = abs(x(k)-x(k-1)); 
     if (abs(ex) <= tol)
         nmax = k; % Store final iteration
         break;
     endif
     k = k+1;
 endwhile

% Plot evolution of the solution
figure('Color','White')
plot(0:nmax - 1,x(1:nmax),'o-')
title('Newton''s Method Solution: $f(x) = x + x^{\frac{4}{3}}$','FontSize',
20,'Interpreter','latex')
xlabel('Iteration','FontSize',16)
ylabel('$x$','FontSize',16,'Interpreter','latex')
endfunction
