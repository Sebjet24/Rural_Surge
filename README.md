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
- Team Zoom calls (March 19th and 26th, April 1st, 2nd, 3rd)
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
- [Amazon S3](https://aws.amazon.com/s3/)
    * Object storage service offering industry-leading scalability, data availability, security, and performance.
    * Used to store our data on the cloud
- [pgAdmin](https://www.pgadmin.org/)
    * The most popular and feature rich Open Source administration and development platform for PostgreSQL, the most advanced Open Source database in the world.
- [PySpark](https://spark.apache.org/docs/latest/api/python/)
    * PySpark is the Python API for Apache Spark, an open source, distributed computing framework and set of libraries for real-time, large-scale data processing.
- [GeoJSON](https://geojson.org/)
    * A format for encoding a variety of geographic data structures.
- [Google Slides](https://www.google.com/slides/about/)
    * Used to present our project plan.
- [Tableau](https://www.tableau.com/)
    * A visual analytics platform transforming the way we use data to solve problems—empowering people and organizations to make the most of their data.
- [Microsoft Word](https://www.microsoft.com/en-us/microsoft-365/word)
    * Used to create our project plan


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



### Machine Learning Modeling

- Description of preliminary data preprocessing

   * Store csv files on GitHub
   * Create a [Schema](https://github.com/Sebjet24/Rural_Surge/blob/Mindy/Resources/schema.sql) to show how we organized the data
   * Create ERDs (Entity Relationship Diagrams)
    
     **ERD - FCC data**
   
      <img src="Images/ERD_FCC_tables.png" width="50%" height="30%">
     
     **ERD - State of Kansas data**
     
      <img src="Images/ERD-Kansas_Tables.png" width="50%" height="30%">
      
   
   * Load data into a database in AWS
   * Connect database from AWS into pgAdmin
   * Discuss what data we need for our Dataset
   * Process (format, clean and sample) our data using PySpark
   * Develop usable DataFrames through Jupyter Notebook and return DataFrames as CSV files

- Description of preliminary feature engineering and preliminary feature selection, including their decision-making process

  * Rural and urban % per KS county
  * Number of ISP options per KS county
  * Highest internet speed per KS county

- Description of how data was split into training and testing sets

  * TBD

- Explanation of model choice, including limitations and benefits
  
  * The team discussed the different machine learning options, and initially thought that a **Decision Tree** would be a good fit for our project.
      
     ![image](https://user-images.githubusercontent.com/93055450/160937924-93787c01-78f7-4f5c-907b-792a370c80b5.png)
     
- After learning more about the data, we decided that an **Unsupervised Learning** model would be a better fit. 

  * Using the K-means clustering algorithm, we could demonstrate how population density in each Kansas county correlated with internet speed, as well as number of Internet Service Providers
  
     ![image](https://user-images.githubusercontent.com/93055450/161391844-aba47a4e-2b92-4b5a-b7ef-41ea67fba502.png)






### Visualize the Data
   - [Google Slides](https://github.com/Sebjet24/Rural_Surge/blob/main/Resources/Rural%20Surge.pptx)
   - Tableau
      * [Storyboard](https://github.com/Sebjet24/Rural_Surge/blob/main/Resources/Story%20board.pptx)
