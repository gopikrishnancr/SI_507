function x = solve_jacobi(A,b,x0,tol,kmax)
 
  N = size(A,1);               % get the dimension of the system
  x = x0;                      
  Atemp = zeros(N,N);
  Btemp = zeros(N,1);
  b = b./diag(A);
  A = -bsxfun(@rdivide,A,diag(A)); % matrix-vector pairwise multiplication
  A = A - diag(diag(A));           % eliminates diagonal entries of A
  
  for k =1:kmax
    x = A*x + b;                         % Jacobi iteration
    if norm(x - x0)/norm(x0 + eps) < tol % relative error (why eps?)
      break
    endif
      x0 = x;
  endfor
  
  fprintf('\n Relative eroor is %e \n',norm(x - x0)/norm(x0 + eps));
  
  if k == kmax % error message on maximum iteration number reaching
    disp('Maximum iteration reached. Solution may be erraneous. ');
  endif
  
  
endfunction
