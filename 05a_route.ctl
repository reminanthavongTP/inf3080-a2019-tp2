SET ECHO ON
-- Script Oracle SQL*plus de creation des routes travail pratique 2 - Modélisation et Conception d'une BD
-- Version sans accents
SET ECHO ON
LOAD DATA
APPEND
INTO TABLE tp1Route
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
pRoute,
cRoute,
nLatOri,
nLongOri,
nLatDes,
nLongDes,
nDistance
)
/
COMMIT
/
