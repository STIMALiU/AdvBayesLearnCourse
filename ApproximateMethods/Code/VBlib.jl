# A collection of Variational Bayes functions
function ProbitVB(y, X, muBeta, invSigmaBeta, tol)

	# Load packages, defining shortcut functions 
	using Distributions
	function normcdf(x) return cdf(Normal(0,1),x) end
	function normpdf(x) return pdf(Normal(0,1),x) end

	# Prelim
	SigmaQBeta = inv(X'*X + invSigmaBeta)

	lowerBoundOld = 1
	lowerBound = 1 + 2*tol
	muQbeta = X \ y # Initialize with a linear regression estimate
	XmuQbeta = X*muQbeta
	PhiFunc = normcdf(XmuQbeta)
	while abs(lowerBound - lowerBoundOld) > tol
		
		# Updating a
		muQa = XmuQbeta + normpdf(XmuQbeta) ./ ( (PhiFunc.^y) * ((PhiFunc-1).^(1-y)) )

		# Updating beta
		muQbeta = (X'*X + invSigmaBeta) \ (X'*muQa + invSigmaBeta*muBeta)  
		XmuQbeta = X*muQbeta
		PhiFunc = normcdf(XmuQbeta)

        # Computing the lower bound
		lowerBoundOld = lowerBound
		lowerBound = y'*log(PhiFunc) + (1-y)'*log(1-PhiFunc) - 0.5*(muQbeta - muBeta)'*invSigmaBeta*(muQbeta - muBeta) - 0.5*log(det(SigmaQBeta*X'*X)) # FIXME: last term is constant.

	end

	return muQbeta, SigmaQBeta

end