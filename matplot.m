
clear all;
close all;


figure(1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% Plotting Evolution of the Reference Problem %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map = jet(21);

hold on;

for i = 0:2:20
    str = "data/boundary/stationary/domain"+i+".txt";
    [x,y]   = textread(str, '%f  %f');
    h = plot(x, y, 'o-','LineWidth' , .75, 'MarkerSize', 4, 'color', [map(i+1,:)]);
    
    if i == 0 || i == 20
        h.Annotation.LegendInformation.IconDisplayStyle = 'on';
    else
        h.Annotation.LegendInformation.IconDisplayStyle = 'off';
    end
%     if i == 20
%         str = "data/boundary/stationary/domain"+(i+1)+".txt";
%         [x, y]   = textread(str, '%f  %f');
%         plot(x, y, '*','LineWidth' , 1.5, 'MarkerSize', 2);
%     end
    
end
legend('Initial Shape', 'Final Shape')
hold off;
box on;

figure(2);
str = "data/value/stationary/objectivevalue.txt";
[objx,objy] = textread(str,'%f  %f' );
objy = objy./max(objy);
plot(objx,objy,'o-','LineWidth' , 2, 'MarkerSize', 5);
xlabel('Iterate number $k$','interpreter', 'latex', 'fontsize', 15);
ylabel('$J_{s,\times}(\Omega_k)/J_{s,\times}(\Omega_0)$', 'interpreter',...
    'latex', 'fontsize', 15);
grid on;
axis([-0.1 20.1 -0.01 1.01]);


figure(3);
tiledlayout(2,4);
set(gcf,'position',[0,0,950,450]);




nexttile([2,2]);
hold on;
      
    j = 3;
    str = "data/boundary/instationary/time_T1/domain"+j+".txt";
    [x1, y1]   = textread(str, '%f  %f');
    plot(x1, y1, 'o-','LineWidth' , 1.5, 'MarkerSize', 2, ...
        'Color', [1.0000         0         0]);
    
    j = 5;
    str = "data/boundary/instationary/time_T2/domain"+j+".txt";
    [x2, y2]   = textread(str, '%f  %f');
    plot(x2, y2, 'o-','LineWidth' , 1.5, 'MarkerSize', 2, ...
        'Color', [1.0000    0.5000         0]);
    
    j = 16;
    str = "data/boundary/instationary/time_T4/domain"+j+".txt";
    [x3, y3]   = textread(str, '%f  %f');
    plot(x3, y3, 'o-','LineWidth' , 1.5, 'MarkerSize', 2, ...
        'Color', [1.0000    1.0000         0]);
    
    j = 42;
    str = "data/boundary/instationary/time_T8/domain"+j+".txt";
    [x4, y4]   = textread(str, '%f  %f');
    plot(x4, y4, 'o-','LineWidth' , 1.5, 'MarkerSize', 2, ...
        'Color', [0    1.0000    0]);
    
    j = 83;
    str = "data/boundary/instationary/time_T16/domain"+j+".txt";
    [x5, y5]   = textread(str, '%f  %f');
    plot(x5, y5, 'o-','LineWidth' , 1.5, 'MarkerSize', 2, ...
        'Color', [0         0    1.0000]);
    
    j = 138;
    str = "data/boundary/instationary/time_T32/domain"+j+".txt";
    [x6, y6]   = textread(str, '%f  %f');
    plot(x, y, 'o-','LineWidth' , 1.5, 'MarkerSize', 2, ...
        'Color', [0.6667         0    1.0000]);
    
    j = 208;
    str = "data/boundary/instationary/time_T64/domain"+j+".txt";
    [x7, y7]   = textread(str, '%f  %f');
    plot(x7, y7, 'o-','LineWidth' , 1.5, 'MarkerSize', 2, ...
        'Color', [1.0000         0         0]);
    
    j = 254;
    str = "data/boundary/instationary/time_T128/domain"+j+".txt";
    [x8, y8]   = textread(str, '%f  %f');
    plot(x8, y8, 'o-','LineWidth' , 1.5, 'MarkerSize', 2, ...
        'Color', [1.0000         .6667         0]);
    
    
    i = 20;
    str = "data/boundary/stationary/domain"+i+".txt";
    [x, y]   = textread(str, '%f  %f');
    plot(x, y, '*-','LineWidth' , 1.5, 'MarkerSize', 2, ...
        'Color', [0.0000    0         0]);

   

hold off;
box on;
axis([-4 6 -4 6]);
legend({'T = 1', 'T = 2','T = 4', 'T = 8', 'T = 16','T = 32', 'T = 64',...
    'T=128','Stationary Solution'}, 'Fontsize', 10)
%title('Shape Evolution');
% 



nexttile([1,2]);


[objx, objy]   = textread("data/value/stationary/objectivevalue.txt", '%f  %f');
[objx1, objy1]   = textread("data/value/instationary/objectivevalue_T1.txt", '%f  %f');
[objx2, objy2]   = textread("data/value/instationary/objectivevalue_T2.txt", '%f  %f');
[objx3, objy3]   = textread("data/value/instationary/objectivevalue_T4.txt", '%f  %f');
[objx4, objy4]   = textread("data/value/instationary/objectivevalue_T8.txt", '%f  %f');
[objx5, objy5]   = textread("data/value/instationary/objectivevalue_T16.txt", '%f  %f');
[objx6, objy6]   = textread("data/value/instationary/objectivevalue_T32.txt", '%f  %f');
[objx7, objy7]   = textread("data/value/instationary/objectivevalue_T64.txt", '%f  %f');
[objx8, objy8]   = textread("data/value/instationary/objectivevalue_T128.txt", '%f  %f');


[diff1, reldiff1] = compute_findiff(objy,objy1);
[diff2, reldiff2] = compute_findiff(objy,objy2);
[diff3, reldiff3] = compute_findiff(objy,objy3);
[diff4, reldiff4] = compute_findiff(objy,objy4);
[diff5, reldiff5] = compute_findiff(objy,objy5);
[diff6, reldiff6] = compute_findiff(objy,objy6);
[diff7, reldiff7] = compute_findiff(objy,objy7);
[diff8, reldiff8] = compute_findiff(objy,objy8);

t = [1, 2, 4, 8, 16, 32, 64, 128];
z = [diff1, diff2, diff3, diff4, diff5, diff6, diff7, diff8]
z1 = (1/14)*t.^(-1);
z2 = (1/13)*t.^(-1/2);
loglog(t, z, '-rs', t, z1, '-bs', t, z2, '-gs', 'linewidth', 1.5 );
legend({'$|J_{T,\times}-J_{s,\times}|$', '$\mathcal{O}(T^{-1})$',...
    '$\mathcal{O}(T^{-1/2})$'}, 'interpreter', 'latex', 'fontsize', 12,...
    'location', 'southwest');
% axis([-0.01 log(64+0.1) log(min(z)) log(max(z)) ])
grid on;


nexttile([1,2]);

hdist = [ compute_haussdist([x,y],[x1,y1]), compute_haussdist([x,y],[x2,y2]),...
    compute_haussdist([x,y],[x3,y3]), compute_haussdist([x,y],[x4,y4]),...
    compute_haussdist([x,y],[x5,y5]), compute_haussdist([x,y],[x6,y6]),...
    compute_haussdist([x,y],[x7,y7]), compute_haussdist([x,y],[x8,y8])]
t = log(t)/log(2);

plot(t,hdist,'-bs', 'linewidth', 1.5);
axis([-0.1 7.1 -0.01 1.1])
grid on;


function[diff,reldiff] = compute_findiff(A,B)
    n = length(A);
    m = length(B);
    
    diff = abs(A(n) - B(m));
    reldiff = diff/A(n);
end


function[dist] = compute_dist(A, B) 
m = size(A, 1); 
n = size(B, 1); 
dim= size(A, 2); 
for k = 1:m 
    C = ones(n, 1) * A(k, :); 
    D = (C-B) .* (C-B); 
    D = sqrt(D * ones(dim,1)); 
    dist(k) = min(D); 
end
dist = max(dist);
end

function[hauss_dist] = compute_haussdist(A,B)
    hauss_dist = max( compute_dist(A,B), compute_dist(B,A))
end
