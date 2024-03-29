SET ECHO ON
-- Script Oracle SQL*plus de l'insertion pour le travail pratique 1 - Modélisation et Conception d'une BD
-- Version sans accents
-- INSERTION dans les tables
SET ECHO ON
INSERT INTO tp1Client
 	VALUES(0,'VISA')
/
INSERT INTO tp1Client
 	VALUES(0,'Master Card')
/
INSERT INTO tp1Client
 	VALUES(0,'VISA')
/
INSERT INTO tp1Client
 	VALUES(0,'Master Card')
/
INSERT INTO tp1Client
 	VALUES(0,'American Express')
/
INSERT INTO tp1Client
 	VALUES(0,'VISA')
/
INSERT INTO tp1Client
 	VALUES(0,'Master Card')
/
INSERT INTO tp1Client
 	VALUES(0,'Master Card')
/
INSERT INTO tp1Client
 	VALUES(0,'VISA')
/
INSERT INTO tp1Client
 	VALUES(0,'American Express')
/
INSERT INTO tp1Client
 	VALUES(0,'VISA')
/
INSERT INTO tp1Compagnie
 	VALUES(0,'Earenam',10,1.18)
/
INSERT INTO tp1Compagnie
 	VALUES(0,'Arearn',10,1.18)
/
INSERT INTO tp1Compagnie
 	VALUES(0,'Senoine',10,1.18)
/
INSERT INTO tp1TypeEquipement
 	VALUES(0,'Flatbed',0.02)
/
INSERT INTO tp1Equipement
 	VALUES(0,'EarenamFlatbed',8.0,4.8,5.4,208.0,0)
/	
INSERT INTO tp1TypeEquipement
 	VALUES(0,'DryBox',0.05)
/
INSERT INTO tp1Equipement
 	VALUES(0,'EarenamDryBox',11.7,6.0,5.5,396.0,0)
/
INSERT INTO tp1TypeEquipement
 	VALUES(0,'Flatbed',0.02)
/
INSERT INTO tp1Equipement
 	VALUES(0,'ArearnFlatbed',8.0,4.8,5.4,208.0,0)
/
INSERT INTO tp1TypeEquipement
 	VALUES(0,'DryBox',0.05)
/
INSERT INTO tp1Equipement
 	VALUES(0,'ArearnDryBox',11.7,6.0,5.5,396.0,0)
/
INSERT INTO tp1TypeEquipement
 	VALUES(0,'Flatbed',0.02)
/
INSERT INTO tp1Equipement
 	VALUES(0,'SenoineFlatbed',8.0,4.8,5.4,208.0,0)
/
INSERT INTO tp1TypeEquipement
 	VALUES(0,'DryBox',0.05)
/
INSERT INTO tp1Equipement
 	VALUES(0,'SenoineDryBox',11.7,6.0,5.5,396.0,0)
/
INSERT INTO tp1Carburant
 	VALUES(0,'Regulier',1.10)
/
INSERT INTO tp1Tracteur
 	VALUES(0,'EarenamTracteurReg',20,1,0)
/
INSERT INTO tp1Camion
 	VALUES(0,10,0,0,'EarenamCamion')
/
INSERT INTO tp1Position
 	VALUES(0,'Montreal',43.6532,79.3832,1,0)
/
INSERT INTO tp1Tracteur
 	VALUES(0,'ArearnTracteurReg',20,1,0)
/
INSERT INTO tp1Camion
 	VALUES(0,12,0,0,'ArearnCamion')
/
INSERT INTO tp1Position
 	VALUES(0,'Toronto',45.5017,73.5673,1,0)
/
INSERT INTO tp1Tracteur
 	VALUES(0,'SenoineTracteurReg',20,1,0)
/
INSERT INTO tp1Camion
 	VALUES(0,14,0,0,'SenoineCamion')
/
INSERT INTO tp1Position
 	VALUES(0,'Calgary',51.0447,114.0719,1,0)
/
INSERT INTO tp1Carburant
 	VALUES(0,'Diesel',1.50)
/
INSERT INTO tp1Tracteur
 	VALUES(0,'EarenamTracteurDies',20,1,0)
/
INSERT INTO tp1Camion
 	VALUES(0,10,0,0,'EarenamCamion')
/
INSERT INTO tp1Position
 	VALUES(0,'Montreal',43.6532,79.3832,1,0)
/
INSERT INTO tp1Tracteur
 	VALUES(0,'ArearnTracteurDies',20,1,0)
/
INSERT INTO tp1Camion
 	VALUES(0,12,0,0,'ArearnCamion')
/
INSERT INTO tp1Position
 	VALUES(0,'Toronto',45.5017,73.5673,1,0)
/
INSERT INTO tp1Tracteur
 	VALUES(0,'SenoineTracteurDies',20,1,0)
/
INSERT INTO tp1Camion
 	VALUES(0,14,0,0,'SenoineCamion')
/
INSERT INTO tp1Position
 	VALUES(0,'Calgary',51.0447,114.0719,1,0)
/
INSERT INTO tp1DemandeSoumission
 	VALUES(0,15.00,0,to_date('2019/10/18', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Toronto-Mississauga',0,0,0,0,6.0,3.0,7.0,20.0,1,1.0,200.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Toronto-Mississauga',43.6532,79.3832,43.5890,79.6441,0,0)
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/10/18', 'yyyy/mm/dd'))
/                           
INSERT INTO tp1DemandeSoumission
 	VALUES(0,170.00,0,to_date('2019/10/17', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Calgary-Chestermere',0,1,0,0,7.0,6.0,3.0,30.0,1,1.0,300.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Calgary-Chestermere',51.0486,114.0719,51.0382,113.8425,0,0)
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/10/17', 'yyyy/mm/dd'))
/                            
INSERT INTO tp1DemandeSoumission
 	VALUES(0,190.00,0,to_date('2019/09/30', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Vancouver-West Vancouver',0,1,0,1,7.0,3.0,6.0,40.0,1,1.0,20.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Vancouver-West Vancouver',49.2827,123.1207,49.3286,123.1602,0,0) 
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/09/30', 'yyyy/mm/dd'))
/                            
INSERT INTO tp1DemandeSoumission
 	VALUES(0,20.00,0,to_date('2019/09/30', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Quebec-Levis',0,0,1,1,7.0,6.0,3.0,50.0,1,1.0,500.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Quebec-Levis',46.8139,71.2080,46.7382,71.2465,0,0)
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/09/30', 'yyyy/mm/dd'))
/                           
INSERT INTO tp1DemandeSoumission
 	VALUES(0,15.00,0,to_date('2019/09/30', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Montreal-Brossard',0,0,1,0,6.0,3.0,7.0,20.0,1,1.0,1000.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Montreal-Brossard',45.5017,73.5673,45.4514,73.4619,0,0)
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/09/30', 'yyyy/mm/dd'))
/                           
INSERT INTO tp1DemandeSoumission
 	VALUES(0,125.00,0,to_date('2019/09/30', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Montreal-Laval',1,1,1,0,7.0,6.0,3.0,40.0,1,1.0,5000.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Montreal-Laval',45.501,73.567,45.6066,73.7124,0,0) 
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/09/30', 'yyyy/mm/dd'))
/                            
INSERT INTO tp1DemandeSoumission
 	VALUES(0,160.00,0,to_date('2019/09/30', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Edmonton-Summerside',1,1,1,1,3.0,7.0,6.0,50.0,1,1.0,100.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Edmonton-Summerside',53.546,113.493,53.4158,113.4588,0,0) 
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/09/30', 'yyyy/mm/dd'))
/                            
INSERT INTO tp1DemandeSoumission
 	VALUES(0,12.00,0,to_date('2019/10/18', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Mississauga-Toronto',0,1,0,1,3.0,6.0,7.0,20.0,1,1.0,400.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Mississauga-Toronto',43.5890,79.6441,43.6532,79.3832,0,0)
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/10/18', 'yyyy/mm/dd'))
/                           
INSERT INTO tp1DemandeSoumission
 	VALUES(0,30.00,0,to_date('2019/10/15', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Winnipeg-Oakville',0,1,1,0,6.0,3.0,7.0,200.0,1,1.0,500.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Winnipeg-Oakville',49.895,97.138,49.9294,98.0039,0,0)
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/10/15', 'yyyy/mm/dd'))
/                           
INSERT INTO tp1DemandeSoumission
 	VALUES(0,5.00,0,to_date('2019/10/12', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Toronto-Mississauga',1,0,1,0,7.0,6.0,3.0,250.0,1,1.0,600.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Toronto-Mississauga',43.6532,79.3832,43.5890,79.6441,0,0)
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/10/12', 'yyyy/mm/dd'))
/                          
INSERT INTO tp1DemandeSoumission
 	VALUES(0,80.00,0,to_date('2019/10/13', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Toronto-Etobicoke',0,0,1,0,3.0,7.0,6.0,30.0,1,1.0,800.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Toronto-Etobicoke',43.6532,79.3832,43.6205,79.5132,0,0) 
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/10/13', 'yyyy/mm/dd'))
/
INSERT INTO tp1DemandeSoumission
 	VALUES(0,145.00,0,to_date('2019/10/10', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Edmonton-Sherwood Park',0,0,0,1,7.0,6.0,3.0,80.0,1,1.0,700.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Edmonton-Sherwood Park',53.546,113.49,53.5412,113.2957,0,0) 
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/10/10', 'yyyy/mm/dd'))
/                            
INSERT INTO tp1DemandeSoumission
 	VALUES(0,5.00,0,to_date('2019/10/17', 'yyyy/mm/dd'))
/
INSERT INTO tp1Chargement
 	VALUES(0,'Hamilton-Mississauga',0,0,0,1,6.0,3.0,7.0,90.0,1,1.0,40.00,0,0)
/
INSERT INTO tp1Route
 	VALUES(0,'Hamilton-Mississauga',43.2557,79.8711,43.5890,79.6441,0,0)
/
INSERT INTO tp1SoumissionE
 	VALUES(0,0,to_date('2019/10/17', 'yyyy/mm/dd'))
/
COMMIT
/
