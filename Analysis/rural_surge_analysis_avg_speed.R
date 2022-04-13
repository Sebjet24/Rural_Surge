# load dplyr
library(dplyr)

# read in ml_data_4_percent_speed to data frame
rs_analysis_speed <- read.csv('C:/Users/Teresa/Class/Rural_Surge/Resources/Data/ml_data_4.csv',check.names = F, stringsAsFactors = F)

# perform linear regression using lm() for all six variables
lm(avg_speed ~ avg_zero +	avg_one +	avg_two +	avg_three,data=rs_analysis_speed)

# use summary function to determine p-value and r-squared valued for linear regression model
summary(lm(avg_speed ~ avg_zero +	avg_one +	avg_two +	avg_three,data=rs_analysis_speed))

# read in ml_data_4.csv
rs_speed <- read.csv('C:/Users/Teresa/Class/Rural_Surge/Resources/Data/ml_data_4.csv',check.names = F, stringsAsFactors = F)

# create a total_summary dataframe using the summarize() function to get mean, median, variance, and SD of suspension coils PSI Column
total_summary <- rs_speed %>% summarize(Mean=mean(avg_speed), Median=median(avg_speed), Variance=var(avg_speed), SD=sd(avg_speed), .groups = 'keep')


# create summary dataframe using group_by() and summarize() functions to group by ru_code
ru_summary <- rs_speed %>% group_by(u_r_code) %>% summarize(Mean=mean(avg_speed), Median=median(avg_speed), Variance=var(avg_speed), SD=sd(avg_speed), .groups = 'keep')

library(tidyverse)


## - perform a t-test. reference USDA definition of 100 mb sufficient broadband
t.test(rs_speed$avg_speed,mu=100)

# - perform t-test by ru_code
rs_speed_r <- subset(rs_speed, u_r_code=="R")
rs_speed_u <- subset(rs_speed, u_r_code=="U")


t.test(rs_speed_r$avg_speed,mu=100)
t.test(rs_speed_u$avg_speed,mu=100)

## deeper dive - create box and whisker plot by ur_code
## sample code: p <- ggplot(df, aes(carat, price)) +geom_point() +
## labs(title = "Diamonds", x = "x-axis -> Carat", y = "y-axis -> Price")


ggplot(rs_speed, aes(x=u_r_code, y=avg_speed)) +
  geom_boxplot() +
  scale_fill_manual(values = c("#0099f8", "#e74c3c")) +
  labs(title = "Average Available Download Rate by Rural-Urban Classification",
       caption = "Source: ML Has 0 Dataset",
       x = 'Rural-Urban Classification', 
       y= 'Average Available Speed')+
  theme_classic()
