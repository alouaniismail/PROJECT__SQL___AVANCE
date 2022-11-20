-- ============================================================
--   Nom de la base   :  Parking_campus
--   Nom du fichier   :  aff_vues_c.sql
--   Nom de SGBD      :  ORACLE Version 7.0
--   Date de creation :  20/11/2022 11:39
-- ============================================================

@base
@vues_consultation
@donnees

-- ============================================================
--    Données utiles pour les affichages suivants
-- ============================================================


insert  into  STATIONNEMENTS VALUES (31, '2022-07-23 13:23:17', '2022-07-23 13:24:59', 321, 'KV02MI');

-- ============================================================
--                vue_voitures__deux_parkings_h
-- ============================================================

select * from voitures__deux_parkings_h;

rollback;

--on teste que celle-ci car c'est la seule mettant le lien avec
--les vehicules et pointant vers NUMERO_PLACE qui pointe vers NUMERO_PARKING
--qui pointe vers COMMUNES.
