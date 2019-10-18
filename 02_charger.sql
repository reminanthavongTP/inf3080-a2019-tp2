SET ECHO ON
-- Script Oracle SQL*plus de l'insertion pour le travail pratique 1 - Modélisation et Conception d'une BD
-- Version sans accents
-- INSERTION dans les tables
SET ECHO ON
INSERT INTO tp1Client
 	VALUES(1,'Luc','Samson','(999)999-9999',"luc.samson@email.ca")
/
INSERT INTO tp1Client
 	VALUES(2,'Oliwia','Beltran','(514)999-9999',"oliwia.beltran@email.ca")
/
INSERT INTO tp1Client
 	VALUES(3,'Kaidan','Key','(450)999-9999',"kaidan.key@email.ca")
/
INSERT INTO tp1Client
 	VALUES(4,'Ahmet','Benjamin','(418)999-9999',"ahmet.benjamin@email.ca")
/
INSERT INTO tp1Client
 	VALUES(5,'Shiv','Gardner','(403)999-9999',"sgardner@email.ca")
/
INSERT INTO tp1Client
 	VALUES(6,'Keelan','Tran','(204)999-9999',"ktran@email.ca")
/
INSERT INTO tp1Client
 	VALUES(7,'Kajol','Boyle','(709)999-9999',"kajol.boyle@email.ca")
/
INSERT INTO tp1Client
 	VALUES(8,'Shuaib','Kaiser','(613)999-9999',"Shuaib.Kaiser@email.ca")
/
INSERT INTO tp1Client
 	VALUES(9,'Saqlain','Kemp','(226)999-9999',"Saqlain.Kemp@email.ca")
/
INSERT INTO tp1Client
 	VALUES(10,'Junayd','Head','(519)999-9999',"Junayd.Head@email.ca")
/
INSERT INTO tp1Client
 	VALUES(11,'Abdulahi','Church','(306)999-9999',"Abdulahi.Church@email.ca")
/
INSERT INTO tp1DemandeSoumission
 	VALUES(000001,'Toronto','Ottawa','2019/10/18',0,0,0,0,6.0,3.0,7.0,1,1.0,200.00,1)
/
INSERT INTO tp1DemandeSoumission
 	VALUES(000002,'Calgary','Montreal','2019/10/17',0,1,0,0,7.0,6.0,3.0,1,1.0,300.00,1)
/
INSERT INTO tp1DemandeSoumission
 	VALUES(000003,'Vancouver','Ottawa','2019/09/30',0,1,0,1,7.0,3.0,6.0,1,1.0,20.00,2)
/
INSERT INTO tp1DemandeSoumission
 	VALUES(000004,'Quebec','Toronto','2019/09/30',0,0,1,1,7.0,6.0,3.0,1,1.0,500.00,3)
/
INSERT INTO tp1DemandeSoumission
 	VALUES(000005,'Montreal','Toronto','2019/09/30',0,0,1,0,6.0,3.0,7.0,1,1.0,1000.00,4)
/
INSERT INTO tp1DemandeSoumission
 	VALUES(000006,'Montreal','Regina','2019/09/30',1,1,1,0,7.0,6.0,3.0,1,1.0,5000.00,4)
/
INSERT INTO tp1DemandeSoumission
 	VALUES(000007,'Edmonton','Ottawa','2019/09/30',1,1,1,1,3.0,7.0,6.0,1,1.0,100.00,5)
/
INSERT INTO tp1DemandeSoumission
 	VALUES(000008,'Mississauga','Ottawa','2019/10/18',0,1,0,1,3.0,6.0,7.0,1,1.0,400.00,6)
/
INSERT INTO tp1DemandeSoumission
 	VALUES(000009,'Winnipeg','Edmonton','2019/10/15',0,1,1,0,6.0,3.0,7.0,1,1.0,500.00,7)
/
INSERT INTO tp1DemandeSoumission
 	VALUES(000010,'Toronto','Mississauga','2019/10/12',1,0,1,0,7.0,6.0,3.0,1,1.0,600.00,8)
/
INSERT INTO tp1DemandeSoumission
 	VALUES(000011,'Winnipeg','Brampton','2019/10/13',0,0,1,0,3.0,7.0,6.0,1,1.0,800.00,9)
/
INSERT INTO tp1DemandeSoumission
 	VALUES(000012,'Edmonton','Hamilton','2019/10/10',0,0,0,1,7.0,6.0,3.0,1,1.0,700.00,10)
/
INSERT INTO tp1DemandeSoumission
 	VALUES(000013,'Hamilton','Mississauga','2019/10/17',0,0,0,1,6.0,3.0,7.0,1,1.0,40.00,11)
/
INSERT INTO tp1Route
 	VALUES(000001,'exarij','Toronto-Ottawa',43.6532,79.3832,45.4215,75.6972,352.1)
/
INSERT INTO tp1Route
 	VALUES(000002,'ahiyut','Calgary-Montreal',51.0447,114.0719,45.5017,73.5673,3020.0)
/
INSERT INTO tp1Route
 	VALUES(000003,'imewak','Vancouver-Ottawa',49.2827,123.1207,45.4215,75.6972,3539.0)
/
INSERT INTO tp1Route
 	VALUES(000004,'agogox','Quebec-Toronto',46.8139,71.2080,43.6532,79.3832,729.8)
/
INSERT INTO tp1Route
 	VALUES(000005,'eximew','Montreal-Toronto',45.5017,73.5673,43.6532,79.3832,504.3)
/
INSERT INTO tp1Route
 	VALUES(000006,'aqikij','Montreal-Regina',45.5017,73.5673,50.4452,104.6189,2357.0)
/
INSERT INTO tp1Route
 	VALUES(000007,'ezahag','Edmonton-Ottawa',53.5461,113.4938,45.4215,75.6972,2837.0)
/
INSERT INTO tp1Route
 	VALUES(000008,'avitiq','Mississauga-Ottawa',43.5890,79.6441,45.4215,75.6972,373.4)
/
INSERT INTO tp1Route
 	VALUES(000009,'eracos','Winnipeg-Edmonton',49.8951,97.1384,53.5461,113.4938,1194.0)
/
INSERT INTO tp1Route
 	VALUES(000010,'ocesas','Toronto-Mississauga',43.6532,79.3832,43.5890,79.6441,22.18)
/
INSERT INTO tp1Route
 	VALUES(000011,'ukocuy','Winnipeg-Brampton',49.8951,97.1384,43.7315,79.7624,1484.0)
/
INSERT INTO tp1Route
 	VALUES(000012,'idemoq','Edmonton-Hamilton',53.5461,113.4938,43.2557,79.8711,2700.0)
/
INSERT INTO tp1Route
 	VALUES(000013,'ozihiv','Hamilton-Mississauga',43.2557,79.8711,43.5890,79.6441,41.35)
/
INSERT INTO tp1Proposition
 	VALUES(000001,000001,'2019/10/18','2019/10/20',15.00,5,1.20,10.09)
/
INSERT INTO tp1Proposition
 	VALUES(000002,000002,'2019/10/17','2019/10/21',170.00,6,1.20,151.0)
/
INSERT INTO tp1Proposition
 	VALUES(000003,000003,'2019/09/30','2019/10/01',190.00,2,1.20,176.95‬)
/
INSERT INTO tp1Proposition
 	VALUES(000004,000004,'2019/09/30','2019/10/01',20.00,1,1.20,14.60)
/
INSERT INTO tp1Proposition
 	VALUES(000005,000005,'2019/09/30','2019/10/02',15.00,3,1.20,10.09)
/
INSERT INTO tp1Proposition
 	VALUES(000006,000006,'2019/09/30','2019/10/03',125.00,4,1.20,117.85)
/
INSERT INTO tp1Proposition
 	VALUES(000007,000007,'2019/09/30','2019/10/01',160.00,6,1.20,141.85)
/
INSERT INTO tp1Proposition
 	VALUES(000008,000008,'2019/10/18','2019/10/19',12.00,5,1.20,7.47)
/
INSERT INTO tp1Proposition
 	VALUES(000009,000009,'2019/10/15','2019/10/17',30.00,5,1.20,22.18)
/
INSERT INTO tp1Proposition
 	VALUES(000010,000010,'2019/10/12','2019/10/14',5.00,1,1.20,0.44)
/
INSERT INTO tp1Proposition
 	VALUES(000011,000011,'2019/10/13','2019/10/16',80.00,3,1.20,74.2)
/
INSERT INTO tp1Proposition
 	VALUES(000012,000012,'2019/10/10','2019/10/11',145.00,5,1.20,135‬.0)
/
INSERT INTO tp1Proposition
 	VALUES(000013,000013,'2019/10/17','2019/10/18',5.00,1,1.20,0.83)
/
INSERT INTO tp1Compagnie
 	VALUES(1,'Earenam','(999)888-9999',"Earenam,@transport.ca",2)
/
INSERT INTO tp1Compagnie
 	VALUES(2,'Arearn','(514)777-9999',"Arearn@transport.ca",2)
/
INSERT INTO tp1Compagnie
 	VALUES(3,'Senoine','(450)666-9999',"Senoine@transport.ca",2)
/
INSERT INTO tp1Camion
 	VALUES(1,1,8.0,4.8,5.4,208.0)
/
INSERT INTO tp1Camion
 	VALUES(2,1,11.7,6.0,5.5,396.0)
/
INSERT INTO tp1Camion
 	VALUES(3,2,8.0,4.8,5.4,208.0)
/
INSERT INTO tp1Camion
 	VALUES(4,2,11.7,6.0,5.5,396.0)
/
INSERT INTO tp1Camion
 	VALUES(5,3,8.0,4.8,5.4,208.0)
/
INSERT INTO tp1Camion
 	VALUES(6,3,11.7,6.0,5.5,396.0)
/
INSERT INTO tp1TypeEquipement
 	VALUES(1,0,'NonTracteur',0.02)
/
INSERT INTO tp1TypeEquipement
 	VALUES(2,1,'AvecTracteur',0.05)
/
INSERT INTO tp1TypeEquipement
 	VALUES(3,0,'NonTracteur',0.02)
/
INSERT INTO tp1TypeEquipement
 	VALUES(4,1,'AvecTracteur',0.05)
/
INSERT INTO tp1TypeEquipement
 	VALUES(5,0,'NonTracteur',0.02)
/
INSERT INTO tp1TypeEquipement
 	VALUES(6,1,'AvecTracteur',0.05)
/
INSERT INTO tp1Position
 	VALUES(1,'GARAGEEarenam','GarageTORONTO',43.6532,79.3832,1)
/
INSERT INTO tp1Position
 	VALUES(2,'GARAGEEarenam','GarageTORONTO',43.6532,79.3832,1)
/
INSERT INTO tp1Position
 	VALUES(3,'GARAGEArearn','GarageMONTREAL',45.5017,73.5673,1)
/
INSERT INTO tp1Position
 	VALUES(4,'GARAGEArearn','GarageMONTREAL',45.5017,73.5673,1)
/
INSERT INTO tp1Position
 	VALUES(5,'GARAGESenoine','GarageCALGARY',51.0447,114.0719,1)
/
INSERT INTO tp1Position
 	VALUES(6,'GARAGESenoine','GarageCALGARY',51.0447,114.0719,1)
/
COMMIT
/
