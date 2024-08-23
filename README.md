# Simulations code for sensitivity analysis of G-estimators
Simulations and data analysis code for the paper Sensitivity Analysis of G-estimators to Invalid Instrumental Variables by Valentin Vancak & Arvid Sjölander.
The repository consists of three folders: 
Linear causal model; code for the linear causal regression model simulation.
Logistic causal model: code for the logit causal regression model simulation (with logistic association model).
The linear and the logistic model folders contain six files each: 
(1) Estimating equation(s) for the causal parameter. 
(2) Setting/Definition of the coefficients for different combinations of alpha, psi, and marginal probabilities.
(3) Main simulation file.
(4) Covariance matrix calculations for the G-estimator(s) and the coefficients of the association model.
(5) Plots of the coverage probabilities for the causal parameters as a function of alpha. 
(6) Plots of the bias of the G-estimators as a function of alpha.
Vitamin D example: code for the Vitamin D data example. It contains one file.



### References 
Vancak V, Sjölander A. Sensitivity analysis of G-estimators to invalid instrumental variables. [Statistics in Medicine](https://onlinelibrary.wiley.com/doi/10.1002/sim.9859). 2023; 42(23): 4257–4281
