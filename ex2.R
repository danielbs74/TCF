rm(list = ls())
#We assume A = 0 WLOG

#####2.2#####

r = 0.04
z = 0

alpha = seq(0.01, 0.99, 0.01)
x = ((1+r)/(alpha*exp(z)))^(1/(alpha - 1))

plot(x = alpha, y = x, type = 'l', 
     xlab = expression(alpha), ylab = 'Optimal X',  main = "z = 0")


#####2.3#####

r = 0.04
z = 0.03

alpha = seq(0.01, 0.99, 0.01)
x = ((1+r)/(alpha*exp(z)))^(1/(alpha - 1))

plot(x = alpha, y = x, type = 'l', 
     xlab = expression(alpha), ylab = 'Optimal X', main = "z = 0.03")


z = 0.05

x = ((1+r)/(alpha*exp(z)))^(1/(alpha - 1))

plot(x = alpha, y = x, type = 'l', 
     xlab = expression(alpha), ylab = 'Optimal X', main = "z = 0.05")


#####2.5#####

r = 0.04

z = seq(0, 0.05, 0.05/98)

ddx = -1 + exp(z)/(1+r)

x = ifelse(ddx > 0, 10, 0)


plot(x = z, y = x, type = 'l', 
     xlab = "z", ylab = 'Optimal X', main = substitute(paste(a, " = 1"), list(a = bquote(alpha))))

