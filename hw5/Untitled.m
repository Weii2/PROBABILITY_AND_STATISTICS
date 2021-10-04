print_table = zeros(25,9); x=1; y=1; z=5.5; z1=0.5;
for i=1:9
    print_table(1,i) = po(0, z); check=0;
    for j=2:25        
        if(print_table(j-1,i)>0.99995)
            check=1; break;
        else if(check == 1)
            print_table(j,i)='empty';
            else
            print_table(j,i) = print_table(j-1,i) + po(j-1, z);
            end
        end
    end
    z=z+0.5;
end


function poisson = po(x_p, u)
poisson = exp(-u)*(u^x_p) / factorial(x_p);
end