CREATE SCHEMA gym;
CREATE TABLE branch (
 branchID CHAR(4) NOT NULL,
 country  VARCHAR(30),
 city     VARCHAR(30),
 street   VARCHAR(30),
 CONSTRAINT branch_PK PRIMARY KEY (branchID));
 
 CREATE TABLE branch_offer (
 branchID CHAR(4) NOT NULL,
 offer    VARCHAR(200) NOT NULL,
 CONSTRAINT  branch_offer_PK  PRIMARY KEY (branchID,offer),
 CONSTRAINT  branch_offer_FK FOREIGN KEY (branchID) REFERENCES branch(branchID) ON DELETE CASCADE  ON UPDATE CASCADE );

 
CREATE TABLE package (
packageID        CHAR(4) NOT NULL ,
packageName      VARCHAR(10) UNIQUE,
periode          VARCHAR(10),
cost             DECIMAL(6,2),
description1     VARCHAR(300),
CONSTRAINT package_PK PRIMARY KEY(packageID));

 CREATE TABLE class (
 classID   VARCHAR(6) NOT NULL,
 calssName VARCHAR(30),
 date1     DATE ,
 time1     VARCHAR(20),
 CONSTRAINT class_PK PRIMARY KEY(classID));
 
 CREATE TABLE workout_plan (
 planID    VARCHAR(6) NOT NULL,
 startDate DATE,
 endDate     DATE ,
 discription VARCHAR(100),
 price       DECIMAL(7,2),
 CONSTRAINT workout_plan_PK PRIMARY KEY(planID));
 

 CREATE TABLE coach (
 coachID   VARCHAR(6) NOT NULL,
 idNumber  CHAR(10) UNIQUE,
 fName     VARCHAR(20),
 lName     VARCHAR(20),
 country   VARCHAR(20),
 city      VARCHAR(20),
 street    VARCHAR(20),
 salary    DECIMAL (7, 3),
 CONSTRAINT coach_PK PRIMARY KEY (coachID));

CREATE TABLE coach_phoneNO (
coachID VARCHAR(6) NOT NULL,
phoneNO VARCHAR(10) NOT NULL,
CONSTRAINT coach_phoneNO_PK PRIMARY KEY (coachID,phoneNO),
CONSTRAINT coach_phoneNO_FK1 FOREIGN KEY (coachID) REFERENCES coach(coachID) ON DELETE CASCADE );


CREATE TABLE includes (
coachID VARCHAR(6) NOT NULL,
planID  VARCHAR(6) NOT NULL,
classID VARCHAR(6) NOT NULL,
CONSTRAINT includes_PK PRIMARY KEY (coachID, planID, classID),
CONSTRAINT includes_FK1 FOREIGN KEY (coachID) REFERENCES coach(coachID) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT includes_FK2 FOREIGN KEY (planID) REFERENCES workout_plan(planID) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT includes_FK3 FOREIGN KEY (classID ) REFERENCES class(classID ) ON DELETE CASCADE ON UPDATE CASCADE );

CREATE TABLE member1 (
membershipID    VARCHAR(6) NOT NULL,
idNumber        CHAR(10) UNIQUE,
fName           VARCHAR(20),
lName           VARCHAR(20),
age             INT(2),
registrationDate DATE,
packageID       CHAR(4),
branchID        CHAR(4),
planID          CHAR(6),
CONSTRAINT Member1_PK PRIMARY KEY (membershipID),
CONSTRAINT Member1_FK1 FOREIGN KEY (packageID) REFERENCES package(packageID) ON DELETE CASCADE  ON UPDATE CASCADE,
CONSTRAINT Member1_FK2 FOREIGN KEY (branchID) REFERENCES branch(branchID) ON DELETE SET NULL  ON UPDATE CASCADE,
CONSTRAINT Member1_FK3 FOREIGN KEY (planID) REFERENCES workout_plan(planID) ON DELETE SET NULL  ON UPDATE CASCADE);

CREATE TABLE member_phoneNO (
membershipID   VARCHAR(6) NOT NULL,
phoneNO        CHAR(10) NOT NULL,
CONSTRAINT membe_phoneNO_PK PRIMARY KEY (membershipID,phoneNO),
CONSTRAINT membe_phoneNO_FK FOREIGN KEY (membershipID) REFERENCES member1(membershipID) ON DELETE CASCADE ); 


CREATE TABLE dependent (
 childID       VARCHAR(6) NOT NULL,
 membershipID  VARCHAR(6)  NOT NULL,
 childName     VARCHAR(30),
 dateOfBirth   DATE ,
 gender        CHAR(1) CHECK(gender IN('F','M')),
 CONSTRAINT dependent_PK PRIMARY KEY(childID,membershipID),
 CONSTRAINT dependent_FK1 FOREIGN KEY (membershipID) REFERENCES member1(membershipID) ON DELETE CASCADE );

 INSERT INTO   branch
 VALUES('MH11','Saudi Arabia','Makkah','Al-Hajj');
 INSERT INTO   branch
 VALUES('JQ12','Saudi Arabia','Jeddah','Quraish');
 INSERT INTO   branch
 VALUES('RO13','Saudi Arabia','Riyadh','Al-olaya');
 INSERT INTO   branch
 VALUES('DD14' ,'Saudi Arabia','Al-Dammam','Al-dahran');
 INSERT INTO   branch
 VALUES('KR15','Saudi Arabia','Al-Khobar','Al-Rawabi');
 INSERT INTO   branch
 VALUES('RK16','Saudi Arabia','Riyadh','Al-Khaldiyah');
 INSERT INTO   branch
 VALUES('Rm17','Saudi Arabia','Riyadh','Al-Hmraa');
 

 INSERT INTO   branch_offer
 VALUES('MH11','Join our gym NOW and get voucher for purchase from adidas');
 INSERT INTO   branch_offer
 VALUES('MH11','Show up Your Student ID card and get Healthy Meals for 3 months free from diet STORE');
 INSERT INTO   branch_offer
 VALUES('JQ12','Join our gym NOW and get voucher for purchase from adidas' );
 INSERT INTO   branch_offer
 VALUES('JQ12','6-month subscription and get Healthy Meals for 3 months free from diet STORE' );
 INSERT INTO   branch_offer
 VALUES('RO13','Show up Your Student ID card and get Healthy Meals for 3 months free from diet STORE' );
 INSERT INTO   branch_offer
 VALUES('RO13','Come with Your frinds and get A ticket to World Cup Qatar2022');
 INSERT INTO   branch_offer
 VALUES('DD14','Come with 3 of your frinds and get A ticket to World Cup Qatar2022' );
 INSERT INTO   branch_offer
 VALUES('KR15','Join our gym NOW and get voucher for purchase from adidas' );
 INSERT INTO   branch_offer
 VALUES('KR15','Show up Your Student ID card and get Healthy Meals for 3 months free from diet STORE' );
 INSERT INTO branch_offer
 VALUES('KR15','When you subsecribe for 6 months , you have a chance to enter the anuual draw to get Bently Car' );
 INSERT INTO   branch_offer
 VALUES('RK16','Come with Your frinds and get A ticket to World Cup Qatar2022' );
 INSERT INTO   branch_offer
 VALUES('RK16','Join our gym NOW and get voucher for purchase from adidas' ); 
 INSERT INTO   branch_offer
 VALUES('Rm17','When you subsecribe for 6 months , you have a chance to enter the anuual draw to get Bently Car');
 
INSERT INTO package
VALUES('PG11','Platinum','1-month','500','Training in one class during the day and use gym equepments');
INSERT INTO package
VALUES('PG12','Silver','3-month','1200','Training in three classes during the day and access to dance class and use gym equepments');
INSERT INTO package
VALUES('PG13','Bronze','6-month','2000','Unlimited access to classes and access to dance class and use gym equipments and personal swimming coach');
INSERT INTO package
VALUES('PG14','Gold','1-year','3300','Unlimited access to classes, access to dance class, use gym equepments personlized eating plan, unlimited use of massage chairs and personal trainer');
INSERT INTO package
VALUES('PG15','Weekly','1-week','120','Use gym equepments');


INSERT INTO class 
VALUES ('CS601','YOGA',STR_TO_DATE('5-08-22','%d-%m-%y'),'7:30-8:00 PM');
INSERT INTO class 
VALUES ('CS602','CARDIO',STR_TO_DATE('12-08-22','%d-%m-%y'),'5:30-6:00 PM');
INSERT INTO class 
VALUES ('CS603','ZUMBA',STR_TO_DATE('17-08-22','%d-%m-%y'),'3:30-4:00 PM');
INSERT INTO class 
VALUES ('CS604','BODY COMBAT',STR_TO_DATE('20-08-22','%d-%m-%y'),'10:30-10:55 AM');
INSERT INTO class 
VALUES ('CS605','BODY BALANCE',STR_TO_DATE('27-08-22','%d-%m-%y'),'12:15-1:00 PM');

INSERT INTO workout_plan
VALUES ('LW319',STR_TO_DATE('5-11-2022','%d-%m-%Y'),STR_TO_DATE('4-07-2022','%d-%m-%Y'),'Lose weight', 180.50);
INSERT INTO workout_plan
VALUES ('GMM571',STR_TO_DATE('15-11-2022','%d-%m-%Y'),STR_TO_DATE('15-1-2023','%d-%m-%Y'),'Gain muscle mass', 200.99);
INSERT INTO workout_plan
VALUES ('GS681',STR_TO_DATE('6-11-2022','%d-%m-%Y'),STR_TO_DATE('6-02-2023','%d-%m-%Y'),'Get Shredded', 299.00);
INSERT INTO workout_plan
VALUES ('WF111',STR_TO_DATE('10-10-2022','%d-%m-%Y'),STR_TO_DATE('10-04-2023','%d-%m-%Y'),'Weight fixing', 120.00);
INSERT INTO workout_plan
VALUES('LS481',STR_TO_DATE('4-09-2022','%d-%m-%Y'),STR_TO_DATE('4-11-2022','%d-%m-%Y'),'Learnning to swim', 90.00);
INSERT INTO workout_plan
VALUES('LS690',STR_TO_DATE('4-08-2022','%d-%m-%Y'),STR_TO_DATE('4-01-2022','%d-%m-%Y'),'Lose weight', 150.00);
INSERT INTO workout_plan
VALUES('MA990',STR_TO_DATE('7-11-2023','%d-%m-%Y'),STR_TO_DATE('12-02-2024','%d-%m-%Y'),'muscle amplification', 250.00);
INSERT INTO workout_plan
VALUES('WL678',STR_TO_DATE('8-08-2023','%d-%m-%Y'),STR_TO_DATE('12-12-2023','%d-%m-%Y'),'weight lifting', 200.00);
INSERT INTO workout_plan
VALUES('QD111',STR_TO_DATE('15-11-2022','%d-%m-%Y'),STR_TO_DATE('15-01-2023','%d-%m-%Y'),'improve health', 230.99);
INSERT INTO workout_plan
VALUES('RW571',STR_TO_DATE('22-09-2022','%d-%m-%Y'),STR_TO_DATE('6-12-2023','%d-%m-%Y'),'healthy Weight gain', 300.00);
INSERT INTO workout_plan
VALUES('LK681',STR_TO_DATE('1-11-2022','%d-%m-%Y'),STR_TO_DATE('10-04-2023','%d-%m-%Y'),'Lose weight', 140.00);

 INSERT INTO coach
 VALUES ('C101','1124573836','Maram','Alrasheed','Saudi Arabia','Makkah','Al-Shawgiyah',2500.00);
 INSERT INTO  coach
 VALUES ('C102','1023858564','Sara','Alharbi','Saudi Arabia','Jeddah','Hiraa',2500.00);
 INSERT INTO  coach
 VALUES ('C103','1118593052','Ahlam','Alshreef','Saudi Arabia','Riyadh','Al-Rashid',3000.00);
 INSERT INTO  coach
 VALUES ('C104','1485920492','Raghad','Aljohani','Saudi Arabia','Al-Khobar','Al-Tahliya',2000.00);
 INSERT INTO  coach
 VALUES ('C105','1749647659','Samar','Alahmadi','Saudi Arabia','Al-Dammam','Al-dahran',3500.00);

 INSERT INTO coach_phoneNO
 VALUES ('C101','0567774623');
 INSERT INTO coach_phoneNO
 VALUES ('C101','0563425493');
 INSERT INTO gym.coach_phoneNO
 VALUES ('C101','0564525420');
 INSERT INTO coach_phoneNO
 VALUES ('C102','0574535382');
 INSERT INTO coach_phoneNO
 VALUES ('C102','0573425662');
 INSERT INTO coach_phoneNO
 VALUES ('C102','0577437639');
 INSERT INTO coach_phoneNO
 VALUES ('C103','0567639832');
 INSERT INTO coach_phoneNO
 VALUES ('C103','0564328739');
 INSERT INTO coach_phoneNO
 VALUES ('C103','0565399832');
 INSERT INTO coach_phoneNO
 VALUES ('C104','0573245678');
 INSERT INTO coach_phoneNO
 VALUES ('C104','0573422316');
 INSERT INTO coach_phoneNO
 VALUES ('C104','0574373185');
 INSERT INTO coach_phoneNO
 VALUES ('C105','0594537639');
 INSERT INTO coach_phoneNO
 VALUES ('C105','0597633732');
 INSERT INTO coach_phoneNO
 VALUES ('C105','0594328739');
 
INSERT INTO member1
VALUES('101M','1114573836','Norah','Alhazmi',18,STR_TO_DATE('5-Nov-2022','%d-%b-%Y'),'PG11','MH11', 'LW319');
INSERT INTO member1
VALUES('102M','1123858564','Lina','Aljhani',30,STR_TO_DATE('1-Nov-2022','%d-%b-%Y'),'PG12','JQ12','GMM571');
INSERT INTO member1
VALUES ('103M','1111593052','Samia','Alharbi',22,STR_TO_DATE('22-Sep-2021','%d-%b-%Y'),'PG13','RO13','GS681');
INSERT INTO member1
VALUES ('104M','1485420492','Raghad','Alshrif',19,STR_TO_DATE('14-Aug-2022','%d-%b-%Y'),'PG14','DD14','WF111' );
INSERT INTO member1
VALUES ('105M','474964769','Ghaida','Katfi',23,STR_TO_DATE('1-Aug-2022','%d-%b-%Y'), 'PG15','KR15', NULL);
INSERT INTO member1
VALUES ('109M','8664893249','Reem','Alharbi',19,STR_TO_DATE('4-Aug-2022','%d-%b-%Y'), 'PG13','MH11', 'LS690');
INSERT INTO member1
VALUES ('110M','5634588566','Soha','Alotabi',24,STR_TO_DATE('7-NOV-2023','%d-%b-%Y'), 'PG11','Rm17', 'MA990');
INSERT INTO member1
VALUES ('111M','8634598543','Rana','Althbiti',25,STR_TO_DATE('8-AUG-2023','%d-%b-%Y'), 'PG12','MH11', 'WL678');
INSERT INTO member1
VALUES ('112M','5789576465','wafa','Althagafi',20,STR_TO_DATE('9-Oct-2023','%d-%b-%Y'), 'PG14','RO13', NULL);
INSERT INTO member1
VALUES ('113M','863679356','Rwan','Althbiti',21,STR_TO_DATE('12-NOV-2023','%d-%b-%Y'), 'PG13','JQ12', NULL);
INSERT INTO member1
VALUES ('114M','5434643290','Hana','Alotabi',22,STR_TO_DATE('21-Oct-2023','%d-%b-%Y'), 'PG15','RO13', NULL);
INSERT INTO member1
VALUES('115M','199157345','Afnan','Alhazmi',18,STR_TO_DATE('22-SEP-2022','%d-%b-%Y'),'PG11','MH11', 'RW571');
INSERT INTO member1
VALUES('116M','1243858564','Lama','Aljhani',30,STR_TO_DATE('1-Nov-2022','%d-%b-%Y'),'PG12','JQ12','LK681');
INSERT INTO member1
VALUES('117M','171593052','Raghad','Alotabi',22,STR_TO_DATE('15-Nov-2022','%d-%b-%Y'),'PG13','RO13','QD111');
INSERT INTO member1
VALUES('118M','474334769','Salma','Alharbi',23,STR_TO_DATE('1-Aug-2022','%d-%b-%Y'),'PG15','KR15', NULL);
INSERT INTO member1
VALUES('119M','925378656','Rand','Althbiti',23,STR_TO_DATE('6-Nov-2022','%d-%b-%Y'),'PG12','KR15', NULL);
INSERT INTO member1
VALUES ('120M','7427576466','Elaf','Althagafi',23,STR_TO_DATE('2-Oct-2022','%d-%b-%Y'),'PG15','RO13', NULL);

INSERT INTO member_phoneNO
VALUES ('101M','0555765123');
INSERT INTO member_phoneNO
VALUES ('101M','0557653245');
INSERT INTO member_phoneNO
VALUES ('101M','0557753856');

INSERT INTO member_phoneNo
VALUES('102M','0555189234');
insert into member_phoneNo
VALUES('102M','0556827835');
INSERT INTO member_phoneNo
VALUES('102M','0555346255');
INSERT INTO member_phoneNo
VALUES('103M','0506763993');
INSERT INTO member_phoneNo
VALUES('103M','0565528739');
INSERT INTO member_phoneNo
VALUES('103M','0569999832');

INSERT INTO member_phoneNo
VALUES('104M','0578945938');
INSERT INTO member_phoneNo
VALUES('104M','0573828516');
INSERT INTO member_phoneNo
VALUES('104M','0567247346');

INSERT INTO member_phoneNo
VALUES('105M','0597434339');
INSERT INTO member_phoneNo
VALUES('105M','0597659332');
INSERT INTO member_phoneNo
VALUES('105M','0594427823');

INSERT INTO member_phoneNo
VALUES('109M','0549558467');
INSERT INTO member_phoneNo
VALUES('109M','0531082349');
INSERT INTO member_phoneNo
VALUES('109M','0566674333');

INSERT INTO member_phoneNo
VALUES('110M','0531796553');
INSERT INTO member_phoneNo
VALUES('110M','0537651349');
INSERT INTO member_phoneNo
VALUES('110M','0588427827');

INSERT INTO member_phoneNo
VALUES('111M','055894369');
INSERT INTO member_phoneNo
VALUES('111M','0578659356');
INSERT INTO member_phoneNo
VALUES('111M','0568547829');

INSERT INTO member_phoneNo
VALUES('112M','055878909');
INSERT INTO member_phoneNo
VALUES('112M','0589559356');
INSERT INTO member_phoneNo
VALUES('112M','056857865');

INSERT INTO member_phoneNo
VALUES('113M','0558943J69');
INSERT INTO member_phoneNo
VALUES('113M','0578865935');
INSERT INTO member_phoneNo
VALUES('113M','0567548289');

INSERT INTO member_phoneNo
VALUES('114M','055807377');
INSERT INTO member_phoneNo
VALUES('114M','0578659349');
INSERT INTO member_phoneNo
VALUES('114M','0574247888');

INSERT INTO member_phoneNo
VALUES('115M','0551796553');
INSERT INTO member_phoneNo
VALUES('115M','0587651349');
INSERT INTO member_phoneNo
VALUES('115M','0568427827');

INSERT INTO member_phoneNo
VALUES('116M','0538943694');
INSERT INTO member_phoneNo
VALUES('116M','0598659356');
INSERT INTO member_phoneNo
VALUES('116M','0568547829');

INSERT INTO member_phoneNo
VALUES('117M','0568725728');
INSERT INTO member_phoneNo
VALUES('117M','0546385292');
INSERT INTO member_phoneNo
VALUES('117M','0592847292');

INSERT INTO member_phoneNo
VALUES('118M','0594564789');
INSERT INTO member_phoneNo
VALUES('118M','0563629203');
INSERT INTO member_phoneNo
VALUES('118M','0585582682');

INSERT INTO member_phoneNo
VALUES('119M','0547083894');
INSERT INTO member_phoneNo
VALUES('119M','0521994638');
INSERT INTO member_phoneNo
VALUES('119M','0593639403');

INSERT INTO member_phoneNo
VALUES('120M','0563883894');
INSERT INTO member_phoneNo
VALUES('120M','0504294638');
INSERT INTO member_phoneNo
VALUES('120M','0557239403');

INSERT INTO dependent 
VALUE ('ch231','101M','ahmad',STR_TO_DATE('23-04-2018','%d-%m-%Y'),'M');
INSERT INTO dependent 
VALUE ('ch639','102M','lama',STR_TO_DATE('15-03-2019','%d-%m-%Y'),'F');
INSERT INTO dependent 
VALUE ('ch232','104M','sara',STR_TO_DATE('14-05-2017','%d-%m-%Y'),'F');
INSERT INTO dependent 
VALUE('ch739','105M','saeed',STR_TO_DATE('10-10-2018','%d-%m-%Y'),'M');
INSERT INTO dependent 
VALUE('ch283','105M','ruba',STR_TO_DATE('9-12-2019','%d-%m-%Y'),'F');


INSERT INTO includes
VALUES ('C101','LW319','CS601');
iNSERT INTO includes
VALUES ('C102','GMM571','CS602');
INSERT INTO includes
VALUES ('C103','GS681','CS603');
INSERT INTO includes
VALUES ('C104','WF111','CS604');
INSERT INTO includes 
VALUES('C105','LS481','CS605');
INSERT INTO includes 
VALUES('C101','LS690','CS602');
INSERT INTO includes 
VALUES('C103','MA990','CS604');
INSERT INTO includes
VALUES ('C101','RW571','CS601');
iNSERT INTO includes
VALUES ('C102','LK681','CS602');
INSERT INTO includes
VALUES ('C103','QD111','CS603');

SELECT fName, lName
FROM   member1
WHERE  branchID IN (SELECT  branchID 
                    FROM    branch
                    WHERE   city='Jeddah');
                    
SELECT  street, offer
FROM branch b, branch_offer o
WHERE b.branchID = o.branchID AND city = 'Riyadh';

SELECT packageName, COUNT(membershipID) AS count
FROM member1 m, package p 
WHERE m.packageID = p.packageID
GROUP BY  packageName
ORDER BY count DESC;

CREATE VIEW TotalPrice1 AS
SELECT membershipID,price AS planPrice ,cost AS packagePrice, (cost+price) as TotalPrice
FROM workout_plan W, package p, member1 m
WHERE m.packageID = p.packageID AND w.planID = m.planID ;

CREATE VIEW TotalPrice2 AS
SELECT membershipID, planID AS planPrice ,cost AS packagePrice, (cost+0) as TotalPrice
FROM  package p, member1 m
WHERE m.packageID = p.packageID AND planID IS NULL;

SELECT * FROM totalprice1
UNION ALL
SELECT * FROM totalprice2;

SELECT s.membershipID, Fname AS preant_First_Name , lname AS preant_Last_Name ,childID
FROM member1 s ,dependent d
WHERE d.membershipID = s.membershipID;
                        
SELECT childID,childName,dateOfBirth,gender,TIMESTAMPDIFF(YEAR,dateOfBirth,CURDATE()) AS age
FROM dependent;

SELECT DISTINCT city, COUNT(membershipID) AS count_Of_members
FROM member1 m, branch b 
WHERE m.branchID = b.branchID
GROUP BY  city
ORDER BY count_Of_members DESC;

CREATE VIEW coach_member AS  
SELECT coachID,m.planID,fName,membershipID
FROM includes i,member1 m
where i.planID=m.planID
ORDER BY coachID;

SELECT *
FROM coach_member;

CREATE VIEW MemberPlanInfo AS 
SELECT  membershipID,m.fName AS member_first_name,m.lName AS member_last_name,m.planID,concat('from ',startDate,'  To  ',endDate) AS DurationOfPlan , ch.fName AS Coach_first_name,ch.lName AS Coach_last_name,c.calssName,date1 AS DateOFClass,time1 AS TimofClass
FROM member1 m,includes i,class c, workout_plan W ,coach ch
WHERE m.planID=i.planID AND i.classID=c.classID AND i.planID=W.planID AND ch.coachID=i.coachID
ORDER BY m.fname;

SELECT *
FROM MemberPlanInfo;

SELECT  b.branchID, COUNT(offer) AS count ,b.offer AS most_Popular_Offer,br.city 
FROM branch_offer b, branch br
WHERE b.branchID = br.branchID
GROUP BY  branchID
HAVING count>1
ORDER BY count DESC;

SELECT fName AS coach_First_Name ,lName AS coach_Last_Name , COUNT(planID) AS NumberOfMembers
FROM   coach c , includes i
WHERE  c.coachID=i.coachID 
GROUP BY fName ;

CREATE VIEW coachInfo AS 
SELECT coachID ,ch.fName AS coach_first_name,ch.lName AS coach_last_name,W.discription AS plan_Discription ,
m.fName AS member_first_name,m.lName AS member_last_name
FROM member1 m,includes i, workout_plan W ,coach ch
WHERE m.planID=i.planID AND i.planID=W.planID And ch.coachID=i.coachID
ORDER BY ch.coachID;

SELECT *
FROM coachInfo;

UPDATE member_phoneNo
SET phoneNo='0558942198'
WHERE phoneNo='0555346255';

UPDATE coach
SET salary = salary+1500
 WHERE coachID IN (SELECT coachID 
                   FROM includes
                   GROUP BY coachID
                   HAVING count(classID)>2);

DELETE  m , p
FROM member1 m ,workout_plan p
WHERE  m.planID=p.planID AND m.membershipID='101M';

DELETE FROM member1
WHERE planID IS NULL AND membershipID='105M';

 DELETE FROM branch_offer
 WHERE offer = 'Join our gym NOW and get voucher for purchase from adidas';
 








                                        
											
                                                
                                                


 