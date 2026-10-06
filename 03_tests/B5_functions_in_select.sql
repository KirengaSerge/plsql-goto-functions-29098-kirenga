COLUMN employee_name FORMAT A15;
COLUMN department_name FORMAT A20;

SELECT 
    first_name || ' ' || last_name AS employee_name,
    fn_dept_name(department_id) AS department_name,
    salary AS monthly_salary,
    fn_annual_salary(salary, commission_pct) AS gross_annual,
    fn_calculate_tax(fn_annual_salary(salary, commission_pct)) AS annual_tax,
    fn_years_of_service(hire_date) AS years_served
FROM employees;
