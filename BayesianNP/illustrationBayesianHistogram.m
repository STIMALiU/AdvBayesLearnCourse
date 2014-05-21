data = [1 2 4 3 2 1 2]; % Made up data
%sigma= 0.1; data = [-3+randn(1,1)*sigma -2+randn(1,2)*sigma -1+randn(1,4)*sigma 0+randn(1,3)*sigma 1+randn(1,2)*sigma 2+randn(1,1)*sigma 3+randn(1,2)*sigma];
figure
n =100;
hold on
count = 0;
for i = -2.5:3.5
    count = count + 1;
    plot(i*ones(n,1),linspace(0,5,n), 'color',[0.5 0.5 0.5])
    text(i-0.5,4.5,strcat('\xi_',int2str(count-1)),'fontsize',16)
end
%text(i+0.5,4.5,strcat('\xi_',int2str(count)),'fontsize',16)
xs = [linspace(-2.5,-1.5,100) fliplr(linspace(-2.5,-1.5,100))];
ys = 12*[zeros(1,100) normpdf(fliplr(linspace(-2.5,-1.5,100)))];
fill(xs,ys,[0.5 0.5 1])
x= linspace(-4,4,1000);
hDens = plot(x,12*normpdf(x), 'linewidth',2);
hBar = bar([-3,-2,-1,0,1,2,3],[1 2 4 3 2 1 2]);
set(hBar,'facecolor','y','barwidth',0.6)
legend([hDens hBar],'\alpha\cdotP_{0}','Data')
set(gca,'xlim',[-3.5 3.5])
 
gtext('\alpha\cdotP(B_1)','fontsize',16)





