DROP TABLE IF EXISTS dept_emp, dept_manager, salaries, departments, employees, titles;

CREATE TABLE departments (
    dept_no VARCHAR PRIMARY KEY,
    dept_name VARCHAR
);

CREATE TABLE titles (
    title_id VARCHAR PRIMARY KEY,
    title VARCHAR
);

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR,
--    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
    birth_date DATE,
    first_name VARCHAR,
    last_name VARCHAR,
    sex VARCHAR,
    hire_date DATE
);

CREATE TABLE dept_emp (
    id SERIAL PRIMARY KEY,
    emp_no INT,
    dept_no VARCHAR
);

CREATE TABLE dept_manager (
    id SERIAL PRIMARY KEY,
    dept_no VARCHAR,
    emp_no INT
);

CREATE TABLE salaries (
    id SERIAL PRIMARY KEY,
    emp_no INT,
    salary INT
);

SELECT employees.emp_no, employees.last_name, employees.first_name,
employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
salaries.emp_no=employees.emp_no;


SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date between '1986-01-01' and '1986-12-31'


SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no,
employees.first_name, employees.last_name
FROM employees
INNER JOIN dept_manager ON dept_manager.emp_no=employees.emp_no
INNER JOIN departments ON departments.dept_no=dept_manager.dept_no;


SELECT employees.emp_no, employees.last_name, employees.first_name,
dept_name
FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no=employees.emp_no
INNER JOIN departments ON departments.dept_no=dept_emp.dept_no;


SELECT first_name, last_name, sex
FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%'


SELECT employees.emp_no, employees.last_name, employees.first_name,
departments.dept_name
FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no=employees.emp_no
INNER JOIN departments on departments.dept_no=dept_emp.dept_no
WHERE dept_name='Sales';


SELECT employees.emp_no, employees.last_name, employees.first_name,
departments.dept_name
FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no=employees.emp_no
INNER JOIN departments on departments.dept_no=dept_emp.dept_no
WHERE dept_name='Sales' OR dept_name='Development';


SELECT employees.last_name, COUNT(employees.last_name) AS "Last Name Frequency"
FROM employees
GROUP BY employees.last_name
ORDER BY "Last Name Frequency" DESC;
