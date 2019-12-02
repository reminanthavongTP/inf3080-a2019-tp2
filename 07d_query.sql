SET ECHO ON
-- Écrire le les intructions nécessaire, sous la forme d'un tutoriel markdown (étapes), 
-- pour afin d'inclure dans la base de données le programme Java f_prix2( ... ) qui est disponible dans la classe Transport. 
-- L'implémentation de la classe est dans le fichier Transport.java.
SET ECHO ON
CREATE OR REPLACE VIEW entites AS
SELECT tp1camion.tracteur, tp1camion.pcamion, tp1camion.pcompagnie,tp1camion.lenght,tp1camion.width,tp1camion.height,tp1camion.capacity,tp1typeequipement.ctypeequipement 
FROM tp1camion
FULL OUTER JOIN tp1typeequipement ON tp1camion.pcamion = tp1typeequipement.pcamion;
/
SELECT * FROM entites
/
