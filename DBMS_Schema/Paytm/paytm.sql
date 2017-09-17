-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Paytm
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Paytm
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Paytm` DEFAULT CHARACTER SET utf8 ;
USE `Paytm` ;

-- -----------------------------------------------------
-- Table `Paytm`.`Account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Paytm`.`Account` (
  `Accounts_id` INT NOT NULL AUTO_INCREMENT,
  `Accounts_type` ENUM('current', 'saving') NOT NULL,
  `Accounts_balance` DECIMAL NOT NULL,
  PRIMARY KEY (`Accounts_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Paytm`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Paytm`.`Customer` (
  `Customer_id` INT NOT NULL AUTO_INCREMENT,
  `Customer_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Paytm`.`Branch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Paytm`.`Branch` (
  `Branches_id` INT NOT NULL AUTO_INCREMENT,
  `Branches_name` VARCHAR(45) NOT NULL,
  `Branch_IFSC` VARCHAR(12) NOT NULL,
  `Branch_address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Branches_id`),
  UNIQUE INDEX `Branch_IFSC_UNIQUE` (`Branch_IFSC` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Paytm`.`customer_account_in_a_branch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Paytm`.`customer_account_in_a_branch` (
  `Customer_Customer_id` INT NOT NULL,
  `Branches_Branches_id` INT NOT NULL,
  `Account_Accounts_id1` INT NOT NULL,
  PRIMARY KEY (`Customer_Customer_id`, `Branches_Branches_id`),
  INDEX `fk_customer_account_in_a_branch_Branches1_idx` (`Branches_Branches_id` ASC),
  INDEX `fk_customer_account_in_a_branch_Account2_idx` (`Account_Accounts_id1` ASC),
  CONSTRAINT `fk_customer_account_in_a_branch_Customer`
    FOREIGN KEY (`Customer_Customer_id`)
    REFERENCES `Paytm`.`Customer` (`Customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_account_in_a_branch_Branches1`
    FOREIGN KEY (`Branches_Branches_id`)
    REFERENCES `Paytm`.`Branch` (`Branches_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_account_in_a_branch_Account2`
    FOREIGN KEY (`Account_Accounts_id1`)
    REFERENCES `Paytm`.`Account` (`Accounts_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Paytm`.`account_in_a_branch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Paytm`.`account_in_a_branch` (
  `Account_Accounts_id` INT NOT NULL,
  `Branch_Branches_id` INT NOT NULL,
  PRIMARY KEY (`Account_Accounts_id`, `Branch_Branches_id`),
  INDEX `fk_account_in_a_branch_Branch1_idx` (`Branch_Branches_id` ASC),
  CONSTRAINT `fk_account_in_a_branch_Account1`
    FOREIGN KEY (`Account_Accounts_id`)
    REFERENCES `Paytm`.`Account` (`Accounts_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_account_in_a_branch_Branch1`
    FOREIGN KEY (`Branch_Branches_id`)
    REFERENCES `Paytm`.`Branch` (`Branches_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
