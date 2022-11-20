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

create or replace procedure procedure_places_stats
       IS
	BEGIN
	FOR compteur in (select * from vue_places_stats)
	LOOP
		IF compteur.NUMERO_PLACE is not null then
		   dbms_output.put_line('Cette place ne concerne aucun stationnement jusquà maintenant : ||', compteur.NOM_POSITION);
		END IF;
	END LOOP;
	END;
/
		   
