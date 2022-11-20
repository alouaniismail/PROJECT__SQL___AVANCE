-- ============================================================
--   Nom de la base   :  AMAP
--   Nom du fichier   :  aff_vues_s.sql
--   Nom de SGBD      :  ORACLE Version 7.0
--   Date de creation :  20/11/2022 11:45
-- ============================================================

@base
@vues_statistique
@donnees

-- ============================================================
--   Nom de la base   :  AMAP
--   Nom du fichier   :  aff_vues_c.sql
--   Nom de SGBD      :  ORACLE Version 7.0
--   Date de creation :  05/12/2017  17h45
-- ============================================================

-- ============================================================
--   vue moyenne_nbr_places_parking
-- ============================================================

select * from moyenne_nbr_places_parking;

-- ============================================================
--   vue duree_moy_stat_vehicule__p
-- ============================================================

select * from duree_moy_stat_vehicule__p;

-- ============================================================
--   vue cout_moyen_stat_v__mois;
-- ============================================================

select * from cout_moyen_stat_v__mois;

-- ============================================================
--   vue classement_parking_moins
-- ============================================================

select * from classement_parking_moins;

-- ============================================================
--   vue parkings_classement__rs
-- ============================================================

select * from parkings_classement__rs;

-- ============================================================
--   vue communes_plus_demandees__s
-- ============================================================

select * from communes_plus_demandees__s;
