# Presentation

The presentation outlines the project, including the following:

#### Selected topic
Rural Surge: A Study of Internet Quality & Availability in Kansas

#### Reason topic was selected
For small rural counties in Kansas, the 2020 pandemic emphasized a lack of quality internet access. Schools were closed, and emergency remote instruction became the method to address educational delivery moving into fall 2020. However, as students and parents attempted to learn and work from home, it became clear that not all internet is created equal. Many community members had only cellular data service, which made participating in an online learning environment impossible. Those who had internet access experienced slow download rates and many were unable to participate in online class activities.

Our group decided to dive into this topic, and research internet availability and quality in the state of Kansas.

#### Description of the source of data
* The FCC tracks broadband access across the United States, which includes an interactive map and the data tables behind the map. We used the Area tables and provider tables to retrieve latitude and logitude, as well as the type of internet available by geolocation, and the level available in rural and urban areas.

* The Kansas State Library has extensive data for all counties in the state, which includes child poverty levels by county. We plan to use this data as a layer in the interactive map and as a feature in the machine learning model.

* The United States Department of Agriculture (USDA) provides grants and loans to improve internet infrastructure across the nation. In addition to establishing criteria for eligible providers, which includes minimum broadband speeds of 100mb download, but also provided datasets from the U.S. Census Bureau that provides rural and urban density and population percentages by county.

* U.S. Census Bureau - we had difficulty finding data relevant to our project until we stumbled onto a link to the data from the USDA 
Re-connect site. This data was used to obtain the rural and urban density and population percentages by county. This data is used in the machine learning model, and will be a layer in the interactive map.

#### Questions the team hopes to answer with the data
* Is there a difference in internet speed between rural and urban geographic locations?
* Is this difference common between Kansas counties, or are there variances by county?

#### Description of the data exploration phase of the project
We started by searching the internet for Federal grants available to improve broadband access in the U.S. That search revealed extensive data and interactive mapping from the Federal Communication Commission (FCC). Further research for known grants implemented in adjacent states found an article that lead to the U.S. Department of Agriculture's (USDA) website, and a current grant and loan program, which also includes an interactive map and datasets. We also found the Kansas 

#### Description of the analysis phase of the project
Most of the analysis has occurred in the database, where queries were created and converted to tables to pull specific components together for the machine learning model. The same will be used for the interactive map.

### Slides
Presentations are drafted in Google Slides.

# Database Integration (30 points)
The team members are expected to present a fully integrated database, including the following:

* Database stores static data for use during the project

* Database interfaces with the project in some format (e.g., scraping updates the database)
    ```
    alter table "pct_urban_rural_county" add column "state_county_code" INT;
    update "pct_urban_rural_county"
        set "state_county_code" = concat(state_code,county_code);
    ```
* Includes at least two tables (or collections, if using MongoDB)
Use image of the database in PG Admin.

* Includes at least one join using the database language (not including any joins in Pandas)
We created a query and subsequent data table with the below, which includes a join from 

    ```
    -- has_0 = Population with zero providers (i.e., no broadband) given choice of technology and speed
    SELECT DISTINCT at.id, at.type, at.urban_rural, at.speed, at.has_0, at.has_1, at.has_2, at.has_3more
    FROM area_table at LEFT OUTER JOIN geo_lookup gl ON (at.id, at.type) = (gl.geoid, gl.type)
    WHERE at.id like '20%'
    AND at.type = 'county';

    ```

* Includes at least one connection string (using SQLAlchemy or PyMongo)
We needed to convert a string of text in a column to a count of the string characters in that column. Fernando was able to pull the data table into Google Colab and create the new column, then reload it to the shared database through AWS RDS services.
```
area_df = spark.read.jdbc(url = "jdbc:postgresql://ruralsurge.cu3ibjje45e1.us-east-1.rds.amazonaws.com:5432/rural_surge_db", 
                     table = "(SELECT * FROM area_table) AS my_table",
                     properties={"user": "root", "password": "XXXXXXX", "driver":  "org.postgresql.Driver"})#.createTempView("tbl")

spark.sql('select * from tbl').show() #or use .collect() to get Rows

import pyspark.sql.functions as F 
length_df = area_df.withColumn("tech_options", F.length("tech"))
length_df.show(truncate=False)

# Configure settings for RDS
mode = "append"
jdbc_url="jdbc:postgresql://ruralsurge.cu3ibjje45e1.us-east-1.rds.amazonaws.com:5432/rural_surge_db"
config = {"user":"root", 
          "password": "#######", 
          "driver":"org.postgresql.Driver"}

# Write review_id_df to table in RDS
length_df.write.jdbc(url=jdbc_url, table='area_mod', mode=mode, properties=config)

```
