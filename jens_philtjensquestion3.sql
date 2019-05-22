-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`patient_diagnosis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`patient_diagnosis` (
  `idpatients` INT NOT NULL,
  `idgene` INT NOT NULL,
  PRIMARY KEY (`idpatients`, `idgene`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`patients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`patients` (
  `idpatients` INT NOT NULL,
  `patient_name` VARCHAR(45) NULL,
  `patient_sex` CHAR(1) NULL,
  `patient_age_diagnosis` DATE NULL,
  `patient_syndrome` VARCHAR(45) NULL,
  `syndrome_description` VARCHAR(45) NULL,
  PRIMARY KEY (`idpatients`),
  CONSTRAINT `fk_patients_1`
    FOREIGN KEY (`idpatients`)
    REFERENCES `mydb`.`patient_diagnosis` (`idpatients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gene` (
  `idgene` INT NOT NULL,
  `gene_name` VARCHAR(45) NULL,
  `start` INT NULL,
  `end` INT NULL,
  `chromosome` INT NULL,
  PRIMARY KEY (`idgene`),
  CONSTRAINT `fk_gene_1`
    FOREIGN KEY (`idgene`)
    REFERENCES `mydb`.`patient_diagnosis` (`idpatients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
