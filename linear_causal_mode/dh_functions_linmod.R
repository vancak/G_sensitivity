#############################################
### D * h function - linear causal model  ###
#############################################

dh = function(psi, alpha){ 
  mu_zz = mean(z)
  sum( ( z - mu_zz ) * (y - psi * x - alpha * z) )  
} 

# fixing alpha, solving for psi 
dh_alpha = function(x, alpha)
{
  dh(psi = x, alpha)
} 
