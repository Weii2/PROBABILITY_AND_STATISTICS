fprintf("(a)Binomial distribution\r")

x_b=input('Please input x : ');
n=input('Please input n : ');
p=input('Please input p : ');
fprintf("b(%d;%d,%.2f) = %f\r",x_b, n, p, bi(x_b, n, p))

fprintf("(b)Poisson distribution\r")

x_p=input('Please input x : ');
u=input('Please input £g : ');
fprintf("p(%d;%.2f) = %f\r",x_p ,u ,po(x_p, u))

fprintf("(c)Binomial Probability Sums Table\r")

input('Press Enter to built table.');
print_table = zeros(35,10); t=1; s=3;
for i=1:7
    bi_table = zeros(i+1,10);
    p=0.1;  
    if(i==1)
        t=1;
    else if(i==2)
        t=3;
    else
        t=t+s; s=s+1;
        end
    end
    for j=1:10
        bi_table(1,j) = bi(0, i, p);
        print_table(t,j) = bi_table(1,j);
        t1=1;
        for k=2:i+1
            bi_table(k,j) = bi_table(k-1,j) + bi(k-1, i, p);
            print_table(t+t1,j) = bi_table(k,j); t1=t1+1;
        end
        if(j==3 || j==4)
            p=p+0.05;
        else
            p=p+0.1;
        end
    end
end
x=1; y=0;
poo={'n','r','p=0.10','0.20','0.25','0.30','0.40','0.50','0.60','0.70','0.80','0.90'};
n=['1';' ';'2';' ';' ';'3';' ';' ';' ';'4';' ';' ';' ';' ';'5';' ';' ';' ';' ';' ';'6';' ';' ';' ';' ';' '; ...
    ' ';'7';' ';' ';' ';' ';' ';' ';' '];
r=[0;1;0;1;2;0;1;2;3;0;1;2;3;4;0;1;2;3;4;5;0;1;2;3;4;5;6;0;1;2;3;4;5;6;7];
T = table(n(1:35,1),r(1:35,1),print_table(1:35,1),print_table(1:35,2),print_table(1:35,3),print_table(1:35,4), ...
          print_table(1:35,5),print_table(1:35,6),print_table(1:35,7),print_table(1:35,8),           ...
          print_table(1:35,9),print_table(1:35,10),'VariableNames',poo)

fprintf("(d)Poisson Probability Sums Table\r")
input('Press Enter to built table.');
print_table = zeros(25,9); x=1; y=1; z=5.5; z1=0.5;
for i=1:9
    print_table(1,i) = po(0, z);
    for j=2:25
        print_table(j,i) = print_table(j-1,i) + po(j-1, z);
    end
    z=z+0.5;
end
poo={'r','£g=5.5','6.0','6.5','7.0','7.5','8.0','8.5','9.0','9.5'};
r=[0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20;21;22;23;24];
T = table(r(1:25,1),print_table(1:25,1),print_table(1:25,2),print_table(1:25,3),print_table(1:25,4),  ...
          print_table(1:25,5),print_table(1:25,6),print_table(1:25,7),print_table(1:25,8),            ...
          print_table(1:25,9),'VariableNames',poo)

fprintf("(e)\r")
input('Press Enter to show 4 plots.');
x = 0:10^4;
y1 = binopdf(x, 10^4, 0.01); y2 = binopdf(x, 10^4, 0.1);
y3 = binopdf(x, 10^4, 0.2); y4 = binopdf(x, 10^4, 0.5);
p1 = poisspdf(x,100); p2 = poisspdf(x,1000);
p3 = poisspdf(x,2000); p4 = poisspdf(x,5000);

figure(); plot(x,y1, x,p1); legend('Binomial','Poisson'); axis([0, 10^4, 0, 0.05]);
title('(n, p) = (10^4, 0.01)'); xlabel('x');  ylabel('P(X=x)');

figure(); plot(x,y2, x,p2); legend('Binomial','Poisson'); axis([0, 10^4, 0, 0.02]);
title('(n, p) = (10^4, 0.1)'); xlabel('x');  ylabel('P(X=x)');

figure(); plot(x,y3, x,p3); legend('Binomial','Poisson'); axis([0, 10^4, 0, 0.015]);
title('(n, p) = (10^4, 0.2)'); xlabel('x');  ylabel('P(X=x)');

figure(); plot(x,y4, x,p4); legend('Binomial','Poisson'); axis([0, 10^4, 0, 0.01]);
title('(n, p) = (10^4, 0.5)'); xlabel('x');  ylabel('P(X=x)');

function binomial = bi(x_b, n, p)
binomial = nchoosek(n,x_b) * p^x_b * (1-p)^(n-x_b);
end
function poisson = po(x_p, u)
poisson = exp(-u)*(u^x_p) / factorial(x_p);
end