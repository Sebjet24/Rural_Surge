-- Create location table for Rural Surge Project
-- FCC data https://broadbandmap.fcc.gov/#/data-download
CREATE TABLE location_coord (
	lng FLOAT(20) NOT NULL,
    lat FLOAT(20) NOT NULL,
	zip_code VARCHAR(9) NOT NULL,
    state_code VARCHAR(2) NOT NULL,
    PRIMARY KEY (zip_code)
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
