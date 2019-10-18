SET ECHO ON
-- Script Oracle SQL*plus de creation du schema VentesPleinDeFoin 
-- Version sans accents

-- Creation des tables
SET ECHO ON
CREATE TABLE tp1Client
(pClient 		INTEGER 		NOT NULL,
 nomClient 		VARCHAR(20) 	NOT NULL,
 prenomClient 		VARCHAR(20) 	NOT NULL,
 noTelephone 	VARCHAR(15) 	NOT NULL,
 email 	VARCHAR(15) 	NOT NULL,
 PRIMARY KEY 	(pClient)
)
/
CREATE TABLE tp1DemandeSoumission
(pSoumission 		INTEGER 		NOT NULL,
 origine 		VARCHAR(20) 	NOT NULL,
 destination 		VARCHAR(20) 	NOT NULL,
 dateSoumission 	DATE 	NOT NULL,
 pClient 		INTEGER 		NOT NULL,
 PRIMARY KEY 	(pSoumission)
 FOREIGN KEY 	(pClient) REFERENCES tp1Client
)
/
CREATE TABLE tp1Requis
(pSoumission 		INTEGER 		NOT NULL,
 refrigerated 		BIT 	NOT NULL,
 dock 		BIT 	NOT NULL,
 hazardous 	BIT 	NOT NULL,
 rush 		BIT 		NOT NULL,
 FOREIGN KEY 	(pSoumission) REFERENCES tp1DemandeSoumission
)
/
CREATE TABLE tp1Varias
(pSoumission 		INTEGER 		NOT NULL,
 lenght		FLOAT 	NOT NULL,
 width 		FLOAT  	NOT NULL,
 height 	FLOAT  	NOT NULL,
 quantity 	FLOAT  	NOT NULL,
 hours 	FLOAT  	NOT NULL,
 valeur 	FLOAT  	NOT NULL,
 FOREIGN KEY 	(pSoumission) REFERENCES tp1DemandeSoumission
)
/
CREATE TABLE tp1Route
(pSoumission 		INTEGER 		NOT NULL,
 pRoute 		VARCHAR(30) 	NOT NULL,
 cRoute 		VARCHAR(30) 	NOT NULL,
 nLatOri 	FLOAT(8) 	NOT NULL,
 nLatDes 		FLOAT(8) 		NOT NULL,
 nLongOri 	FLOAT(8) 	NOT NULL,
 nLongDes 		FLOAT(8) 		NOT NULL,
 nDistance 		FLOAT(8) 		NOT NULL,
 FOREIGN KEY 	(pSoumission) REFERENCES tp1DemandeSoumission
)
/
CREATE TABLE tp1FacteurPrix
(pSoumission 		INTEGER 		NOT NULL,
 prixCarburant 	FLOAT(8) 	NOT NULL,
 consommation 		FLOAT(8) 		NOT NULL,
 margeProfit		FLOAT(3) 		DEFAULT 1.18,
 FOREIGN KEY 	(pSoumission) REFERENCES tp1DemandeSoumission
)
/
CREATE TABLE tp1Proposition
(pProposition 		INTEGER 		NOT NULL,
 pSoumission 		INTEGER 		NOT NULL,
 datePickup 	DATE 	NOT NULL,
 dateDelivery 		DATE 		NOT NULL,
 estimation		FLOAT(3) 		NOT NULL,
 tCamion		VARCHAR(20) 		NOT NULL,
 PRIMARY KEY 	(pProposition)
 FOREIGN KEY 	(pSoumission) REFERENCES tp1DemandeSoumission
)
/
CREATE TABLE tp1Compagnie
(pCompagnie 		INTEGER 		NOT NULL,
 nomCompagnie 		VARCHAR(20) 	NOT NULL,
 noTelephone 	VARCHAR(15) 	NOT NULL,
 email 	VARCHAR(15) 	NOT NULL,
 nbCamion INTEGER NOT NULL,
 PRIMARY KEY 	(pCompagnie)
)
/
CREATE TABLE tp1Camion
(pCamion 		INTEGER 		NOT NULL,
 pCompagnie 		INTEGER 		NOT NULL,
 PRIMARY KEY 	(pCamion)
 FOREIGN KEY 	(pCompagnie) REFERENCES tp1Compagnie
)
/
CREATE TABLE tp1TypeEquipement
(pCamion 		INTEGER 		NOT NULL,
 pTypeEquipement INTEGER NOT NULL,
 cTypeEquipement VARCHAR(30) NOT NULL,
 nCout FLOAT(8) NOT NULL,
 FOREIGN KEY 	(pCamion) REFERENCES tp1Camion
)
/
CREATE TABLE tp1Position
(pCamion 		INTEGER 		NOT NULL,
 pPosition		VARCHAR(30) 	NOT NULL,
 cPosition 		VARCHAR(30) 	NOT NULL,
 nLat 	FLOAT(8) 	NOT NULL,
 nLong 	FLOAT(8) 	NOT NULL,
 nDisponible		BIT		NOT NULL,
 FOREIGN KEY 	(pCamion) REFERENCES tp1Camion
)
/
CREATE TABLE tp1Remorque
(pCamion 		INTEGER 		NOT NULL,
 lenght		FLOAT 	NOT NULL,
 width 		FLOAT  	NOT NULL,
 height 	FLOAT  	NOT NULL,
 capacity	FLOAT  	NOT NULL,
 FOREIGN KEY 	(pCamion) REFERENCES tp1Camion
)
/
COMMIT
/
