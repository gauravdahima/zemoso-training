-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Ecommerce
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ecommerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ecommerce` DEFAULT CHARACTER SET utf8 ;
USE `Ecommerce` ;

-- -----------------------------------------------------
-- Table `Ecommerce`.`Supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Supplier` (
  `Supplier_id` INT NOT NULL AUTO_INCREMENT,
  `Supplier_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Supplier_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Customer` (
  `Customer_id` INT NOT NULL AUTO_INCREMENT,
  `Customer_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Order` (
  `Order_id` INT NOT NULL AUTO_INCREMENT,
  `Order_amount` INT NOT NULL,
  PRIMARY KEY (`Order_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`Items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Items` (
  `Items_id` INT NOT NULL AUTO_INCREMENT,
  `Items_name` VARCHAR(45) NOT NULL,
  `Items_cost` INT NOT NULL,
  `Supplier_id` INT NOT NULL,
  PRIMARY KEY (`Items_id`),
  INDEX `fk_Items_Supplier1_idx` (`Supplier_id` ASC),
  CONSTRAINT `fk_Items_Supplier1`
    FOREIGN KEY (`Supplier_id`)
    REFERENCES `Ecommerce`.`Supplier` (`Supplier_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`Placed_Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Placed_Order` (
  `Order_id` INT NOT NULL,
  `Customer_id` INT NOT NULL,
  PRIMARY KEY (`Order_id`, `Customer_id`),
  INDEX `fk_Placed_Order_Customer1_idx` (`Customer_id` ASC),
  CONSTRAINT `fk_Placed_Order_Order1`
    FOREIGN KEY (`Order_id`)
    REFERENCES `Ecommerce`.`Order` (`Order_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Placed_Order_Customer1`
    FOREIGN KEY (`Customer_id`)
    REFERENCES `Ecommerce`.`Customer` (`Customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`Order_Contains_Items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Order_Contains_Items` (
  `Order_Order_id` INT NOT NULL,
  `Items_Items_id` INT NOT NULL,
  PRIMARY KEY (`Order_Order_id`, `Items_Items_id`),
  INDEX `fk_Order_Contains_Items_Items1_idx` (`Items_Items_id` ASC),
  CONSTRAINT `fk_Order_Contains_Items_Order1`
    FOREIGN KEY (`Order_Order_id`)
    REFERENCES `Ecommerce`.`Order` (`Order_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Order_Contains_Items_Items1`
    FOREIGN KEY (`Items_Items_id`)
    REFERENCES `Ecommerce`.`Items` (`Items_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
