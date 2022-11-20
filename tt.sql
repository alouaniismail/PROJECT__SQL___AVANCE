-- ============================================================
--   Nom de la base   :  CINEMA                                
--   Nom de SGBD      :  ORACLE Version 7.0                    
--   Date de creation :  30/10/96  12:09                       
-- ============================================================

drop table STATIONNEMENTS cascade constraints;

drop table PLACES cascade constraints;

drop table PARKINGS cascade constraints;

drop table VEHICULES cascade constraints;

drop table COMMUNES cascade constraints;


-- ============================================================
--   Table : COMMUNES
-- ============================================================

create table COMMUNES
(
	CODE_POSTAL	NUMBER(5)	not null,
	NOM_COMMUNE	CHAR(20)		,
	constraint pk_commune primary key (CODE_POSTAL)
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
	ETAT					CHAR(8)	    ,
	constraint pk_vehicule primary key (NUMERO_IMMATRICULATION)
);

-- ============================================================
--   Table : PARKINGS
-- ============================================================

create table PARKINGS
(
	NUMERO_PARKING	NUMBER(3)	not null,
	NOM_PARKING 	CHAR(30)	not null,
	ADRESSE		CHAR(40)	not null,
	TARIF_HORAIRE 	NUMBER(4)	not null,
	CAPACITE	NUMBER(5)	,
	CODE_POSTAL	NUMBER(5)	not null,
	constraint pk_parking primary key (NUMERO_PARKING)
);


-- ============================================================
--   Table : STATIONNEMENTS                                          
-- ============================================================

create table STATIONNEMENTS
(
	ID_STATIONNEMENT	NUMBER(4)	not null,
	DATE_STATIONNEMENT 	DATE		not null,
	HORAIRE_SORTIE		DATE		not null,
	NUMERO_PLACE		NUMBER(5)	not null,
	NUMERO_IMMATRICULATION	CHAR(11)	not null,
	constraint pk_stationnement primary key (ID_STATIONNEMENT)
);




alter table PLACES
      add constraint fk1_place foreign key (NUMERO_PARKING)
      	  references PARKINGS (NUMERO_PARKING);

alter table PARKINGS
      add constraint fk1_parking foreign key (CODE_POSTAL)
      	  references COMMUNES (CODE_POSTAL);

alter table STATIONNEMENTS
      add constraint fk1_stationnement foreign key (NUMERO_PLACE)
      	  references PLACES (NUMERO_PLACE);
	  
alter table STATIONNEMENTS
      add constraint fk2_stationnement foreign key (NUMERO_IMMATRICULATION)
      	  references VEHICULES (NUMERO_IMMATRICULATION);


