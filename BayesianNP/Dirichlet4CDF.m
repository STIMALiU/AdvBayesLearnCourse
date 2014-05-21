% Dirichlet process prior for the distribution function
data = [0.68872543  0.33967413 -0.06830467 -1.87898409 -0.29230842  2.53667828 0.03314814 -3.10966805  2.43197586  3.60005107 -1.19090274 -0.09658805 ...
    0.38108757  1.00879419 -1.62893681 -1.00333500  3.03621296 -0.66239101 -0.19230352 -0.91602101  0.56778737  0.49642100  2.85880069  1.81142523 ...
    2.26751000 -1.12437874  1.68187364  0.37786249  0.77942687 -1.60312300];
n = length(data);
xGrid = linspace(min(data),max(data),100);
data = sort(data);

figure
count = 0;
for alpha = [1 10 100 1000]
    count = count + 1;
    Femp = (1/n)*cumsum(ones(1,n));
    FpriorAtObsData = normcdf(data);
    Fprior = normcdf(xGrid);
    w = alpha/(alpha+n);
    Fpost = w*FpriorAtObsData + (1-w)*Femp;
    
    subplot(2,2,count)
    hold on
    stairs(data,Femp, 'linewidth',2)
    plot(xGrid,Fprior,'g', 'linewidth',2)
    stairs(data,Fpost,'r', 'linewidth',2)
    title(['\alpha = ',int2str(alpha)])
    if count == 1
        hl = legend('F_{n} - empirical','F_{0} - prior','Posterior', 'location','northwest');
        set(hl,'fontsize',10)
    end
end