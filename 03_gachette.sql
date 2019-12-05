SET ECHO ON
-- Script Oracle SQL*plus de gachette pour le travail pratique 2 - Modélisation et Conception d'une BD
-- Version sans accents
-- INSERTION dans les tables
SET ECHO ON
create OR REPLACE trigger tp2GachetteClients 
 before INSERT 
  on 
  tp1Client  
  for each row
  BEGIN
  IF :new.pClient = 0
  THEN
  set :new.pClient := tp2Client.nextval
  END IF;
  END

/
create OR REPLACE trigger tp2GachetteDemandeSoumission
 before INSERT 
  on 
  tp1DemandeSoumission  
  for each row 
  set tp1DemandeSoumission.pSoumission = tp2DemandeSoumission.nextval

/
create OR REPLACE trigger tp2GachetteSoumissionE
 before INSERT 
  on 
  tp1SoumissionE  
  for each row 
  set tp1SoumissionE.pSoumissionE = tp2SoumissionE.nextval

/
create OR REPLACE trigger tp2GachetteChargement
 before INSERT 
  on 
  tp1Chargement  
  for each row 
  set tp1Chargement.pChargement = tp2Chargement.nextval

/
create OR REPLACE trigger tp2GachetteRoute
 before INSERT 
  on 
  tp1Route  
  for each row 
  set tp1Route.pRoute = tp2Route.nextval

/
create OR REPLACE trigger tp2GachetteCarburant
 before INSERT 
  on 
  tp1Carburant  
  for each row 
  set tp1Carburant.pCarburant = tp2Carburant.nextval

/
create OR REPLACE trigger tp2GachetteCompagnie
 before INSERT 
  on 
  tp1Compagnie 
  for each row 
  set tp1Compagnie.pCompagnie = tp2Compagnie.nextval

/
create OR REPLACE trigger tp2GachetteCamion
 before INSERT 
  on 
  tp1Camion  
  for each row 
  set tp1Camion.pCamion = tp2Camion.nextval

/
create OR REPLACE trigger tp2GachetteTypeEquipement
 before INSERT 
  on 
  tp1TypeEquipement  
  for each row 
  set tp1TypeEquipement.pTypeEquipement = tp2TypeEquipement.nextval

/
create OR REPLACE trigger tp2GachetteEquipement
 before INSERT 
  on 
  tp1Equipement  
  for each row 
  set tp1Equipement.pEquipement  = tp2Equipement.nextval

/
create OR REPLACE trigger tp2GachettePosition
 before INSERT 
  on 
  tp1Position  
  for each row 
  set tp1Position.pPosition  = tp2Position.nextval

/
create OR REPLACE trigger tp2GachetteTracteur
 before INSERT 
  on 
  tp1Tracteur  
  for each row 
  set tp1Tracteur.pTracteur  = tp2Tracteur.nextval

/
create OR REPLACE trigger tp2ReduireCamion
 after INSERT on tp1DemandeSoumission  
  for each row 
  on tp1Camion
  set tp1Camion.nCamion = tp1Camion - 1

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
