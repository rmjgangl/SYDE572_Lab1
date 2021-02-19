% Class Data
mu_A = [5 10];
sigma_A = [8 0; 0 4];
N_A = 200;

mu_B = [10 15];
sigma_B = [8 0; 0 4];
N_B = 200;

mu_C = [5 10];
sigma_C = [8 4; 4 40];
N_C = 100;

mu_D = [15 10];
sigma_D = [8 0; 0 8];
N_D = 200;

mu_E = [10 5];
sigma_E = [10 -5; -5 20];
N_E = 150;

% Generate random Gaussian for each class
x_1_A = randn(N_A,1);
x_2_A = randn(N_A,1);

x_1_B = randn(N_B,1);
x_2_B = randn(N_B,1);

x_1_C = randn(N_C,1);
x_2_C = randn(N_C,1);

x_1_D = randn(N_D,1);
x_2_D = randn(N_D,1);

x_1_E = randn(N_E,1);
x_2_E = randn(N_E,1);

% plot 1
hold on;
Transformation(x_1_A,x_2_A,sigma_A,mu_A,N_A);
X_A = ans;
scatter(X_A(:,1),X_A(:,2));
FindAngle(mu_A,sigma_A);

Transformation(x_1_B,x_2_B,sigma_B,mu_B,N_B);
X_B = ans;
scatter(X_B(:,1),X_B(:,2));
FindAngle(mu_B,sigma_B);
hold off;

% plot 2
figure;
hold on;
Transformation(x_1_C,x_2_C,sigma_C,mu_C,N_C);
X_C = ans;
scatter(X_C(:,1),X_C(:,2));
FindAngle(mu_C,sigma_C);

Transformation(x_1_D,x_2_D,sigma_D,mu_D,N_D);
X_D = ans;
scatter(X_D(:,1),X_D(:,2));
FindAngle(mu_D,sigma_D);

Transformation(x_1_E,x_2_E,sigma_E,mu_E,N_E);
X_E = ans;
scatter(X_E(:,1),X_E(:,2));
FindAngle(mu_E,sigma_E);
hold off;
