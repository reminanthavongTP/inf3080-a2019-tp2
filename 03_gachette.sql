SET ECHO ON
-- Script Oracle SQL*plus de gachette pour le travail pratique 2 - Modélisation et Conception d'une BD
-- Version sans accents
-- INSERTION dans les tables
SET ECHO ON
CREATE OR REPLACE TRIGGER tp2GachetteClients
BEFORE INSERT ON tp1Client
FOR EACH ROW
  WHEN (new.pClient IS NULL)
BEGIN
  :new.pClient := tp2Client.nextval;
END;
/
create OR REPLACE trigger tp2GachetteDemandeSoumission
BEFORE INSERT ON tp1DemandeSoumission
FOR EACH ROW
  WHEN (new.pDemandeSoumission IS NULL)
BEGIN
  :new.pDemandeSoumission := tp2DemandeSoumission.nextval;
END;

/
create OR REPLACE trigger tp2GachetteSoumissionE
BEFORE INSERT ON tp1SoumissionE
FOR EACH ROW
  WHEN (new.pSoumissionEt IS NULL)
BEGIN
  :new.pSoumissionE := tp2SoumissionE.nextval;
END;
/
create OR REPLACE trigger tp2GachetteChargement
BEFORE INSERT ON tp1Chargement
FOR EACH ROW
  WHEN (new.pChargementt IS NULL)
BEGIN
  :new.pChargement := tp2Chargement.nextval;
END;
/
create OR REPLACE trigger tp2GachetteRoute
BEFORE INSERT ON tp1Route
FOR EACH ROW
  WHEN (new.pRoutet IS NULL)
BEGIN
  :new.pRoute := tp2Route.nextval;
END;
/
create OR REPLACE trigger tp2GachetteCarburant
BEFORE INSERT ON tp1Carburant
FOR EACH ROW
  WHEN (new.pCarburantt IS NULL)
BEGIN
  :new.pCarburant := tp2Carburant.nextval;
END;
/
create OR REPLACE trigger tp2GachetteCompagnie
BEFORE INSERT ON tp1Compagnie
FOR EACH ROW
  WHEN (new.pCompagnie IS NULL)
BEGIN
  :new.pCompagnie := tp2Compagnie.nextval;
END;
/
create OR REPLACE trigger tp2GachetteCamion
BEFORE INSERT ON tp1Camion
FOR EACH ROW
  WHEN (new.pCamion IS NULL)
BEGIN
  :new.pCamion := tp2Camion.nextval;
END;
/
create OR REPLACE trigger tp2GachetteTypeEquipement
BEFORE INSERT ON tp1TypeEquipement
FOR EACH ROW
  WHEN (new.pTypeEquipement IS NULL)
BEGIN
  :new.pTypeEquipement := tp2TypeEquipement.nextval;
END;
/
create OR REPLACE trigger tp2GachetteEquipement
BEFORE INSERT ON tp1Equipement
FOR EACH ROW
  WHEN (new.pEquipement IS NULL)
BEGIN
  :new.pEquipement := tp2Equipement.nextval;
END;
/
create OR REPLACE trigger tp2GachettePosition
BEFORE INSERT ON tp1Position
FOR EACH ROW
  WHEN (new.pPosition IS NULL)
BEGIN
  :new.pPosition := tp2Position.nextval;
END;
/
create OR REPLACE trigger tp2GachetteTracteur
BEFORE INSERT ON tp1Tracteur
FOR EACH ROW
  WHEN (new.pTracteur IS NULL)
BEGIN
  :new.pTracteur := tp2Tracteur.nextval;
END;
/
create OR REPLACE trigger tp2ReduireCamion
AFTER INSERT ON tp1SoumissionE
FOR EACH ROW
  UPDATE tp1Compagnie
     SET nCamion = nCamion - 1;
/
CREATE OR REPLACE TRIGGER ON tp1DemandeSoumission
AFTER INSERT
AS
IF EXISTS (SELECT *
           FROM tp1Route p 
           JOIN inserted AS i 
           ON p.pSoumission = i.pSoumission 
           WHERE p.nDistance > 50
          )
BEGIN
RAISERROR ('Bloquer la réservation d’un camion lorsque le trajet est supérieur à 50 km');
ROLLBACK TRANSACTION;
RETURN 
END
 
/
CREATE OR REPLACE TRIGGER ON tp1DemandeSoumission
AFTER INSERT
AS
IF EXISTS (SELECT *
           FROM tp1Route p 
           JOIN inserted AS i 
           ON p.pSoumission = i.pSoumission 
           WHERE p.nDistance = 0
          )
BEGIN
RAISERROR ('Bloquer la soumission si le trajet n’a pas été bien identifié');
ROLLBACK TRANSACTION;
RETURN 
END
 
 /
 CREATE OR REPLACE TRIGGER ON tp1DemandeSoumission
AFTER INSERT
AS
IF EXISTS (SELECT *
           FROM tp1Camion p 
           JOIN inserted AS i 
           ON p.pCamion = i.pCamion 
           JOIN tp1Equipement AS v 
           ON v.pTypeEquipement = p.pTypeEquipement
           JOIN tp1TypeEquipement AS y
           ON y.pTypeEquipement = v.pTypeEquipement
           WHERE y.nCout > 0
          )
BEGIN
RAISERROR ('Bloquer la soumission si le coût de type d’équipement pour un camion ne sont pas
différents');
ROLLBACK TRANSACTION;
RETURN 
END
 
 /
COMMIT
/
