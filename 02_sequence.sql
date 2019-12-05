SET ECHO ON
-- Script Oracle SQL*plus de sequence pour le travail pratique 2 - Modélisation et Conception d'une BD
-- Version sans accents
-- INSERTION dans les tables
SET ECHO ON
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
 cycle

/
CREATE SEQUENCE tp2DemandeSoumission
 start with 10
 increment by 2
 minvalue 10
 maxvalue 100
 cycle

/
CREATE SEQUENCE tp2SoumissionE
 start with 10
 increment by 2
 minvalue 10
 maxvalue 100
 cycle

/
CREATE SEQUENCE tp2Chargement
 start with 10
 increment by 2
 minvalue 10
 maxvalue 200
 cycle

/
CREATE SEQUENCE tp2Route
 start with 10
 increment by 2
 minvalue 10
 maxvalue 20
 cycle

/
CREATE SEQUENCE tp2Carburant
 start with 10
 increment by 2
 minvalue 10
 maxvalue 12
 cycle

/
CREATE SEQUENCE tp2Compagnie
 start with 10
 increment by 2
 minvalue 10
 maxvalue 20
 cycle

/
CREATE SEQUENCE tp2Camion
 start with 10
 increment by 2
 minvalue 10
 maxvalue 40
 cycle

/
CREATE SEQUENCE tp2TypeEquipement
 start with 10
 increment by 2
 minvalue 10
 maxvalue 40
 cycle

/
CREATE SEQUENCE tp2Equipement
 start with 10
 increment by 2
 minvalue 10
 maxvalue 40
 cycle

/
CREATE SEQUENCE tp2Position
 start with 10
 increment by 2
 minvalue 10
 maxvalue 40
 cycle

/
CREATE SEQUENCE tp2Tracteur
 start with 10
 increment by 2
 minvalue 10
 maxvalue 40
 cycle

/
COMMIT
/
