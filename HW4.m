alpha=1/3;
beta=0.99;
sigma=2;
delta=0.025;

maxr=1/beta;
minr=1;
l=1;
sigm=0.2;
rho=0.5;
k=5;
j=5;
[z,zprob] =TAUCHEN(j,rho,sigm,k);

min = 0;
maxa = 300;
numa = 200;
a = linspace(n=mina, maxa, numa);
    y     = zeros(ny,1);
yprob = zeros(ny,ny);

y(ny) = m * sqrt(sigma^2 / (1 - lambda^2));
y(1)  = -y(ny);
ystep = (y(ny) - y(1)) / (ny - 1);

for i=2:(ny-1)
    y(i) = y(1) + ystep * (i - 1);
end 

for j = 1:ny
     for k = 1:ny
         if k == 1
            yprob(j,k) = normcdf((y(1)- lambda * y(j) + ystep / 2) / sigma);
        elseif k == ny
            yprob(j,k) = 1 - normcdf((y(ny)- lambda * y(j) - ystep / 2) / sigma);
        else
            yprob(j,k) = normcdf((y(k)- lambda * y(j) + ystep / 2) / sigma) - ...
                         normcdf((y(k)- lambda * y(j) - ystep / 2) / sigma);
        end
    end
end