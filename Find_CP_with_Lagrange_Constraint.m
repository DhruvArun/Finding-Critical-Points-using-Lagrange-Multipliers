syms x y z lambda

f = x*y^2 - 2*(x^2) - 4*x; % function

g = 4*x^2 + y^2 - 1 == 0; % constraint 

L = f - lambda * lhs(g); % Lagrange function

dL_dx = diff(L,x) == 0; % derivative of L with respect to x
dL_dy = diff(L,y) == 0; % derivative of L with respect to y
dL_dz = diff(L,z) == 0; % derivative of L with respect to z

dL_dlambda = diff(L,lambda) == 0; % derivative of L with respect to lambda

system = [dL_dx; dL_dy; dL_dz; dL_dlambda]; % build the system of equations

[x_val, y_val,z_val, lambda_val] = solve(system, [x y z lambda], 'Real', true); % solve the system of equations and display the results 

results_numeric = double([x_val, y_val, z_val, lambda_val]); % show results in a vector of data type double

CP = double([x_val, y_val, z_val]);

num_CP = length(CP);