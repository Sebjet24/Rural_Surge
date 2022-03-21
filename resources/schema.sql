-- Create location table for Rural Surge Project
-- FCC data https://broadbandmap.fcc.gov/#/data-download
CREATE TABLE location_coord (
	lng VARCHAR(20) NOT NULL,
    lat VARCHAR(20) NOT NULL,
	zip_code VARCHAR(9) NOT NULL,
    state_code VARCHAR(2) NOT NULL,
    PRIMARY KEY (zip_code)
);

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
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    FOREIGN KEY (zip_code) REFERENCES departments (location_coord),
	PRIMARY KEY (zip_code)
);
