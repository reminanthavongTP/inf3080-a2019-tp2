SET ECHO ON
-- Script Oracle SQL*plus de gachette pour le travail pratique 2 - Modélisation et Conception d'une BD
-- Version sans accents
-- INSERTION dans les tables
SET ECHO ON
CREATE OR REPLACE TRIGGER tp2GachetteClients
BEFORE INSERT ON tp1Client
FOR EACH ROW
  WHEN (new.pClient = 0)
BEGIN
  :new.pClient := tp2Client.nextval;
END;
/
create OR REPLACE trigger tp2GachetteDemandeSoumission
BEFORE INSERT ON tp1DemandeSoumission
FOR EACH ROW
  WHEN (new.pSoumission = 0 AND new.pCamion = 0)
DECLARE
  rpCamion  tp1DemandeSoumission.pCamion%TYPE;  
BEGIN
  :new.pSoumission := tp2DemandeSoumission.nextval;
  SELECT * INTO rpCamion FROM   
(
SELECT pCamion FROM tp1Camion  
ORDER BY dbms_random.value
)  
WHERE rownum = 1;
 
  :new.pCamion := rpCamion;
END;
/
create OR REPLACE trigger tp2GachetteSoumissionE
BEFORE INSERT ON tp1SoumissionE
FOR EACH ROW
  WHEN (new.pSoumissionE = 0 AND new.pChargement = 0)
BEGIN
  :new.pSoumissionE := tp2SoumissionE.nextval;
  :new.pChargement := tp2Chargement.currval;
END;
/
create OR REPLACE trigger tp2GachetteChargement
BEFORE INSERT ON tp1Chargement
FOR EACH ROW
  WHEN (new.pChargement = 0 AND new.pSoumission = 0 AND new.pClient = 0)
DECLARE
  rpClient  tp1Chargement.pClient%TYPE;  
BEGIN
  :new.pChargement := tp2Chargement.nextval;
  :new.pSoumission := tp2DemandeSoumission.currval;
  SELECT * INTO rpClient FROM   
(
SELECT pClient FROM tp1Client  
ORDER BY dbms_random.value
)  
WHERE rownum = 1;
  :new.pClient := rpClient;
END;
/
create OR REPLACE trigger tp2GachetteRoute
BEFORE INSERT ON tp1Route
FOR EACH ROW
  WHEN (new.pRoute = 0 AND new.pSoumission = 0 AND new.nDistance = 0)
DECLARE
rnDistance tp1Route.nDistance%TYPE;    
BEGIN
  :new.pRoute := tp2Route.nextval;
  :new.pSoumission := tp2DemandeSoumission.currval;
  
  SELECT calculDistance (:new.nLatOri,:new.nLongOri,:new.nLatDes,:new.nLongDes) INTO rnDistance FROM DUAL;
  :new.nDistance := rnDistance;
END;
/
create OR REPLACE trigger tp2GachetteCarburant
BEFORE INSERT ON tp1Carburant
FOR EACH ROW
  WHEN (new.pCarburant = 0)
BEGIN
  :new.pCarburant := tp2Carburant.nextval;
END;
/
create OR REPLACE trigger tp2GachetteCompagnie
BEFORE INSERT ON tp1Compagnie
FOR EACH ROW
  WHEN (new.pCompagnie = 0)
BEGIN
  :new.pCompagnie := tp2Compagnie.nextval;
END;
/
create OR REPLACE trigger tp2GachetteCamion
BEFORE INSERT ON tp1Camion
FOR EACH ROW
  WHEN (new.pCamion = 0 AND new.pEquipement = 0 and new.pTracteur = 0)
BEGIN
  :new.pCamion := tp2Camion.nextval;
  :new.pEquipement := tp2Equipement.currval;
  :new.pTracteur := tp2Tracteur.currval;
END;
/
create OR REPLACE trigger tp2GachetteTypeEquipement
BEFORE INSERT ON tp1TypeEquipement
FOR EACH ROW
  WHEN (new.pTypeEquipement = 0)
BEGIN
  :new.pTypeEquipement := tp2TypeEquipement.nextval;
END;
/
create OR REPLACE trigger tp2GachetteEquipement
BEFORE INSERT ON tp1Equipement
FOR EACH ROW
  WHEN (new.pEquipement = 0 AND new.pTypeEquipement = 0)
BEGIN
  :new.pEquipement := tp2Equipement.nextval;
  :new.pTypeEquipement := tp2TypeEquipement.currval;
END;
/
create OR REPLACE trigger tp2GachettePosition
BEFORE INSERT ON tp1Position
FOR EACH ROW
  WHEN (new.pPosition = 0 AND new.pCamion = 0)
BEGIN
  :new.pPosition := tp2Position.nextval;
  :new.pCamion := tp2Camion.currval;
END;
/
create OR REPLACE trigger tp2GachetteTracteur
BEFORE INSERT ON tp1Tracteur
FOR EACH ROW
  WHEN (new.pTracteur = 0 AND new.pCarburant = 0)
BEGIN
  :new.pTracteur := tp2Tracteur.nextval;
  :new.pCarburant := tp2Carburant.currval;
END;
/
create OR REPLACE trigger tp2ReduireCamion
AFTER INSERT ON tp1SoumissionE
FOR EACH ROW
DECLARE
  rpCompagnie  tp1Camion.pCompagnie %TYPE;
BEGIN

SELECT tp1Camion.pCompagnie INTO rpCompagnie
     FROM tp1SoumissionE JOIN tp1Chargement
     ON tp1SoumissionE.pChargement = tp1Chargement.pChargement
     JOIN tp1DemandeSoumission
     ON tp1Chargement.pSoumission = tp1DemandeSoumission.pSoumission
     JOIN tp1Camion
     ON tp1DemandeSoumission.pCamion = tp1Camion.pCamion
     WHERE tp1SoumissionE.pSoumissionE = :new.pSoumissionE;

  UPDATE tp1Compagnie
     SET tp1Compagnie.nCamion = tp1Compagnie.nCamion - 1
     WHERE tp1Compagnie.pCompagnie = rpCompagnie;
END;     
/
COMMIT
/
