SET ECHO ON
-- Écrire (un script) le code pour effacer tous les tuples de toutes les tables qui sont dans la base de données;
SET ECHO ON
select pSoumission,origine,destination from tp1DemandeSoumission where pclient = 4 and datesoumission = '2019/09/30'
/
