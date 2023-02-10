### ggplot
library(cowplot)
library(ggplot2)
# theme_set(theme_minimal())

#theme_replace()

g0_0.5 = ggplot( data = dat_cp, aes( x = alpha_range0, y = cp0_0.5) ) + 
  geom_line(size = 1) + 
  geom_vline(xintercept = 0,    linetype = "dashed", col = "red", size = 0.8) +
  geom_hline(yintercept = 0.95, linetype = "dashed", col = "red", size = 0.8) +
  xlab(expression(alpha)) + ylab("coverage probability")             +
  ggtitle(alpha~"=0,"~psi~"=0.5,"~p[y]~"=0.3,"~p[x]~"=0.6")  +
#  scale_y_continuous(limits=c(0.65, 1), breaks=seq(0.7, 1, by = 0.05)) +
  theme_minimal_grid() + 
  theme(plot.title       = element_text(hjust = 0.5, size = 25),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20), 
        axis.title  = element_text(size = 20))

        
g0.5_0.5 = ggplot( data = dat_cp, aes( x = alpha_range0.5, y = cp0.5_0.5) ) + 
  geom_line(size = 1) + 
  geom_vline(xintercept = 0.5,  linetype = "dashed", col = "red", size = 0.8) +
  geom_hline(yintercept = 0.95, linetype = "dashed", col = "red", size = 0.8) +
  xlab(expression(alpha)) + ylab("coverage probability")             +
  ggtitle(alpha~"=0.5,"~psi~"=0.5,"~p[y]~"=0.3,"~p[x]~"=0.6")  +
#  scale_y_continuous(limits=c(0.65, 1),breaks=seq(0.7, 1, by = 0.05)) +
  theme_minimal_grid() + 
  theme(plot.title       = element_text(hjust = 0.5, size = 25),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20), 
        axis.title  = element_text(size = 20))

  
g0_0 = ggplot( data = dat_cp, aes( x = alpha_range0, y = cp0_0) ) + 
  geom_line(size = 1) + 
  geom_vline(xintercept = 0,    linetype = "dashed", col = "red", size = 0.8) +
  geom_hline(yintercept = 0.95, linetype = "dashed", col = "red", size = 0.8) +
  xlab(expression(alpha)) + ylab("coverage prob.")             +
  ggtitle(alpha~"=0,"~psi~"=0,"~p[y]~"=0.3,"~p[x]~"=0.6")  +
#  scale_y_continuous(limits=c(0.65, 1),breaks=seq(0.7, 1, by = 0.05)) +
  theme_minimal_grid() + 
  theme(plot.title       = element_text(hjust = 0.5, size = 25),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20), 
        axis.title  = element_text(size = 20))


g0.5_0 = ggplot( data = dat_cp, aes( x = alpha_range0.5, y = cp0.5_0) ) + 
  geom_line(size = 1) + 
  geom_vline(xintercept = 0.5,    linetype = "dashed", col = "red", size = 0.8) +
  geom_hline(yintercept = 0.95,   linetype = "dashed", col = "red", size = 0.8) +
  xlab(expression(alpha)) + ylab("coverage prob.")             +
  ggtitle(alpha~"=0.5,"~psi~"=0,"~p[y]~"=0.3,"~p[x]~"=0.6")  +
#  scale_y_continuous(limits=c(0.65, 1),breaks=seq(0.7, 1, by = 0.05)) +
  theme_minimal_grid() + 
  theme(plot.title       = element_text(hjust = 0.5, size = 25),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20), 
        axis.title  = element_text(size = 20))


plot_grid(g0_0.5, g0.5_0.5, g0_0, g0.5_0,
          ncol = 2, nrow = 2)
