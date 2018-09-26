%Ethan MacDonald . 9/26/18
%{
This function handles the messey process of finding the linear
approximations needed to solve in NewtonMethod2Vars.m, and as such that
function relies upon this one. While this math could be included in the
main function, I found it easier to seperate it out. This function takes
two equations and an inital point as inputs, and returns two equations
which approcimate the tangent line at the given point. 
%}

function [returned] = NM2VLApprox(eqn1,eqn2,a,b)
    syms x y z real
    f = @(x,y) eqn1; g = @(x,y) eqn2;
    finitial = f(a,b); ginitial = g(a,b);
   
    gradF = @(x,y) jacobian(eqn1); gradG = @(x,y) jacobian(eqn2);
    gradFinitial = gradF(a,b);gradGinitial = gradG(a,b);
    
    tangent = [x - a, y - b];
    fapprox = simplify(finitial + dot(gradFinitial,tangent) == 0);
    gapprox = simplify(ginitial + dot(gradGinitial,tangent) == 0);
    
    returned = [fapprox; gapprox];
end