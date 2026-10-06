SET SERVEROUTPUT ON;
DECLARE
    v_emp_id  employees.employee_id%TYPE := 102;
    v_salary  employees.salary%TYPE;
BEGIN
    SELECT salary INTO v_salary FROM employees WHERE employee_id = v_emp_id;
    
    IF v_salary < 5000 THEN
        GOTO low_salary;
    ELSIF v_salary BETWEEN 5000 AND 10000 THEN
        GOTO mid_salary;
    ELSE
        GOTO high_salary;
    END IF;

    <<low_salary>>
    DBMS_OUTPUT.PUT_LINE('Employee ' || v_emp_id || ' has a Below Average salary.');
    GOTO end_review;

    <<mid_salary>>
    DBMS_OUTPUT.PUT_LINE('Employee ' || v_emp_id || ' has a Market Standard salary.');
    GOTO end_review;

    <<high_salary>>
    DBMS_OUTPUT.PUT_LINE('Employee ' || v_emp_id || ' has a Premium Tier salary.');
    
    <<end_review>>
    NULL;
END;
/
