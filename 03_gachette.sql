SET ECHO ON
-- Script Oracle SQL*plus de gachette pour le travail pratique 2 - Modélisation et Conception d'une BD
-- Version sans accents
-- INSERTION dans les tables
SET ECHO ON
create trigger tp2GachetteClients 
( before INSERT 
  on 
  Student 
  for each row 
  set Student.total = Student.subj1 + Student.subj2 + Student.subj3, Student.per = Student.total * 60 / 100
)
/
create trigger tp2GachetteDemandeSoumission
( before INSERT 
  on 
  Student 
  for each row 
  set Student.total = Student.subj1 + Student.subj2 + Student.subj3, Student.per = Student.total * 60 / 100
)
/
create trigger tp2GachetteSoumissionE
( before INSERT 
  on 
  Student 
  for each row 
  set Student.total = Student.subj1 + Student.subj2 + Student.subj3, Student.per = Student.total * 60 / 100
)
/
create trigger tp2GachetteChargement
( before INSERT 
  on 
  Student 
  for each row 
  set Student.total = Student.subj1 + Student.subj2 + Student.subj3, Student.per = Student.total * 60 / 100
)
/
create trigger tp2GachetteRoute
( before INSERT 
  on 
  Student 
  for each row 
  set Student.total = Student.subj1 + Student.subj2 + Student.subj3, Student.per = Student.total * 60 / 100
)
/
create trigger tp2GachetteCarburant
( before INSERT 
  on 
  Student 
  for each row 
  set Student.total = Student.subj1 + Student.subj2 + Student.subj3, Student.per = Student.total * 60 / 100
)
/
create trigger tp2GachetteCompagnie
( before INSERT 
  on 
  Student 
  for each row 
  set Student.total = Student.subj1 + Student.subj2 + Student.subj3, Student.per = Student.total * 60 / 100
)
/
create trigger tp2GachetteCamion
( before INSERT 
  on 
  Student 
  for each row 
  set Student.total = Student.subj1 + Student.subj2 + Student.subj3, Student.per = Student.total * 60 / 100
)
/
create trigger tp2GachetteTypeEquipement
( before INSERT 
  on 
  Student 
  for each row 
  set Student.total = Student.subj1 + Student.subj2 + Student.subj3, Student.per = Student.total * 60 / 100
)
/
create trigger tp2GachetteEquipement
( before INSERT 
  on 
  Student 
  for each row 
  set Student.total = Student.subj1 + Student.subj2 + Student.subj3, Student.per = Student.total * 60 / 100
)
/
create trigger tp2GachettePosition
( before INSERT 
  on 
  Student 
  for each row 
  set Student.total = Student.subj1 + Student.subj2 + Student.subj3, Student.per = Student.total * 60 / 100
)
/
create trigger tp2GachetteTracteur
( before INSERT 
  on 
  Student 
  for each row 
  set Student.total = Student.subj1 + Student.subj2 + Student.subj3, Student.per = Student.total * 60 / 100
)
/
COMMIT
/
