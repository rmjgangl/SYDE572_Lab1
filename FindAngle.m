function angle = FindAngle(mu,sigma)
[V,D] = eig(sigma);
if D(1,1)>=D(2,2)
    major = V(:,1);
    angle = atan(major(2)/major(1));
    plot_ellipse(mu(1),mu(2),angle,sqrt(D(1,1)),sqrt(D(2,2)));
else
    major = V(:,2);
    angle = atan(major(2)/major(1));
    plot_ellipse(mu(1),mu(2),angle,sqrt(D(2,2)),sqrt(D(1,1)));
end
end
