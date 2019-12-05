SET ECHO ON
-- Script Oracle SQL*plus de creation du schema travail pratique 1 - Modélisation et Conception d'une BD
-- Version sans accents
-- Enlever les tables existantes
-- Creation des tables
SET ECHO ON
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
 nPrix 		NUMBER 		NOT NULL,
 pCamion 		INTEGER 		NOT NULL,
 dateSoumission 	DATE 	NOT NULL,
 PRIMARY KEY 	(pSoumission),
 FOREIGN KEY 	(pCamion) REFERENCES tp1Camion
)
/
CREATE TABLE tp1Route
(pRoute 		INTEGER 	NOT NULL,
 cRoute 		VARCHAR(30) 	NOT NULL,
 nLatOri 	NUMBER(8,5) 	NOT NULL,
 nLongOri 	NUMBER(8,5) 	NOT NULL,
 nLatDes 		NUMBER(8,5) 		NOT NULL,
 nLongDes 		NUMBER(8,5) 		NOT NULL,
 nDistance 		NUMBER(8,5) 		NOT NULL,
 pSoumission 		INTEGER 		NOT NULL,
 FOREIGN KEY 	(pSoumission) REFERENCES tp1DemandeSoumission,
 PRIMARY KEY 	(pRoute)
)
/
CREATE TABLE tp1Chargement
(pChargement 		INTEGER 	NOT NULL,
 cChargement 		VARCHAR(30) 	NOT NULL,
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
 FOREIGN KEY 	(pClient) REFERENCES tp1Client
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
 nLat NUMBER(8,5) NOT NULL,
 nLong NUMBER(8,5) NOT NULL,
 bDisponible INTEGER NOT NULL,
 pCamion 		INTEGER 		NOT NULL,
 PRIMARY KEY    (pPosition),
 FOREIGN KEY 	(pCamion) REFERENCES tp1Camion
)
/
COMMIT
/
