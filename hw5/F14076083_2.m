x = 1:14;
y = [0.04, 0.06, 0.07, 0.08, 0.08, 0.07, 0.07, 0.06, 0.05, 0.03, 0.06, 0.12, 0.10, 0.11];
figure(); bar(x,y,0.2);
title('(a)  f(x) versus X'); xlabel('X');  ylabel('f(X)');

num = input('(b)\nPlease input the number of samples:');
random_x = ran_x(num);
re_x = zeros(1,14);
for i=1:num
    for j=1:14
        if(random_x(i)==j)    re_x(j) = re_x(j)+1;    end
    end
end
for j=1:14
    re_x(j) = re_x(j)/num;
end
figure(); bar(re_x,1); set(gca,'XTick',[0:1:15]);
title('(b)  relative frequency plot of the samples'); xlabel('x');  ylabel('relative frequency)');

function X = ran_x(num)
X = zeros(1,num);
for i = 1:num
    t = randi([0 100]);
    if( t>=0 && t<4 )     X(i)=1;    end
    if( t>=4 && t<10 )    X(i)=2;    end
    if( t>=10 && t<17 )   X(i)=3;    end
    if( t>=17 && t<25 )   X(i)=4;    end
    if( t>=25 && t<33 )   X(i)=5;    end
    if( t>=33 && t<40 )   X(i)=6;    end
    if( t>=40 && t<47 )   X(i)=7;    end
    if( t>=47 && t<53 )   X(i)=8;    end
    if( t>=53 && t<58 )   X(i)=9;    end
    if( t>=58 && t<61 )   X(i)=10;   end
    if( t>=61 && t<67 )   X(i)=11;   end
    if( t>=67 && t<79 )   X(i)=12;   end
    if( t>=79 && t<89 )   X(i)=13;   end
    if( t>=89 && t<=100 ) X(i)=14;    end
end
end