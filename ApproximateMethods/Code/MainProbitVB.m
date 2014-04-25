cd('/home/mv/Dropbox/Teaching/AdvBayesLearn/VT2014/ApproximateMethods/Code/')

% Loading data
data = load('MrozChibJeliaData.mat');
y = data.y;
X = data.X; % intercept by first column of ones
[n,p] = size(X);

% Prior
muBeta = zeros(p,1);
SigmaBeta = 25*eye(p);
invSigmaBeta = inv(SigmaBeta);

% Algorithmic settings
tol = 1e-8;

[muQbeta, SigmaQBeta, lowerBounds] = ProbitVB(y, X, muBeta, invSigmaBeta, tol);

plot(lowerBounds)
xlabel('iterations')
ylabel('Lower bound LML')

figure
for k = 1:p
    subplot(4,2,k)
    betaGrid = linspace(muQbeta(k) - 4*sqrt(SigmaQBeta(k,k)), muQbeta(k) + 4*sqrt(SigmaQBeta(k,k)), 100);
    plot(betaGrid, normpdf(betaGrid,muQbeta(k),sqrt(SigmaQBeta(k,k))), 'linewidth',2)
    title(['beta',int2str(k-1)])
end

