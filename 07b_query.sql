SET ECHO ON
-- Écrire le code nécessaire pour réinitialiser toutes les séquences qui existent dans la base de données
-- La séquence offrira comme première valeur 1 et augmentera de 1.
SET ECHO ON
CREATE OR REPLACE SEQUENCE tp2Client
(start with 1
 increment by 1
 minvalue 10
 maxvalue 100
 cycle
)
/
CREATE OR REPLACE SEQUENCE tp2DemandeSoumission
(start with 1
 increment by 1
 minvalue 10
 maxvalue 100
 cycle
)
/
CREATE OR REPLACE SEQUENCE tp2SoumissionE
(start with 1
 increment by 1
 minvalue 10
 maxvalue 100
 cycle
)
/
CREATE OR REPLACE SEQUENCE tp2Chargement
(start with 1
 increment by 1
 minvalue 10
 maxvalue 200
 cycle
)
/
CREATE OR REPLACE SEQUENCE tp2Route
(start with 1
 increment by 1
 minvalue 10
 maxvalue 20
 cycle
)
/
CREATE OR REPLACE SEQUENCE tp2Carburant
(start with 1
 increment by 1
 minvalue 10
 maxvalue 12
 cycle
)
/
CREATE OR REPLACE SEQUENCE tp2Compagnie
(start with 1
 increment by 1
 minvalue 10
 maxvalue 20
 cycle
)
/
CREATE OR REPLACE SEQUENCE tp2Camion
(start with 1
 increment by 1
 minvalue 10
 maxvalue 40
 cycle
)
/
CREATE OR REPLACE SEQUENCE tp2TypeEquipement
(start with 1
 increment by 1
 minvalue 10
 maxvalue 40
 cycle
)
/
CREATE OR REPLACE SEQUENCE tp2Equipement
(start with 1
 increment by 1
 minvalue 10
 maxvalue 40
 cycle
)
/
CREATE OR REPLACE SEQUENCE tp2Position
(start with 1
 increment by 1
 minvalue 10
 maxvalue 40
 cycle
)
/
CREATE OR REPLACE SEQUENCE tp2Tracteur
(start with 1
 increment by 1
 minvalue 10
 maxvalue 40
 cycle
)
/
COMMIT
/
