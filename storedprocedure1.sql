2. PL/SQL stored procedure to update the quiz score to 100 of the students with score between 91& 99.
CREATE OR REPLACE PROCEDURE INCREASE_SCORE AS
BEGIN
DECLARE
ScoreDetails USER_QUIZ%ROWTYPE;
CURSOR SCORE_CHECK IS SELECT * FROM USER_QUIZ WHERE SCORE BETWEEN 90 AND 99;
BEGIN
OPEN SCORE_CHECK;
DBMS_OUTPUT.PUT_LINE('CURSOR OPENED');
LOOP
FETCH SCORE_CHECK INTO ScoreDetails;
EXIT WHEN (SCORE_CHECK%NOTFOUND);
UPDATE USER_QUIZ SET SCORE = 100 WHERE U_ID = ScoreDetails.U_ID AND QZ_ID = ScoreDetails.QZ_ID;
END LOOP;
Online Education System
CLOSE SCORE_CHECK;
END;
END INCREASE_SCORE;
Procedure Call:
SET SERVEROUTPUT ON;
BEGIN
INCREASE_SCORE;
END;