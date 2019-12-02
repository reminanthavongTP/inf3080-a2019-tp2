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
 PRIMARY KEY 	(pClient)
)
/
CREATE TABLE tp1DemandeSoumission
(pSoumission 		INTEGER 		NOT NULL,
 nPrix 		INTEGER 		NOT NULL,
 pCamion 		INTEGER 		NOT NULL,
 PRIMARY KEY 	(pSoumission),
 FOREIGN KEY 	(pCamion) REFERENCES tp1Camion
)
/
CREATE TABLE tp1Route
(pRoute 		VARCHAR(30) 	NOT NULL,
 cRoute 		VARCHAR(30) 	NOT NULL,
 nLatOri 	FLOAT(8) 	NOT NULL,
 nLongOri 	FLOAT(8) 	NOT NULL,
 nLatDes 		FLOAT(8) 		NOT NULL,
 nLongDes 		FLOAT(8) 		NOT NULL,
 nDistance 		FLOAT(8) 		NOT NULL,
 CHECK (nDistance>0),
 PRIMARY KEY 	(pRoute)
)
/
CREATE TABLE tp1Compagnie
(pCompagnie 		INTEGER 		NOT NULL,
 cCompagnie 		VARCHAR(20) 	NOT NULL,
 nProfit      INTEGER      NOT NULL,
 PRIMARY KEY 	(pCompagnie)
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
CREATE TABLE tp1TypeEquipement
(pTypeEquipement INTEGER NOT NULL,
 cTypeEquipement VARCHAR(30) NOT NULL,
 nCout FLOAT(8) NOT NULL,
 PRIMARY KEY    (pTypeEquipement)
)
/
CREATE TABLE tp1Equipement
(pEquipement INTEGER NOT NULL,
 cEquipement VARCHAR(30) NOT NULL,
 nCapacite INTEGER NOT NULL,
 nLongueur INTEGER NOT NULL,
 nLargeur INTEGER NOT NULL,
 nHauteur INTEGER NOT NULL,
 pTypeEquipement INTEGER NOT NULL,
 PRIMARY KEY    (pTypeEquipement),
 FOREIGN KEY 	(pTypeEquipement) REFERENCES tp1TypeEquipement
)
/
CREATE TABLE tp1SoumissionE
(pSoumissionE		INTEGER 		NOT NULL,
 pChargement   INTEGER 		NOT NULL,
 dSoumission   INTEGER 		NOT NULL,
 PRIMARY KEY 	(pSoumissionE),
 FOREIGN KEY 	(pChargement) REFERENCES tp1Chargement
)
/
CREATE TABLE tp1Tracteur
(pTracteur INTEGER NOT NULL,
 cTracteur VARCHAR(30) NOT NULL,
 nConsommation FLOAT(8) NOT NULL,
 bActif        INTEGER NOT NULL,
 pCarburant    INTEGER NOT NULL,
 PRIMARY KEY    (pTypeEquipement),
 FOREIGN KEY 	(pCarburant) REFERENCES tp1Carburant
)
/
CREATE TABLE tp1Carburant
(pCarburant INTEGER NOT NULL,
 cCarburant VARCHAR(30) NOT NULL,
 nCout INTEGER NOT NULL,
 PRIMARY KEY    (pCarburant)
)
/
CREATE TABLE tp1Position
(pPosition INTEGER NOT NULL,
 cPosition VARCHAR(30) NOT NULL,
 nLat INTEGER NOT NULL,
 nLong INTEGER NOT NULL,
 bDisponible INTEGER NOT NULL,
 PRIMARY KEY    (pPosition)
)
COMMIT
/
