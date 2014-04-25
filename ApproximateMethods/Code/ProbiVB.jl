# Variation Bayes analysis of probit regression 
# Mattias Villani

cd("/home/mv/Dropbox/Teaching/AdvBayesLearn/VT2014/ApproximateMethods/Code/")

# Data
y = 
X = 
n, p = size(X,2)

# Prior
muBeta = zeros(p,1)
SigmaBeta = 10^2*eye(p)
invSigmaBeta = inv(SigmaBeta)

# Algorithmic settings
tol = 10^-8

# Prelim
SigmaBetaPost = X'*X + invSigmaBeta

lowerBoundOld = 1
lowerBound = 1 + 2*tol
while abs(lowerBound - lowerBoundOld) > tol
	
	muQbeta = (X'*X + invSigmaBeta) \ (X'*muQa + invSigmaBeta*muBeta) 
	lowerBoundOld = lowerBound
	lowerBound =  
end