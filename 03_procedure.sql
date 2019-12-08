SET ECHO ON
-- Script Oracle SQL*plus de procedure. pour le travail pratique 2 - Modélisation et Conception d'une BD
-- Version sans accents
SET ECHO ON
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
CREATE OR REPLACE PROCEDURE ConsulterSoumissions 
(noClient tp1Chargement.pClient%TYPE) IS 
laRoute tp1Chargement.cChargement%TYPE; 
laSoumission tp1Chargement.pSoumission%TYPE;
lePrix tp1DemandeSoumission.nPrix%TYPE;
CURSOR lignesDétail 
(unClient tp1Chargement.pClient%TYPE)IS 
SELECT * FROM
(SELECT  tp1Chargement.cChargement, tp1Chargement.pSoumission, tp1DemandeSoumission.nPrix
FROM tp1Chargement JOIN  tp1DemandeSoumission
ON tp1Chargement.pSoumission = tp1DemandeSoumission.pSoumission
JOIN tp1Client
ON tp1Chargement.pClient = tp1Client.pClient
WHERE tp1Chargement.pClient = unClient
)
WHERE noClient = unClient; 
BEGIN 
DBMS_OUTPUT.PUT('Votre Client #:'); 
DBMS_OUTPUT.PUT_LINE(noClient);  
OPEN lignesDétail(noClient); 
LOOP 
FETCH lignesDétail INTO laRoute, laSoumission, lePrix; 
EXIT WHEN lignesDétail%NOTFOUND; 
DBMS_OUTPUT.PUT('La route : '); 
DBMS_OUTPUT.PUT(laRoute); 
DBMS_OUTPUT.PUT(' et ');
DBMS_OUTPUT.PUT('Votre soumission #: '); 
DBMS_OUTPUT.PUT_LINE(laSoumission); 
DBMS_OUTPUT.PUT('Prix a payer $: '); 
DBMS_OUTPUT.PUT_LINE(lePrix); 
END LOOP; 
CLOSE lignesDétail ; 
EXCEPTION 
WHEN OTHERS THEN 
RAISE_APPLICATION_ERROR(-20003,'erreur interne'); 
END ConsulterSoumissions;
/
CREATE OR REPLACE PROCEDURE ProduireFacture 
(noClient tp1Chargement.pClient%TYPE) IS 
laSoumission tp1Chargement.pSoumission%TYPE;
lePrix tp1DemandeSoumission.nPrix%TYPE;
laPayment tp1Client.cClient%TYPE;
CURSOR lignesDétail 
(unClient tp1Chargement.pClient%TYPE)IS 
SELECT * FROM
(SELECT  tp1Chargement.pSoumission, tp1DemandeSoumission.nPrix, tp1Client.cClient
FROM tp1Chargement JOIN  tp1DemandeSoumission
ON tp1Chargement.pSoumission = tp1DemandeSoumission.pSoumission
JOIN tp1Client
ON tp1Chargement.pClient = tp1Client.pClient
WHERE tp1Chargement.pClient = unClient
)
WHERE noClient = unClient; 
BEGIN 
DBMS_OUTPUT.PUT('Votre Client #:'); 
DBMS_OUTPUT.PUT_LINE(noClient);  
OPEN lignesDétail(noClient); 
LOOP 
FETCH lignesDétail INTO laSoumission, lePrix, laPayment; 
EXIT WHEN lignesDétail%NOTFOUND; 
DBMS_OUTPUT.PUT('Votre soumission #: '); 
DBMS_OUTPUT.PUT_LINE(laSoumission); 
DBMS_OUTPUT.PUT('Votre cout $: '); 
DBMS_OUTPUT.PUT_LINE(lePrix); 
DBMS_OUTPUT.PUT('Votre mode de payment: '); 
DBMS_OUTPUT.PUT_LINE(laPayment);
END LOOP; 
CLOSE lignesDétail ; 
EXCEPTION 
WHEN OTHERS THEN 
RAISE_APPLICATION_ERROR(-20004,'erreur interne'); 
END ProduireFacture;
/
CREATE OR REPLACE FUNCTION CoutTotalDuTrajet
(uneSoumission tp1DemandeSoumission.pSoumission%TYPE,
sourceOriLat tp1Route.nLatOri%TYPE,
sourceOriLong tp1Route.nLongOri%TYPE,
sourceDestLat tp1Route.nLatDes%TYPE,
sourceDestLong tp1Route.nLongDes%TYPE) RETURN NUMBER	
IS	
 prix INTEGER;
 rnDistance tp1Route.nDistance%TYPE;
 BEGIN	
 SELECT calculDistance (sourceOriLat,sourceOriLong,sourceDestLat,sourceDestLong) INTO rnDistance FROM DUAL;
 prix := rnDistance * 1.5; 	
 prix := prix * 1.18;	
 RETURN prix;	
END;
/
CREATE OR REPLACE FUNCTION TotalFacture
(uneSoumission tp1DemandeSoumission.pSoumission%TYPE) RETURN NUMBER	
IS	
 prix INTEGER;
 rnDistance tp1Route.nDistance%TYPE;
 rnConsommation tp1Tracteur.nConsommation%TYPE;
 CarburantnCout tp1Carburant.nCout%TYPE;
 TypeEnCout  tp1TypeEquipement.nCout%TYPE;
 rnProfit tp1Compagnie.nProfit%TYPE;
 BEGIN	
 
 SELECT tp1TypeEquipement.nCout INTO TypeEnCout	 	
    FROM tp1DemandeSoumission JOIN tp1Camion	 	
    ON tp1DemandeSoumission.pCamion = tp1Camion.pCamion	 	
    JOIN tp1Equipement	
    ON tp1Camion.pEquipement = tp1Equipement.pEquipement	
    JOIN tp1TypeEquipement	 
    ON tp1Equipement.pTypeEquipement = tp1TypeEquipement.pTypeEquipement
    WHERE tp1DemandeSoumission.pSoumission = uneSoumission; 

  SELECT tp1Route.nDistance INTO rnDistance	 	
    FROM tp1DemandeSoumission JOIN tp1Route	 	
    ON tp1DemandeSoumission.pSoumission = tp1Route.pSoumission	 	
    WHERE tp1DemandeSoumission.pSoumission = uneSoumission;
	
   SELECT tp1Tracteur.nConsommation INTO rnConsommation	 	
    FROM tp1DemandeSoumission JOIN tp1Camion	 	
    ON tp1DemandeSoumission.pCamion = tp1Camion.pCamion	 	
    JOIN tp1Tracteur	
    ON tp1Camion.pTracteur = tp1Tracteur.pTracteur	
    WHERE tp1DemandeSoumission.pSoumission = uneSoumission;
 
  SELECT tp1Carburant.nCout INTO CarburantnCout	 	
    FROM tp1DemandeSoumission JOIN tp1Camion	 	
    ON tp1DemandeSoumission.pCamion = tp1Camion.pCamion	 	
    JOIN tp1Tracteur	
    ON tp1Camion.pTracteur = tp1Tracteur.pTracteur
	JOIN tp1Carburant
	ON tp1Tracteur.pCarburant = tp1Carburant.pCarburant
    WHERE tp1DemandeSoumission.pSoumission = uneSoumission;

  SELECT tp1Compagnie.nProfit INTO rnProfit	 	
    FROM tp1DemandeSoumission JOIN tp1Camion	 	
    ON tp1DemandeSoumission.pCamion = tp1Camion.pCamion	
	JOIN tp1Compagnie
	ON tp1Camion.pCompagnie = tp1Compagnie.pCompagnie
    WHERE tp1DemandeSoumission.pSoumission = uneSoumission;
	
 prix := (rnConsommation * rnDistance * CarburantnCout) + (TypeEnCout * rnDistance) * rnProfit;	
 RETURN prix;	
END;
/
CREATE OR REPLACE FUNCTION PlusLongTrajet
(uneDate tp1DemandeSoumission.dateSoumission%TYPE) RETURN VARCHAR2
IS	
 rnDistance tp1Route.nDistance%TYPE;
 rnCamion tp1DemandeSoumission.pCamion%TYPE;
 BEGIN	
 
SELECT tp1Route.nDistance, tp1DemandeSoumission.pCamion INTO rnDistance , rnCamion
FROM tp1DemandeSoumission JOIN tp1Route
ON tp1DemandeSoumission.pSoumission = tp1Route.pSoumission
WHERE tp1DemandeSoumission.dateSoumission = uneDate
ORDER BY nDistance desc
FETCH  first 1 rows only;

 RETURN ' La distance: ' || rnDistance || ' et le camion: ' || rnCamion;	
END;
/             
COMMIT
/
