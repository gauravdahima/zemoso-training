-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema IRCTC
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema IRCTC
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `IRCTC` DEFAULT CHARACTER SET utf8 ;
USE `IRCTC` ;

-- -----------------------------------------------------
-- Table `IRCTC`.`train`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IRCTC`.`train` (
  `train_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `train_name` VARCHAR(45) NULL,
  PRIMARY KEY (`train_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IRCTC`.`ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IRCTC`.`ticket` (
  `ticket_id` INT NOT NULL AUTO_INCREMENT,
  `ticket_price` INT NOT NULL,
  PRIMARY KEY (`ticket_id`),
  UNIQUE INDEX `Ticket_id_UNIQUE` (`ticket_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IRCTC`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IRCTC`.`customer` (
  `customer_id` INT NOT NULL,
  `customer_name` VARCHAR(45) NOT NULL,
  `customer_age` INT NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IRCTC`.`reserved_ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IRCTC`.`reserved_ticket` (
  `ticket_id` INT NOT NULL,
  PRIMARY KEY (`ticket_id`),
  CONSTRAINT `fk_reserved_ticket_ticket`
    FOREIGN KEY (`ticket_id`)
    REFERENCES `IRCTC`.`ticket` (`ticket_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IRCTC`.`unreserved_ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IRCTC`.`unreserved_ticket` (
  `ticket_id` INT NOT NULL,
  PRIMARY KEY (`ticket_id`),
  CONSTRAINT `fk_unreserved_ticket_ticket1`
    FOREIGN KEY (`ticket_id`)
    REFERENCES `IRCTC`.`ticket` (`ticket_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IRCTC`.`customer_with_unreserved_ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IRCTC`.`customer_with_unreserved_ticket` (
  `ticket_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`ticket_id`, `customer_id`),
  INDEX `fk_customer_with_unreserves_ticket_customer1_idx` (`customer_id` ASC),
  CONSTRAINT `fk_customer_with_unreserves_ticket_unreserved_ticket1`
    FOREIGN KEY (`ticket_id`)
    REFERENCES `IRCTC`.`unreserved_ticket` (`ticket_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_with_unreserves_ticket_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `IRCTC`.`customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IRCTC`.`customer_reserved_ticket_train`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IRCTC`.`customer_reserved_ticket_train` (
  `ticket_id` INT NOT NULL,
  `train_id` INT UNSIGNED NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`ticket_id`, `train_id`, `customer_id`),
  INDEX `fk_customer_reserved_ticket_train_train1_idx` (`train_id` ASC),
  INDEX `fk_customer_reserved_ticket_train_customer1_idx` (`customer_id` ASC),
  CONSTRAINT `fk_customer_reserved_ticket_train_reserved_ticket1`
    FOREIGN KEY (`ticket_id`)
    REFERENCES `IRCTC`.`reserved_ticket` (`ticket_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_reserved_ticket_train_train1`
    FOREIGN KEY (`train_id`)
    REFERENCES `IRCTC`.`train` (`train_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_reserved_ticket_train_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `IRCTC`.`customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
