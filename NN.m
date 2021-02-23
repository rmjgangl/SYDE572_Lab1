function NN(X1,X2)
    X = [X1(:,1); X2(:,1)];
    Y = [X1(:,2); X2(:,2)];
    
    x1range = min(X):0.1:max(X);
    x2range = min(Y):0.1:max(Y);
    [xx1, xx2] = meshgrid(x1range,x2range);
    class = zeros(length(x1range)*length(x2range),1);
    XGrid = [xx1(:) xx2(:)];
    
    for i = 1:length(XGrid)
        min1 = 100;
        min2 = 100;
        for j = 1:length(X1)
            a = sqrt((X1(j,1) - XGrid(i,1))^2 + (X1(j,2) - XGrid(i,2))^2);
            if (a < min1)
                min1 = a;
            end
        end
        for k = 1:length(X2)
            b = sqrt((X2(k,1) - XGrid(i,1))^2 + (X2(k,2) - XGrid(i,2))^2);
            if (b < min2)
                min2 = b;
            end
        end
        if (min1 < min2)
            class(i) = 1;
        elseif (min2 < min1)
            class(i) = 2;
        else
            class(i) = 0;
        end
    end
    z = reshape(class,length(x2range),length(x1range));
    contour(xx1,xx2,z)
end
