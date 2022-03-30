# Rural Surge: A Study of Internet Quality & Availability in Kansas

## Project Team
Sebastian Scholl, Fernando Porras, Mindy Collmeyer, Teresa Wehmeier
  

## Background on our Topic
For small rural counties in Kansas, the 2020 pandemic emphasized a lack of quality internet access. Schools were closed, and emergency remote instruction became the method to address educational delivery moving into fall 2020. However, as students and parents attempted to learn and work from home, it became clear that not all internet is created equal. Many community members had only cellular data service, which made participating in an online learning environment impossible. Those who had internet access experienced low download rates that many were unable to participate in online class activities.

Our group decided to dive into this topic, and research internet availability and quality in the state of Kansas.
  

## Communication Protocols
- Group Slack channel
- Group Project GitHub, including a branch for each team member
- Breakout room during class time
- Saturday Zoom calls (March 19th and 26th)
- Team has shared phone numbers and email addresses


## Tools Used on our Project
- [GitHub](https://github.com/)
    * The largest and most advanced development platform in the world.
    * Used to organize our research and documentation.
- [Pandas](https://pandas.pydata.org/)
    * A fast, powerful, flexible and easy to use open source data analysis and manipulation tool, built on top of the Python programming language
- [Python](https://www.python.org/)
    * A general-purpose, versatile, and powerful programming language.
- [QuickDBD](https://www.quickdatabasediagrams.com/)
    * A simple online tool to quickly draw database diagrams.
    * Used to create ERDs.
- [Visual Studio Code](https://code.visualstudio.com/)
   * A code editor redefined and optimized for building and debugging modern web and cloud applications
- [Canva](https://www.canva.com/)
    * Online design and publishing tool.
    * Used to design the Project Flowchart.
- [GeoJSON](https://geojson.org/)
    * A format for encoding a variety of geographic data structures.
- [Google Slides](https://docs.google.com/presentation/d/1s3hrkMdUn2UQK7V6L73jDXKZyd1Sj-ZztJQ3GYvPlYY/edit#slide=id.g1205a2ea841_0_1)
    * Used to present our project plan.
- [Tableau](https://www.tableau.com/)
    * A visual analytics platform transforming the way we use data to solve problems—empowering people and organizations to make the most of their data.


## Project Outline

### Our Topic

**Internet Availability & Quality in Kansas**
   - How does internet access support (quality, availability, etc.) compare between rural and urban areas in Kansas?
   - What Internet Service Providers (ISPs) are available in Kansas? 
   - How does their support vary between rural and urban communities?
   - Is there a link between poverty rate and quality internet access?
   - Is there a link between school district success and quality internet access?


### Our Project Plan
![image](https://user-images.githubusercontent.com/93055450/160928328-355686b7-e6c8-454a-9ec7-58fc1ff0a26e.png)

   
### Our Research

**Where is our data coming from?**
   - [State Library of Kansas](https://kslib.info/423/State-Data-Center)
     * Kansas info: County data, Lat/long, County population, Poverty by county, School district info
   - [FCC Fixed Broadband Deployment](https://broadbandmap.fcc.gov/#/data-download)
     * Internet Providers and speeds correlated with location
   - [US Census Bureau](https://www.census.gov/programs-surveys/geography/guidance/geo-areas/urban-rural/2010-urban-rural.html)
     * Population density


### Preparing the data
   - Store csv files on GitHub
   - [Schema](https://github.com/Sebjet24/Rural_Surge/blob/Mindy/Resources/schema.sql)
   - ERD - FCC data
   
   <img src="Images/ERD_FCC_tables.png" width="50%" height="30%">
     
   - ERD - State of Kansas data
   
   <img src="Images/ERD-Kansas_Tables.png" width="50%" height="30%">
   
   - Load data into a database using pgAdmin

### Data Modeling
**Which machine learning model will work best for our project?**

   - The team discussed the different options, and determined that a **Decision Tree** would be a great fit for our project.
      
     ![image](https://user-images.githubusercontent.com/93055450/160937924-93787c01-78f7-4f5c-907b-792a370c80b5.png)

### Visualize the Data
   - Google Slides
   - Tableau
     * Images from Seward county fiber install
     * Maps
