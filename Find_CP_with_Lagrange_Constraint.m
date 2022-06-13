syms x y z lambda

f = x*y^2 - 2*(x^2) - 4*x; % Function (Insert required Function in this field)

g = 4*x^2 + y^2 - 1 == 0; % Constraint (Insert required Lagrange Constraint in this field)

L = f - lambda * lhs(g); % Lagrange function

dL_dx = diff(L,x) == 0; % Derivative of L with respect to x
dL_dy = diff(L,y) == 0; % Derivative of L with respect to y
dL_dz = diff(L,z) == 0; % Derivative of L with respect to z

dL_dlambda = diff(L,lambda) == 0; % Derivative of L with respect to lambda

system = [dL_dx; dL_dy; dL_dz; dL_dlambda]; % Build the system of equations

[x_val, y_val,z_val, lambda_val] = solve(system, [x y z lambda], 'Real', true); % Solve the system of equations and display the results 

results_numeric = double([x_val, y_val, z_val, lambda_val]); % Show results in a vector of data type double in the format [x, y, z, Lambda]

CP = double([x_val, y_val, z_val]); % Critical Points in the format [x, y, z]
