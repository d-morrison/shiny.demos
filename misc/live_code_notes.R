#live coding for mpm 207, linear regression

library(ggplot2)


## PART 1

# Set the number of observations
n <- 100

# Set the true intercept and slope
intercept <- 2
slope <- 3

# Simulate predictor variable
x <- rnorm(n, mean = 3)

# Simulate response variable
error <- rnorm(n, mean = 0, sd = 2)
y <- intercept + slope * x + error

# Create a data frame of x and y
dsim <- data.frame(x, y)

# Plot the simulated data using ggplot2
ggplot(dsim, aes(x = x, y = y)) +
  geom_point() +
  labs(title = "Simulated Data for Linear Model", x = "Predictor Variable (X)", y = "Response Variable (Y)")

# Fit a linear model to the simulated data
model <- lm(y ~ x)

# Print the model coefficients
summary(model)


# Plot the simulated data and the fitted line using ggplot2 
ggplot(dsim, aes(x = x, y = y)) +
  geom_point(alpha = .5) +
  labs(title = "Simulated Data for Linear Model", x = "Predictor Variable (X)", y = "Response Variable (Y)") +
  geom_abline(intercept = coef(model)[1], slope = coef(model)[2])  + 
  theme_bw()




## PART 2
raw <- <- read.csv("~/Library/CloudStorage/Box-Box/MPM 207 and 212 co-teaching/MPM 207/Lab 6/live code/pop.data.csv")



d <- raw %>% mutate(popb = pop/1000000000)


ggplot(d, aes(x = year, y = popb, color = type)) + 
  geom_point() + 
  #scale_y_log10() +
  theme_bw() +
  geom_smooth(method = "lm") + 
  scale_color_manual(values = c("purple", "blue"))



