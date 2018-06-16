-- MySQL Script generated by MySQL Workbench
-- Sex 11 Mai 2018 10:22:15 -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`DimTempo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`DimTempo` ;

CREATE TABLE IF NOT EXISTS `mydb`.`DimTempo` (
  `idTempo` INT NOT NULL,
  `Ano` VARCHAR(4) NULL,
  `Mes` VARCHAR(2) NULL,
  `Dia` VARCHAR(2) NULL,
  PRIMARY KEY (`idTempo`),
  UNIQUE INDEX `Dia_UNIQUE` (`Dia` ASC),
  UNIQUE INDEX `Mes_UNIQUE` (`Mes` ASC),
  UNIQUE INDEX `Ano_UNIQUE` (`Ano` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DimPoder`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`DimPoder` ;

CREATE TABLE IF NOT EXISTS `mydb`.`DimPoder` (
  `idPoder` INT NOT NULL,
  `NomePoder` VARCHAR(45) NULL,
  PRIMARY KEY (`idPoder`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DimUnidadeOrcamentaria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`DimUnidadeOrcamentaria` ;

CREATE TABLE IF NOT EXISTS `mydb`.`DimUnidadeOrcamentaria` (
  `idUniOrc` INT NOT NULL,
  `GrpAdminUniOrc` VARCHAR(100) NULL,
  `NomeUniOrc` VARCHAR(255) NULL,
  PRIMARY KEY (`idUniOrc`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DimFonte`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`DimFonte` ;

CREATE TABLE IF NOT EXISTS `mydb`.`DimFonte` (
  `idFonte` INT NOT NULL,
  `NomeFonte` VARCHAR(45) NULL,
  PRIMARY KEY (`idFonte`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FatoReceita`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`FatoReceita` ;

CREATE TABLE IF NOT EXISTS `mydb`.`FatoReceita` (
  `VlrArrecadado` DOUBLE NULL,
  `VlrDspSrvAtivo` DOUBLE NULL,
  `VlrDspSrvInativo` DOUBLE NULL,
  `VlrDspPensionista` DOUBLE NULL,
  `VlrDspContratado` DOUBLE NULL,
  `VlrDespesasTotal` DOUBLE NULL,
  `idFonte` INT NOT NULL,
  `idTempo` INT NOT NULL,
  `idPoder` INT NOT NULL,
  `idUniOrc` INT NOT NULL,
  PRIMARY KEY (`idFonte`, `idTempo`, `idPoder`, `idUniOrc`),
  INDEX `fk_FatoReceita_DimFonte1_idx` (`idFonte` ASC),
  INDEX `fk_FatoReceita_DimTempo1_idx` (`idTempo` ASC),
  INDEX `fk_FatoReceita_DimPoder1_idx` (`idPoder` ASC),
  INDEX `fk_FatoReceita_DimUnidadeOrcamentaria1_idx` (`idUniOrc` ASC),
  CONSTRAINT `fk_FatoReceita_DimFonte1`
    FOREIGN KEY (`idFonte`)
    REFERENCES `mydb`.`DimFonte` (`idFonte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FatoReceita_DimTempo1`
    FOREIGN KEY (`idTempo`)
    REFERENCES `mydb`.`DimTempo` (`idTempo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FatoReceita_DimPoder1`
    FOREIGN KEY (`idPoder`)
    REFERENCES `mydb`.`DimPoder` (`idPoder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FatoReceita_DimUnidadeOrcamentaria1`
    FOREIGN KEY (`idUniOrc`)
    REFERENCES `mydb`.`DimUnidadeOrcamentaria` (`idUniOrc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
