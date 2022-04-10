# - load dplyr
library(dplyr)

## Null Hypothesis: there is no difference in ISP availability based on urban_rural classification

## - p-value is .02897, which is less than .05, so the null hypothesis is rejected.

# read in ml_data_has_zero to data frame
rs_analysis_no_isp <- read.csv('C:/Users/Teresa/Class/Rural_Surge/Resources/Data/ml_data_has_zero.csv',check.names = F, stringsAsFactors = F)

# perform linear regression using lm() for all six variables
lm(ur_val ~ avg_0 + avg_1 + avg_2 + avg_3,data=rs_analysis_no_isp)

# use summary function to determine p-value and r-squared valued for linear regression model
summary(lm(ur_val ~ avg_0 + avg_1 + avg_2 + avg_3,data=rs_analysis_no_isp))

## - read in ml_data_has_zero.csv
rs_no_isp <- read.csv('C:/Users/Teresa/Class/Rural_Surge/Resources/Data/ml_data_has_zero.csv',check.names = F, stringsAsFactors = F)

# - create a total_summary dataframe using the summarize() function to get mean, median, variance, and SD of rs_speed_max max_speed Column
summary <- rs_no_isp %>% summarize(Mean=mean(avg_0), Median=median(avg_0), Variance=var(avg_0), SD=sd(avg_0), .groups = 'keep')


# create UR_summary dataframe using group_by() and summarize() functions to group by ur_code
ru_summary_no_isp <- rs_no_isp %>% group_by(urban_rural) %>% summarize(Mean=mean(avg_0), Median=median(avg_0), Variance=var(avg_0), SD=sd(avg_0), .groups = 'keep')

library(tidyverse)

## - perform a t-test.Mean set at 100 MB - reference USDA definition of sufficient broadband
t.test(rs_no_isp$avg_0)

# perform t-test by ur_code
rs_no_isp_r <- subset(rs_no_isp, urban_rural=="R")
rs_no_isp_u <- subset(rs_no_isp, urban_rural=="U")


t.test(rs_no_isp_r$avg_0)
t.test(rs_no_isp_u$avg_0)

## deeper dive - create box and whisker plot by ur_code and max speed
## sample code: p <- ggplot(df, aes(carat, price)) +geom_point() +
## labs(title = "Diamonds", x = "x-axis -> Carat", y = "y-axis -> Price")
ggplot(rs_no_isp, aes(urban_rural, avg_0)) +
  geom_boxplot() + labs(title = "Population with No ISP by Rural-Urban Classification", x="Rural-Urban",y="Population")


