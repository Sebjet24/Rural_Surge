# Rural Surge: A Study of Internet Quality & Availability in Kansas

## Presentation (15 points)
### Content
The presentation tells a cohesive story about the project and includes the following:

* Selected topic
Rural Surge: A Study of Internet Quality & Availability in Kansas

Reason topic was selected

For small rural counties in Kansas, the 2020 pandemic emphasized a lack of quality internet access. Schools were closed, and emergency remote instruction became the method to address educational delivery moving into fall 2020. However, as students, parents and teachers attempted to learn and work from home, it became clear that not all internet is created equal. Many community members had only cellular data service with only a hotspot connected to a notebook or just a cell phone, which made participating in an online learning environment impossible. Those who had internet access experienced slow download rates that made it difficult to participate in online class activities.

Our group decided to dive into this topic, and research internet availability and quality in the state of Kansas.

Description of the source of data

**Where is our data coming from?**
   - [State Library of Kansas](https://kslib.info/423/State-Data-Center)
     * The Kansas State Library has extensive data for all counties in the state.
     * We plan to use this data as a layer in the interactive map and as a feature in the machine learning model.
     * Kansas info: County data, Lat/long, County population, Poverty by county, School district info
     
   - [FCC Fixed Broadband Deployment](https://broadbandmap.fcc.gov/#/data-download)
     * The FCC tracks broadband access across the United States, which includes an interactive map and the data tables behind the map. 
     * We used an Area table and Provider table to collect data about Internet Providers and speeds correlated with location

   - [United States Department of Agriculture (USDA)](https://www.usda.gov/reconnect)
     * The USDA provides grants and loans to improve internet infrastructure across the nation. 
     * Through this website, we found useful links to datasets from the US Census Bureau.
    
   - [US Census Bureau](https://www.census.gov/programs-surveys/geography/guidance/geo-areas/urban-rural/2010-urban-rural.html)
     * We struggled to find data relevant to our project until we stumbled onto a link to the data from the [USDA ReConnect site](https://www.usda.gov/reconnect).
     * This data was used to obtain the rural and urban density and population percentages by county. 
     * This data is used in the machine learning model, and will be a layer in the interactive map.
Questions the team hopes to answer with the data
Description of the data exploration phase of the project
Description of the analysis phase of the project
Technologies, languages, tools, and algorithms used throughout the project
Bookmarked <a href="https://github.com/Sebjet24/Rural_Surge#tools-used-on-our-project">here</a>.

## Slides

* Presentations are drafted in Google Slides.
https://docs.google.com/presentation/d/1s3hrkMdUn2UQK7V6L73jDXKZyd1Sj-ZztJQ3GYvPlYY/edit?usp=sharing

## GitHub Repository (10 points)

### Main Branch
All code in the main branch is production-ready. All code is clean, commented, easy to read, and adheres to a coding standard (e.g., PEP8)

The resource folder has been reorganized into categories to make it easier to find information. All analytical data is now stored in the <a href="https://github.com/Sebjet24/Rural_Surge/tree/main/Analysis">Analysis</a>folder, wich includes R files and all machine learning code in Jupyter files. The database schema, ERD text file and queries used to explore the data and create new tables is stored in the <a href="https://github.com/Sebjet24/Rural_Surge/tree/main/Resources/DATABASE">DATABASE</a>folder. 

The main branch should include:

* All code necessary to perform exploratory analysis
  * All code is stored in the <a href="https://github.com/Sebjet24/Rural_Surge/tree/main/Analysis">Analysis</a>folder.
* Most code necessary to complete the machine learning portion of the project
  * The random forest ML code is store <a href="Analysis/RuralSurge_ml_RandomForrest_AdaBooster.ipynb">Analysis folder</a> which is the model we elected to use in our analysis for the project.
  * We also have our initial unsupervised ML code stored in the Analysis folder, but have elected not to use it for the project. Code is available <a href="Analysis/RuralSurge_ml_Unsupervised.ipynb">here</a>.

### README.md
The README.md should include:

* Description of the communication protocols has been removed
  * Protocols have been removed
* Cohesive, structured outline of the project (this may include images, but they should be easy to follow and digest)
* Link to Google Slides draft presentation

### Individual Branches
Requirements for the individual branches follow:

At least one branch for each team member
Each team member has at least four commits for the duration of the third segment (12 total commits per person) - good.

## Machine Learning Model (45 points)
Students will be expected to submit the working code for their machine learning model, as well as the following:

The machine learning model code used in the analysis is a Random Forest model. The code is available <a href="Analysis/RuralSurge_ml_RandomForrest_AdaBooster.ipynb">here</a>.

Description of data preprocessing
The preprocessing included:

* Read in the data file
* Created features in a new dataframe
* Created our targeted dependent variable based on the Urban-Rural Classification
* Described the dataframe to show the total features and rows

Below is an image of some of the preprocessing steps:
![split_train_test_code_2](https://user-images.githubusercontent.com/92836648/162632416-26bc4ada-25c1-4db0-8f11-f46275b29df7.png)

Description of feature engineering and the feature selection, including the decision-making process

The team wanted to answer two questions: does geographical location impact internet quality, and does Rural-Urban classifiers impact Internet Service Provider (ISP) availabilty. Due to the need for classification, we changed our mind late in the project to focus on a Random Forest model, which improved predictability of the data to 86% accuracy score once we included average internet speeds. Adding the speed feature was something we knew we had to have to answer our question; however, the data we had to identify these speeds was difficult to work with. We finally came up with a dataset we felt would represent the data well, without impacting the integrity of the analysis.

The features included the average number of the population in each county who had 1) no ISP providers available, 2) one ISP provider available, 3) two ISP providers available and 4) three or more ISP providers available. We also included the percentage of each of those populations, and finally a feature for each of the 105 counties in Kansas based on their Rural-Urban classification.

The team feels the biggest limitation in developing a machine learning model for this project has been the data itself. It has taken much longer than anticipated to build the data because we have spent so much time manipulating it while trying not to affect the integrity of the data. However, the benefits of the cluster model are that, from a geographical perspective, clustering makes sense, and provides a more visual look at the data.

The team acknowledges a need for additional features to gain more insight into the data, not least of which is poverty levels by county. However, these poverty levels cannot be determined within a Rural-Urban classification at this time, so we elected to leave it out of the model for now.

![random_forest_2](https://user-images.githubusercontent.com/92836648/162632418-cee1c875-a905-41bd-861a-70fb66e15fc0.png)

R scripts run for t tests and regression analysis

T-test sample below and average speed code <a href="Analysis/rural_surge_analysis_avg_speed_r_file.R">here</a> and max code <a href="Analysis/rural_surge_analysis_max_speeds_r_file.R">here</a>.

```
## - perform a t-test. reference USDA definition of 100 mb sufficient broadband
t.test(rs_speed$avg_speed)

# - perform t-test by ru_code
rs_speed_r <- subset(rs_speed, u_r_code=="R")
rs_speed_u <- subset(rs_speed, u_r_code=="U")


t.test(rs_speed_r$avg_speed)
t.test(rs_speed_u$avg_speed)

## deeper dive - create box and whisker plot by ur_code
## sample code: p <- ggplot(df, aes(carat, price)) +geom_point() +
## labs(title = "Diamonds", x = "x-axis -> Carat", y = "y-axis -> Price")
ggplot(rs_speed, aes(u_r_code, avg_speed)) +
  geom_boxplot() + labs(title = "Average Available Download Rate by Rural-Urban Classification", x="Rural-Urban",y="Avg Available Speed")
  
```


## Database Integration (0 points)
There are no deliverables for the database integration section of the project for this segment.


## Dashboard (30 points)
The dashboard presents a data story that is logical and easy to follow for someone unfamiliar with the topic. It includes the following:

* Images from the initial analysis
* Data (images or report) from the machine learning task
* At least one interactive element
