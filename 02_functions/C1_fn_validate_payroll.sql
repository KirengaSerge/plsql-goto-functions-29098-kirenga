CREATE OR REPLACE FUNCTION fn_validate_payroll (
    p_emp_id IN NUMBER
) 
RETURN VARCHAR2 IS
    v_salary employees.salary%TYPE;
BEGIN
    SELECT salary INTO v_salary FROM employees WHERE employee_id = p_emp_id;
    
    IF v_salary <= 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Invalid Salary Amount.');
    ELSIF v_salary > 25000 THEN
        RETURN 'FLAGGED: Salary exceeds operational boundaries.';
    ELSE
        RETURN 'VALID';
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'INVALID: Employee footprint not found.';
END;
/
