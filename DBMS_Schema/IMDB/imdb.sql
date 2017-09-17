-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema imdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema imdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `imdb` DEFAULT CHARACTER SET utf8 ;
USE `imdb` ;

-- -----------------------------------------------------
-- Table `imdb`.`actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imdb`.`actors` (
  `actors_id` INT NOT NULL AUTO_INCREMENT,
  `actors_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`actors_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `imdb`.`movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imdb`.`movie` (
  `movie_id` INT NOT NULL AUTO_INCREMENT,
  `movie_name` VARCHAR(45) NOT NULL,
  `actors_actors_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `actors_actors_id`),
  INDEX `fk_movie_actors_idx` (`actors_actors_id` ASC),
  CONSTRAINT `fk_movie_actors`
    FOREIGN KEY (`actors_actors_id`)
    REFERENCES `imdb`.`actors` (`actors_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `imdb`.`tv_series`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imdb`.`tv_series` (
  `tv_series_id` INT NOT NULL AUTO_INCREMENT,
  `tv_series_name` VARCHAR(45) NOT NULL,
  `actors_actors_id` INT NOT NULL,
  PRIMARY KEY (`tv_series_id`, `actors_actors_id`),
  INDEX `fk_tv_series_actors1_idx` (`actors_actors_id` ASC),
  CONSTRAINT `fk_tv_series_actors1`
    FOREIGN KEY (`actors_actors_id`)
    REFERENCES `imdb`.`actors` (`actors_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
