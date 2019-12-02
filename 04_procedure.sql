SET ECHO ON
-- Script Oracle SQL*plus de procedure. pour le travail pratique 2 - Modélisation et Conception d'une BD
-- Version sans accents
-- p_demande() p_soumission() p_commande() f_prix()
SET ECHO ON
CREATE OR REPLACE PROCEDURE p_demande(pClient, nLatOri, nLongOri, nLatDes, nLongDes, nPoids, nLargeur, nLongueur, nHauteur)
(@pChargement 		INTEGER 	= '0',
 @cChargement 		VARCHAR(30) 	= pClient + pChargement
 AS
 BEGIN
    INSERT INTO tp1Chargement (pChargement,cChargement,nLatOri,nLongOri,nLatDes,nLongDes,nLongueur,nLargeur,nHauteur,nPoids,pClient) 
    values (@pChargement,@cChargement,nLatOri,nLongOri,nLatDes,nLongDes,nLongueur,nLargeur,nHauteur,nPoids,pClient)
 END
)
/
CREATE OR REPLACE PROCEDURE p_soumission(pChargement)
(IS
 BEGIN
 dbms_output.put_line (‘Welcome '|| p_name);
 END
)
/
CREATE OR REPLACE PROCEDURE p_commande(pSoumissionD)
(IS
 BEGIN
 dbms_output.put_line (‘Welcome '|| p_name);
 END
)
/
CREATE OR REPLACE FUNCTION f_prix(pSoumissionD) RETURN NUMBER
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
COMMIT
/
