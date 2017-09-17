-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Food_Delivery
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Food_Delivery
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Food_Delivery` DEFAULT CHARACTER SET utf8 ;
USE `Food_Delivery` ;

-- -----------------------------------------------------
-- Table `Food_Delivery`.`Restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Food_Delivery`.`Restaurant` (
  `Restaurant_id` INT NOT NULL AUTO_INCREMENT,
  `Restaurant_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Restaurant_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Food_Delivery`.`Delivery_person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Food_Delivery`.`Delivery_person` (
  `Delivery_person_id` INT NOT NULL,
  `Delivery_person_name` VARCHAR(45) NULL,
  PRIMARY KEY (`Delivery_person_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Food_Delivery`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Food_Delivery`.`Customer` (
  `Customer_id` INT NOT NULL AUTO_INCREMENT,
  `Customer_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Food_Delivery`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Food_Delivery`.`Order` (
  `Order_id` INT NOT NULL,
  `Order_amount` INT NOT NULL,
  `Delivery_person_id` INT NOT NULL,
  `Restaurant_id` INT NOT NULL,
  `Customer_id` INT NOT NULL,
  PRIMARY KEY (`Order_id`),
  INDEX `fk_Order_Delivery_person_idx` (`Delivery_person_id` ASC),
  INDEX `fk_Order_Restaurant1_idx` (`Restaurant_id` ASC),
  INDEX `fk_Order_Customer1_idx` (`Customer_id` ASC),
  CONSTRAINT `fk_Order_Delivery_person`
    FOREIGN KEY (`Delivery_person_id`)
    REFERENCES `Food_Delivery`.`Delivery_person` (`Delivery_person_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Order_Restaurant1`
    FOREIGN KEY (`Restaurant_id`)
    REFERENCES `Food_Delivery`.`Restaurant` (`Restaurant_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Order_Customer1`
    FOREIGN KEY (`Customer_id`)
    REFERENCES `Food_Delivery`.`Customer` (`Customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
