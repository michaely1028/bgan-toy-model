a=sqrt(2)/2;
A=[a,-a;a,a]*[10,0;0,1]*[a,a;-a,a];
n=50;
y=zeros(2,n);
for i=1:n
y(:,i)=mvnrnd(zeros(2,1),A);
end
scatter(y(1,:),y(2,:));
hold on;

%===========================================
%Generating n distinct points
%d=0;
x=zeros(2,n);
%a=mvnrnd(zeros(2,1),A);
a=[-6,6];
for j=1:n
    x(:,j)=pavelitera(a,y,0.1,n,500);
end
scatter(x(1,:),x(2,:),'r');
plot(a(1),a(2),'ko','markerfacecolor','m')

%==================== Focusing on one =============

x1=zeros(2,501);
x1(:,1)=a';alpha=0.1;
v=zeros(2,1);
for i=1:500
    k=unidrnd(n);
    v=v+alpha*(x1(:,i)-y(:,k));
    if norm(v)>1
        v=v/norm(v);
    end
    x1(:,i+1)=x1(:,i)-alpha*v;
end
plot(x1(1,:),x1(2,:));
plot(x1(1,501),x1(2,501),'ko');

x2=zeros(2,501);
x2(:,1)=a';alpha=0.1;
v=zeros(2,1);
for i=1:500
    %k=unidrnd(n);
    v=v+alpha*(x2(:,i)-mean(y,2));
    if norm(v)>1
        v=v/norm(v);
    end
    x2(:,i+1)=x2(:,i)-alpha*v;
end
plot(x2(1,:),x2(2,:));
plot(x2(1,501),x2(2,501),'mo');

%===========Axuiliary functions========
function l=pavelitera(a,y,alpha,n,n_iter)
for i=1:n
    d=zeros(2,1);l=a';
    for j=1:n_iter
    k=unidrnd(n);
    d=d+alpha*(l-y(:,k));
    %d=d+alpha*(l-mean(y,2));
    if norm(d)>1
    d=d/norm(d);
    end
    l=l-alpha*d;
    end
end
end