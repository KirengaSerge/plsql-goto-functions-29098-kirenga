CREATE OR REPLACE FUNCTION fn_annual_salary (
    p_monthly_sal IN NUMBER,
    p_comm_pct    IN NUMBER
) RETURN NUMBER IS
BEGIN
    RETURN (p_monthly_sal * 12) + (p_monthly_sal * 12 * NVL(p_comm_pct, 0));
END;
/
