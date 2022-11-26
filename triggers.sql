CREATE OR REPLACE TRIGGER stationnements_sortie_trig
  BEFORE UPDATE ON STATIONNEMENTS 
  FOR EACH ROW
BEGIN
  IF NEW.date_sortie IS NULL THEN
    SET NEW.date_sortie = CURRENT_TIMESTAMP;
  END IF;
END
/
--a revoir aussi ultèrieurement, l'important, c'est que notre procédure
--reliée implicitement au trigger (inclut les fonctionnalitées du trigger)
--marche avec @execute_procedures.sql.
