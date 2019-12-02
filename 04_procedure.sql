SET ECHO ON
-- Script Oracle SQL*plus de procedure. pour le travail pratique 2 - Modélisation et Conception d'une BD
-- Version sans accents
-- p_demande() p_soumission() p_commande() f_prix()
SET ECHO ON
CREATE OR REPLACE PROCEDURE p_demande()
(IS
 BEGIN
 dbms_output.put_line (‘Welcome '|| p_name);
 END
)
/
CREATE OR REPLACE PROCEDURE p_soumission()
(IS
 BEGIN
 dbms_output.put_line (‘Welcome '|| p_name);
 END
)
/
CREATE OR REPLACE PROCEDURE p_commande()
(IS
 BEGIN
 dbms_output.put_line (‘Welcome '|| p_name);
 END
)
/
CREATE OR REPLACE FUNCTION f_prix() RETURN VAR.CHAR2
(IS
 BEGIN
 RETURN (‘Welcome ‘|| p_name);
 END
)
/
COMMIT
/
