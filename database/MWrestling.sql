SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE DATABASE `mwrestling`;

CREATE SCHEMA IF NOT EXISTS `mwrestling` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mwrestling` ;

-- -----------------------------------------------------
-- Table `mwrestling`.`user`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mwrestling`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `class_id` INT NULL ,
  `firstname` VARCHAR(45) NULL ,
  `lastname` VARCHAR(45) NULL ,
  `email` VARCHAR(45) NULL ,
  `uniqname` VARCHAR(45) NULL ,
  `password` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mwrestling`.`season`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mwrestling`.`season` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `season` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mwrestling`.`bout`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mwrestling`.`bout` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `user_id` INT NULL ,
  `season_id` INT NOT NULL ,
  `week` INT NULL ,
  `bout` INT NULL ,
  `bout_id` VARCHAR(45) NULL ,
  `opponent` VARCHAR(45) NULL ,
  `opponentteam` VARCHAR(45) NULL ,
  `weightclass` VARCHAR(45) NULL ,
  `firsttakedown` INT NULL ,
  `firsttakedownopp` INT NULL ,
  `takedowns` INT NULL ,
  `takedownsopp` INT NULL ,
  `twopointnf` INT NULL ,
  `twopointnfopp` INT NULL ,
  `threepointnf` INT NULL ,
  `threepointnfopp` INT NULL ,
  `pin` INT NULL ,
  `pinsopp` INT NULL ,
  `escapes` INT NULL ,
  `escapesopp` INT NULL ,
  `reversals` INT NULL ,
  `reversalsopp` INT NULL ,
  `win` INT NULL ,
  `decision` INT NULL ,
  `decisionopp` INT NULL ,
  `majordecision` INT NULL ,
  `majordecisionopp` INT NULL ,
  `technicalfallnf` INT NULL ,
  `technicalfallnonf` INT NULL ,
  `technicalfallnfopp` INT NULL ,
  `technicalfallnonfopp` INT NULL ,
  `forfeit` INT NULL ,
  `forfeitopp` INT NULL ,
  `injurydefault` INT NULL ,
  `injurydefaultopp` INT NULL ,
  `stallwarning` INT NULL ,
  `stallwarningopp` INT NULL ,
  `stallpoints` INT NULL ,
  `stallpointsopp` INT NULL ,
  `caution` INT NULL ,
  `cautionopp` INT NULL ,
  `cautionpoints` INT NULL ,
  `cautionpointsopp` INT NULL ,
  `thirdperiodwin` INT NULL ,
  `neutralattacks` INT NULL ,
  `timesattacked` INT NULL ,
  `attacksstopped` INT NULL ,
  `stoppoints` INT NULL ,
  `firstbackcenter` INT NULL ,
  `legattack` INT NULL ,
  `legattackfinish` INT NULL ,
  `edgefinish` INT NULL ,
  `latetdrecovery` INT NULL ,
  `latetdheld` INT NULL ,
  `latetdrecoveryopp` INT NULL ,
  `latetdheldopp` INT NULL ,
  `teampointsdual` INT NULL ,
  `teampointstourn` INT NULL ,
  `ridingtime` INT NULL ,
  `ridingtimept` INT NULL ,
  `ridingtimeopp` INT NULL ,
  `ridingtimeptopp` INT NULL ,
  `dual` INT NULL ,
  `tournament` INT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mwrestling`.`class`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mwrestling`.`class` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `class` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
