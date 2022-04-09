# - load dplyr
library(dplyr)

# read in ml_data_4_percent_speed to data frame
rs_analysis_speed_max <- read.csv('C:/Users/Teresa/Class/Rural_Surge_extra/ml_data_4_percent_speed.csv',check.names = F, stringsAsFactors = F)

# perform linear regression using lm() for all six variables
lm(max_speed ~ avg_speed + perc_one + perc_two + perc_three + u_r_code,data=rs_analysis_speed_max)

# use summary function to determine p-value and r-squared valued for linear regression model
summary(lm(max_speed ~ avg_speed + perc_one + perc_two + perc_three + u_r_code,data=rs_analysis_speed_max))

## - read in ml_data_4.csv
rs_speed_max <- read.csv('C:/Users/Teresa/Class/Rural_Surge_extra/ml_data_4.csv',check.names = F, stringsAsFactors = F)

# - create a total_summary dataframe using the summarize() function to get mean, median, variance, and SD of rs_speed_max max_speed Column
total_summary_max <- rs_speed %>% summarize(Mean=mean(max_speed), Median=median(max_speed), Variance=var(max_speed), SD=sd(max_speed), .groups = 'keep')


# create lot_summary dataframe using group_by() and summarize() functions to group by ur_code
ru_summary_max <- rs_speed_max %>% group_by(u_r_code) %>% summarize(Mean=mean(max_speed), Median=median(max_speed), Variance=var(max_speed), SD=sd(max_speed), .groups = 'keep')

library(tidyverse)

## - perform a t-test.Mean set at 100 MB - reference USDA definition of sufficient broadband
t.test(rs_speed_max$avg_speed)

# perform t-test by ur_code
rs_speed_r_max <- subset(rs_speed_max, u_r_code=="R")
rs_speed_u_max <- subset(rs_speed_max, u_r_code=="U")


t.test(rs_speed_r_max$max_speed)
t.test(rs_speed_u_max$max_speed)

## deeper dive - create box and whisker plot by ur_code and max speed
## sample code: p <- ggplot(df, aes(carat, price)) +geom_point() +
## labs(title = "Diamonds", x = "x-axis -> Carat", y = "y-axis -> Price")
ggplot(rs_speed, aes(u_r_code, max_speed)) +
  geom_boxplot() + labs(title = "Max Available Download Rate by Rural-Urban Classification", x="Rural-Urban",y="Max Available Speed")


