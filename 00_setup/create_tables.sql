CREATE TABLE departments (
    department_id   NUMBER PRIMARY KEY,
    department_name VARCHAR2(50) NOT NULL
);

CREATE TABLE employees (
    employee_id     NUMBER PRIMARY KEY,
    first_name      VARCHAR2(50),
    last_name       VARCHAR2(50) NOT NULL,
    department_id   NUMBER REFERENCES departments(department_id),
    hire_date       DATE NOT NULL,
    salary          NUMBER(10,2) NOT NULL,
    commission_pct  NUMBER(3,2)
);

INSERT INTO departments VALUES (10, 'Administration');
INSERT INTO departments VALUES (20, 'Human Resources');
INSERT INTO departments VALUES (30, 'Sales');

INSERT INTO employees VALUES (101, 'Alice', 'Smith', 10, TO_DATE('2018-03-15', 'YYYY-MM-DD'), 7000, NULL);
INSERT INTO employees VALUES (102, 'Bob', 'Jones', 20, TO_DATE('2021-06-01', 'YYYY-MM-DD'), 4500, NULL);
INSERT INTO employees VALUES (103, 'Charlie', 'Brown', 30, TO_DATE('2015-11-10', 'YYYY-MM-DD'), 11000, 0.15);
COMMIT;
/
