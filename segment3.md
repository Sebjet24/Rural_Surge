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

#### Schema
The database schema was created in SQL, along with comments describing the data tables. Much of the initial database development, as well as some of the extraction and manipulation occurred using SQL. 

The main branch should include:

* All code necessary to perform exploratory analysis
* Most code necessary to complete the machine learning portion of the project

### README.md
The README.md should include:

* Description of the communication protocols has been removed
* Cohesive, structured outline of the project (this may include images, but they should be easy to follow and digest)
* Link to Google Slides draft presentation

### Individual Branches
Requirements for the individual branches follow:

At least one branch for each team member
Each team member has at least four commits for the duration of the third segment (12 total commits per person)

## Machine Learning Model (45 points)
Students will be expected to submit the working code for their machine learning model, as well as the following:

Description of data preprocessing

Before we could perform analysis of the 
Description of feature engineering and the feature selection, including the decision-making process
Description of how data was split into training and testing sets
Explanation of model choice, including limitations and benefits
Explanation of changes in model choice (if changes occurred between the Segment 2 and Segment 3 deliverables)
Description of how they have trained the model thus far, and any additional training that will take place
Description of current accuracy score

Additionally, the model obviously addresses the question or problem the team is solving.

![split_train_test_code](https://user-images.githubusercontent.com/92836648/162582295-a49c3e90-6fc0-4888-a562-692d7a32c0d0.png)
![random_forest](https://user-images.githubusercontent.com/92836648/162582298-ba3dca0c-dd06-46ba-8a7c-d5f250479bda.png)
![adaboost](https://user-images.githubusercontent.com/92836648/162582299-c25f1b4c-6bd7-4c7c-becc-17a4bd5d28b9.png)

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
