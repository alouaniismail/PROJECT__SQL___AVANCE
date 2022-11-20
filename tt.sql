-- ============================================================
--   Nom de la base   :  CINEMA                                
--   Nom de SGBD      :  ORACLE Version 7.0                    
--   Date de creation :  30/10/96  12:09                       
-- ============================================================

drop table STATIONNEMENTS cascade constraints;

drop table PLACES cascade constraints;

drop table PARKINGS cascade constraints;

drop table COMMUNES cascade constraints;

drop table VEHICULES cascade constraints;

-- ============================================================
--   Table : ACTEUR                                            
-- ============================================================
create table ACTEUR
(
    NUMERO_ACTEUR                   NUMBER(3)              not null,
    NOM_ACTEUR                      CHAR(20)               not null,
    PRENOM_ACTEUR                   CHAR(20)                       ,
    NATION_ACTEUR                   CHAR(20)                       ,
    DATE_DE_NAISSANCE               DATE                           ,
    constraint pk_acteur primary key (NUMERO_ACTEUR)
);

create table COMMUNES
(
	CODE_POSTAL	NUMBER(5)	not null,
	NOM_COMMUNE	CHAR(20)		,
	constraint pk_commune primary key (CODE_POSTAL)
);


-- ============================================================
--   Table : REALISATEUR                                       
-- ============================================================
create table REALISATEUR
(
    NUMERO_REALISATEUR              NUMBER(3)              not null,
    NOM_REALISATEUR                 CHAR(20)               not null,
    PRENOM_REALISATEUR              CHAR(20)                       ,
    NATION_REALISATEUR              CHAR(20)                       ,
    constraint pk_realisateur primary key (NUMERO_REALISATEUR)
);

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
--   Table : FILM                                              
-- ============================================================
create table FILM
(
    NUMERO_FILM                     NUMBER(3)              not null,
    TITRE_FILM                      CHAR(30)               not null,
    DATE_DE_SORTIE                  DATE                           ,
    DUREE                           NUMBER(3)              not null,
    GENRE                           CHAR(20)               not null,
    NUMERO_REALISATEUR              NUMBER(3)              not null,
    constraint pk_film primary key (NUMERO_FILM)
);

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
--   Table : ROLE                                              
-- ============================================================
create table ROLE
(
    NUMERO_ACTEUR                   NUMBER(3)              not null,
    NUMERO_FILM                     NUMBER(3)              not null,
    NOM_DU_ROLE                     CHAR(30)                       ,
    constraint pk_role primary key (NUMERO_ACTEUR, NUMERO_FILM)
);

create table STATIONNEMENTS
(
	ID_STATIONNEMENT	NUMBER(4)	not null,
	DATE_STATIONNEMENT 	DATE		not null,
	HORAIRE_SORTIE		DATE		not null,
	NUMERO_PLACE		NUMBER(5)	not null,
	NUMERO_IMMATRICULATION	CHAR(11)	not null,
	constraint pk_stationnement primary key (ID_STATIONNEMENT)
);


alter table FILM
    add constraint fk1_film foreign key (NUMERO_REALISATEUR)
       references REALISATEUR (NUMERO_REALISATEUR);

alter table PARKINGS
      add constraint fk1_parking foreign key (CODE_POSTAL)
      	  references COMMUNES (CODE_POSTAL);

alter table PLACES
      add constraint fk1_place foreign key (NUMERO_PARKING)
      	  references PARKINGS (NUMERO_PARKING);

alter table ROLE
    add constraint fk1_role foreign key (NUMERO_ACTEUR)
       references ACTEUR (NUMERO_ACTEUR);

alter table ROLE
    add constraint fk2_role foreign key (NUMERO_FILM)
       references FILM (NUMERO_FILM);

alter table STATIONNEMENTS
      add constraint fk1_stationnement foreign key (NUMERO_PLACE)
      	  references PLACES (NUMERO_PLACE);
	  
alter table STATIONNEMENTS
      add constraint fk2_stationnement foreign key (NUMERO_IMMATRICULATION)
      	  references VEHICULES (NUMERO_IMMATRICULATION);
