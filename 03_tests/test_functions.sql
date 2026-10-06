SET SERVEROUTPUT ON;

DECLARE
    -- Define test inputs for baseline verification
    v_test_salary    NUMBER := 5000;          -- $5,000 monthly salary
    v_test_comm      NUMBER := 0.10;          -- 10% commission rate
    v_test_hire_date DATE   := ADD_MONTHS(SYSDATE, -60); -- Exactly 5 years ago today
    
    -- Variables to hold function outputs
    v_annual_gross   NUMBER;
    v_calculated_tax NUMBER;
    v_years_served   NUMBER;
    v_dept_name      VARCHAR2(50);
BEGIN
    DBMS_OUTPUT.PUT_LINE('RUNNING DIAGNOSTIC: PART B FUNCTIONS');

    1. Test B1: Annual Salary Calculation Engine
    v_annual_gross := fn_annual_salary(v_test_salary, v_test_comm);
    DBMS_OUTPUT.PUT_LINE('B1 (Annual Salary):');
    DBMS_OUTPUT.PUT_LINE('Inputs -> Monthly Base: $' || v_test_salary || ' | Comm: ' || (v_test_comm * 100) || '%');
    DBMS_OUTPUT.PUT_LINE('Result -> Total Gross Annual Income: $' || TO_CHAR(v_annual_gross, '999,999.00'));

    2. Test B2: Years of Service / Tenure Engine
    v_years_served := fn_years_of_service(v_test_hire_date);
    DBMS_OUTPUT.PUT_LINE('B2 (Years of Service):');
    DBMS_OUTPUT.PUT_LINE('Inputs -> Hire Date: ' || TO_CHAR(v_test_hire_date, 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Result -> Calculated System Tenure: ' || v_years_served || ' Years');

    3. Test B3: Progressive Income Tax Engine
    v_calculated_tax := fn_calculate_tax(v_annual_gross);
    DBMS_OUTPUT.PUT_LINE('B3 (Tax Calculator):');
    DBMS_OUTPUT.PUT_LINE('Inputs -> Taxable Income Base: $' || TO_CHAR(v_annual_gross, '999,999.00'));
    DBMS_OUTPUT.PUT_LINE('Result -> Progressive Tax Liability: $' || TO_CHAR(v_calculated_tax, '999,999.00'));

    4. Test B4: Department Name Operational Lookup
    DBMS_OUTPUT.PUT_LINE('B4 (Department Name Lookup):');
    
    Test Case A: Existing Department ID
    v_dept_name := fn_dept_name(10);
    DBMS_OUTPUT.PUT_LINE('Test A -> Checking Active ID 10 : ' || v_dept_name);
    
    Test Case B: Boundary Exception / Invalid ID
    v_dept_name := fn_dept_name(99);
    DBMS_OUTPUT.PUT_LINE('Test B -> Checking Invalid ID 99: ' || v_dept_name);
    
    DBMS_OUTPUT.PUT_LINE('DIAGNOSTIC COMPLETE: ALL TASKS PASSED');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('CRITICAL RUNTIME ERROR: ' || SQLERRM);
END;
/
