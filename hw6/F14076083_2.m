clear all;
x=linspace(0,100,101);
y=linspace(1000,2000,1001);

dis_plot1=zeros(101,1001); dis_plot2=zeros(101,1001); dis_plot3=zeros(101,1001); dis_plot4=zeros(101,1001);
for i=0:100
    for j=1000:2000
        dis_plot1(i+1,j-999) = bi_no(i, j, 25, 30, 1250, 300, 0);
        dis_plot2(i+1,j-999) = bi_no(i, j, 75, 30, 1750, 300, 0);
        dis_plot3(i+1,j-999) = bi_no(i, j, 25, 20, 1250, 200, 0);
        dis_plot4(i+1,j-999) = bi_no(i, j, 75, 30, 1750, 300, 0);
    end
end
d1_max=0.005*max(dis_plot1(:)); d2_max=0.005*max(dis_plot2(:));
d3_max=0.005*max(dis_plot3(:)); d4_max=0.005*max(dis_plot4(:));
db1=zeros(101,1);    db2=zeros(101,1);
for i=0:100
    for j=1000:2000
        if( abs( dis_plot1(i+1,j-999)-dis_plot2(i+1,j-999) ) < d1_max && ...
            abs( dis_plot1(i+1,j-999)-dis_plot2(i+1,j-999) ) < d2_max)
            db1(i+1,1)=j;
        end
        if( abs( dis_plot3(i+1,j-999)-dis_plot4(i+1,j-999) ) < d3_max && ...
            abs( dis_plot3(i+1,j-999)-dis_plot4(i+1,j-999) ) < d4_max)
            db2(i+1,1)=j;
        end
    end
end
figure(1); imagesc(x,y,dis_plot1);   colorbar;   set(gca,'YDir','normal');  xlabel('X');  ylabel('Y');  
    set(gca,'ytick',[1000:200:2000]);  colormap(jet);   title('[\mu_x,\sigma_x,\mu_y,\sigma_y,\rho] = [25,30,1250,300,0]');
figure(2); imagesc(x,y,dis_plot2);   colorbar;   set(gca,'YDir','normal');  xlabel('X');  ylabel('Y'); 
    set(gca,'ytick',[1000:200:2000]);  colormap(jet);   title('[\mu_x,\sigma_x,\mu_y,\sigma_y,\rho] = [75,30,1750,300,0]');
figure(3); p1=plot(db1);   axis([0,100,1000,2000]); set(p1,'lineWidth',3);  xlabel('X');  ylabel('Y'); 
    title('decision boundary for case1');

figure(4); imagesc(x,y,dis_plot3);   colorbar;   set(gca,'YDir','normal');  xlabel('X');  ylabel('Y'); 
    set(gca,'ytick',[1000:200:2000]);  colormap(jet);   title('[\mu_x,\sigma_x,\mu_y,\sigma_y,\rho] = [25,20,1250,200,0]');
figure(5); imagesc(x,y,dis_plot4);   colorbar;   set(gca,'YDir','normal');  xlabel('X');  ylabel('Y'); 
    set(gca,'ytick',[1000:200:2000]);  colormap(jet);   title('[\mu_x,\sigma_x,\mu_y,\sigma_y,\rho] = [75,30,1750,300,0]');
figure(6); p2=plot(db2);   axis([0,100,1000,2000]);	set(p2,'lineWidth',3);  xlabel('X');  ylabel('Y'); 
    title('decision boundary for case2');

function bi_normaldist = bi_no(x, y, mean_x, sigma_x, mean_y, sigma_y, cor_co)
bi_normaldist = (1 / (2*pi*sigma_x*sigma_y* sqrt(1-cor_co^2) ) ) * ...
    exp( -((x-mean_x)^2/sigma_x^2 + (y-mean_y)^2/sigma_y^2 - 2*cor_co*(x-mean_x)*(y-mean_y)/(sigma_x*sigma_y)) / ...
        (2*(1-cor_co^2)) );
end