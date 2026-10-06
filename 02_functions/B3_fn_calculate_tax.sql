CREATE OR REPLACE FUNCTION fn_calculate_tax (
    p_annual_income IN NUMBER
) 
RETURN NUMBER IS
    v_tax NUMBER := 0;
BEGIN
    IF p_annual_income <= 60000 THEN
        v_tax := p_annual_income * 0.10;
    ELSIF p_annual_income <= 120000 THEN
        v_tax := (60000 * 0.10) + ((p_annual_income - 60000) * 0.20);
    ELSE
        v_tax := (60000 * 0.10) + (60000 * 0.20) + ((p_annual_income - 120000) * 0.30);
    END IF;
    RETURN v_tax;
END;
/
