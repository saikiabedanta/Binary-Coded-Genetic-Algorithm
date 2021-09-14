function [f] = func(xreal,P)

for i=1:P
     f(i)=1/(1+(xreal(i,1)+xreal(i,2)-2*(xreal(i,1)^2)-xreal(i,2)^2+xreal(i,1)*xreal(i,2)));
end
end

