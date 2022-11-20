-- ============================================================
--   Nom de la base   :  Parking_campus
--   Nom du fichier   :  execute_procedures.sql
--   Nom de SGBD      :  ORACLE Version 7.0
--   Date de creation :  20/11/2022  12h40
-- ============================================================

-- ============================================================
-- !!!!!! VOUS DEVEZ EXECUTER CES FICHIERS AVANT:
-- !!!!!!           - base.sql
-- !!!!!!           - vues.sql
-- !!!!!!           - procedures.sql
-- ============================================================
-- Pour l'affichage des dbms_output.put_line
set serveroutput on;

-- ============================================================
--                procedure_places__stat
-- ============================================================

EXECUTE procedure_places_stat

rollback;

