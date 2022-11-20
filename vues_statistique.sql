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

select NUMERO_PARKING, sum(HORAIRE_SORTIE-DATE_STATIONNEMENT)/count(NUMERO_IMMATRICULATION)
from STATIONNEMENTS natural join POSITIONS
natural join PARKINGS
natural join VEHICULES
group by NUMERO_PARKING;

--par parking, on fait la somme des durres de stationnements (en jour)
--on divise par le nbr_vehicules qui stationnent là (ou déjà & parti)
--ça nous donne la nombre moyen exprimant la durée de stationnement
--d'un véhicule par parking.

--le cout moyen de stationnement d'un vehicule par mois
--on va faire la somme des tarifs de stationnements des vehicules qui ont
--stationne dans ce parking fixe / somme des vehicules qui s'est
--stationne pendant un mois(on garde les donnees, durabilitee(ACID)).
--Rq: on doit pas evoquer un parking.



