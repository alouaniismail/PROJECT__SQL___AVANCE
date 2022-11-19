-- ============================================================
--   Nom de la base   :  Parking_campus
--   Nom du fichier   :  base.sql
--   Nom de SGBD      :  ORACLE Version 7.0
--   Date de creation :  19/11/2022  01:43
-- ============================================================

--Format des dates de la session
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-DD-MM HH24:MI';

-- ============================================================
-- ============================================================
--                           DROP
-- ============================================================
-- ============================================================


drop table COMMUNES cascade constraints;
drop table PARKINGS cascade constraints;
drop table PLACES cascade constraints;
drop table STATIONNEMENTS cascade constraints;
drop table VEHICULES cascade constraints;

drop sequence NUMERO_PARKING_seq;
drop sequence NUMERO_PLACE_seq;
drop sequence ID_STATIONNEMENT_seq;

-- ============================================================
-- ============================================================
--                   CREATE TABLE/CREATE SEQUENCE
-- ============================================================
-- ============================================================

-- ============================================================
--   Table : COMMUNES
-- ============================================================

create table COMMUNES
(
CODE_POSTAL	NUMBER(5)	not null,
NOM_COMMUNE	CHAR(20)	not null,
constraint pk_commune PRIMARY KEY (CODE_POSTAL)
);

-- ============================================================
--   Table : PARKINGS
-- ============================================================

create sequence NUMERO_PARKING_seq
       minvalue 1
       maxvalue 999
       start with 1
       increment by 1
       cache 10;

create table PARKINGS
(
NUMERO_PARKING	NUMBER(3)	not null,
NOM_PARKING 	CHAR(30)	not null,
ADRESSE		CHAR(40)	not null,
TARIF_HORAIRE 	NUMBER(4)	not null,
CAPACITE 	NUMBER(5)	not null,
constraint pk_parking PRIMARY KEY(NUMERO_PARKING),
check(CAPACITE >= 1),
check(TARIF_HORAIRE >= 1),
);


-- ============================================================
--   Table : PLACES
-- ============================================================

create sequence NUMERO_PLACE_seq
       minvalue 1
       maxvalue 999
       start with 1
       increment by 1
       cache 10;

create table PLACES
(
NUMERO_PLACE	NUMBER(5)	not null,
NOM_PLACE	NUMBER(10)	not null,
--chaque numero correspond a une signification particuliere de la place
--d'ou un nom attribue(on procede de cette maniere).
constraint pk_place PRIMARY KEY(NUMERO_PLACE)
);

-- ============================================================
--   Table : STATIONNEMENTS
-- ============================================================

create sequence ID_STATIONNEMENT_seq
       minvalue 1
       maxvalue 999
       start with 1
       increment by 1
       cache 10;


create table STATIONNEMENTS
(
ID_STATIONNEMENT	NUMBER(4)	not null,
DATE_STATIONNEMENT 	DATE		not null,
HORAIRE_SORTIE		DATE		not null,
constraint pk_stationnement PRIMARY KEY(ID_STATIONNEMENT)
);

-- ============================================================
--   Table : VEHICULES
-- ============================================================

create table VEHICULES
(
NUMERO_IMMATRICULATION	CHAR(11)	not null,
MARQUE 			CHAR(17)	not null,
DATE_DE_MISE_EN_CIRCULATION		DATE	not null,
KILOMETRAGE 				NUMBER(7)   not null,
ETAT					CHAR(8)	    not null,
constraint pk_vehicule PRIMARY KEY(NUMERO_IMMATRICULATION),
check(KILOMETRAGE >= 1),
);

-- ============================================================
-- ============================================================
--                      ALTER TABLE
-- ============================================================
-- ============================================================


alter table PARKINGS
      add constraint fk1_code_postal FOREIGN KEY(CODE_POSTAL)
      references COMMUNES(CODE_POSTAL)

alter table PLACES
      add constaint fk1_numero_parking FOREIGN KEY(NUMERO_PARKING)
      references PARKINGS(NUMERO_PARKING)

alter table STATIONNEMENTS
      add constraint fk1_numero_place FOREIGN KEY(NUMERO_PLACE)
      references PLACES(NUMERO_PLACE)
alter table STATIONNEMENTS
      add constraint fk2_numero_immatriculation FOREIGN KEY(NUMERO_IMMATRICULATION)
      references VEHICULES(NUMERO_IMMATRICULATION)

commit;
