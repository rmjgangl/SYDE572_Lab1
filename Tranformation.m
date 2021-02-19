function [new_x] = Transformation(x1,x2,Sigma,mu,N)
new_x = zeros(N,2);
A = chol(Sigma);
    for i=1:N
        x_bar = [x1(i) x2(i)];
        new_variance = x_bar*A;
        new_x(i,1) = new_variance(1,1) + mu(1);
        new_x(i,2) = new_variance(1,2) + mu(2);
    end
end
