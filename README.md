# Simulations code for sensitivity analysis of G-estimators
Simulations and data analysis code for the paper Sensitivity [Analysis of G-estimators to Invalid Instrumental Variables by Valentin Vancak & Arvid Sjölander](https://arxiv.org/pdf/2208.05854.pdf).
The repository consists of three folders: 
Linear model; code for the linear causal regression model simulation.
Logistic model: code for the logit causal regression model simulation (with logistic association model).
The linear and the logistic model folders contain six files each: 
(1) Estimating equation(s) for the causal parameter. 
(2) Setting/Definition of the coefficients for different combinations of alpha, psi, and marginal probabilites.
(3) Main simulation file.
(4) Covariance matrix calculations for the G-estimator(s) and the coefficients of the association model.
(5) Plots of the coverage probabilities as a function of alpha. 
(6) Plots of the bias as a function of alpha.
Vitamin D example: code for the Vitamin D data example. It contains one file.



### References 
Valentin Vancak & Arvid Sjölander, Sensitivity Analysis of G-estimators to Invalid Instrumental Variables, 2022
