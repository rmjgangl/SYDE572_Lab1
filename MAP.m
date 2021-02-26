function MAP(X1,X2,mu1,mu2,sigma1,sigma2,N1,N2)    
    X = [X1(:,1); X2(:,1)];
    Y = [X1(:,2); X2(:,2)];
  
    x1range = min(X):0.1:max(X);
    x2range = min(Y):0.1:max(Y);
    [xx1, xx2] = meshgrid(x1range,x2range);
    class = zeros(length(x1range)*length(x2range),1);
    XGrid = [xx1(:) xx2(:)];
    
    z_1 = Gauss2d(x1range, x2range, mu1', sigma1');
    z_2 = Gauss2d(x1range, x2range, mu2', sigma2');
    pA = N1 / (N1 + N2);
    pB = N2 / (N1 + N2);

    for i = 1:length(XGrid)
        
        i1 = ceil(i / length(x2range));
        i2 = i - ((i1 - 1) * length(x2range));
        pxA = z_1(i1,i2);
        pxB = z_2(i1,i2);
        
        logI1 = log(pxA / pxB);
        logTheta1 = log(pB / pA);
        
        if (logI1 > logTheta1)
            class(i) = 1; % A
        elseif (logI1 < logTheta1)
            class(i) = 2; % B
        else
            class(i) = 0;
        end
    end
    z = reshape(class,length(x2range),length(x1range));
    contour(xx1,xx2,z)

%    figure(4)
%    hold on;
%    alpha(0.5)
%    surf(x1range, x2range, z_1', 'FaceColor', 'blue');
%    alpha(0.5)
%    surf(x1range, x2range, z_2', 'FaceColor', 'yellow');
    
%    title('3D Distributions of Class Aand B')
%    legend('Class A', 'Class B');
%    xlabel('x1')
%    ylabel('x2')
 
%    figure(2)
end
