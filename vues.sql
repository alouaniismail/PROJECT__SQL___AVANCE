-- ============================================================
--   Nom de la base   :  Parking_campus
--   Nom du fichier   :  vues.sql
--   Nom de SGBD      :  ORACLE Version 7.0
--   Date de creation :  20/11/2022 12:19
-- ============================================================

-- ============================================================
-- !!!!!! VOUS DEVEZ EXECUTER CES FICHIERS AVANT:
-- !!!!!!           - base.sql
-- ============================================================


-- ============================================================
--   vue places_stats
-- ============================================================

--ceux qui participent pas à des emplacements de vehicule.(parkings concernes nn)
create or replace view vue_places_stats_2 as
select NUMERO_PLACE, NOM_PLACE
from PARKINGS natural join POSITIONS
minus
select NUMERO_PLACE, NOM_PLACE
from STATIONNEMENTS natural join POSITIONS 
natural join PARKINGS;
