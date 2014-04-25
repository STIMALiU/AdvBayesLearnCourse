% NB: You need a matrix PostSampleIndepMH with MCMC samples to run this code
figure
for i = 1:8
    k=i;
    subplot(4,2,i)
    [f,x] = ksdensity(PostSampleIndepMH(:,i));
    plot(x,f,'r', 'linewidth',2)
    title(['\beta_{',int2str(i-1),'}'])
    hold on
    betaGrid = linspace(PostMode(k) - 4*sqrt(InvHessian(k,k)), PostMode(k) + 4*sqrt(InvHessian(k,k)), 100);
    plot(betaGrid, normpdf(betaGrid,muQbeta(k),sqrt(SigmaQBeta(k,k))), 'linewidth',2)
    plot(betaGrid, normpdf(betaGrid,PostMode(k),sqrt(InvHessian(k,k))), 'linewidth',2, 'color','g')
end



