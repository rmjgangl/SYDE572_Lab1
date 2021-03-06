function MED3(mu1,mu2,mu3,X1,X2,X3)
    
    X = [X1(:,1); X2(:,1); X3(:,1)];
    Y = [X1(:,2); X2(:,2); X3(:,2)];
    
    x1range = min(X):0.1:max(X);
    x2range = min(Y):0.1:max(Y);
    [xx1, xx2] = meshgrid(x1range,x2range);
    class = zeros(length(x1range)*length(x2range),1);
    XGrid = [xx1(:) xx2(:)];
    
    for i = 1:length(XGrid)
        d1 = sqrt((mu1(1) - XGrid(i,1))^2 + (mu1(2) - XGrid(i,2))^2);
        d2 = sqrt((mu2(1) - XGrid(i,1))^2 + (mu2(2) - XGrid(i,2))^2);
        d3 = sqrt((mu3(1) - XGrid(i,1))^2 + (mu3(2) - XGrid(i,2))^2);
        if (d1 < d2 && d1 < d3)
            class(i) = 1;
        elseif (d2 < d1 && d2 < d3)
            class(i) = 2;
        elseif (d3 < d1 && d3 < d2)
            class(i) = 3;
        else
            class(i) = 0;
        end
    end
    
    z = reshape(class,length(x2range),length(x1range));
    contour(xx1,xx2,z)
end
