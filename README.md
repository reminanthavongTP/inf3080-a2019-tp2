   # Travail pratique 2

   ## Description

   Utilisation et développement de programmes dans un SGBDR pour une compagnie de transport avec plusieurs camions.

   INF3080 A2019 UQAM

   ## Auteur

   Remi Nanthavong NANS24118900

   ## Fonctionnement

   1 - Charger le schema dans sqlplus (@01_schema.sql)
   
   2 - Charger les entres dans sqlplus (@02_charger.sql)
   
   3 -  Exemple a) Pour afficher tous les demande de soumission fait par les clients en affichant seulement Origine et Destination
                  
                    SELECT pclient,origine,destination FROM tp1DemandeSoumission;
                    PCLIENT    ORIGINE              DESTINATION
                    ---------- -------------------- --------------------
                    1          Toronto              Ottawa
                    1          Calgary              Montreal
                    2          Vancouver            Ottawa
                    3          Quebec               Toronto
                    4          Montreal             Toronto
                    
        Exemple b) Pour afficher liste les camions qui sont presentement en voyage
                  SELECT tp1Compagnie.nomcompagnie, tp1camion.pcamion, tp1position.cposition, tp1position.ndisponible 
                  FROM ((tp1Compagnie
                  INNER JOIN tp1camion ON tp1Compagnie.pcompagnie = tp1camion.pcompagnie)
                  INNER JOIN tp1position ON tp1camion.pcamion = tp1position.pcamion)
                  WHERE tp1position.ndisponible = 0
                  
                  ou
                  
                  @04a_query.sql

               NOMCOMPAGNIE            PCAMION CPOSITION                      NDISPONIBLE
               -------------------- ---------- ------------------------------ -----------
                  Earenam                       7 AWAY                                     0
                  Senoine                       8 AWAY                                     0


   ## Contenu du projet

   01_schema.sql
   
   02_sequence.sql
   
   03_gachette.sql
   
   04_procedure.sql
   
   05a_route.txt
   
   05a_route.ctl
   
   05a_route.log
   
   05a_route.sh
   
   05b_charger.sql
   
   06_tester.sql
   
   07a_query.sql
   
   07b_query.sql
   
   07c_query.sql
   
   07d_query.md
   
   07e_query.sql
   
   08_algebre-tp1.pdf

   ## Références

  https://www.w3schools.com/sql/
  
  https://www.oracletutorial.com/oracle-basics/

   ## Statut

   Le projet est complété.
   
   ## Auto-évaluation de votre travail
   
   J'évalue mon livrable à 10 points / 15
