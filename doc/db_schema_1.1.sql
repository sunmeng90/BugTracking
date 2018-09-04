-- MySQL Script generated by MySQL Workbench
-- Tue Sep  4 21:29:50 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bug_tracking
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `bug_tracking` ;

-- -----------------------------------------------------
-- Schema bug_tracking
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bug_tracking` DEFAULT CHARACTER SET utf8 ;
USE `bug_tracking` ;

-- -----------------------------------------------------
-- Table `bug_tracking`.`action`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bug_tracking`.`action` ;

CREATE TABLE IF NOT EXISTS `bug_tracking`.`action` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(100) NULL DEFAULT NULL,
  `status` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bug_tracking`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bug_tracking`.`role` ;

CREATE TABLE IF NOT EXISTS `bug_tracking`.`role` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `valid_from` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `valid_to` DATETIME NULL DEFAULT '9999-12-31 23:59:59',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bug_tracking`.`employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bug_tracking`.`employee` ;

CREATE TABLE IF NOT EXISTS `bug_tracking`.`employee` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `login_id` VARCHAR(50) NOT NULL,
  `first_name` VARCHAR(50) NULL DEFAULT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  `gender` CHAR(1) NULL DEFAULT 'M',
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `birth_date` DATE NULL DEFAULT '1970-01-01',
  `role_id` INT(11) NOT NULL DEFAULT '0',
  `valid_from` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `valid_to` DATETIME NULL DEFAULT '9999-12-31 23:59:59',
  PRIMARY KEY (`id`, `role_id`),
  CONSTRAINT `fk_employee_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `bug_tracking`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 500000
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_employee_role1_idx` ON `bug_tracking`.`employee` (`role_id` ASC);


-- -----------------------------------------------------
-- Table `bug_tracking`.`project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bug_tracking`.`project` ;

CREATE TABLE IF NOT EXISTS `bug_tracking`.`project` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `status` VARCHAR(10) NULL DEFAULT NULL,
  `valid_from` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `valid_to` DATETIME NULL DEFAULT '9999-12-31 23:59:59',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bug_tracking`.`bug`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bug_tracking`.`bug` ;

CREATE TABLE IF NOT EXISTS `bug_tracking`.`bug` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `serverity` VARCHAR(45) NULL DEFAULT NULL,
  `status` VARCHAR(45) NULL DEFAULT NULL,
  `bug_status` VARCHAR(45) NULL DEFAULT NULL,
  `reporter_id` INT(11) NULL DEFAULT NULL,
  `assignee_id` INT(11) NULL DEFAULT NULL,
  `project_id` INT(11) NULL DEFAULT NULL,
  `valid_from` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `valid_to` DATETIME NULL DEFAULT '9999-12-31 23:59:59',
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_bug_assignee_id1`
    FOREIGN KEY (`assignee_id`)
    REFERENCES `bug_tracking`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bug_employee_id1`
    FOREIGN KEY (`reporter_id`)
    REFERENCES `bug_tracking`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bug_project_id1`
    FOREIGN KEY (`project_id`)
    REFERENCES `bug_tracking`.`project` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_bug_employee_id1_idx` ON `bug_tracking`.`bug` (`reporter_id` ASC);

CREATE INDEX `fk_bug_project_id1_idx` ON `bug_tracking`.`bug` (`project_id` ASC);

CREATE INDEX `fk_bug_assignee_id1_idx` ON `bug_tracking`.`bug` (`assignee_id` ASC);


-- -----------------------------------------------------
-- Table `bug_tracking`.`department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bug_tracking`.`department` ;

CREATE TABLE IF NOT EXISTS `bug_tracking`.`department` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `parent_id` INT(11) NULL DEFAULT NULL,
  `level` INT(11) NULL DEFAULT NULL,
  `valid_from` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `valid_to` DATETIME NULL DEFAULT '9999-12-31 23:59:59',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bug_tracking`.`dept_emp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bug_tracking`.`dept_emp` ;

CREATE TABLE IF NOT EXISTS `bug_tracking`.`dept_emp` (
  `employee_id` INT(11) NOT NULL,
  `dept_id` INT(11) NOT NULL,
  `valid_from` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `valid_to` DATETIME NOT NULL DEFAULT '9999-12-31 23:59:59',
  CONSTRAINT `fk_dept_emp_department1`
    FOREIGN KEY (`dept_id`)
    REFERENCES `bug_tracking`.`department` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dept_emp_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `bug_tracking`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_dept_emp_employee1_idx` ON `bug_tracking`.`dept_emp` (`employee_id` ASC);

CREATE INDEX `fk_dept_emp_department1_idx` ON `bug_tracking`.`dept_emp` (`dept_id` ASC);


-- -----------------------------------------------------
-- Table `bug_tracking`.`employee_bak`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bug_tracking`.`employee_bak` ;

CREATE TABLE IF NOT EXISTS `bug_tracking`.`employee_bak` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `login_id` VARCHAR(50) NOT NULL,
  `first_name` VARCHAR(50) NULL DEFAULT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  `gender` CHAR(1) NULL DEFAULT 'M',
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `birth_date` DATE NULL DEFAULT '1970-01-01',
  `role_id` INT(11) NOT NULL DEFAULT '0',
  `valid_from` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `valid_to` DATETIME NULL DEFAULT '9999-12-31 23:59:59',
  PRIMARY KEY (`id`, `role_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 500000
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_employee_role1_idx` ON `bug_tracking`.`employee_bak` (`role_id` ASC);


-- -----------------------------------------------------
-- Table `bug_tracking`.`employee_project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bug_tracking`.`employee_project` ;

CREATE TABLE IF NOT EXISTS `bug_tracking`.`employee_project` (
  `status` VARCHAR(10) NOT NULL DEFAULT 'A',
  `valid_from` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `valid_to` DATETIME NULL DEFAULT '9999-12-31 23:59:59',
  `employee_id` INT(11) NOT NULL,
  `project_id` INT(11) NOT NULL,
  PRIMARY KEY (`project_id`, `status`, `employee_id`),
  CONSTRAINT `fk_employee_project_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `bug_tracking`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_project_project1`
    FOREIGN KEY (`project_id`)
    REFERENCES `bug_tracking`.`project` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_employee_project_project1_idx` ON `bug_tracking`.`employee_project` (`project_id` ASC);

CREATE INDEX `fk_employee_project_employee1` ON `bug_tracking`.`employee_project` (`employee_id` ASC);


-- -----------------------------------------------------
-- Table `bug_tracking`.`resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bug_tracking`.`resource` ;

CREATE TABLE IF NOT EXISTS `bug_tracking`.`resource` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `valid_from` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `valid_to` DATETIME NULL DEFAULT '9999-12-31 11:59:59',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bug_tracking`.`permission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bug_tracking`.`permission` ;

CREATE TABLE IF NOT EXISTS `bug_tracking`.`permission` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `action_id` INT(11) NOT NULL,
  `resource_id` INT(11) NOT NULL,
  `valid_from` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `valid_to` DATETIME NULL DEFAULT '9999-12-31 11:59:59',
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_permission_action_id1`
    FOREIGN KEY (`action_id`)
    REFERENCES `bug_tracking`.`action` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_permission_resource_id1`
    FOREIGN KEY (`resource_id`)
    REFERENCES `bug_tracking`.`resource` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_permission_action_id1_idx` ON `bug_tracking`.`permission` (`action_id` ASC);

CREATE INDEX `fk_permission_resource_id1_idx` ON `bug_tracking`.`permission` (`resource_id` ASC);


-- -----------------------------------------------------
-- Table `bug_tracking`.`role_permission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bug_tracking`.`role_permission` ;

CREATE TABLE IF NOT EXISTS `bug_tracking`.`role_permission` (
  `role_id` INT(11) NOT NULL,
  `permission_id` INT(11) NOT NULL,
  `valid_from` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `valid_to` DATETIME NULL DEFAULT '9999-12-31 23:59:59',
  PRIMARY KEY (`role_id`, `permission_id`),
  CONSTRAINT `fk_role_permission_permission1`
    FOREIGN KEY (`permission_id`)
    REFERENCES `bug_tracking`.`permission` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_role_permission_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `bug_tracking`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_role_action_role1_idx` ON `bug_tracking`.`role_permission` (`role_id` ASC);

CREATE INDEX `fk_role_action_permission1_idx` ON `bug_tracking`.`role_permission` (`permission_id` ASC);


-- -----------------------------------------------------
-- Table `bug_tracking`.`salaries`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bug_tracking`.`salaries` ;

CREATE TABLE IF NOT EXISTS `bug_tracking`.`salaries` (
  `employee_id` INT(11) NOT NULL,
  `salary` INT(11) NOT NULL,
  `from_date` DATE NOT NULL,
  `to_date` DATE NOT NULL,
  PRIMARY KEY (`employee_id`, `from_date`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8 PARTITION BY RANGE(from_date) PARTITIONS 19( PARTITION p01 VALUES LESS THAN ('1985-12-31'),  PARTITION p02 VALUES LESS THAN ('1986-12-31'),  PARTITION p03 VALUES LESS THAN ('1987-12-31'),  PARTITION p04 VALUES LESS THAN ('1988-12-31'),  PARTITION p05 VALUES LESS THAN ('1989-12-31'),  PARTITION p06 VALUES LESS THAN ('1990-12-31'),  PARTITION p07 VALUES LESS THAN ('1991-12-31'),  PARTITION p08 VALUES LESS THAN ('1992-12-31'),  PARTITION p09 VALUES LESS THAN ('1993-12-31'),  PARTITION p10 VALUES LESS THAN ('1994-12-31'),  PARTITION p11 VALUES LESS THAN ('1995-12-31'),  PARTITION p12 VALUES LESS THAN ('1996-12-31'),  PARTITION p13 VALUES LESS THAN ('1997-12-31'),  PARTITION p14 VALUES LESS THAN ('1998-12-31'),  PARTITION p15 VALUES LESS THAN ('1999-12-31'),  PARTITION p16 VALUES LESS THAN ('2000-12-31'),  PARTITION p17 VALUES LESS THAN ('2001-12-31'),  PARTITION p18 VALUES LESS THAN ('2002-12-31'),  PARTITION p19 VALUES LESS THAN (MAXVALUE)) ;

USE `bug_tracking` ;

-- -----------------------------------------------------
-- Placeholder table for view `bug_tracking`.`v_permission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bug_tracking`.`v_permission` (`permission_id` INT, `action_name` INT, `resource_name` INT);

-- -----------------------------------------------------
-- View `bug_tracking`.`v_permission`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `bug_tracking`.`v_permission` ;
DROP TABLE IF EXISTS `bug_tracking`.`v_permission`;
USE `bug_tracking`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bug_tracking`.`v_permission` AS select `p`.`id` AS `permission_id`,`a`.`name` AS `action_name`,`r`.`name` AS `resource_name` from ((`bug_tracking`.`permission` `p` join `bug_tracking`.`action` `a`) join `bug_tracking`.`resource` `r`) where ((`p`.`action_id` = `a`.`id`) and (`p`.`resource_id` = `r`.`id`));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;