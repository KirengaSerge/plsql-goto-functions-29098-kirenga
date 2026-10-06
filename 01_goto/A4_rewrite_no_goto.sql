SET SERVEROUTPUT ON;
DECLARE
    v_emp_id  employees.employee_id%TYPE := 102;
    v_salary  employees.salary%TYPE;
    v_remark  VARCHAR2(50);
BEGIN
    SELECT salary INTO v_salary FROM employees WHERE employee_id = v_emp_id;
    
    -- Clean, maintainable refactoring without GOTO tags
    IF v_salary < 5000 THEN
        v_remark := 'Below Average salary.';
    ELSIF v_salary BETWEEN 5000 AND 10000 THEN
        v_remark := 'Market Standard salary.';
    ELSE
        v_remark := 'Premium Tier salary.';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Employee ' || v_emp_id || ' has a ' || v_remark);
END;
/
