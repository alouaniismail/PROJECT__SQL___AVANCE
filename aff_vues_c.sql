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

insert  into  STATIONNEMENTS VALUES (31, '2022-10-03 11:10:58', '2022-10-03 12:55:53', 30, 'LP73BN');
insert  into  STATIONNEMENTS VALUES (32, '2022-10-03 12:56:58', '2022-10-03 13:55:53', 1, 'LP73BN');
insert  into  STATIONNEMENTS VALUES (33, '2022-10-03 11:10:58', '2022-10-03 12:55:53', 50, 'LP73BX');
insert  into  STATIONNEMENTS VALUES (34, '2022-10-03 12:56:58', '2022-10-03 13:55:53', 80, 'LP73BX');
insert  into  STATIONNEMENTS VALUES (35, '2022-10-03 11:10:58', '2022-10-03 12:55:53', 90, 'LP73BO');
insert  into  STATIONNEMENTS VALUES (36, '2022-10-03 12:56:58', '2022-10-03 13:55:53', 107, 'LP73BO');



-- ============================================================
--                vue_voitures__deux_parkings_h
-- ============================================================

select * from voitures__deux_parkings_h;

rollback;

--on teste que celle-ci car c'est la seule mettant le lien avec
--les vehicules et pointant vers NUMERO_PLACE qui pointe vers NUMERO_PARKING
--qui pointe vers COMMUNES.
