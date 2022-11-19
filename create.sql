-- ============================================================
--   Fichier   :  create.sql                                
--   Nom de la base   :  parking_campus                                
--   Nom de SGBD      :  15.1 Distrib 10.6.7-MariaDB                    
--   Date de creation :  31/10/2022                     
-- ============================================================


-- -----------------------------------------------------
-- Schema parking_campus
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS parking_campus ;

-- -----------------------------------------------------
-- Table parking_campus.Communes
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS parking_campus.Communes (
  code_postal INT NOT NULL,
  nom_commune VARCHAR(100) NOT NULL,
  PRIMARY KEY (code_postal));


-- -----------------------------------------------------
-- Table parking_campus.Parkings
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS parking_campus.Parkings (
  numero_parking INT NOT NULL AUTO_INCREMENT,
  nom_parking VARCHAR(100) NOT NULL,
  adresse VARCHAR(100) NOT NULL,
  tarif_horaire DECIMAL NOT NULL,
  capacite INT NOT NULL,
  code_postal INT NOT NULL,
  PRIMARY KEY (numero_parking),
  CONSTRAINT fk_Parkings_Communes
    FOREIGN KEY (code_postal)
    REFERENCES parking_campus.Communes (code_postal)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table parking_campus.Places
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS parking_campus.Places (
  numero_place INT NOT NULL AUTO_INCREMENT,
  nom_place VARCHAR(100) NOT NULL,
  numero_parking INT NOT NULL,
  PRIMARY KEY (numero_place),
  CONSTRAINT fk_Places_Parkings
    FOREIGN KEY (numero_parking)
    REFERENCES parking_campus.Parkings (numero_parking)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table parking_campus.Vehicules
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS parking_campus.Vehicules (
  numero_immatriculation VARCHAR(45) NOT NULL,
  marque VARCHAR(100) NOT NULL,
  date_de_mise_en_circulation TIMESTAMP NULL,
  kilometrage DECIMAL NOT NULL,
  etat VARCHAR(45) NOT NULL,
  PRIMARY KEY (numero_immatriculation));


-- -----------------------------------------------------
-- Table parking_campus.Stationnements
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS parking_campus.Stationnements (
  id_stationnement INT NOT NULL AUTO_INCREMENT,
  date_entree TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  date_sortie TIMESTAMP NULL,
  numero_place INT NOT NULL,
  numero_immatriculation VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_stationnement),
  CONSTRAINT fk_Stationnements_Places
    FOREIGN KEY (numero_place)
    REFERENCES parking_campus.Places (numero_place)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Stationnements_Vehicules
    FOREIGN KEY (numero_immatriculation)
    REFERENCES parking_campus.Vehicules (numero_immatriculation)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);