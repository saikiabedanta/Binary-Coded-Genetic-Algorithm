function [xreal] = realxvalue(xmin,xmax,n,x,P)

for k=1:n
    for i=1:P
        xreal(i,k)=xmin(k)+((xmax(k)-xmin(k))/((2^5)-1))*x(i,k);
    end
end

