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

create or replace view liste_parkings__commune as
select NUMERO_PARKING, NOM_PARKING, NOM_COMMUNE
from
COMMUNES natural join PARKINGS

--Liste des parkings qui sont saturés à un jour donnée.
create or replace view parkings_satures as
select NOM_PARKING, NUMERO_PARKING, CAPACITE
from PARKINGS
intersect
select NOM_PARKING, NUMERO_PARKING, NBR
from(
select NUMERO_PARKING, NOM_PARKING, count(NUMERO_PLACE) as NBR
from POSITIONS natural join PARKINGS 
group by NUMERO_PARKING, NOM_PARKING
);

--Liste des places disponibles, par parking, à un moment donné.
create or replace view places_dispos__parking as
select NUMERO_PARKING, NOM_PARKING, NUMERO_PLACE
from PARKINGS natural join POSITIONS
minus
select NUMERO_PARKING, NOM_PARKING, NUMERO_PLACE
from STATIONNEMENTS natural join POSITIONS 
natural join PARKINGS;


--Liste de voitures qui se sont garées dans deux parkings différents au cours d'une journée.

create or replace view voitures__se_garant_deux_fois_parking_different__journee as
select NUMERO_IMMATRICULATION, count(NUMERO_PARKING)
from
STATIONNEMENTS natural join VEHICULES
natural join POSITIONS
natural join PARKINGS
where floor(HORAIRE_SORTIE-DATE_STATIONNEMENT) = 0
or floor(HORAIRE_SORTIE-DATE_STATIONNEMENT)=1
group by NUMERO_IMMATRICULATION
having count(NUMERO_PARKING) > 1 ;










