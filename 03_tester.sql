SET ECHO ON
CREATE OR ALTER FUNCTION GETCLIENTNAME (CLNUMBER IN INTEGER) RETURN INTEGER
IS
CLNUMBER INTEGER;
BEGIN
SELECT * INTO tp1TestClient FROM tp1Client WHERE tp1Client.nomClient = 'Junayd';
RETURN CLNUMBER;
END GETCLIENTNAME;
/
