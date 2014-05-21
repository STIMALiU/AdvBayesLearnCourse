alpha = 1; % Prior precision
data = [0.68872543  0.33967413 -0.06830467 -1.87898409 -0.29230842  2.53667828 0.03314814 -3.10966805  2.43197586  3.60005107 -1.19090274 -0.09658805 ...
    0.38108757  1.00879419 -1.62893681 -1.00333500  3.03621296 -0.66239101 -0.19230352 -0.91602101  0.56778737  0.49642100  2.85880069  1.81142523 ...
    2.26751000 -1.12437874  1.68187364  0.37786249  0.77942687 -1.60312300];

[val,bin] = hist(data,10);
binWidth = diff(bin);
binWidth = binWidth(1);
lower = bin - binWidth/2; % lower endpoint of bins
upper = bin + binWidth/2; % upper endpoint of bins
upper(end) = max(data);

a = normcdf(upper);
b = diff(normcdf(upper));
pi0 = [a(1) b]; % Prior mean of pi
pi0(end) = pi0(end) +(1-sum(pi0)); % Adding the rightmost mass to the last bin

% Binning the data
n = [];
for i = 1:length(upper)
    n = [n sum(data>=lower(i) & data<=upper(i))];
end

figure
hold on
b1 = bar(bin,n);
set(b1,'facecolor','y')
title('Data','fontsize',16)
print Data -depsc2

figure
hold on
b2 = bar(bin,pi0);
set(b2,'facecolor','b')
title('Prior','fontsize',16)
print Prior -depsc2


% Posterior
alpha = 1; % Prior precision
a = alpha*pi0;
aPost = a + n;
postMean = aPost/sum(aPost);


figure
hold on
b3 = bar(bin,postMean);
set(b3,'facecolor','r')
title('Posterior, \alpha = 1','fontsize',16)
print PosteriorAlpha1 -depsc2


% Posterior
alpha = 10; % Prior precision
a = alpha*pi0;
aPost = a + n;
postMean = aPost/sum(aPost);


figure
hold on
b3 = bar(bin,postMean);
set(b3,'facecolor','r')
title('Posterior, \alpha = 10','fontsize',16)
print PosteriorAlpha10 -depsc2


% Posterior
alpha = 100; % Prior precision
a = alpha*pi0;
aPost = a + n;
postMean = aPost/sum(aPost);


figure
hold on
b3 = bar(bin,postMean);
set(b3,'facecolor','r')
title('Posterior, \alpha = 100','fontsize',16)
print PosteriorAlpha100 -depsc2



% Posterior
alpha = 1000; % Prior precision
a = alpha*pi0;
aPost = a + n;
postMean = aPost/sum(aPost);


figure
hold on
b3 = bar(bin,postMean);
set(b3,'facecolor','r')
title('Posterior, \alpha = 1000','fontsize',16)
print PosteriorAlpha1000 -depsc2