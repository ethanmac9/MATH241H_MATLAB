%Ethan MacDonald . 9/26/18
%{
This function solves for one intersection of two functions (f and g)
of two variable (x and y). As inputs, the functions, the number of
interations (n), and an initial point (a,b) are needed. This function
relies upon the function NM2VLApprox.m to fing the linear approximation of
the functions that is used to compute Newton's Method with 2 variables. 
%}

function [returned] = NewtonMethod2Vars(f,g,n,a,b)
    %f and g must'nt be function_handel, i.e. NO @(x,y)
    syms x y z real
    for i = 1:n
        system = NM2VLApprox(f,g,a,b);
        eqns = [system(1,1),system(2,1)];
        [X,Y] = solve(eqns,[x y]);
        a = double(X(1,1));
        b =double(Y(1,1));
        solution = [a,b];
    end
returned = solution;
end

