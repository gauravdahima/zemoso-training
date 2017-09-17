-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Hotel_Booking
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Hotel_Booking
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Hotel_Booking` DEFAULT CHARACTER SET utf8 ;
USE `Hotel_Booking` ;

-- -----------------------------------------------------
-- Table `Hotel_Booking`.`Hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel_Booking`.`Hotel` (
  `Hotel_id` INT NOT NULL AUTO_INCREMENT,
  `Hotel_name` VARCHAR(45) NOT NULL,
  `Hotel_address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Hotel_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel_Booking`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel_Booking`.`Customer` (
  `Customer_id` INT NOT NULL,
  `Customer_name` VARCHAR(45) NOT NULL,
  `Customer_age` INT NULL,
  PRIMARY KEY (`Customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel_Booking`.`Booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel_Booking`.`Booking` (
  `Booking_id` INT NOT NULL AUTO_INCREMENT,
  `Hotel_Hotel_id` INT NOT NULL,
  `Customer_id` INT NOT NULL,
  PRIMARY KEY (`Booking_id`),
  INDEX `fk_Booking_Hotel_idx` (`Hotel_Hotel_id` ASC),
  INDEX `fk_Booking_Customer1_idx` (`Customer_id` ASC),
  CONSTRAINT `fk_Booking_Hotel`
    FOREIGN KEY (`Hotel_Hotel_id`)
    REFERENCES `Hotel_Booking`.`Hotel` (`Hotel_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Booking_Customer1`
    FOREIGN KEY (`Customer_id`)
    REFERENCES `Hotel_Booking`.`Customer` (`Customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
