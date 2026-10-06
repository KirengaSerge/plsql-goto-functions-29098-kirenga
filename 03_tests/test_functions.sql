SET SERVEROUTPUT ON;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Testing ID 101: ' || fn_validate_payroll(101));
    DBMS_OUTPUT.PUT_LINE('Testing ID 999: ' || fn_validate_payroll(999));
END;
/
