#############################
### COV MATRIX FOR LOGREG ###
#############################

# function of the outcome model

h_reg = function(beta, x, z) {
  
  plogis( beta[1] + beta[2] * x + beta[3] * z + beta[4] * x * z )
  
}


# function of the h(psi;\alpha)

h_a_psi = function(beta, psi, alpha, x, z ) {
  
  plogis( beta[1] + beta[2] * x + beta[3] * z + beta[4] * x * z - psi * x - alpha * z )
  
}


# D function of the instrument model

D_z = function(z, mu_z){ return( z - mu_z ) }

# system of estimating equations

Q = function(y, beta, psi, alpha, x, z, mu_z = mu_zz){ c( 
  (y - h_reg(beta,  x, z)), 
  (y - h_reg(beta,  x, z)) * x,
  (y - h_reg(beta,  x, z)) * z,
  (y - h_reg(beta,  x, z)) * x * z,
  D_z(z, mu_z), 
  D_z(z, mu_z) * h_a_psi(beta, psi, alpha, x, z) ) } 

# check 
# Q(y=1, beta=1:4, psi=4, alpha=1, x=1, z=2, mu_z=0.5)

# PSI_TAG derivative of the system of estimating equations

Q_tag = function(y, beta, psi, alpha, x, z, mu_z = mu_zz) {
  
  # rows of the outcome model. No alpha, no psi
 row1 = - c( h_reg(beta, x, z) * (1 - h_reg(beta, x, z)),
             h_reg(beta, x, z) * (1 - h_reg(beta, x, z)) * x,
             h_reg(beta, x, z) * (1 - h_reg(beta, x, z)) * z, 
             h_reg(beta, x, z) * (1 - h_reg(beta, x, z)) * x * z,
             0,
       -     D_z(z, mu_z) * h_a_psi(beta, psi, alpha, x, z) * (1 - h_a_psi(beta, psi, alpha, x, z)) )
  
  # last row of the h(psi;\alpha) model  
 # row6 = - c(   D_z(z, mu_z) * h_a_psi(beta, psi, alpha, x, z) * (1 - h_a_psi(beta, psi, alpha, x, z)),
 #                D_z(z, mu_z) * h_a_psi(beta, psi, alpha, x, z) * (1 - h_a_psi(beta, psi, alpha, x, z)) * x,
 #                D_z(z, mu_z) * h_a_psi(beta, psi, alpha, x, z) * (1 - h_a_psi(beta, psi, alpha, x, z)) * z, 
 #                D_z(z, mu_z) * h_a_psi(beta, psi, alpha, x, z) * (1 - h_a_psi(beta, psi, alpha, x, z)) * x * z,
 #                h_a_psi(beta, psi, alpha, x, z), 
 #                D_z(z, mu_z) * h_a_psi(beta, psi, alpha, x, z) * (1 - h_a_psi(beta, psi, alpha, x, z)) * x ) 
  
  row6 = c(rep(0, 5), -D_z(z, mu_z) * h_a_psi(beta, psi, alpha, x, z) * (1 - h_a_psi(beta, psi, alpha, x, z)) * x )
  
  # constructing the derivative matrix       
 mm =    matrix( ncol = 6, nrow = 6, byrow = F, 
          data =   c(  row1, 
                       x * row1,
                       z * row1,
                       x * z * row1, 
                       c( rep(0, 4), -1, -h_a_psi(beta, psi, alpha, x, z)), 
                       row6 )  ) 
  
 return(mm)
} 

# check 
# Q_tag(y=1, beta=1:4, psi=4, alpha=1, x=1, z=2, mu_z=0.5)


######### COV MATRIX ################

### BREAD MATRIX ###
bread_alph_psi = function(psi, alpha, beta, z, x, y, n) { 
  
  mu_zz = mean(z) 
  
  A0 = matrix(0, ncol = 6, nrow = 6)
  
  for (i in 1:n) {
    
    A0  = A0 +  Q_tag(y = y[i], beta, psi, alpha, x = x[i], z = z[i], mu_z = mu_zz)
  }
  return( -1 / n * A0 ) 
}

# check of the bread matrix 
# bread_alph_psi(psi = 1, alpha = 1, beta = 1:4, z = z, mu_z = mean(z), x = x, y = y, n = m )
# solve(bread_alph_psi(psi = 1, alpha = 1, beta = 1:4, z = z, mu_z = mean(z), x = x, y = y, n = m ))

### MEAT MATRIX ###
meat_alph_psi = function(psi, alpha, beta, z, x, y, n) { 
  
  mu_zz = mean(z)
  
  B0 = matrix(0, ncol = 6, nrow = 6)
  
  for (i in 1:n) {
    B0  =  B0 + outer( Q(y = y[i], beta, psi, alpha, x = x[i], z = z[i], mu_z = mu_zz),
                       Q(y = y[i], beta, psi, alpha, x = x[i], z = z[i], mu_z = mu_zz) )
  }
  return(  1 / n * B0 ) 
}

# check of the meat matrix   
# meat_alph_psi(psi = 1, alpha = 1, beta = 1:4, z = z, x = x, y =y, n=100 )
# solve(meat_alph_psi(psi = 1, alpha = 1, beta = 1:4, z = z, x = x, y =y, n=100 ))

# COVARIANCE SANDWICH BASED MATRIX  
vcov_alph_psi = function(  psi, alpha, beta, z, x, y, n) { 
    solve(bread_alph_psi(  psi, alpha, beta, z, x, y, n ))  %*% 
    meat_alph_psi(         psi, alpha, beta, z, x, y, n)    %*%
    t(solve(bread_alph_psi(psi, alpha, beta, z, x, y, n))) * 1 / n }

# check of the covariance matrix

m = 10 ^ 3
x = rnorm(m); y = rbinom(m, size = 1, prob = 0.5 ); z = rbinom(m, size = 1, prob = 0.5 )

mu_zz = mean(z)

library(ivtools)
dat = data.frame(y, x, z)

# Outcome model 
y_mod = glm( y ~ x + z + x * z,
             data   = dat,
             family = "binomial" )

# Instrument model 
z_mod = glm(z ~ 1, data = dat, family = "binomial")

# plogis(coef(z_mod))

### The G-est. of psi
psi_mod = ivglm(estmethod = "g", 
                X         = "x",
                Y         = "y",
                fitZ.L    = z_mod,
                fitY.LZX  = y_mod,
                data      = dat, 
                link      = "logit",
                vcov.fit  = T)

summary(psi_mod)

vv = vcov_alph_psi(psi   = psi_mod$est,
                   alpha = 0,
                   beta  = coef(y_mod), 
                   z     = z,
                   x     = x,
                   y     = y,
                   n     = m) 
round(vv, 5)

round(vcov(y_mod), 5)

# sqrt(psi_mod$vcov)

sder = sqrt(vv[6,6])
sder

# b = 0
# for( i in 1:10){
#   b = b + i 
# }
