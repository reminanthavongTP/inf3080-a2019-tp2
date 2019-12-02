SET ECHO ON
-- Écrire le code pour créer une vue nommée v_tables qui liste les tables et le nombre de lignes que chacune contient. 
-- Dans ce script (fichier) vous devez faire, écrire, tout ce qui est nécessaire pour arriver à un résultat exact.
SET ECHO ON

CREATE OR REPLACE VIEW v_tables AS
  SELECT
   COUNT (table_name) "NbLignes", owner
  FROM
   all_tables
  WHERE
   table_name LIKE 'TP1%'
  ORDER BY
   owner, table_name DESC
  
/  

