# File:    pizza_restaurants_analysis.R
# Course:  Data Analysis 1: Data Exploration
# Group: C
# Date:    2020-10-21

# INSTALL AND LOAD PACKAGES ################################

library(datasets)  # Load base packages manually

# Installs pacman ("package manager") if needed
if (!require("pacman")) install.packages("pacman")

# Use pacman to load add-on packages as desired
pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, 
               ggvis, httr, lubridate, plotly, rio, rmarkdown, shiny, 
               stringr, tidyr) 


# IMPORTING THE DATASET WITH RIO ##########################

# CSV
pizza_csv <- import("~/Desktop/pizza_restaurants.csv")
head(pizza_csv)


# DATA VIEWER ##############################################

?View
View(pizza_csv)

glimpse(pizza_dataset)

summary(pizza_dataset$`Margherita Price (HUF)`)
# Create descriptive table
rests_stat <- summarise( pizza_dataset , 
                              mean = mean( pizza_dataset$`Margherita Price (HUF)` ),
                              median = median( pizza_dataset$`Margherita Price (HUF)` ),
                              std = sd( pizza_dataset$`Margherita Price (HUF)` ),
                              min = min( pizza_dataset$`Margherita Price (HUF)` ),
                              max = max( pizza_dataset$`Margherita Price (HUF)` ) )


vienna_sum_stat

summary(pizza_dataset$`0.5L Cola Price (HUF)`)
# Clone the dataset and assign it to a variable

pizza_dataset <- pizza_csv
head(pizza_dataset)


# Plot Pizza Price vs. Beverage Price

plot(pizza_dataset$`Margherita Price (HUF)`, pizza_dataset$`0.5L Cola Price (HUF)`,
     col = "#cc0000",  # Hex code for red
     pch = 19,         # Solid points
     main = "Pizza Restaurants: Prices of Pizza Vs. Price of Beverage",
     xlab = "Pizza Price (HUF)",
     ylab = "Beverage Price (HUF)")



# Need a table with frequencies for each category
pizza_price <- table(pizza_dataset$`Margherita Price (HUF)`)  # Create table
barplot(pizza_price)              # Bar chart
plot(pizza_price)                 # Default X-Y plot (lines)





# BASIC HISTOGRAMS #########################################

hist(pizza_dataset$`Margherita Price (HUF)`)
hist(pizza_dataset$`0.5L Cola Price (HUF)`) ## missing value error

# HISTOGRAM BY GROUP #######################################

# Put graphs in 2 rows and 1 column
par(mfrow = c(2, 1))

# Histogram for price of pizza in the capital
hist(pizza_dataset$`Margherita Price (HUF)` [pizza_dataset$Region == "Capital"],
     xlim = c(0, 2500),
     breaks = 27,
     main = "Distribution of the pizza price in the capital",
     xlab = "",
     col = "red")

hist(pizza_dataset$`0.5L Cola Price (HUF)` (HUF)` [pizza_dataset$Region == "Capital"],
     xlim = c(0, 1500),
     ##breaks = 27,
     main = "Distribution of the pizza price in the capital",
     xlab = "",
     col = "blue")


# PLOTS ####################################################

# Good to first check univariate distributions
hist(pizza_dataset$`Margherita Price (HUF)`)
hist(pizza_dataset$`0.5L Cola Price (HUF)`)

# Basic X-Y plot for two quantitative variables
plot(pizza_dataset$`0.5L Cola Price (HUF)`, pizza_dataset$`Margherita Price (HUF)`)

# Add some options
plot(pizza_dataset$`0.5L Cola Price (HUF)`, pizza_dataset$`Margherita Price (HUF)`,
     pch = 19,         # Solid circle
     cex = 1.5,        # Make 150% size
     col = "#cc0000",  # Red
     main = "Scatterplot for price: Pizza vs. Beverage",
     xlab = "Beverage Price",
     ylab = "Pizza Price")


# Restore graphic parameter
par(mfrow=c(1, 1))


# HISTOGRAM ################################################

# Default
hist(lynx)

# Add some options
hist(pizza_dataset$`Margherita Price (HUF)`,
     breaks = 48,          # "Suggests" 14 bins
     freq   = FALSE,       # Axis shows density, not freq.
     col    = "thistle1",  # Color for histogram
     main   = paste("Histogram of Prices of pizza"),
     xlab   = "Price of pizza")

# Add a normal distribution
curve(dnorm(x, mean = mean(pizza_dataset$`Margherita Price (HUF)`), sd = sd(pizza_dataset$`Margherita Price (HUF)`)),
      col = "thistle4",  # Color of curve
      lwd = 2,           # Line width of 2 pixels
      add = TRUE)        # Superimpose on previous graph

# Add two kernel density estimators
lines(density(pizza_dataset$`Margherita Price (HUF)`), col = "blue", lwd = 2)
lines(density(pizza_dataset$`Margherita Price (HUF)`, adjust = 3), col = "purple", lwd = 2)

# Add a rug plot
rug(pizza_dataset$`Margherita Price (HUF)`, lwd = 2, col = "gray")


# SUMMARY() ################################################

summary(pizza_dataset$`Online rating`)       # Categorical variable
summary(pizza_dataset$`Margherita Price (HUF)`)  # Quantitative variable
summary(pizza_dataset)               # Entire data frame

# Use pacman to load add-on packages as desired
pacman::p_load(pacman, psych) 

# Get info on package
p_help(psych)           # Opens package PDF in browser
p_help(psych, web = F)  # Opens help in R Viewer

# DESCRIBE() ###############################################

# For quantitative variables only.

describe(pizza_dataset$`Margherita Price (HUF)`)  # One quantitative variable
describe(pizza_dataset)               # Entire data frame


# SELECT BY CATEGORY #######################################

# Price of pizza in the capital
hist(pizza_dataset$`Margherita Price (HUF)`[pizza_dataset$Region == "Capital"],
     main = "Pizza Prices in the capital")

# Price of pizza in the countryside
hist(pizza_dataset[pizza_dataset$Region == "Countryside"],
     main = "Price of pizza in the countryside")






# CLEAN UP #################################################

# Clear environment
rm(list = ls()) 

# Clear packages
p_unload(all)  # Remove all add-ons


# Clear packages
detach("package:datasets", unload = TRUE) #For base

# Clear plots
dev.off()  # But only if there IS a plot

# Clear console
cat("\014")  # ctrl+L
