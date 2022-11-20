-- ============================================================
--   Nom de la base   :  Parking_campus
--   Nom du fichier   :  vues_consultation.sql
--   Nom de SGBD      :  ORACLE Version 7.0
--   Date de creation :  20/11/2022 03:09
-- ============================================================

-- ============================================================
-- !!!!!! VOUS DEVEZ EXECUTER CES FICHIERS AVANT:
-- !!!!!!           - base.sql
-- ============================================================

--Informations sur les parkings, les voitures, les places.
create or replace view parkings_commune as
select *
from
PARKINGS natural join COMMUNES

create or replace view voitures as
select *
from
VEHICULES

create or replace view positions_parking__commune as
select *
from
POSITIONS natural join PARKINGS
natural join COMMUNES

--Liste des voitures par parking, la liste des parkings par commune.
create or replace view voitures_parking as
select NUMERO_PARKING, NUMERO_IMMATRICULATION
from
STATIONNEMENTS natural join VEHICULES
natural join POSITIONS
natural join PARKINGS

select NUMERO_PARKING, NOM_PARKING, NOM_COMMUNE
from
COMMUNES natural join PARKINGS

--Liste des parkings qui sont saturés à un jour donnée.
select NUMERO_PARKING, NOM_PARKING, count(NUMERO_PLACE)
from
POSITIONS natural join PARKINGS 
group by NUMERO_PARKING, NOM_PARKING
having count(NUMERO_PLACE)=CAPACITE;

--Liste des places disponibles, par parking, à un moment donné.
select NUMERO_PLACE, NUMERO_PARKING
from
POSITIONS natural join PARKINGS
where NOM_PLACE is null;


--Liste de voitures qui se sont garées dans deux parkings différents au cours d'une journée.

select NUMERO_IMMATRICULATION, count(NUMERO_PARKING)
from
STATIONNEMENTS natural join VEHICULES
natural join POSITIONS
natural join PARKINGS
where CAST(HORAIRE_SORTIE-DATE_STATIONNEMENT AS SIGNED INTEGER) >= 1
group by NUMERO_IMMATRICULATION
having count(NUMERO_PARKING) > 1 ;
