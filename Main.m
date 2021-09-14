clc;
clear all;
close all;


x1min=0;
x1max=0.5;
x2min=0;
x2max=0.5;

xmin=[0;0];
xmax=[0.5;0.5];

gen=input("Enter the number of generations: ");
%no of variables
n=2;
%population size
P=input("Enter the population size: ");

%one variable string size
l=20;
%crossover prob
Pc=input("Enter the crossover probability: ");

%mutation prob
Pm=input("Enter the mutation probability: ");

for i=1:P
    for j=1:(l*n)
        r=rand;
        if r<=0.5
            A(i,j)=0;
        else
            A(i,j)=1;
        end
    end
end

N=0;
while(N<gen)

N=N+1;
num(N)=N;
for i=1:P
    for k=1:n
        dum=1;
        for j=(5*(k-1)+1):(5*k)
           r1(dum)=A(i,j);
           dum=dum+1;
        end
           x(i,k)=decode(r1);
    end
    
end
        

xreal =realxvalue(xmin,xmax,n,x,P);


for i=1:P
    for k=1:n
        f=func(xreal,P);
    end
end



[~,maximumf]=max(f);

x=xreal(maximumf,:);
x1(N)=x(1);
x2(N)=x(2);

maximum(N)=max(f);
minimum(N)=min(f);
S=sum(f);

avgf(N)=S/P;


for i=1:P
    p(i)=f(i)/S;
end

a(1)=p(1);
for i=2:P
    a(i)=a(i-1)+p(i);
end


for i=1:P
    r=rand;
    for j=1:P
      if(r<a(j))
            index(i)=j;
            break
      end
    end
end


for i=1:P
    for j=1:(n*l)
    matingp(i,j)=A(index(i),j);
    end
end

%crossover
rows = size(matingp,1);      
U = randperm(rows);
matingp_new = matingp(U,:);

for i=1:(P/2)
   r=rand;
   if r<=Pc
       r1=randperm(((n*l)-1),2);
       if r1(1)<=r1(2)
           for j=r1(1):(r1(2)-1)
            temp=matingp_new((2*i-1),j+1);
             matingp_new((2*i-1),j)=matingp_new(2*i,j);
             child((2*i-1),:)=matingp_new((2*i-1),:);
             matingp_new(2*i,j)=temp;
             child((2*i),j)=temp;
           end
       else
            for j=r1(2):(r1(1)-1)
             temp=matingp_new((2*i-1),j+1);
             matingp_new((2*i-1),j)=matingp_new(2*i,j);
             child((2*i-1),:)=matingp_new((2*i-1),:);
             matingp_new(2*i,j)=temp;
             child((2*i),j)=temp;
           end
       end
   
   end
   
   child((2*i-1),:)= matingp_new((2*i-1),:);
   child((2*i),:)= matingp_new((2*i),:);
 
end


%mutation

for i=1:P
    for j=1:(n*l)
    r=rand;
    if r<Pm
        child(i,j)=~child(i,j);
    end
    end
    
end

A=child;



end


figure(1)
plot(num,x1,num,x2);
legend('x1','x2');
axis([1 gen -0.1 1]);
xlabel('Generations');
ylabel('x1/x2  value');
hold on;


figure(2)
plot(num,minimum,num, maximum, num, avgf);
legend('minimum','maximum','avgf');
axis([1 gen 0.6 1.2]);
xlabel('Generations');
ylabel('Min f');
hold off



