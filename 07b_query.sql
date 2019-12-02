SET ECHO ON
-- Écrire le code nécessaire pour réinitialiser toutes les séquences qui existent dans la base de données
-- La séquence offrira comme première valeur 1 et augmentera de 1.
SET ECHO ON
SELECT tp1Compagnie.nomcompagnie, tp1camion.pcamion, tp1position.cposition, tp1position.ndisponible 
FROM ((tp1Compagnie
INNER JOIN tp1camion ON tp1Compagnie.pcompagnie = tp1camion.pcompagnie)
INNER JOIN tp1position ON tp1camion.pcamion = tp1position.pcamion)
WHERE tp1position.ndisponible = 0
/
