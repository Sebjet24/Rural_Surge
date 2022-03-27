-- Create tables for Rural Surge Project
-- FCC data https://broadbandmap.fcc.gov/#/data-download

-- Create Area Table from FCC site
-- type = Type of area (national, state, county,
--congressional district, census designated place, tribal area, CBSA)
-- Urban = U; Rural = R

CREATE TABLE area_table (
	type VARCHAR(20) NOT NULL,
    id VARCHAR(20) NOT NULL,
	tech VARCHAR(6) NOT NULL,
    urban_rural VARCHAR(1) NOT NULL,
	tribal_non VARCHAR(5) NOT NULL,
	speed FLOAT,
	has_zero INT,
	has_one INT,
	has_two INT,
	has_three_plus INT,
	FOREIGN KEY (tech) REFERENCES (tech_type),
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

CREATE TABLE geo_lookup (
	year VARCHAR(20) NOT NULL,
    geoid VARCHAR(20) NOT NULL,
	type VARCHAR(20) NOT NULL,
    name VARCHAR(40) NOT NULL,
	centroid_lng VARCHAR(20) NOT NULL,
	centroid_lat VARCHAR(20) NOT NULL,
	bbox_arr VARCHAR,
    PRIMARY KEY (geoid)
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
CREATE TABLE bb_providers (
	logical_id INT NOT NULL,
    provider_id VARCHAR(20) NOT NULL,
	frn VARCHAR(20) NOT NULL, -- fcc registration number
    provider_name VARCHAR(40) NOT NULL,
	dba_name VARCHAR(40) NOT NULL,
	holding_co_name VARCHAR(40), -- api field holdingcompanyname
	holding_co_no INT, -- api field hoconum
	holding_co_final VARCHAR(40), -- api field hocofinal
	state_code VARCHAR(2) -- api field stateabbr
	fips_block_code VARCHAR(2) -- api field blockcode
	num_tech_type INT, -- API field techcode - not same code as tech_code
	consumer_offers INT, -- API consumer (0=no, 1=yes offered in block)
	max_ad_down_speed INT, 
	max_ad_UP_speed INT, 
	business_offers INT, -- 1= offers to business/ government service blocks.
    FOREIGN KEY (holding_co_no) REFERENCES provider_detail (holding_co_no),
	PRIMARY KEY (logical_id)
);

CREATE TABLE provider_detail (
	holding_co_no INT NOT NULL,
    num_tech_type INT, -- API field techcode - not same code as tech_code
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
	u_9 INT, -- POPULATION covered by provider with relevant tech upload speed
	PRIMARY KEY (holding_co_no)
);
-- Create Validation Table for Area Table tech column from FCC site
CREATE TABLE tech_type (
	tech_type_code VARCHAR(1) NOT NULL,
    tech_type_desc VARCHAR(20) NOT NULL,
	PRIMARY KEY (tech_type_code)
);

-- Create county table for Rural Surge Project
-- KS Library data https://kslib.info/423/State-Data-Center
CREATE TABLE ks_counties (
	county_code VARCHAR(2) NOT NULL,
	county_desc VARCHAR NOT NULL,
    PRIMARY KEY (county_code)
    
);

-- Create ks_zip_code table
CREATE TABLE ks_zip_codes (
	zip_code VARCHAR(9) NOT NULL,
	county_code VARCHAR(2) NOT NULL,
    city    VARCHAR(20) NOT NULL,
    state_code VARCHAR(2) NOT NULL,
	FOREIGN KEY (county_code) REFERENCES ks_counties (county_code),
	PRIMARY KEY (zip_code)
);
