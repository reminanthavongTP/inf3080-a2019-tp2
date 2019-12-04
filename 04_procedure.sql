SET ECHO ON
-- Script Oracle SQL*plus de procedure. pour le travail pratique 2 - Modélisation et Conception d'une BD
-- Version sans accents
SET ECHO ON
CREATE OR REPLACE PROCEDURE ConsulterSoumissions
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
COMMIT
/
