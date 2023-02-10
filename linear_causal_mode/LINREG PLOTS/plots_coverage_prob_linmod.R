##### ggplot #####

library(cowplot)
library(ggplot2)
theme_set(theme_minimal())

g0_1.5 = ggplot(data = dat_cp, aes(x = alpha_range0, y = cp0_1.5)) + 
  geom_line(size = 1) + 
  geom_vline(xintercept = 0,    linetype = "dashed", col = "red", size = 0.8) +
  geom_hline(yintercept = 0.95, linetype = "dashed", col = "red", size = 0.8) +
  xlab(expression(alpha)) + ylab("coverage probability")             +
  ggtitle(alpha~"=0,"~psi~"=1.5,"~~p[x]~"=0.6,"~"y~N("~mu[y](beta)~","~sigma^2~")")  +
  # scale_y_continuous(limits = c(0.7, 1), breaks = seq(0.1, 1, by = 0.05)) +
  # scale_x_continuous(limits = c(-0.1, 0.1))  +
  theme_minimal_grid() + 
  theme(plot.title       = element_text(hjust = 0.5, size = 25),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20), 
        axis.title  = element_text(size = 25))

g0.5_1.5 = ggplot(data = dat_cp, aes(x = alpha_range0.5, y = cp0.5_1.5)) + 
  geom_line(size = 1) + 
  geom_vline(xintercept = 0.5,  linetype = "dashed", col = "red", size = 0.8) +
  geom_hline(yintercept = 0.95, linetype = "dashed", col = "red", size = 0.8) +
  xlab(expression(alpha)) + ylab("coverage probability")             +
  ggtitle(alpha~"=0.5,"~psi~"=1.5,"~~p[x]~"=0.6,"~"y~N("~mu[y](beta)~","~sigma^2~")")  +
  # scale_y_continuous(limits = c(0.7, 1), breaks = seq(0.1, 1, by = 0.05)) +
  # scale_x_continuous(limits = c(0.4, 0.6))  +
  theme_minimal_grid() + 
  theme(plot.title       = element_text(hjust = 0.5, size = 25),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20), 
        axis.title  = element_text(size = 25))

g0_0 = ggplot(data = dat_cp, aes( x = alpha_range0, y = cp0_0)) + 
  geom_line(size = 1) + 
  geom_vline(xintercept = 0,    linetype = "dashed", col = "red", size = 0.8) +
  geom_hline(yintercept = 0.95, linetype = "dashed", col = "red", size = 0.8) +
  xlab(expression(alpha)) + ylab("coverage probability")             +
  ggtitle(alpha~"=0,"~psi~"=0,"~~p[x]~"=0.6,"~"y~N("~mu[y](beta)~","~sigma^2~")")  +
  # scale_y_continuous(limits = c(0.7, 1), breaks = seq(0.1, 1, by = 0.05)) +
  # scale_x_continuous(limits = c(-0.1, 0.1))  +
  theme_minimal_grid() + 
  theme(plot.title       = element_text(hjust = 0.5, size = 25),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20), 
        axis.title  = element_text(size = 25))

g0.5_0 = ggplot( data = dat_cp, aes( x = alpha_range0.5, y = cp0.5_0) ) + 
  geom_line(size = 1) + 
  geom_vline(xintercept = 0.5,    linetype = "dashed", col = "red", size = 0.8) +
  geom_hline(yintercept = 0.95,   linetype = "dashed", col = "red", size = 0.8) +
  xlab(expression(alpha)) + ylab("coverage probability")             +
  ggtitle(alpha~"=0.5,"~psi~"=0,"~~p[x]~"=0.6,"~"y~N("~mu[y](beta)~","~sigma^2~")")  +
  # scale_y_continuous(limits = c(0.7, 1), breaks = seq(0.1, 1, by = 0.05)) +
  # scale_x_continuous(limits = c(0.4, 0.6))  +
  theme_minimal_grid() + 
  theme(plot.title       = element_text(hjust = 0.5, size = 25),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20), 
        axis.title  = element_text(size = 25))

plot_grid(g0_1.5, g0.5_1.5, g0_0, g0.5_0,
          ncol = 2, nrow = 2)

