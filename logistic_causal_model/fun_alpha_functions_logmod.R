############################################
### causal logit model for psi and alpha ###
############################################


expit = function(x){ 1 / ( 1 + exp(-x) ) }

logit = function(x){ log( x / ( 1 - x ) ) }

### solving for gam0 marginal P(X=1) = p_x1, assuming p(Z=1) = 0.5
fun_px_gamx = function(x, p_x1 = 0.6, gamz = 2){
  p_x  = -p_x1 + expit( x + gamz ) * 0.5 + expit( x ) * 0.5 
  #   q_x  = - 0.4 + ( 1 - expit( x + 1 ) ) * 0.5 + ( 1 - expit( x ) ) * 0.5   
  
  return( p_x )
  
}

# solve for gam0 
fun_gam0 = function(x, p_x11, gamzz){ nleqslv(x = 1, fn = fun_px_gamx, p_x1 = p_x11, gamz = gamzz)$x }

# check 
# gam0 = fun_gam0(p_x11 = 0.6)

# P(X=1|Z=z), z\in \{0, 1\}
# p_x_1 = expit( gam0 - 0.5 )
# p_x_0 = expit( gam0 )
# 
# # check if indeed P(X=1) = p_x1
# p_x_1 * 0.5 + p_x_0 * 0.5


# for alpha, psi and marginal p(Y=1) py
fun_alpha = function(beta  = c(1, 1, 1, 1),
                      gamma,   # for P(X=1) = 0.6
                      py    = 0.3,          # for P(Y=1) = 0.3
                      alpha,
                      psi ){
  
  # for alpha and psi
  a1 =   alpha -  
    logit( expit( beta[1] + beta[3] ) * ( 1 - expit( gamma[1] + gamma[2] ) )  +
             expit( beta[1] + beta[2] + beta[3] + beta[4] - psi) *  expit( gamma[1] + gamma[2] ) )  +
    logit( expit( beta[1] ) * ( 1 -  expit( gamma[1] ) )  +
             expit( beta[1] + beta[2] - psi) * expit( gamma[1] )  )
  
  # for marginal P(Y=1) = 0.3
  b1 = py - 1/2 * ( 
    expit( beta[1] )           * ( 1 - expit( gamma[1] ) ) + 
      expit( beta[1] + beta[2] ) * expit( gamma[1] ) + 
      expit( beta[1] + beta[3] ) * ( 1 - expit(gamma[1] + gamma[2]) ) + 
      expit( beta[1] + beta[2] + beta[3] + beta[4] ) * expit( gamma[1] + gamma[2] ) 
  )
  return( c(a1, b1) )
}

### fixing b0x bz; solving for b0, bxz. Given P(X=1) = 0.6, and P(Y=1) by default
fun_alpha_b0_bxz_py = function(x, alpha, psi, gamma, py = 0.3){ fun_alpha(beta  = c(x[1], 1, 1, x[2]),
                                                                   gamma,
                                                                   py,
                                                                   alpha,
                                                                   psi) }
