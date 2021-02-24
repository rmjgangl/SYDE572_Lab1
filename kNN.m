function kNN(X1,X2)
    X = [X1(:,1); X2(:,1)];
    Y = [X1(:,2); X2(:,2)];
    
    x1range = min(X):0.1:max(X);
    x2range = min(Y):0.1:max(Y);
    [xx1, xx2] = meshgrid(x1range,x2range);
    class = zeros(length(x1range)*length(x2range),1);
    XGrid = [xx1(:) xx2(:)];
    Class1min = zeros(length(X1),1);
    Class2min = zeros(length(X2),1);
    
    for i = 1:length(XGrid)
        for j = 1:length(X1)
            Class1min(j) = sqrt((X1(j,1) - XGrid(i,1))^2 + (X1(j,2) - XGrid(i,2))^2);
        end
        [vals1] = sort(Class1min);
        proto1 = sum(vals1(1:5))/5;
        for k = 1:length(X2)
            Class2min(k) = sqrt((X2(k,1) - XGrid(i,1))^2 + (X2(k,2) - XGrid(i,2))^2);
        end
        [vals2] = sort(Class2min);
        proto2 = sum(vals2(1:5))/5;
        
        if (proto1 < proto2)
            class(i) = 1;
        elseif (proto2 < proto1)
            class(i) = 2;
        else
            class(i) = 0;
        end
    end
    z = reshape(class,length(x2range),length(x1range));
    contour(xx1,xx2,z)
end
