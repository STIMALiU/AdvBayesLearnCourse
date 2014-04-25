# Variation Bayes analysis of probit regression 
# Mattias Villani

cd("/home/mv/Dropbox/Teaching/AdvBayesLearn/VT2014/ApproximateMethods/Code/")
include("VBlib.jl")
using MAT

# Loading data
data = matread("MrozChibJeliaData.mat")
y = data["y"]
X = data["X"] # intercept by first column of ones
n,p = size(X)

# Prior
muBeta = zeros(p,1)
SigmaBeta = 10^2*eye(p)
invSigmaBeta = inv(SigmaBeta)

# Algorithmic settings
tol = 1e-8

muQBeta, SigmaQBeta = ProbitVB(y, X, muBeta, invSigmaBeta, tol)

