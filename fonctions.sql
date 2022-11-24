-- ============================================================
--   Nom de la base   :  AMAP
--   Nom du fichier   :  fonctions.sql
--   Nom de SGBD      :  ORACLE Version 7.0
--   Date de creation :  09/12/2017  12h10
-- ============================================================

-- ============================================================
-- !!!!!! VOUS DEVEZ EXECUTER CES FICHIERS AVANT:
-- !!!!!!           - base.sql
-- !!!!!!           - vues_statistiques.sql
-- !!!!!!           - vues_consultation.sql
-- ============================================================


-- retourne les places occupees à cet instant dans un parking donne
CREATE OR REPLACE FUNCTION places_occupation__p(num_p IN NUMBER)
   RETURN NUMBER
   AS
    nbr_places_occupees__p NUMBER;
    nbr_places_occupees__p2 NUMBER;
   BEGIN

      SELECT NUMERO_PARKING, COUNT(NUMERO_PLACE) INTO nb_places__occupees__p2
      FROM STATIONNEMENTS natural join POSITIONS
      natural join PARKINGS
      group by NUMERO_PARKING;

      nbr_places_occupees__p := nbr_places_occupees__p2;
      RETURN(nbr_places_occupees__p);
    END;
/

--a revoir() ulterieurement.
