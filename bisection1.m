function c = bisection1
% check for x^2-1. What is the appropriate interval?
f= @(x) x^2-3;
a=1;
b=2;
% we don't want f(a)=0 or f(b)=0
 %check the sign of the continous function at the end points of 
                %the interval
if f(a)*f(b)>0 
    disp('Wrong choice of the interval')
else
    c = (a + b)/2; % find the midpoint of the interval
    err = abs(f(c)); 
    while err > 1e-6 % tolerance for f(c)=0
      if f(a)*f(c)<0 
       b = c; %update the interval
      else
       a = c; %update the interval         
      end
      c = (a + b)/2; 
      err = abs(f(c));
    end
end
    
end    