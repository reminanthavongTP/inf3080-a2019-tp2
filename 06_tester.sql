SET ECHO ON
-- Script Oracle SQL*plus de creation du schema travail pratique 1 - Modélisation et Conception d'une BD
-- 
-- Test de la BD
-- 
SET ECHO ON

-- 
-- Test CHECK dans la table tp1Client - CHECK (cClient IN ('VISA','Master Card','American Express'))
-- 
INSERT INTO tp1Client
 	VALUES(0,'AMEX')
/
-- 
-- Test CHECK dans la table tp1Compagnie - CHECK (nCamion>=1)
-- 
INSERT INTO tp1Compagnie
 	VALUES(0,'TestCheck',0,1.18)
/
-- 
-- Test Trigger tp2ReduireCamion 
-- Réduire la quantité des camions que le transporteur possède en fonction de la quantité louée
SELECT nCamion FROM tp1Compagnie
/
INSERT INTO tp1DemandeSoumission
 	VALUES(0,15.00,0,to_date('2019/12/06', 'yyyy/mm/dd'))
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
SELECT nCamion FROM tp1Compagnie
/
-- 
-- Test Trigger tp2VerifierSoumission
-- Bloquer la réservation d’un camion lorsque le trajet est supérieur à 50 km
-- Bloquer la soumission si le trajet n’a pas été bien identifié
INSERT INTO tp1DemandeSoumission
 	VALUES(0,15.00,0,to_date('2019/12/06', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Toronto-Montreal',0,0,0,0,6.0,3.0,7.0,20.0,1,1.0,200.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Toronto-Montreal',43.6532,79.3832,45.5017,73.5673,0,0)
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/10/18', 'yyyy/mm/dd'))
/
INSERT INTO tp1DemandeSoumission
 	VALUES(0,15.00,0,to_date('2019/12/06', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Toronto-Montreal',0,0,0,0,6.0,3.0,7.0,20.0,1,1.0,200.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Toronto-Montreal',0,0,0,0,0,0)
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/10/18', 'yyyy/mm/dd'))
/
-- 
-- Test Trigger tp2CoutErreur
-- Bloquer la soumission si le coût de type d’équipement pour un camion ne sont pas différents. 
INSERT INTO tp1DemandeSoumission
 	VALUES(0,0.02,0,to_date('2019/12/06', 'yyyy/mm/dd'))
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
 	VALUES(0,0.05,0,to_date('2019/12/06', 'yyyy/mm/dd'))
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
-- 
-- Test PROCEDURE ConsulterSoumissions
-- 
EXEC ConsulterSoumissions(14)
/
EXEC ConsulterSoumissions(10)
/
EXEC ConsulterSoumissions(20)
/
-- 
-- Test PROCEDURE ProduireFacture 
-- 
EXEC ProduireFacture(14)
/
EXEC ProduireFacture(22)
/
EXEC ProduireFacture(18)
/
-- 
-- Test FUNCTION  CoutTotalDuTrajet 
-- 
SELECT CoutTotalDuTrajet(14,43.6532,79.3832,43.5890,79.6441) FROM DUAL
/
-- 
-- Test FUNCTION  TotalFacture 
-- 
SELECT TotalFacture(14) FROM DUAL
/
SELECT TotalFacture(10) FROM DUAL
/  
SELECT TotalFacture(12) FROM DUAL
/  
-- 
-- Test FUNCTION  PlusLongTrajet 
-- 
SELECT PlusLongTrajet('30-SEP-19') FROM DUAL
/
SELECT PlusLongTrajet('17-OCT-19') FROM DUAL
/  
SELECT PlusLongTrajet('18-OCT-19') FROM DUAL
/  
COMMIT
/
