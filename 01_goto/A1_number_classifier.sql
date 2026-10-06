SET SERVEROUTPUT ON;
DECLARE
    v_num NUMBER;
BEGIN
    FOR i IN 1..5 LOOP
        -- Select a mix of numbers to test
        v_num := CASE i WHEN 1 THEN 12 WHEN 2 THEN -7 WHEN 3 THEN 0 WHEN 4 THEN 15 ELSE -20 END;
        
        DBMS_OUTPUT.PUT('Number ' || v_num || ' is: ');
        
        IF v_num = 0 THEN
            GOTO print_zero;
        ELSIF v_num > 0 THEN
            GOTO print_positive;
        ELSE
            GOTO print_negative;
        END IF;

        <<print_positive>>
        DBMS_OUTPUT.PUT('Positive');
        GOTO check_parity;

        <<print_negative>>
        DBMS_OUTPUT.PUT('Negative');
        GOTO check_parity;

        <<print_zero>>
        DBMS_OUTPUT.PUT_LINE('Zero (Even)');
        GOTO end_loop;

        <<check_parity>>
        IF MOD(v_num, 2) = 0 THEN
            DBMS_OUTPUT.PUT_LINE(' and Even');
        ELSE
            DBMS_OUTPUT.PUT_LINE(' and Odd');
        END IF;

        <<end_loop>>
        NULL;
    END LOOP;
END;
/
