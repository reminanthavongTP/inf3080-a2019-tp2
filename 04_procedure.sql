SET ECHO ON
-- Script Oracle SQL*plus de procedure. pour le travail pratique 2 - Modélisation et Conception d'une BD
-- Version sans accents
SET ECHO ON
CREATE OR REPLACE PROCEDURE ConsulterSoumissions 
(noSoumissionE tp1SoumissionE.pSoumissionE%TYPE, 
noDate tp1SoumissionE.dSoumission%TYPE) IS 
leCamion tp1DemandeSoumission.pCamion%TYPE; 
lePrix tp1DemandeSoumission.nPrix%TYPE; 
CURSOR lignesDétail 
(unnoSoumissionE tp1SoumissionE.pSoumissionE%TYPE, 
unnoDate tp1SoumissionE.dSoumission%TYPE)IS 
SELECT tp1DemandeSoumission.pCamion, tp1DemandeSoumission.nPrix 
FROM tp1SoumissionE JOIN tp1Chargement 
ON tp1SoumissionE.pChargement = tp1Chargement.pChargement 
JOIN tp1DemandeSoumission 
ON tp1Chargement.pSoumission = tp1DemandeSoumission.pSoumission 
WHERE noSoumissionE = unnoSoumissionE AND 
noDate = unnoDate; 
BEGIN 
DBMS_OUTPUT.PUT('Votre Soumission #:'); 
DBMS_OUTPUT.PUT_LINE(noSoumissionE); 
DBMS_OUTPUT.PUT('Date:'); 
DBMS_OUTPUT.PUT_LINE(noDate); 
OPEN lignesDétail(noSoumissionE, noDate); 
LOOP 
FETCH lignesDétail INTO leCamion, lePrix; 
EXIT WHEN lignesDétail%NOTFOUND; 
DBMS_OUTPUT.PUT('Le Camion assigné :'); 
DBMS_OUTPUT.PUT(leCamion); 
DBMS_OUTPUT.PUT('Votre Cout :'); 
DBMS_OUTPUT.PUT_LINE(lePrix); 
END LOOP; 
CLOSE lignesDétail ; 
EXCEPTION 
WHEN OTHERS THEN 
RAISE_APPLICATION_ERROR(-20001,'erreur interne'); 
END ConsulterSoumissions;
/
CREATE OR REPLACE PROCEDURE ProduireFacture
(
(Soumission tp1DemandeSoumission.pSoumission%TYPE) 
IS
laSoumission tp1DemandeSoumission.pSoumission%TYPE;
-- Déclaration d'un curseur (CURSOR) PL/SQL pour itérer sur les lignes
CURSOR lignesDetail
(unSoumission tp1DemandeSoumission.pSoumission%TYPE)
IS
SELECT pSoumission, pCamion, dateSoumission
FROM tp1DemandeSoumission
WHERE Soumission = unSoumission;
BEGIN
DBMS_OUTPUT.PUT('noSoumission #:');
DBMS_OUTPUT.PUT_LINE(Soumission);
OPEN lignesDetail(Soumission);
LOOP
FETCH lignesDetail INTO laSoumission;
EXIT WHEN lignesDetail%NOTFOUND;
DBMS_OUTPUT.PUT('noSoumission #:');
DBMS_OUTPUT.PUT(laSoumission);
END LOOP;
CLOSE lignesDetail ;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20001,'erreur interne');
END afficherLivraisons
)
/
CREATE OR REPLACE FUNCTION CoutTotalDuTrajet
(uneSoumission tp1DemandeSoumission.pSoumission%TYPE,
sourceOriLat tp1Route.nLatOri%TYPE,
sourceOriLong tp1Route.nLongOri%TYPE,
sourceDestLat tp1Route.nLatDes%TYPE,
sourceDestLong tp1Route.nLongDes%TYPE) RETURN NUMBER	
(IS	
 prix INTEGER;	
 BEGIN	
 prix = tp1Tracteur.nConsommation * tp1Chargement.nDistance * tp1Chargement.nCout; 	
 prix = prix + (tp1TypeEquipement.nCount * tp1Chargement.nDistance); 	
 prix = prix * tp1Compagnie.nProfit;	
 RETURN prix;	
 END	
)
/
CREATE OR REPLACE FUNCTION TotalFacture
(uneFacture tp1SoumissionE.pSoumissionE%TYPE)
RETURN tp1DemandeSoumission.nPrix%TYPE IS
unPrix tp1DemandeSoumission.nPrix%TYPE;
BEGIN
SELECT quantitéEnStock
INTO unPrix
FROM Article
WHERE noArticle = unNoArticle;
RETURN unPrix;
END TotalFacture;
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
COMMIT
/
