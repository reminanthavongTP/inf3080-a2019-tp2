   # Travail pratique 2

   ## Description

   Utilisation et développement de programmes dans un SGBDR pour une compagnie de transport avec plusieurs camions.

   INF3080 A2019 UQAM

   ## Auteur

   Remi Nanthavong NANS24118900

   ## Fonctionnement
   
   Il y a deux facons: 
   
   ### Soit charger partie par partie

   1 - Charger le schema dans sqlplus (@01_schema.sql)
   
   2 - Charger les sequences dans sqlplus (@02_sequence.sql)
   
   3 - Charger les procedure/fonctions dans sqlplus (@03_procedure.sql)
   
   4 - Charger les gachettes dans sqlplus (@04_gachette.sql)
   
   5 - Charger les entrees dans sqlplus (@05_charger.sql)
   
   6 - Charger les tests dans sqlplus (@06_tester.sql)
   
   ### Soit charger avec une commande
   
   1 - Charger le schema dans sqlplus (@Fullload.sql)

   ## Exemple
   
   ### EXEC ConsulterSoumissions(14)
   
   Statement processed.
   
Votre Client #:14

La route : Toronto-Mississauga et Votre soumission #: 10

Prix a payer $: 15

La route : Winnipeg-Oakville et Votre soumission #: 26

Prix a payer $: 30


  ### EXEC ProduireFacture(14)
   
   Statement processed.
   
Votre Client #:14

Votre soumission #: 10

Votre cout $: 15

Votre mode de payment: VISA

Votre soumission #: 26

Votre cout $: 30

Votre mode de payment: VISA

 ###  SELECT CoutTotalDuTrajet(14,43.6532,79.3832,43.5890,79.6441) FROM DUAL
   
   COUTTOTALDUTRAJET(14,43.6532,79.3832,43.5890,79.6441)
   
25

 ###  SELECT TotalFacture(14) FROM DUAL
   
TOTALFACTURE(14)

109

   ## Contenu du projet

   01_schema.sql
   
   02_sequence.sql
   
   03_procedure.sql
   
   04_gachette.sql
   
   05_charger.sql
   
   06_tester.sql
   
   FullLoad.sql
   
   modele-tp1.png
   
   Main.java

   ## Références

  https://www.w3schools.com/sql/
  
  https://www.oracletutorial.com/oracle-basics/
  
  https://livesql.oracle.com/

   ## Statut

   Le projet est complété.
   
   ## Auto-évaluation de votre travail
   
   J'évalue mon livrable à 20 points / 25
   
   ## Difficultés rencontrées
   
   Creer les procedures/fonctions/gachettes
