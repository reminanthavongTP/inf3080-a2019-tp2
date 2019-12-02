SET ECHO ON
-- Script Oracle SQL*plus de gachette pour le travail pratique 2 - Modélisation et Conception d'une BD
-- Version sans accents
-- INSERTION dans les tables
SET ECHO ON
create trigger tp2GachetteClients 
( before INSERT 
  on 
  tp1Client  
  for each row 
  set tp1Client.pClient = Student.subj1 + Student.subj2 + Student.subj3, Student.per = Student.total * 60 / 100
)
/
create trigger tp2GachetteDemandeSoumission
( before INSERT 
  on 
  tp1DemandeSoumission  
  for each row 
  set tp1DemandeSoumission.pSoumission = Student.subj1 + Student.subj2 + Student.subj3, Student.per = Student.total * 60 / 100
)
/
create trigger tp2GachetteSoumissionE
( before INSERT 
  on 
  tp1SoumissionE  
  for each row 
  set tp1SoumissionE.pSoumissionE = Student.subj1 + Student.subj2 + Student.subj3, Student.per = Student.total * 60 / 100
)
/
create trigger tp2GachetteChargement
( before INSERT 
  on 
  tp1Chargement  
  for each row 
  set tp1Chargement.pChargement = Student.subj1 + Student.subj2 + Student.subj3, Student.per = Student.total * 60 / 100
)
/
create trigger tp2GachetteRoute
( before INSERT 
  on 
  tp1Route  
  for each row 
  set tp1Route.pRoute = Student.subj1 + Student.subj2 + Student.subj3, Student.per = Student.total * 60 / 100
)
/
create trigger tp2GachetteCarburant
( before INSERT 
  on 
  tp1Carburant  
  for each row 
  set tp1Carburant.pCarburant = Student.subj1 + Student.subj2 + Student.subj3, Student.per = Student.total * 60 / 100
)
/
create trigger tp2GachetteCompagnie
( before INSERT 
  on 
  tp1Compagnie 
  for each row 
  set tp1Compagnie.pCompagnie = Student.subj1 + Student.subj2 + Student.subj3, Student.per = Student.total * 60 / 100
)
/
create trigger tp2GachetteCamion
( before INSERT 
  on 
  tp1Camion  
  for each row 
  set tp1Camion.pCamion = Student.subj1 + Student.subj2 + Student.subj3, Student.per = Student.total * 60 / 100
)
/
create trigger tp2GachetteTypeEquipement
( before INSERT 
  on 
  tp1TypeEquipement  
  for each row 
  set tp1TypeEquipement.pTypeEquipement = Student.subj1 + Student.subj2 + Student.subj3, Student.per = Student.total * 60 / 100
)
/
create trigger tp2GachetteEquipement
( before INSERT 
  on 
  tp1Equipement  
  for each row 
  set tp1Equipement.pEquipement  = Student.subj1 + Student.subj2 + Student.subj3, Student.per = Student.total * 60 / 100
)
/
create trigger tp2GachettePosition
( before INSERT 
  on 
  tp1Position  
  for each row 
  set tp1Position.pPosition  = Student.subj1 + Student.subj2 + Student.subj3, Student.per = Student.total * 60 / 100
)
/
create trigger tp2GachetteTracteur
( before INSERT 
  on 
  tp1Tracteur  
  for each row 
  set tp1Tracteur.pTracteur  = Student.subj1 + Student.subj2 + Student.subj3, Student.per = Student.total * 60 / 100
)
/
COMMIT
/
