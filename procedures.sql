-- ============================================================
--   Nom de la base   :  Parking_campus
--   Nom du fichier   :  procedures.sql
--   Nom de SGBD      :  ORACLE Version 7.0
--   Date de creation :  20/11/2022 12:13
-- ============================================================

-- ============================================================
-- !!!!!! VOUS DEVEZ EXECUTER CES FICHIERS AVANT:
-- !!!!!!           - base.sql
-- !!!!!            - vues.sql
-- ============================================================

--fonction dbms_output.put_line.
--operateur || de concatenation de chaines.

--1ere procedure:
--Un numero de place qui participe pas à un stationnement

CREATE or REPLACE PROCEDURE procedure_places_stat
  IS
  BEGIN
  FOR compteur IN (SELECT * FROM vue_places_stats_2)
  LOOP
    IF compteur.NUMERO_PLACE is not NULL THEN
      dbms_output.put_line('Cette place(position !) na jamais ete occupee par une voiture : ' || compteur.NUMERO_PLACE);
      --RAISE_APPLICATION_ERROR (-20001,'Il manque la participation d une position');
    END IF;
  END LOOP;

  END ;
/		   

--exemple seulement simple à cet instant, on ajoutera au moins 3 procedures de
--plus par la suite.
