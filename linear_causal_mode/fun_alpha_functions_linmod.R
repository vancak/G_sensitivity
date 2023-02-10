#############################################
### causal linear model for psi and alpha ###
#############################################


expit = function(x){ 1 / ( 1 + exp(-x) ) }

logit = function(x){ log( x / ( 1 - x ) ) }

fun_alpha = function(beta  = c(1, 1, 1, 1),
                        gamma = c(-1, 3.6),
                        alpha,
                        psi ){
    
    # for alpha and psi
    a1 =   alpha  -  
      ( ( beta[1] + beta[3] ) * ( 1 - expit( gamma[1] + gamma[2] ) )  +
          ( beta[1] + beta[2] + beta[3] + beta[4] - psi ) *  expit( gamma[1] + gamma[2] ) )  +
      (   beta[1] * ( 1 -  expit( gamma[1] ) )  +
            ( beta[1] + beta[2] - psi) *  expit( gamma[1] )  )
    
    return( c(a1) )
  }
  
### fixing b0, bx, bz; solving for bxz
fun_alpha_bxz = function(x, alpha, psi){ fun_alpha(beta  = c(1, 1, 1, x[1]),
                                                   gamma = c(-1, 3.6),
                                                   alpha,
                                                   psi) }
  