#####################
##### BIAS PLOT #####
#####################

psi_sd_dat <- read.csv("psi_sd_dat_logmodn1000m1000py03.csv")

### ggplot
library(cowplot)
library(ggplot2)


b0_0.5 = ggplot(psi_sd_dat, aes(x = alpha - 0.5, y = psi0_0.5, group = alpha)) +  
  geom_boxplot(width = 0.01, fill = "lightgrey") +
  geom_vline(xintercept = 0,    linetype = "dashed", col = "red")    +
  geom_hline(yintercept = 0.5, linetype = "dashed", col = "red")     +
  xlab(expression(alpha)) + ylab(expression(hat(psi)[G]~"("~alpha~")"))           +
  ggtitle(alpha~"=0,"~psi~"=0.5,"~p[y]~"=0.3,"~p[x]~"=0.6")  +
  theme_minimal_grid() + 
  theme(plot.title       = element_text(hjust = 0.5, size = 25),
                      axis.text.x = element_text(size = 20),
                      axis.text.y = element_text(size = 20), 
                      axis.title = element_text(size = 20))

  
b0.5_0.5 = ggplot(psi_sd_dat, aes(x = alpha, y = psi0.5_0.5, group = alpha)) +  
  geom_boxplot(width = 0.01, fill = "grey") +
  geom_vline(xintercept = 0.5, linetype = "dashed", col = "red")    +
  geom_hline(yintercept = 0.5, linetype = "dashed", col = "red")     +
  xlab(expression(alpha)) + ylab(expression(hat(psi)[G]~"("~alpha~")"))           +
  ggtitle(alpha~"=0.5,"~psi~"=0.5,"~p[y]~"=0.3,"~p[x]~"=0.6")  +
  theme_minimal_grid() + 
  theme(plot.title       = element_text(hjust = 0.5, size = 25),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20), 
        axis.title  = element_text(size = 20))


b0_0 = ggplot(psi_sd_dat, aes(x = alpha - 0.5, y = psi0_0, group = alpha)) +  
  geom_boxplot(width = 0.01, fill = "grey") +
  geom_vline(xintercept = 0, linetype = "dashed", col = "red")    +
  geom_hline(yintercept = 0, linetype = "dashed", col = "red")     +
  xlab(expression(alpha)) + ylab(expression(hat(psi)[G]~"("~alpha~")"))           +
  ggtitle(alpha~"=0,"~psi~"=0,"~p[y]~"=0.3,"~p[x]~"=0.6")  +
  theme_minimal_grid() + 
  theme(plot.title       = element_text(hjust = 0.5, size = 25),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20), 
        axis.title  = element_text(size = 20))


b0.5_0 = ggplot(psi_sd_dat, aes(x = alpha, y = psi0_0, group = alpha)) +  
  geom_boxplot(width = 0.01, fill = "grey") +
  geom_vline(xintercept = 0.5, linetype = "dashed", col = "red")    +
  geom_hline(yintercept = 0,   linetype = "dashed", col = "red")     +
  xlab(expression(alpha)) + ylab(expression(hat(psi)[G]~"("~alpha~")"))           +
  ggtitle(alpha~"=0.5,"~psi~"=0,"~p[y]~"=0.3,"~p[x]~"=0.6")  +
  theme_minimal_grid() + 
  theme(plot.title       = element_text(hjust = 0.5, size = 25),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20), 
        axis.title  = element_text(size = 20))


plot_grid(b0_0.5, b0.5_0.5, b0_0, b0.5_0,
          ncol = 2, nrow = 2)

######################################
######### RIBBON #####################
######################################
# psi_sd_dat <- read.csv("psi_sd_dat_logmodn1000m1000py03.csv")
# 
# ### ggplot
# library(cowplot)
# library(ggplot2)
# 
# 
# b0_0.5 = ggplot(data = psi_sd_dat, aes(x = alpha - 0.5, y = psi0_0.5, group = alpha)) +
#   geom_line( col = "blue", linetype = 1 ) +
#   geom_boxplot(width = 0.01, fill = "lightgrey") +
#   geom_vline(xintercept = 0,    linetype = "dashed", col = "red")    +
#   geom_hline(yintercept = 0.5, linetype = "dashed", col = "red")     +
#   geom_path(data = psi_sd_dat, aes(x = alpha - 0.5, y = psi0_0.5, group = alpha), size = 1) +
#   geom_ribbon( data = psi_sd_dat, aes(ymin = l0_0.5, ymax = u0_0.5), 
#                alpha = 0.1) +
#   xlab(expression(alpha)) + ylab(expression(hat(psi)[G]~"("~alpha~")"))           +
#   ggtitle(alpha~"=0,"~psi~"=0.5,"~p[y]~"=0.3,"~p[x]~"=0.6")  +
#   theme_minimal_grid() + 
#   theme(plot.title       = element_text(hjust = 0.5, size = 25),
#         axis.text.x = element_text(size = 20),
#         axis.text.y = element_text(size = 20), 
#         axis.title = element_text(size = 20))
