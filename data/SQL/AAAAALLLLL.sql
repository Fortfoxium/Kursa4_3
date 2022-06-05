CREATE TABLE USLUGA(
    ID_Med_Usl INTEGER NOT NULL,
    Med_Usl Char(50) NOT NULL
);
commit;

CREATE TABLE CABINET(
    Cab INTEGER NOT NULL,
    Name_Cab  Char(30) NOT NULL,
    ID_Doctor INTEGER NOT NULL
);
commit;
CREATE TABLE PROJIVANIE(
    ID_Proj    INTEGER NOT NULL ,
    Street Char(30) NOT NULL,
    Apart INTEGER NOT NULL,
    Building INTEGER NOT NULL,
    Region INTEGER NOT NULL
    
);
commit;

CREATE TABLE DOCTOR (
    ID_DOCTOR    INTEGER NOT NULL,
    FName_Doc Char(30) NOT NULL,
    Name_Doc Char(30) NOT NULL,
    OtchName_Doc Char(30) NOT NULL,
    Days_Pr Char(50) NOT NULL,
    Hours_Pr Char(10) NOT NULL
);
commit;

CREATE TABLE PACIENT (
    ID_PACIENT INTEGER NOT NULL,
    FName Char(30) NOT NULL,
    Name Char(30) NOT NULL,
    OtchName Char(30) NOT NULL,
    ID_Cart Char(5) NOT NULL,
    EMail Char(30),
    Tel Char(11) NOT NULL,
    OMS Char(16) NOT NULL,
    SerOMS Char(6),
    ID_Proj INTEGER NOT NULL 
);
commit;

CREATE TABLE TALON (
    ID_Talon     INTEGER NOT NULL,
    DateZap    Date NOT NULL,
    TimeZap   CHAR(15) NOT NULL,
    DATARAR  DATE NOT NULL,
    Cab INTEGER NOT NULL,
    ID_PACIENT    INTEGER NOT NULL,
    ID_Med_Usl INTEGER NOT NULL
);
commit;

alter table USLUGA add primary key (ID_Med_Usl);
commit;
alter table CABINET add primary key (Cab);
commit;
alter table PROJIVANIE add primary key (ID_Proj);
commit;
alter table DOCTOR add primary key (ID_DOCTOR);
commit;
alter table PACIENT add primary key (ID_PACIENT);
commit;
alter table TALON add primary key (ID_Talon);
commit;

ALTER TABLE talon ADD FOREIGN KEY (Cab ) REFERENCES CABINET (Cab );
COMMIT;
ALTER TABLE CABINET ADD FOREIGN KEY (ID_Doctor) REFERENCES DOCTOR (ID_Doctor);
COMMIT;
ALTER TABLE talon ADD FOREIGN KEY (ID_Med_Usl) REFERENCES usluga (ID_Med_Usl);
COMMIT;
ALTER TABLE pacient ADD FOREIGN KEY (ID_Proj) REFERENCES projivanie (ID_Proj);
COMMIT;
ALTER TABLE talon ADD FOREIGN KEY (ID_PACIENT) REFERENCES pacient (ID_PACIENT);
COMMIT;

CREATE GENERATOR CABINETgen;
commit;

CREATE GENERATOR DOCTORgen;
commit;

CREATE GENERATOR PACIENTgen;
commit;

CREATE GENERATOR PROJIVANIEgen;
commit;

CREATE GENERATOR TALONgen;
commit;

CREATE GENERATOR USLUGAgen;
commit;

