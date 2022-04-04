# Rural Surge Final Project

## Second Segment Narrative:
During the two weeks of this segment, the team remained in the same roles as the first segment. Our focus was on getting the database completely spun up, and the machine learning model data compiled and processed through an unsupervised model. We met several times during these past two weeks, including the four class days and also on Friday, April 1, Saturday, April 2, and Sunday April 3 to finalize the deliverables for this week. 

My accomplishments for this segment included:
* ERD built for all original tables in PG Admin
* Schema built and deployed to PostgreSQL
* AWS RDS built and synchronized with team
* AWS S3 policy built so that the team could access files
* Data explored, specifically examing the data from the perspective of machine learning data
* Cleaned up the data tables to better identify primary and foreign key constraints

In addition, the team accomplished:
* Google slides presentation draft developed
* Dashboard storyboard draft developed
* Machine learning data run through first machine learing model
* GitHub management
* Researched further machine learning models to fit our needs

# First Segment Narrative
## Overview
During the first week of the project, the team met during class time, and also met on Saturday, 3/19/2022 via Zoom. The team defined the name of the project, established its scope, developed methods of communicating, and outlined our roles in the project. Using the rubric, we also established the Github repository, created a branch for each team, committed to our branches, and developed initial deliverables for week one of the project. 

### Communications
We are meeting via Zoom, using Slack for communication, and Github for storing information, code and other resources.

### Roles
To meet the requirements of the first week's rubric, the team clarified more distinctly what data we were going to use, and who was doing what. Although we are all "roughly" taking on one of the four roles defined for the project, we are all working collaboratively on each element, sharing ideas, personal learning experiences, and discoveries as we progress. During the Saturday Zoom meeting, we all stayed on the meeting for a couple of hours, discussing how we could make changes, or fill in gaps in our first week's presentation / outline.

* Sebastian: Created the repository, setup collaborations for all team members, and created a machine learning model layout

* Mindy: Created the initial presentation (outline) that describes what, when, who and how we will meet each week's objectives. Having the outline available during the Saturday meeting helped us find gaps in our project that needed to be addressed.

* Fernando: Has found some quality data for the state of Kansas, and is working to draw that data down via API or CSV files. He will use this data to create DataFrames that will be used in the mapping scripts and the machine learning models.

* Teresa: Initiated the project idea, researched the initial data for the project, including FCC data with mapping coordinates, and designed a basic database schema. 

### Resources
Zoom
Postgresql
Jupyter
Python
GeoJSON
Tableau Public
Quick DBD https://www.quickdatabasediagrams.com/
MAPBOX

### Data Sources
FCC Open Data https://opendata.fcc.gov/Wireline/Fixed-Broadband-Deployment-Data-December-2020/hicn-aujz
Kansas State Library Data Sources https://kslib.info/423/State-Data-Center

## Planned Project
Null Hypthosis: Geographic location in the state of Kansas has no impact on the quality of internet access.

Develop data frames and CSV files that can be used to create maps using MAPBOX that can have enhanced layers such as population size, school locations and commercial/ residential areas.

Use the data frames to develop a deep learning model that can predict level of internet services based on location.

Final output: like the Earthquake project we did a few modules back, this one will present a website that displays population density by county and on hover, number of ISP's, highest level of service and residential/ commercial area indicator.
     
      <img src="Images/ERD-Kansas_Tables.png" width="50%" height="30%">
   
   - Load data into a database using pgAdmin


### Data Modeling

- The team discussed the different machine learning options, and determined that a **Decision Tree** would be a great fit for our project.
      
     ![image](https://user-images.githubusercontent.com/93055450/160937924-93787c01-78f7-4f5c-907b-792a370c80b5.png)


### Visualize the Data
   - Google Slides
   - Tableau
     * Images from Seward county fiber install
     * Maps
