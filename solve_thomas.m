function x = solve_thomas(A,d)
  na = size(A,1); % number of rows in A
  
  for i = 2:na
    p = A(i,i-1)/A(i-1,i-1);           % p = a_i/b_{i-1}
    A(i,i) = A(i,i) - p*A(i-1,i);     % b_i = b_i - p*c_{i-1} 
    d(i,1) = d(i,1) - p*d(i-1,1);      % d_i = d_i - p*d_{i-1} 
  endfor
  
  x = zeros(na,1);
  x(na,1) = d(na,1)/A(na,na);
  for i = na-1:-1:1
    x(i,1) = (d(i,1) - A(i,i+1)*x(i+1,1))/A(i,i);
    endfor
  
endfunction
