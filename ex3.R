rm(list = ls())

#####3.2#####

alpha = 0.35
r = 0.04
z = 0
lambda1 = 0.25

lambda0 = seq(0, 0.6, 0.6/98)
x = ((1+r)*(1+lambda1)/(alpha * exp(z)))^(1/(alpha - 1))

obj = exp(z)*x^alpha - x - lambda0 - lambda1 * x

x = ifelse(obj > 0, x, 0)

plot(x = lambda0, y = x, type = 'l',
     ylab = 'Optimal X', xlab = bquote(lambda[0]))


#####3.3#####


alpha = 0.35
r = 0.04
z = 0
lambda0 = 0.25

lambda1 = seq(0, 0.5, 0.5/98)
x = ((1+r)*(1+lambda1)/(alpha * exp(z)))^(1/(alpha - 1))

obj = exp(z)*x^alpha - x - lambda0 - lambda1 * x

x = ifelse(obj > 0, x, 0)

plot(x = lambda1, y = x, type = 'l',
     ylab = 'Optimal X', xlab = bquote(lambda[1]))


#####3.4#####
set.seed(1)

alpha = 0.35
r = 0.04
lambda0 = 0.3
lambda1 = 0.25

z = rnorm(1e4)

x = ((1+r)*(1+lambda1)/(alpha * exp(z)))^(1/(alpha - 1))

obj = exp(z)*x^alpha - x - lambda0 - lambda1 * x

x = ifelse(obj > 0, x, 0)

sum(x > 0)/1e4

#####3.5#####
res = c()

for(lambda0 in seq(0, 2, 2/9)){
  set.seed(1)
  
  alpha = 0.35
  r = 0.04
  lambda1 = 0.25
  
  z = rnorm(1e4)
  
  x = ((1+r)*(1+lambda1)/(alpha * exp(z)))^(1/(alpha - 1))
  
  obj = exp(z)*x^alpha - x - lambda0 - lambda1 * x
  
  x = ifelse(obj > 0, x, 0)
  
  
  res = rbind(res, c(lambda0, sum(x > 0)/1e4))
}


plot(x = res[,1], y = res[,2], type = 'l', 
     ylab = 'Fraction of CEOs with X > 0', xlab = bquote(lambda[0]))



#####3.6#####

res1 = c()

for(lambda1 in seq(0, 2, 2/9)){
  set.seed(1)
  
  alpha = 0.35
  r = 0.04
  lambda0 = 0.3
  
  z = rnorm(1e4)
  
  x = ((1+r)*(1+lambda1)/(alpha * exp(z)))^(1/(alpha - 1))
  
  obj = exp(z)*x^alpha - x - lambda0 - lambda1 * x
  
  x = ifelse(obj > 0, x, 0)
  
  
  res1 = rbind(res1, c(lambda1, sum(x > 0)/1e4))
}


plot(x = res1[,1], y = res1[,2], type = 'l', 
     ylab = 'Fraction of CEOs with X > 0', xlab = bquote(lambda[1]))

