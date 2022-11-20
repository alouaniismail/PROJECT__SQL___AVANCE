-- ============================================================
--   Nom de la base   :  Parking_campus
--   Nom du fichier   :  vues_statistique.sql
--   Nom de SGBD      :  ORACLE Version 7.0
--   Date de creation :  20/11/2022 03:32
-- ============================================================

-- ============================================================
-- !!!!!! VOUS DEVEZ EXECUTER CES FICHIERS AVANT:
-- !!!!!!           - base.sql
-- ============================================================

--moyenne du nombre de places disponibles par parking.
--somme totale des places disponibles via tous les parkings
--division par le nombre de parking
--donnera le nombre de places dispos / parking.

create or replace view moyenne_nbr_places_parking as
select NUMERO_PARKING, NOM_PARKING, sum(NBR)/count(*) as moyenne_places_dispos
from(
select NUMERO_PARKING, NOM_PARKING, count(NUMERO_PLACE) as NBR
from(
select NUMERO_PARKING, NOM_PARKING, NUMERO_PLACE
from PARKINGS natural join POSITIONS
minus
select NUMERO_PARKING, NOM_PARKING, NUMERO_PLACE
from STATIONNEMENTS natural join POSITIONS 
natural join PARKINGS
)
group by NUMERO_PARKING, NOM_PARKING)
group by NUMERO_PARKING, NOM_PARKING;

--la durée moyenne de stationnement d'un véhicule par parking.
--on fixe un parking, on fait: la somme des durees de stationnements
--de tous les vehicules dans ce parking
--/ nombre de vehicules stationnant là-bas; cela donnerait
--la durée moyenne de stationnement d'un véhicule par parking.

create or replace view duree_moy_stat_vehicule__p as
select NUMERO_PARKING, sum(HORAIRE_SORTIE-DATE_STATIONNEMENT)/count(NUMERO_IMMATRICULATION) as duree_moy
from STATIONNEMENTS natural join POSITIONS
natural join PARKINGS
natural join VEHICULES
group by NUMERO_PARKING;

--par parking, on fait la somme des durres de stationnements (en jour)
--on divise par le nbr_vehicules qui stationnent là (ou déjà & parti)
--ça nous donne la nombre moyen exprimant la durée de stationnement
--d'un véhicule par parking.

--le cout moyen de stationnement d'un vehicule par mois
--on va calculer pour un vehicule le nombre de stationnements
--et la somme des tarifs pendant tous ses stationnements
--puis le diviser par le premier
--ceci donnerait un tarif moyen d'un stationnement de vehicule par mois.

create or replace view cout_moyen_stat_v__mois as
select NUMERO_IMMATRICULATION, ((sum(TARIF_HORAIRE)/count(NUMERO_PLACE))*30)/sum(HORAIRE_SORTIE-DATE_STATIONNEMENT) as tarif_mensuel__horaire___moyen
from VEHICULES natural join STATIONNEMENTS
natural join POSITIONS
natural join PARKINGS
group by NUMERO_IMMATRICULATION;

--par vehicule, on fait la somme de tous les tarifs horaires
--division
--par le nombre de stationnement => tarif moyen par stationnement.(par heure
--aussi)
--au debut cela donne sur une duree
--sortie->duree(en jours)
--y->mois(30, convention)
--y donne sortie*mois/duree.

--classement des parkings les moins utilises

create or replace view classement_parkings_moins as
select NUMERO_PARKING, NOM_PARKING
from(
select NUMERO_PARKING, NOM_PARKING, count(NUMERO_PLACE) as NBR_PLACES_UTILISEES
from PARKINGS natural join POSITIONS
group by NUMERO_PARKING, NOM_PARKING
order by count(NUMERO_PLACE) asc
);

--classement des parking les plus rentables par commune et par mois
--on va calculer la somme des tarifs horaires des vehicules stationnant
--dans ce parking.
--remarque: pas besoin d'ajouter vehicules en plus dans les jointures
--en suites.

create or replace view parkings_classement__rs as
select NUMERO_PARKING, NOM_PARKING, sum(tarif_horaire)*30/sum(HORAIRE_SORTIE-DATE_STATIONNEMENT) as rentabilitee_mensuelle
from STATIONNEMENTS cross join POSITIONS
natural join PARKINGS
natural join COMMUNES
group by NUMERO_PARKING, NOM_PARKING
order by rentabilitee_mensuelle desc;

--classement des communes les plus demandes par semaine
--on va calculer le nombre de stationnements par parking se situant dans
--une commune et on va appliquer la formule
--*7/duree pour avoir le nombre de stationnements par semaine
--et non pas sur toute la duree de la duree de la base totale.

create or replace view communes_plus_demandees__s as
select CODE_POSTAL, NOM_COMMUNE
from(
select CODE_POSTAL, NOM_COMMUNE, count(ID_STATIONNEMENT)*7/sum(HORAIRE_SORTIE-DATE_STATIONNEMENT) as nbr_stationnements
from COMMUNES natural join PARKINGS natural join POSITIONS
natural join STATIONNEMENTS
group by CODE_POSTAL, NOM_COMMUNE
order by nbr_stationnements desc);
