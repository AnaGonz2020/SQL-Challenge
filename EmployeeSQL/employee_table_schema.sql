drop table "Titles";

drop table "Departments";

drop table "Employees";

drop table "Salaries";

drop table "Dept_emp";

drop table Dept_manager;


-- Creating Tables for data import

CREATE TABLE Titles (
    title_id varchar(10) PRIMARY KEY  NOT NULL,
    title varchar(30)   NOT NULL
);

select * from Titles;

CREATE TABLE Departments (
    dept_no varchar(10) PRIMARY KEY  NOT NULL,
    dept_name varchar(30)   NOT NULL
);

select * from departments;

CREATE TABLE Dept_manager (
    dept_no varchar(10) NOT NULL,
    emp_no varchar(20)  NOT NULL,
    CONSTRAINT pk_Dept_manager PRIMARY KEY (
        emp_no,dept_no
     )
);

select * from dept_manager;

CREATE TABLE Employees (
    emp_no varchar(20) PRIMARY KEY NOT NULL,
    title_id varchar(10) NOT NULL,
    birth_date varchar(40) NOT NULL,
    first_name varchar(40) NOT NULL,
    last_name varchar(40) NOT NULL,
    sex varchar NOT NULL,
    hire_date varchar(40) NOT NULL
);

select * from employees;

CREATE TABLE Salaries (
    emp_no varchar(20) PRIMARY KEY  NOT NULL,
    salary varchar(10)  NOT NULL
);

select * from salaries;

CREATE TABLE Dept_emp (
    emp_no varchar(20)   NOT NULL,
    dept_no varchar(10)   NOT NULL,
    CONSTRAINT pk_Dept_emp PRIMARY KEY (
        emp_no,dept_no
     )
);

select * from dept_emp;

-- was unable to establis the foregin key relation for the below referenced tables.
--ALTER TABLE Departments ADD CONSTRAINT fk_Departments_dept_no FOREIGN KEY(dept_no)
--REFERENCES Dept_manager (dept_no);

--ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_no FOREIGN KEY(emp_no)
--REFERENCES Dept_manager (emp_no);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_title_id FOREIGN KEY(title_id)
REFERENCES Titles (title_id);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_emp ADD CONSTRAINT fk_Dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_emp ADD CONSTRAINT fk_Dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);