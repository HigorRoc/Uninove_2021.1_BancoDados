-- ATIVIDADE DE NOTAS
CREATE TABLE NOTAS(
            RA CHAR(9),
            COD_DISC CHAR(4) NOT NULL,
            A1 NUMBER(3,1),
            A2 NUMBER(3,1),
            A3 NUMBER(3,1),
            AULAS NUMBER(2),
            FALTAS NUMBER(2),
            CONSTRAINT NOTAS_PK PRIMARY KEY(RA)
            );
            
INSERT INTO NOTAS VALUES ('111222333','3520',9,10,8.5,80,10);
INSERT INTO NOTAS VALUES ('222333444','3520',6,5,3, 80,20);
INSERT INTO NOTAS VALUES ('333444555','3520',6,5.5,5,80,10);
INSERT INTO NOTAS VALUES ('444555666','3520',7,8.5,6.5,80,40);

SET SERVEROUTPUT ON;
DECLARE
    V_NOTAS NOTAS%ROWTYPE;
    V_MEDIA NUMBER(3,2);
BEGIN
    SELECT * INTO V_NOTAS FROM NOTAS WHERE RA = '111222333';
    
    IF(V_NOTAS.FALTAS/V_NOTAS.AULAS > 0.25) THEN 
        DBMS_OUTPUT.PUT_LINE('REPROVADO POR FALTAS');
    ELSE
        IF(V_NOTAS.A1 >= V_NOTAS.A3) AND (V_NOTAS.A2 >= V_NOTAS.A3) THEN 
        V_MEDIA := (V_NOTAS.A1 + V_NOTAS.A2)/2;
    ELSIF (V_NOTAS.A2 >= V_NOTAS.A1) THEN
        V_MEDIA := (V_NOTAS.A2+V_NOTAS.A3)/2;
    ELSE
        V_MEDIA := (V_NOTAS.A1+V_NOTAS.A3)/2;
    END IF;
    IF (V_MEDIA < 6) THEN
        DBMS_OUTPUT.PUT_LINE ('REPROVADO POR NOTA');
    ELSE
        DBMS_OUTPUT.PUT_LINE ('APROVADO');
        END IF;
    END IF;
    DBMS_OUTPUT.PUT_LINE (V_MEDIA);
END;

DESC NOTAS;
SELECT * FROM NOTAS;