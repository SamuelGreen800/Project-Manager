-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema projectManager2
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `projectManager2` ;

-- -----------------------------------------------------
-- Schema projectManager2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `projectManager2` DEFAULT CHARACTER SET utf8 ;
USE `projectManager2` ;

-- -----------------------------------------------------
-- Table `projectManager2`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projectManager2`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(30) NULL,
  `last_name` VARCHAR(30) NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(255) NULL,
  `created_at` DATETIME(6) NULL,
  `updated_at` DATETIME(6) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projectManager2`.`projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projectManager2`.`projects` (
  `project_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(128) NULL,
  `description` MEDIUMTEXT NULL,
  `due_date` DATETIME(6) NULL,
  `created_at` DATETIME(6) NULL,
  `updated_at` DATETIME(6) NULL,
  PRIMARY KEY (`project_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projectManager2`.`tasks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projectManager2`.`tasks` (
  `task_id` INT NOT NULL,
  `task` VARCHAR(128) NULL,
  `created_at` DATETIME(6) NULL,
  `updated_at` DATETIME(6) NULL,
  `users_id` INT NOT NULL,
  `projects_project_id` INT NOT NULL,
  PRIMARY KEY (`task_id`),
  INDEX `fk_tasks_users1_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_tasks_projects1_idx` (`projects_project_id` ASC) VISIBLE,
  CONSTRAINT `fk_tasks_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `projectManager2`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tasks_projects1`
    FOREIGN KEY (`projects_project_id`)
    REFERENCES `projectManager2`.`projects` (`project_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projectManager2`.`users_has_projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projectManager2`.`users_has_projects` (
  `user_id` INT NOT NULL,
  `project_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `project_id`),
  INDEX `fk_users_has_projects_projects1_idx` (`project_id` ASC) VISIBLE,
  INDEX `fk_users_has_projects_users_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_projects_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `projectManager2`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_projects_projects1`
    FOREIGN KEY (`project_id`)
    REFERENCES `projectManager2`.`projects` (`project_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
