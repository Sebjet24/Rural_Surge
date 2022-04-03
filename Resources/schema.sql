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
SELECT * FROM ks_school_dist_codes;

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

-- Create a validation table that combines the GEOID state_county_code and the KBOR string character code for KS counties
-- then drop ks_county_codes and ks_code_counties
--DROP TABLE ks_state_county_codes;
CREATE TABLE ks_state_county_codes 
AS
SELECT DISTINCT nc.state_county_code, sc.county_code, sc.county_desc, sc.desc_upper
FROM ks_code_counties AS nc
LEFT JOIN ks_county_codes AS sc ON nc.countyname = sc.county_desc
WHERE state_county_code like '20%'
ORDER BY state_county_code;

SELECT DISTINCT state_county_code FROM ks_state_county_codes;
DROP TABLE ks_code_counties;
DROP TABLE ks_county_codes;

-- Create county table for Rural Surge Project
-- KS Library data https://kslib.info/423/State-Data-Center

SELECT * FROM ks_county_lat_long_txt_format;
--
CREATE TABLE ks_county_lat_long_txt_format (
	county_code VARCHAR NOT NULL,
	county_lat VARCHAR NOT NULL,
	county_lng	VARCHAR NOT NULL,
	PRIMARY KEY (county_code)
);

-- Create ks_school_dist_county_pop_poverty table

SELECT * FROM ks_school_dist_county_pop_poverty;

DROP TABLE ks_school_dist_county_pop_poverty;
--
CREATE TABLE ks_school_dist_county_pop_poverty (
	dist_county_code VARCHAR NOT NULL,
	school_dist INT NOT NULL,
	county_code VARCHAR NOT NULL,
    total_pop_est INT,
	child_pop INT,
	child_poverty_numb INT,
	child_poverty_percent FLOAT(2),
	--FOREIGN KEY (county_code) REFERENCES ks_state_county_codes (county_code),
	--FOREIGN KEY (school_dist) REFERENCES ks_school_dist_codes (school_dist)
	PRIMARY KEY (dist_county_code)
);

-- FCC data https://broadbandmap.fcc.gov/#/data-download

-- Create Area Table from FCC site
-- type = Type of area (national, state, county,
--congressional district, census designated place, tribal area, CBSA)
-- Urban = U; Rural = R

SELECT * FROM area_table;

DROP TABLE area_table;
--
CREATE TABLE area_table (
	type VARCHAR NOT NULL,
    id VARCHAR NOT NULL,
	tech VARCHAR NOT NULL,
    urban_rural VARCHAR NOT NULL,
	tribal_non VARCHAR NOT NULL,
	speed FLOAT,
	has_0 INT,
	has_1 INT,
	has_2 INT,
	has_3more INT
);

CREATE TABLE area_mod (
	type VARCHAR NOT NULL,
    id VARCHAR NOT NULL,
	tech VARCHAR NOT NULL,
    urban_rural VARCHAR NOT NULL,
	tribal_non VARCHAR NOT NULL,
	speed FLOAT,
	has_0 INT,
	has_1 INT,
	has_2 INT,
	has_3more INT,
	tech_options INT
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

DROP TABLE geo_lookup;
--
CREATE TABLE geo_lookup (
	year VARCHAR(4) NOT NULL,
    geoid VARCHAR NOT NULL,
	type VARCHAR NOT NULL,
    name VARCHAR NOT NULL,
	centroid_lng VARCHAR NOT NULL,
	centroid_lat VARCHAR NOT NULL,
	bbox_arr VARCHAR-- combines lat and lng
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
-- Summary data of fixed broadband coverage by geographic area
-- CSV file name is Fixed_Broadband_Deployment_Data__December_2020

SELECT * FROM bb_providers;

--DROP TABLE bb_providers;
--
CREATE TABLE bb_providers (
	logrecno INT NOT NULL,
    provider_id VARCHAR NOT NULL,
	frn VARCHAR NOT NULL, -- fcc registration number
    providername VARCHAR NOT NULL,
	dbaname VARCHAR NOT NULL,
	holdingcompanyname VARCHAR , -- api field holdingcompanyname
	hoconum INT, -- api field hoconum
	hocofinal VARCHAR, -- api field hocofinal
	stateabbr VARCHAR, -- api field stateabbr
	blockcode VARCHAR, -- api field blockcode
	techcode INT, -- API field techcode - not same code as tech_code
	consumer_offers INT, -- API consumer (0=no, 1=yes offered in block)
	maxaddown FLOAT, -- highest advertised download speeds
	maxadup FLOAT, -- highest advertised upload speeds
	business INT, -- 1= offers to business/ government service blocks.
	PRIMARY KEY (logrecno)
);

-- https://opendata.fcc.gov/Wireline/Provider-Table-December-2020/2ra3-4jd4
SELECT * FROM provider_detail;
--
CREATE TABLE provider_detail (
	hoconum INT NOT NULL,
    tech VARCHAR, -- API field techcode - not same code as tech_code
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

-- https://opendata.fcc.gov/Wireline/Provider-Table-December-2020/2ra3-4jd4
SELECT * FROM provider_detail;
--
-- Data source for following table is 2010 Census data
-- https://www.census.gov/programs-surveys/geography/guidance/geo-areas/urban-rural/2010-urban-rural.html
-- The following data table contains only Kansas, Colorado, Oklahoma, Missori, and Nebraska, which are KS border states

SELECT * FROM pct_urban_rural_county;

DROP TABLE pct_urban_rural_county;

CREATE TABLE pct_urban_rural_county (
	state_code VARCHAR NOT NULL,
	county_code VARCHAR NOT NULL,
	statename VARCHAR NOT NULL,
	countyname VARCHAR NOT NULL,
	pop_cou INT NOT NULL,
	area_cou BIGINT,
	pop_urban INT,
	poppct_urban FLOAT,
	area_urban BIGINT,
	areapct_urban FLOAT,
	popden_urban FLOAT(1),
	pop_ua BIGINT,-- UA = URBAN AREA land mass
	poppct_ua FLOAT,
	area_ua BIGINT,
	areapct_ua FLOAT,
	popden_ua FLOAT,
	pop_uc INT, -- UC = URBAN COUNTY
	poppct_uc FLOAT,
	area_uc BIGINT,
	areapct_uc FLOAT,
	popden_uc FLOAT(1),
	pop_rural INT,
	poppct_rural FLOAT,
	area_rural BIGINT,
	areapct_rural FLOAT,
	popden_rural FLOAT(1)
);

CREATE TABLE ks_code_counties 
as
select distinct state_county_code, countyname
from pct_urban_rural_county
where state_code = '20'
order by state_county_code;