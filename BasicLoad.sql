DROP TABLE tp1Client CASCADE CONSTRAINTS
/
DROP TABLE tp1DemandeSoumission CASCADE CONSTRAINTS
/
DROP TABLE tp1SoumissionE CASCADE CONSTRAINTS
/
DROP TABLE tp1Chargement CASCADE CONSTRAINTS
/
DROP TABLE tp1Route CASCADE CONSTRAINTS
/
DROP TABLE tp1Carburant CASCADE CONSTRAINTS
/
DROP TABLE tp1Compagnie CASCADE CONSTRAINTS
/
DROP TABLE tp1Camion CASCADE CONSTRAINTS
/
DROP TABLE tp1TypeEquipement CASCADE CONSTRAINTS
/
DROP TABLE tp1Equipement CASCADE CONSTRAINTS
/
DROP TABLE tp1Position CASCADE CONSTRAINTS
/
DROP TABLE tp1Tracteur CASCADE CONSTRAINTS
/
CREATE TABLE tp1Client
(pClient 		INTEGER 		NOT NULL,
 cClient 		VARCHAR(20) 	NOT NULL,
 CHECK     (cClient IN ('VISA','Master Card','American Express')),
 PRIMARY KEY 	(pClient)
)
/
CREATE TABLE tp1Compagnie
(pCompagnie 		INTEGER 		NOT NULL,
 cCompagnie 		VARCHAR(20) 	NOT NULL,
 nCamion      	INTEGER 		NOT NULL,
 nProfit      NUMBER      NOT NULL,
 CHECK (nCamion>=1),
 PRIMARY KEY 	(pCompagnie)
)
/
CREATE TABLE tp1TypeEquipement
(pTypeEquipement INTEGER NOT NULL,
 cTypeEquipement VARCHAR(30) NOT NULL,
 nCout NUMBER(8,5) NOT NULL,
 CHECK           (cTypeEquipement IN ( 'DryBox','Flatbed')),
 PRIMARY KEY    (pTypeEquipement)
)
/
CREATE TABLE tp1Equipement
(pEquipement INTEGER NOT NULL,
 cEquipement VARCHAR(30) NOT NULL,
 nCapacite NUMBER NOT NULL,
 nLongueur NUMBER NOT NULL,
 nLargeur NUMBER NOT NULL,
 nHauteur NUMBER NOT NULL,
 pTypeEquipement INTEGER NOT NULL,
 PRIMARY KEY    (pTypeEquipement),
 FOREIGN KEY 	(pTypeEquipement) REFERENCES tp1TypeEquipement
)
/
CREATE TABLE tp1Carburant
(pCarburant INTEGER NOT NULL,
 cCarburant VARCHAR(30) NOT NULL,
 nCout NUMBER NOT NULL,
 PRIMARY KEY    (pCarburant)
)
/
CREATE TABLE tp1Tracteur
(pTracteur INTEGER NOT NULL,
 cTracteur VARCHAR(30) NOT NULL,
 nConsommation FLOAT(8) NOT NULL,
 bActif        INTEGER NOT NULL,
 pCarburant    INTEGER NOT NULL,
 PRIMARY KEY    (pTracteur),
 FOREIGN KEY 	(pCarburant) REFERENCES tp1Carburant
)
/
CREATE TABLE tp1Camion
(pCamion 		INTEGER 		NOT NULL,
 pCompagnie 		INTEGER 		NOT NULL,
 pEquipement 		INTEGER 		NOT NULL,
 pTracteur 		INTEGER 		NOT NULL,
 cCamion      VARCHAR(20) 	NOT NULL,
 PRIMARY KEY 	(pCamion),
 FOREIGN KEY 	(pCompagnie) REFERENCES tp1Compagnie,
 FOREIGN KEY 	(pEquipement) REFERENCES tp1Equipement,
 FOREIGN KEY 	(pTracteur) REFERENCES tp1Tracteur
)
/
CREATE TABLE tp1DemandeSoumission
(pSoumission 		INTEGER 		NOT NULL,
 nPrix 		NUMBER(8,5) 		NOT NULL,
 pCamion 		INTEGER 		NOT NULL,
 dateSoumission 	DATE 	NOT NULL,
 PRIMARY KEY 	(pSoumission),
 FOREIGN KEY 	(pCamion) REFERENCES tp1Camion
)
/
CREATE TABLE tp1Route
(pRoute 		INTEGER 	NOT NULL,
 cRoute 		VARCHAR(40) 	NOT NULL,
 nLatOri 	NUMBER 	NOT NULL,
 nLongOri 	NUMBER 	NOT NULL,
 nLatDes 		NUMBER 		NOT NULL,
 nLongDes 		NUMBER 		NOT NULL,
 nDistance 		NUMBER 		NOT NULL,
 pSoumission 		INTEGER 		NOT NULL,
 FOREIGN KEY 	(pSoumission) REFERENCES tp1DemandeSoumission,
 PRIMARY KEY 	(pRoute)
)
/
CREATE TABLE tp1Chargement
(pChargement 		INTEGER 	NOT NULL,
 cChargement 		VARCHAR(40) 	NOT NULL,
 refrigerated 		INTEGER	NOT NULL,
 dock 		INTEGER 	NOT NULL,
 hazardous 	INTEGER 	NOT NULL,
 rush 		INTEGER 		NOT NULL,
 nLongueur 		NUMBER 		NOT NULL,
 nLargeur 		NUMBER 		NOT NULL,
 nHauteur		NUMBER 		NOT NULL,
 nPoids 		NUMBER 		NOT NULL,
 quantity 	INTEGER  	NOT NULL,
 hours 	FLOAT  	NOT NULL,
 valeur 	INTEGER  	NOT NULL,
 pSoumission 		INTEGER 		NOT NULL,
 pClient       INTEGER 		NOT NULL,
 PRIMARY KEY 	(pChargement),
 FOREIGN KEY 	(pClient) REFERENCES tp1Client,
 FOREIGN KEY 	(pSoumission) REFERENCES tp1DemandeSoumission
)
/                  
CREATE TABLE tp1SoumissionE
(pSoumissionE		INTEGER 		NOT NULL,
 pChargement   INTEGER 		NOT NULL,
 dSoumission   DATE 		NOT NULL,
 PRIMARY KEY 	(pSoumissionE),
 FOREIGN KEY 	(pChargement) REFERENCES tp1Chargement
)
/
CREATE TABLE tp1Position
(pPosition INTEGER NOT NULL,
 cPosition VARCHAR(30) NOT NULL,
 nLat NUMBER NOT NULL,
 nLong NUMBER NOT NULL,
 bDisponible INTEGER NOT NULL,
 pCamion 		INTEGER 		NOT NULL,
 PRIMARY KEY    (pPosition),
 FOREIGN KEY 	(pCamion) REFERENCES tp1Camion
)
/
DROP SEQUENCE tp2Client
/
DROP SEQUENCE tp2DemandeSoumission
/
DROP SEQUENCE tp2SoumissionE
/
DROP SEQUENCE tp2Chargement
/
DROP SEQUENCE tp2Route
/
DROP SEQUENCE tp2Carburant
/
DROP SEQUENCE tp2Compagnie
/
DROP SEQUENCE tp2Camion
/
DROP SEQUENCE tp2TypeEquipement
/
DROP SEQUENCE tp2Equipement
/
DROP SEQUENCE tp2Position
/
DROP SEQUENCE tp2Tracteur
/
CREATE SEQUENCE tp2Client
 start with 10
 increment by 2
 minvalue 10
 maxvalue 100
 

/
CREATE SEQUENCE tp2DemandeSoumission
 start with 10
 increment by 2
 minvalue 10
 maxvalue 100
 

/
CREATE SEQUENCE tp2SoumissionE
 start with 10
 increment by 2
 minvalue 10
 maxvalue 100
 

/
CREATE SEQUENCE tp2Chargement
 start with 10
 increment by 2
 minvalue 10
 maxvalue 200
 

/
CREATE SEQUENCE tp2Route
 start with 10
 increment by 2
 minvalue 10
 maxvalue 50
 

/
CREATE SEQUENCE tp2Carburant
 start with 10
 increment by 2
 minvalue 10
 maxvalue 12
 

/
CREATE SEQUENCE tp2Compagnie
 start with 10
 increment by 2
 minvalue 10
 maxvalue 20
 

/
CREATE SEQUENCE tp2Camion
 start with 10
 increment by 2
 minvalue 10
 maxvalue 40
 

/
CREATE SEQUENCE tp2TypeEquipement
 start with 10
 increment by 2
 minvalue 10
 maxvalue 40
 

/
CREATE SEQUENCE tp2Equipement
 start with 10
 increment by 2
 minvalue 10
 maxvalue 40
 

/
CREATE SEQUENCE tp2Position
 start with 10
 increment by 2
 minvalue 10
 maxvalue 40
 

/
CREATE SEQUENCE tp2Tracteur
 start with 10
 increment by 2
 minvalue 10
 maxvalue 40
 

/
CREATE OR REPLACE FUNCTION calculDistance (LatOri IN NUMBER,
                                     LonOri IN NUMBER,
                                     LatDest IN NUMBER,
                                     LonDest IN NUMBER,
                                     Radius IN NUMBER DEFAULT 3963) RETURN NUMBER IS
 
 DegToRad NUMBER := 57.29577951;

BEGIN
  RETURN(NVL(Radius,0) * ACOS((sin(NVL(LatOri,0) / DegToRad) * SIN(NVL(LatDest,0) / DegToRad)) +
        (COS(NVL(LatOri,0) / DegToRad) * COS(NVL(LatDest,0) / DegToRad) *
         COS(NVL(LonDest,0) / DegToRad - NVL(LonOri,0)/ DegToRad))));
END;
/             
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
BEFORE INSERT ON tp1SoumissionE
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
IF (rpCompagnie > 0)
THEN  UPDATE tp1Compagnie
     SET tp1Compagnie.nCamion = tp1Compagnie.nCamion - 1
     WHERE tp1Compagnie.pCompagnie = rpCompagnie;
END IF;	 
END;     
/
create OR REPLACE trigger tp2GachetteSoumissionE
BEFORE INSERT ON tp1SoumissionE
FOR EACH ROW
  WHEN (new.pSoumissionE = 0 AND new.pChargement = 0)
DECLARE
  rpCompagnie  tp1Camion.pCompagnie %TYPE; 
  laSoumissionE   tp2SoumissionE.pSoumissionE %TYPE;
BEGIN
  :new.pSoumissionE := tp2SoumissionE.nextval;
  :new.pChargement := tp2Chargement.currval;
  laSoumissionE = tp2SoumissionE.currval;
  SELECT tp1Camion.pCompagnie INTO rpCompagnie
    FROM tp1SoumissionE JOIN tp1Chargement
    ON tp1SoumissionE.pChargement = tp1Chargement.pChargement
    JOIN tp1DemandeSoumission
    ON tp1Chargement.pSoumission = tp1DemandeSoumission.pSoumission
    JOIN tp1Camion
    ON tp1DemandeSoumission.pCamion = tp1Camion.pCamion
    WHERE tp1SoumissionE.pSoumissionE = laSoumissionE;
	
	IF (rpCompagnie > 0)
     THEN  UPDATE tp1Compagnie
     SET tp1Compagnie.nCamion = tp1Compagnie.nCamion - 1
     WHERE tp1Compagnie.pCompagnie = rpCompagnie;
    END IF;	 

END;
/
INSERT INTO tp1Client
 	VALUES(0,'VISA')
/
INSERT INTO tp1Client
 	VALUES(0,'Master Card')
/
INSERT INTO tp1Client
 	VALUES(0,'VISA')
/
INSERT INTO tp1Client
 	VALUES(0,'Master Card')
/
INSERT INTO tp1Client
 	VALUES(0,'American Express')
/
INSERT INTO tp1Client
 	VALUES(0,'VISA')
/
INSERT INTO tp1Client
 	VALUES(0,'Master Card')
/
INSERT INTO tp1Client
 	VALUES(0,'Master Card')
/
INSERT INTO tp1Client
 	VALUES(0,'VISA')
/
INSERT INTO tp1Client
 	VALUES(0,'American Express')
/
INSERT INTO tp1Client
 	VALUES(0,'VISA')
/
INSERT INTO tp1Compagnie
 	VALUES(0,'Earenam',10,1.18)
/
INSERT INTO tp1Compagnie
 	VALUES(0,'Arearn',10,1.18)
/
INSERT INTO tp1Compagnie
 	VALUES(0,'Senoine',10,1.18)
/
INSERT INTO tp1TypeEquipement
 	VALUES(0,'Flatbed',0.02)
/
INSERT INTO tp1Equipement
 	VALUES(0,'EarenamFlatbed',8.0,4.8,5.4,208.0,0)
/	
INSERT INTO tp1TypeEquipement
 	VALUES(0,'DryBox',0.05)
/
INSERT INTO tp1Equipement
 	VALUES(0,'EarenamDryBox',11.7,6.0,5.5,396.0,0)
/
INSERT INTO tp1TypeEquipement
 	VALUES(0,'Flatbed',0.02)
/
INSERT INTO tp1Equipement
 	VALUES(0,'ArearnFlatbed',8.0,4.8,5.4,208.0,0)
/
INSERT INTO tp1TypeEquipement
 	VALUES(0,'DryBox',0.05)
/
INSERT INTO tp1Equipement
 	VALUES(0,'ArearnDryBox',11.7,6.0,5.5,396.0,0)
/
INSERT INTO tp1TypeEquipement
 	VALUES(0,'Flatbed',0.02)
/
INSERT INTO tp1Equipement
 	VALUES(0,'SenoineFlatbed',8.0,4.8,5.4,208.0,0)
/
INSERT INTO tp1TypeEquipement
 	VALUES(0,'DryBox',0.05)
/
INSERT INTO tp1Equipement
 	VALUES(0,'SenoineDryBox',11.7,6.0,5.5,396.0,0)
/
INSERT INTO tp1Carburant
 	VALUES(0,'Regulier',1.10)
/
INSERT INTO tp1Tracteur
 	VALUES(0,'EarenamTracteurReg',20,1,0)
/
INSERT INTO tp1Camion
 	VALUES(0,10,0,0,'EarenamCamion')
/
INSERT INTO tp1Position
 	VALUES(0,'Montreal',43.6532,79.3832,1,0)
/
INSERT INTO tp1Tracteur
 	VALUES(0,'ArearnTracteurReg',20,1,0)
/
INSERT INTO tp1Camion
 	VALUES(0,12,0,0,'ArearnCamion')
/
INSERT INTO tp1Position
 	VALUES(0,'Toronto',45.5017,73.5673,1,0)
/
INSERT INTO tp1Tracteur
 	VALUES(0,'SenoineTracteurReg',20,1,0)
/
INSERT INTO tp1Camion
 	VALUES(0,14,0,0,'SenoineCamion')
/
INSERT INTO tp1Position
 	VALUES(0,'Calgary',51.0447,114.0719,1,0)
/
INSERT INTO tp1Carburant
 	VALUES(0,'Diesel',1.50)
/
INSERT INTO tp1Tracteur
 	VALUES(0,'EarenamTracteurDies',20,1,0)
/
INSERT INTO tp1Camion
 	VALUES(0,10,0,0,'EarenamCamion')
/
INSERT INTO tp1Position
 	VALUES(0,'Montreal',43.6532,79.3832,1,0)
/
INSERT INTO tp1Tracteur
 	VALUES(0,'ArearnTracteurDies',20,1,0)
/
INSERT INTO tp1Camion
 	VALUES(0,12,0,0,'ArearnCamion')
/
INSERT INTO tp1Position
 	VALUES(0,'Toronto',45.5017,73.5673,1,0)
/
INSERT INTO tp1Tracteur
 	VALUES(0,'SenoineTracteurDies',20,1,0)
/
INSERT INTO tp1Camion
 	VALUES(0,14,0,0,'SenoineCamion')
/
INSERT INTO tp1Position
 	VALUES(0,'Calgary',51.0447,114.0719,1,0)
/
INSERT INTO tp1DemandeSoumission
 	VALUES(0,15.00,0,to_date('2019/10/18', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Toronto-Mississauga',0,0,0,0,6.0,3.0,7.0,20.0,1,1.0,200.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Toronto-Mississauga',43.6532,79.3832,43.5890,79.6441,0,0)
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/10/18', 'yyyy/mm/dd'))
/                           
INSERT INTO tp1DemandeSoumission
 	VALUES(0,170.00,0,to_date('2019/10/17', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Calgary-Chestermere',0,1,0,0,7.0,6.0,3.0,30.0,1,1.0,300.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Calgary-Chestermere',51.0486,114.0719,51.0382,113.8425,0,0)
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/10/17', 'yyyy/mm/dd'))
/                            
INSERT INTO tp1DemandeSoumission
 	VALUES(0,190.00,0,to_date('2019/09/30', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Vancouver-West Vancouver',0,1,0,1,7.0,3.0,6.0,40.0,1,1.0,20.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Vancouver-West Vancouver',49.2827,123.1207,49.3286,123.1602,0,0) 
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/09/30', 'yyyy/mm/dd'))
/                            
INSERT INTO tp1DemandeSoumission
 	VALUES(0,20.00,0,to_date('2019/09/30', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Quebec-Levis',0,0,1,1,7.0,6.0,3.0,50.0,1,1.0,500.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Quebec-Levis',46.8139,71.2080,46.7382,71.2465,0,0)
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/09/30', 'yyyy/mm/dd'))
/                           
INSERT INTO tp1DemandeSoumission
 	VALUES(0,15.00,0,to_date('2019/09/30', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Montreal-Brossard',0,0,1,0,6.0,3.0,7.0,20.0,1,1.0,1000.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Montreal-Brossard',45.5017,73.5673,45.4514,73.4619,0,0)
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/09/30', 'yyyy/mm/dd'))
/                           
INSERT INTO tp1DemandeSoumission
 	VALUES(0,125.00,0,to_date('2019/09/30', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Montreal-Laval',1,1,1,0,7.0,6.0,3.0,40.0,1,1.0,5000.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Montreal-Laval',45.501,73.567,45.6066,73.7124,0,0) 
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/09/30', 'yyyy/mm/dd'))
/                            
INSERT INTO tp1DemandeSoumission
 	VALUES(0,160.00,0,to_date('2019/09/30', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Edmonton-Summerside',1,1,1,1,3.0,7.0,6.0,50.0,1,1.0,100.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Edmonton-Summerside',53.546,113.493,53.4158,113.4588,0,0) 
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/09/30', 'yyyy/mm/dd'))
/                            
INSERT INTO tp1DemandeSoumission
 	VALUES(0,12.00,0,to_date('2019/10/18', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Mississauga-Toronto',0,1,0,1,3.0,6.0,7.0,20.0,1,1.0,400.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Mississauga-Toronto',43.5890,79.6441,43.6532,79.3832,0,0)
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/10/18', 'yyyy/mm/dd'))
/                           
INSERT INTO tp1DemandeSoumission
 	VALUES(0,30.00,0,to_date('2019/10/15', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Winnipeg-Oakville',0,1,1,0,6.0,3.0,7.0,200.0,1,1.0,500.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Winnipeg-Oakville',49.895,97.138,49.9294,98.0039,0,0)
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/10/15', 'yyyy/mm/dd'))
/                           
INSERT INTO tp1DemandeSoumission
 	VALUES(0,5.00,0,to_date('2019/10/12', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Toronto-Mississauga',1,0,1,0,7.0,6.0,3.0,250.0,1,1.0,600.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Toronto-Mississauga',43.6532,79.3832,43.5890,79.6441,0,0)
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/10/12', 'yyyy/mm/dd'))
/                          
INSERT INTO tp1DemandeSoumission
 	VALUES(0,80.00,0,to_date('2019/10/13', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Toronto-Etobicoke',0,0,1,0,3.0,7.0,6.0,30.0,1,1.0,800.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Toronto-Etobicoke',43.6532,79.3832,43.6205,79.5132,0,0) 
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/10/13', 'yyyy/mm/dd'))
/
INSERT INTO tp1DemandeSoumission
 	VALUES(0,145.00,0,to_date('2019/10/10', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Edmonton-Sherwood Park',0,0,0,1,7.0,6.0,3.0,80.0,1,1.0,700.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Edmonton-Sherwood Park',53.546,113.49,53.5412,113.2957,0,0) 
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/10/10', 'yyyy/mm/dd'))
/                            
INSERT INTO tp1DemandeSoumission
 	VALUES(0,5.00,0,to_date('2019/10/17', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Hamilton-Mississauga',0,0,0,1,6.0,3.0,7.0,90.0,1,1.0,40.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Hamilton-Mississauga',43.2557,79.8711,43.5890,79.6441,0,0)
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/10/17', 'yyyy/mm/dd'))
/
COMMIT
/
