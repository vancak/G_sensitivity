###########################
##### CI LENGTHS PLOT #####
###########################

##### ggplot #####
library(cowplot)
library(ggplot2)


b0_0.5 = ggplot(psi_sd_dat, aes(x = alpha - 0.5, y = u0_0.5 - l0_0.5, group = alpha)) +  
  geom_boxplot(width = 0.01,   fill     = "grey") +
  xlab(expression(alpha)) + 
  ylab("95% level CIs length")   +
  ggtitle(alpha~"=0,"~psi~"=0.5,"~~p[x]~"=0.6,"~"y~N("~mu[y](beta)~","~sigma^2~")")  +
  #  scale_x_continuous(limits = c(-0.09, 0.09))  +
  theme_minimal_grid() + 
  theme(plot.title  = element_text(hjust = 0.5, size = 25),
        axis.text.x = element_text(size  = 20),
        axis.text.y = element_text(size  = 20), 
        axis.title  = element_text(size  = 25))


b0.5_0.5 = ggplot(psi_sd_dat, aes(x = alpha, y = u0.5_0.5 - l0.5_0.5, group = alpha)) +  
  geom_boxplot(width = 0.01, fill = "grey") +
  xlab(expression(alpha)) + 
  ylab("95% level CIs length")           +
  ggtitle(alpha~"=0.5,"~psi~"=0.5,"~~p[x]~"=0.6,"~"y~N("~mu[y](beta)~","~sigma^2~")")  +
  #  scale_x_continuous(limits = c(0.5 - 0.09, 0.5 + 0.09))  +
  theme_minimal_grid() + 
  theme(plot.title       = element_text(hjust = 0.5, size = 25),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20), 
        axis.title  = element_text(size = 25))


b0_0 = ggplot(psi_sd_dat, aes(x = alpha - 0.5, y = u0_0 - l0_0, group = alpha)) +  
  geom_boxplot(width = 0.01, fill = "grey") +
  xlab(expression(alpha)) + 
  ylab("95% level CIs length")     +
  ggtitle(alpha~"=0,"~psi~"=0,"~~p[x]~"=0.6,"~"y~N("~mu[y](beta)~","~sigma^2~")")  +
  #  scale_x_continuous(limits = c(-0.09, 0.09))  +
  theme_minimal_grid() + 
  theme(plot.title  = element_text(hjust = 0.5, size = 25),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20), 
        axis.title  = element_text(size = 25))


b0.5_0 = ggplot(psi_sd_dat, aes(x = alpha, y = u0.5_0 - l0.5_0, group = alpha)) +  
  geom_boxplot(width = 0.01, fill = "grey") +
  xlab(expression(alpha))      + 
  ylab("95% level CIs length")           +
  ggtitle(alpha~"=0.5,"~psi~"=0,"~~p[x]~"=0.6,"~"y~N("~mu[y](beta)~","~sigma^2~")")  +
  #  scale_x_continuous(limits = c(0.5 - 0.09, 0.5 + 0.09))  +
  theme_minimal_grid() + 
  theme(plot.title  = element_text(hjust = 0.5, size = 25),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20), 
        axis.title  = element_text(size = 25))


plot_grid(b0_0.5, b0.5_0.5, b0_0, b0.5_0,
          ncol = 2, nrow = 2)

psi_sd_dat$ln0_0     = psi_sd_dat$u0_0     - psi_sd_dat$l0_0
psi_sd_dat$ln0.5_0   = psi_sd_dat$u0.5_0   - psi_sd_dat$l0.5_0
psi_sd_dat$ln0.5_0.5 = psi_sd_dat$u0.5_0.5 - psi_sd_dat$l0.5_0.5
psi_sd_dat$ln0_0.5   = psi_sd_dat$u0_0.5   - psi_sd_dat$l0_0.5

library(xtable)

df_alpha_0 = round( rbind(tapply(psi_sd_dat$ln0_0,   INDEX = psi_sd_dat$alpha - 0.5, FUN = mean), 
                          tapply(psi_sd_dat$ln0_0.5, INDEX = psi_sd_dat$alpha - 0.5, FUN = mean)), 3)

df_alpha_0.5 = round(rbind(tapply(psi_sd_dat$ln0.5_0,   INDEX = psi_sd_dat$alpha, FUN = mean), 
                           tapply(psi_sd_dat$ln0.5_0.5, INDEX = psi_sd_dat$alpha, FUN = mean)), 3)

xtable( cbind(t(df_alpha_0), colnames(df_alpha_0.5), t(df_alpha_0.5)))       