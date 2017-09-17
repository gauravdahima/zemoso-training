-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Projects_Employees
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Projects_Employees
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Projects_Employees` DEFAULT CHARACTER SET utf8 ;
USE `Projects_Employees` ;

-- -----------------------------------------------------
-- Table `Projects_Employees`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projects_Employees`.`Employees` (
  `Employees_id` INT NOT NULL AUTO_INCREMENT,
  `Employees_name` VARCHAR(45) NULL,
  PRIMARY KEY (`Employees_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projects_Employees`.`Projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projects_Employees`.`Projects` (
  `Projects_id` INT NOT NULL,
  `Projects_name` VARCHAR(45) NULL,
  `Projects_description` VARCHAR(45) NULL,
  PRIMARY KEY (`Projects_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projects_Employees`.`report_to_manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projects_Employees`.`report_to_manager` (
  `report_to_manager_id` INT NOT NULL AUTO_INCREMENT,
  `Employees_Employees_id` INT NOT NULL,
  `Employees_Projects_Projects_id` INT NOT NULL,
  PRIMARY KEY (`report_to_manager_id`, `Employees_Employees_id`, `Employees_Projects_Projects_id`),
  INDEX `fk_Manager_Employees1_idx` (`Employees_Employees_id` ASC, `Employees_Projects_Projects_id` ASC),
  CONSTRAINT `fk_Manager_Employees1`
    FOREIGN KEY (`Employees_Employees_id`)
    REFERENCES `Projects_Employees`.`Employees` (`Employees_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projects_Employees`.`part_of`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projects_Employees`.`part_of` (
  `Projects_Projects_id` INT NOT NULL,
  `Employees_Employees_id` INT NOT NULL,
  PRIMARY KEY (`Projects_Projects_id`, `Employees_Employees_id`),
  INDEX `fk_part_of_Employees1_idx` (`Employees_Employees_id` ASC),
  CONSTRAINT `fk_part_of_Projects1`
    FOREIGN KEY (`Projects_Projects_id`)
    REFERENCES `Projects_Employees`.`Projects` (`Projects_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_part_of_Employees1`
    FOREIGN KEY (`Employees_Employees_id`)
    REFERENCES `Projects_Employees`.`Employees` (`Employees_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
