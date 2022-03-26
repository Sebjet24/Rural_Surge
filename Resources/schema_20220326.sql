-- Create tables for Rural Surge Project

-- Create Validation Table for Area Table tech column from FCC site
SELECT * FROM tech_type;
--
CREATE TABLE tech_type (
	tech_type_code VARCHAR(1) NOT NULL,
    tech_type_desc VARCHAR(20) NOT NULL,
	PRIMARY KEY (tech_type_code)
);

-- create ks_school_dist_codes
SELECT * FROM ks_school_dist_codes; ks_school_dist_codes;

--DROP TABLE ks_school_dist_codes;
--
CREATE TABLE ks_school_dist_codes (
	school_dist INT NOT NULL,
    school_dist_name VARCHAR NOT NULL,
	PRIMARY KEY (school_dist)
);

-- create ks_county_codes
SELECT * FROM ks_county_codes;
--
CREATE TABLE ks_county_codes (
	county_code VARCHAR(2) NOT NULL,
    county_desc VARCHAR(40) NOT NULL,
	desc_upper VARCHAR(40) NOT NULL,
	PRIMARY KEY (county_code)
);

-- Create county table for Rural Surge Project
-- KS Library data https://kslib.info/423/State-Data-Center

SELECT * FROM ks_county_lat_long_txt_format;
--
CREATE TABLE ks_county_lat_long_txt_format (
	county_code VARCHAR NOT NULL,
	county_lat VARCHAR NOT NULL,
	county_lng	VARCHAR NOT NULL,
	FOREIGN KEY (county_code) REFERENCES ks_county_codes (county_code),
    PRIMARY KEY (county_code)
    
);

-- Create ks_school_dist_county_pop_poverty table

SELECT * FROM ks_school_dist_county_pop_poverty;

--DROP TABLE ks_school_dist_county_pop_poverty;
--
CREATE TABLE ks_school_dist_county_pop_poverty (
	school_dist INT NOT NULL,
	county_code VARCHAR NOT NULL,
    total_pop_est INT,
	child_pop INT,
	child_poverty_numb INT,
	child_poverty_percent FLOAT(2),
	FOREIGN KEY (county_code) REFERENCES ks_county_lat_long_txt_format (county_code),
	FOREIGN KEY (school_dist) REFERENCES ks_school_dist_codes (school_dist)
	--PRIMARY KEY (school_dist)
);

-- FCC data https://broadbandmap.fcc.gov/#/data-download

-- Create Area Table from FCC site
-- type = Type of area (national, state, county,
--congressional district, census designated place, tribal area, CBSA)
-- Urban = U; Rural = R

SELECT * FROM area_table;
--
CREATE TABLE area_table (
	type VARCHAR(20) NOT NULL,
    id VARCHAR(20) NOT NULL,
	tech VARCHAR(6) NOT NULL,
    urban_rural VARCHAR(1) NOT NULL,
	tribal_non VARCHAR(5) NOT NULL,
	speed FLOAT,
	has_0 INT,
	has_1 INT,
	has_2 INT,
	has_3more INT,
	FOREIGN KEY (tech) REFERENCES tech_type (tech_type_code),
	PRIMARY KEY (id)
);

-- Create Geography Lookup Table from FCC site
-- type = Type of area (national, state, county,
--congressional district, census designated place, tribal area, CBSA)
-- Urban = U; Rural = R
-- Definition of CBSA = core based statistical area replaces "metropolitan areas"
--     https://en.wikipedia.org/wiki/Core-based_statistical_area
-- See detailed iformation about GEOID Structure for GEO areas
-- here https://www.census.gov/programs-surveys/geography/guidance/geo-identifiers.html

SELECT * FROM geo_lookup;
--
CREATE TABLE geo_lookup (
	year VARCHAR(4) NOT NULL,
    geoid VARCHAR(20) NOT NULL,
	type VARCHAR(20) NOT NULL,
    name VARCHAR(40) NOT NULL,
	centroid_lng VARCHAR(20) NOT NULL,
	centroid_lat VARCHAR(20) NOT NULL,
	bbox_arr VARCHAR,-- combines lat and lng
	FOREIGN KEY (geoid) REFERENCES area_table (id)
);

-- create broadband provider summary tables
-- CENSUS BLOCK FIPS CODE = 15-digit census block code used in the 2010 US Census.
-- A provider that reports deployment of a particular
-- technology and bandwidth in a particular census
-- block may not necessarily offer that particular service everywhere
-- in the census block. Accordingly, a list of providers deployed in a census
-- block does not necessarily reflect the number of choices available to any
-- particular household or business location in that block, and the number of
-- such providers in the census block does not purport to measure competition.

DROP TABLE bb_providers;
--
CREATE TABLE bb_providers (
	logrecno INT NOT NULL,
    provider_id VARCHAR(20) NOT NULL,
	frn VARCHAR(20) NOT NULL, -- fcc registration number
    providername VARCHAR(40) NOT NULL,
	dbaname VARCHAR(40) NOT NULL,
	holdingcompanyname VARCHAR(40), -- api field holdingcompanyname
	hoconum INT, -- api field hoconum
	hocofinal VARCHAR(40), -- api field hocofinal
	stateabbr VARCHAR(2), -- api field stateabbr
	blockcode VARCHAR(2), -- api field blockcode
	techcode INT, -- API field techcode - not same code as tech_code
	consumer_offers INT, -- API consumer (0=no, 1=yes offered in block)
	maxaddown INT, -- highest advertised download speeds
	maxadup INT, -- highest advertised upload speeds
	business INT, -- 1= offers to business/ government service blocks.
	PRIMARY KEY (logrecno)
);

-- https://opendata.fcc.gov/Wireline/Provider-Table-December-2020/2ra3-4jd4
DROP TABLE provider_detail;
--
CREATE TABLE provider_detail (
	hoconum INT NOT NULL,
    tech INT, -- API field techcode - not same code as tech_code
	d_1 INT, -- POPULATION covered by provider with relevant tech download speed
	d_2 INT, -- POPULATION covered by provider with relevant tech download speed
	d_3 INT, -- POPULATION covered by provider with relevant tech download speed
	d_4 INT, -- POPULATION covered by provider with relevant tech download speed
	d_5 INT, -- POPULATION covered by provider with relevant tech download speed
	d_6 INT, -- POPULATION covered by provider with relevant tech download speed
	d_7 INT, -- POPULATION covered by provider with relevant tech download speed
	d_8 INT, -- POPULATION covered by provider with relevant tech download speed
	u_1 INT, -- POPULATION covered by provider with relevant tech upload speed
	u_2 INT, -- POPULATION covered by provider with relevant tech upload speed
	u_3 INT, -- POPULATION covered by provider with relevant tech upload speed
	u_4 INT, -- POPULATION covered by provider with relevant tech upload speed
	u_5 INT, -- POPULATION covered by provider with relevant tech upload speed
	u_6 INT, -- POPULATION covered by provider with relevant tech upload speed
	u_7 INT, -- POPULATION covered by provider with relevant tech upload speed
	u_8 INT, -- POPULATION covered by provider with relevant tech upload speed
	u_9 INT -- POPULATION covered by provider with relevant tech upload speed
);

