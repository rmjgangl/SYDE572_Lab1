function MAP3(X1, X2, X3, mu1, mu2, mu3, sigma1, sigma2, sigma3, N1, N2, N3)    
    X = [X1(:,1); X2(:,1); X3(:,1)];
    Y = [X1(:,2); X2(:,2); X3(:,1)];
    
    x1range = min(X):0.1:max(X);
    x2range = min(Y):0.1:max(Y);
    [xx1, xx2] = meshgrid(x1range,x2range);
    class = zeros(length(x1range) * length(x2range), 1);
    XGrid = [xx1(:) xx2(:)];
    
    z_1 = Gauss2d(x1range, x2range, mu1', sigma1);
    z_2 = Gauss2d(x1range, x2range, mu2', sigma2);
    z_3 = Gauss2d(x1range, x2range, mu3', sigma3);
    pA = N1 / (N1 + N2 + N3);
    pB = N2 / (N1 + N2 + N3);
    pC = N3 / (N1 + N2 + N3);    

    for i = 1:length(XGrid)
        
        i1 = ceil(i / length(x2range));
        i2 = i - ((i1 - 1) * length(x2range));
        pxA = z_1(i1,i2);
        pxB = z_2(i1,i2);
        pxC = z_3(i1,i2);
        
        logI1 = log(pxA / pxB);
        logTheta1 = log(pB / pA);
        
        logI2 = log(pxB / pxC);
        logTheta2 = log(pC / pB);
        
        logI3 = log(pxC / pxA);
        logTheta3 = log(pA / pC);
        
        if (logI1 > logTheta1 && logI3 < logTheta3)
            class(i) = 1; % A
        elseif (logI1 < logTheta1  && logI2 > logTheta2)
            class(i) = 2; % B
        elseif (logI2 < logTheta2  && logI3 > logTheta3)
            class(i) = 3; % C
        else
            class(i) = 0;
        end
    end
    z = reshape(class,length(x2range),length(x1range));
    contour(xx1,xx2,z)
    
%   figure(3)
%   hold on;
%   surf(x2range, x1range, z_1);
%   surf(x2range, x1range, z_2);
%   surf(x2range, x1range, z_3);
%   figure(2)
end
