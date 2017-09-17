-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema CabRental
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CabRental
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CabRental` DEFAULT CHARACTER SET utf8 ;
USE `CabRental` ;

-- -----------------------------------------------------
-- Table `CabRental`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CabRental`.`Customer` (
  `Customer_id` INT NOT NULL AUTO_INCREMENT,
  `Customer_name` VARCHAR(45) NOT NULL,
  `Customer_phoneNumber` VARCHAR(10) NOT NULL,
  `Customer_email` VARCHAR(45) NOT NULL,
  `Customer_time_stamp` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CabRental`.`Driver`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CabRental`.`Driver` (
  `Driver_id` INT NOT NULL AUTO_INCREMENT,
  `Driver_name` VARCHAR(45) NOT NULL,
  `Driver_phoneNumber` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Driver_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CabRental`.`Cabs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CabRental`.`Cabs` (
  `Cabs_id` INT NOT NULL AUTO_INCREMENT,
  `Cabs_name` VARCHAR(45) NOT NULL,
  `Cabs_licenseNumber` VARCHAR(45) NOT NULL,
  `Driver_Driver_id` INT NOT NULL,
  PRIMARY KEY (`Cabs_id`, `Driver_Driver_id`),
  INDEX `fk_Cabs_Driver_idx` (`Driver_Driver_id` ASC),
  CONSTRAINT `fk_Cabs_Driver`
    FOREIGN KEY (`Driver_Driver_id`)
    REFERENCES `CabRental`.`Driver` (`Driver_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CabRental`.`Customer_Cabs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CabRental`.`Customer_Cabs` (
  `Customer_Customer_id` INT NOT NULL,
  `Cabs_Cabs_id` INT NOT NULL,
  `Cabs_Driver_Driver_id` INT NOT NULL,
  PRIMARY KEY (`Customer_Customer_id`, `Cabs_Cabs_id`, `Cabs_Driver_Driver_id`),
  INDEX `fk_Customer_Cabs_Cabs1_idx` (`Cabs_Cabs_id` ASC, `Cabs_Driver_Driver_id` ASC),
  CONSTRAINT `fk_Customer_Cabs_Customer1`
    FOREIGN KEY (`Customer_Customer_id`)
    REFERENCES `CabRental`.`Customer` (`Customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Customer_Cabs_Cabs1`
    FOREIGN KEY (`Cabs_Cabs_id` , `Cabs_Driver_Driver_id`)
    REFERENCES `CabRental`.`Cabs` (`Cabs_id` , `Driver_Driver_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
