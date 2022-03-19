-- Create location table for Rural Surge Project
-- FCC data https://broadbandmap.fcc.gov/#/data-download
CREATE TABLE location_coord (
	lng FLOAT(20) NOT NULL,
    lat FLOAT(20) NOT NULL,
	zip_code VARCHAR(9) NOT NULL,
    FOREIGN KEY (zip_code) REFERENCES departments (ks_zip_codes),
    PRIMARY KEY (zip_code)
);

-- Create county table for Rural Surge Project
CREATE TABLE ks_counties (
	county_code VARCHAR(2) NOT NULL,
	county_desc VARCHAR NOT NULL,
    zip_code VARCHAR(9) NOT NULL,
	last_name VARCHAR(40) NOT NULL,
	gender VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
    FOREIGN KEY (zip_code) REFERENCES departments (ks_zip_codes),
	PRIMARY KEY (county_code)
    
);

-- Create Dept_Manager table
CREATE TABLE ks_zip_codes (
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	TO_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

-- Create Salary table
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	TO_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);

-- Create Dept_Emp table
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	TO_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

-- Create Titles table
CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	TO_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, title, from_date)
);

-- select statement to check 
SELECT * FROM departments;