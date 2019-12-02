SET ECHO ON
-- Donner des droits à l'usager francoeur_g
-- Écrire la commande qui donne le droit lecture sur la table compagnie et la vue v_tables;
-- Écrire la commande qui donne le droit d'exécution sur la fonction f_prix(...);
-- Écrire la commande qui donne le droit de modification sur la table TypeEquipement;
SET ECHO ON

GRANT SELECT ON v_tables TO francoeur_g
/
GRANT EXECUTE ON f_prix() TO francoeur_g
/
GRANT ALL PRIVILEGES ON tp1TypeEquipement TO francoeur_g
/
