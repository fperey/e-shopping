SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `es_users` ;
CREATE SCHEMA IF NOT EXISTS `es_users` DEFAULT CHARACTER SET latin1 ;
SHOW WARNINGS;
USE `es_users` ;

-- -----------------------------------------------------
-- Table `es_users`.`es_users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `es_users`.`es_users` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `es_users`.`es_users` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `firstname` VARCHAR(45) NOT NULL ,
  `secondname` VARCHAR(45) NULL ,
  `lastname` VARCHAR(45) NOT NULL ,
  `birthdate` DATETIME NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `id_UNIQUE` ON `es_users`.`es_users` (`id` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `es_users`.`es_address_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `es_users`.`es_address_type` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `es_users`.`es_address_type` (
  `id` INT NOT NULL ,
  `description` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `es_users`.`es_user_address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `es_users`.`es_user_address` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `es_users`.`es_user_address` (
  `idUser` INT NOT NULL ,
  `idAddressType_id` INT NOT NULL ,
  `streetLine1` VARCHAR(45) NOT NULL ,
  `streetLine2` VARCHAR(45) NULL ,
  `city` VARCHAR(45) NOT NULL ,
  `state` VARCHAR(45) NOT NULL ,
  `country` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idUser`, `idAddressType_id`) ,
  CONSTRAINT `fk_es_user_address_es_users1`
    FOREIGN KEY (`idUser` )
    REFERENCES `es_users`.`es_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_es_user_address_es_address_type1`
    FOREIGN KEY (`idAddressType_id` )
    REFERENCES `es_users`.`es_address_type` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_es_user_address_es_address_type1_idx` ON `es_users`.`es_user_address` (`idAddressType_id` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `es_users`.`es_user_accounts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `es_users`.`es_user_accounts` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `es_users`.`es_user_accounts` (
  `id` INT NOT NULL ,
  `idUser` INT NOT NULL ,
  `username` VARCHAR(25) NOT NULL ,
  `password` VARCHAR(25) NOT NULL ,
  `creationDate` DATETIME NOT NULL ,
  `expirationDate` VARCHAR(45) NULL ,
  `blocked` TINYINT(1) NOT NULL DEFAULT false ,
  PRIMARY KEY (`id`, `idUser`) ,
  CONSTRAINT `fk_es_user_accounts_es_users`
    FOREIGN KEY (`idUser` )
    REFERENCES `es_users`.`es_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `username_UNIQUE` ON `es_users`.`es_user_accounts` (`username` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `password_UNIQUE` ON `es_users`.`es_user_accounts` (`password` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `es_users`.`es_user_emails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `es_users`.`es_user_emails` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `es_users`.`es_user_emails` (
  `idUser` INT NOT NULL ,
  `idAddressType` INT NOT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idUser`, `idAddressType`) ,
  CONSTRAINT `fk_es_user_emails_es_users1`
    FOREIGN KEY (`idUser` )
    REFERENCES `es_users`.`es_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_es_user_emails_es_address_type1`
    FOREIGN KEY (`idAddressType` )
    REFERENCES `es_users`.`es_address_type` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_es_user_emails_es_address_type1_idx` ON `es_users`.`es_user_emails` (`idAddressType` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `es_users`.`es_phone_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `es_users`.`es_phone_types` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `es_users`.`es_phone_types` (
  `id` INT NOT NULL ,
  `description` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `es_users`.`es_user_phones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `es_users`.`es_user_phones` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `es_users`.`es_user_phones` (
  `idUser` INT NOT NULL ,
  `idPhoneType` INT NOT NULL ,
  `number` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idUser`, `idPhoneType`) ,
  CONSTRAINT `fk_es_user_phones_es_users1`
    FOREIGN KEY (`idUser` )
    REFERENCES `es_users`.`es_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_es_user_phones_es_phone_types1`
    FOREIGN KEY (`idPhoneType` )
    REFERENCES `es_users`.`es_phone_types` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_es_user_phones_es_phone_types1_idx` ON `es_users`.`es_user_phones` (`idPhoneType` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `es_users`.`es_sessions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `es_users`.`es_sessions` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `es_users`.`es_sessions` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `idUser` INT NOT NULL ,
  `creationDate` DATETIME NOT NULL ,
  `destroyDate` DATETIME NULL ,
  `active` TINYINT(1) NOT NULL DEFAULT True ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_es_sessions_es_users1`
    FOREIGN KEY (`idUser` )
    REFERENCES `es_users`.`es_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_es_sessions_es_users1_idx` ON `es_users`.`es_sessions` (`idUser` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `es_users`.`es_events_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `es_users`.`es_events_type` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `es_users`.`es_events_type` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `description_UNIQUE` ON `es_users`.`es_events_type` (`description` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `es_users`.`es_events`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `es_users`.`es_events` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `es_users`.`es_events` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `idSession` INT NOT NULL ,
  `idEventType` INT NOT NULL ,
  `date` DATETIME NOT NULL ,
  `description` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_es_events_es_sessions1`
    FOREIGN KEY (`idSession` )
    REFERENCES `es_users`.`es_sessions` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_es_events_es_events_type1`
    FOREIGN KEY (`idEventType` )
    REFERENCES `es_users`.`es_events_type` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_es_events_es_sessions1_idx` ON `es_users`.`es_events` (`idSession` ASC) ;

SHOW WARNINGS;
CREATE INDEX `fk_es_events_es_events_type1_idx` ON `es_users`.`es_events` (`idEventType` ASC) ;

SHOW WARNINGS;
USE `es_users` ;

GRANT SELECT ON TABLE `es_users`.* TO 'es_portal';
GRANT SELECT, INSERT, TRIGGER ON TABLE `es_users`.* TO 'es_portal';
GRANT ALL ON `es_users`.* TO 'es_portal';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `es_users`.* TO 'es_portal';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `es_users`.`es_users`
-- -----------------------------------------------------
START TRANSACTION;
USE `es_users`;
INSERT INTO `es_users`.`es_users` (`id`, `firstname`, `secondname`, `lastname`, `birthdate`) VALUES (1, 'Francisco', 'José', 'Pereyra', '14/12/1976');

COMMIT;

-- -----------------------------------------------------
-- Data for table `es_users`.`es_address_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `es_users`;
INSERT INTO `es_users`.`es_address_type` (`id`, `description`) VALUES (1, 'Home');
INSERT INTO `es_users`.`es_address_type` (`id`, `description`) VALUES (2, 'Work');
INSERT INTO `es_users`.`es_address_type` (`id`, `description`) VALUES (3, 'Other');

COMMIT;

-- -----------------------------------------------------
-- Data for table `es_users`.`es_user_address`
-- -----------------------------------------------------
START TRANSACTION;
USE `es_users`;
INSERT INTO `es_users`.`es_user_address` (`idUser`, `idAddressType_id`, `streetLine1`, `streetLine2`, `city`, `state`, `country`) VALUES (1, 1, 'Peredo 586', NULL, 'Ituzaingó', 'Buenos Aires', 'Argentina');

COMMIT;

-- -----------------------------------------------------
-- Data for table `es_users`.`es_user_accounts`
-- -----------------------------------------------------
START TRANSACTION;
USE `es_users`;
INSERT INTO `es_users`.`es_user_accounts` (`id`, `idUser`, `username`, `password`, `creationDate`, `expirationDate`, `blocked`) VALUES (1, 1, 'fpereyra', '12Monos', '25/05/2013', NULL, False);

COMMIT;

-- -----------------------------------------------------
-- Data for table `es_users`.`es_user_emails`
-- -----------------------------------------------------
START TRANSACTION;
USE `es_users`;
INSERT INTO `es_users`.`es_user_emails` (`idUser`, `idAddressType`, `email`) VALUES (1, 1, 'francisco.pereyra@gmail.com');

COMMIT;

-- -----------------------------------------------------
-- Data for table `es_users`.`es_phone_types`
-- -----------------------------------------------------
START TRANSACTION;
USE `es_users`;
INSERT INTO `es_users`.`es_phone_types` (`id`, `description`) VALUES (1, 'Home');
INSERT INTO `es_users`.`es_phone_types` (`id`, `description`) VALUES (2, 'Work');
INSERT INTO `es_users`.`es_phone_types` (`id`, `description`) VALUES (3, 'Mobile');
INSERT INTO `es_users`.`es_phone_types` (`id`, `description`) VALUES (4, 'Personal Mobile');
INSERT INTO `es_users`.`es_phone_types` (`id`, `description`) VALUES (5, 'Work Mobile');
INSERT INTO `es_users`.`es_phone_types` (`id`, `description`) VALUES (6, 'Fax');

COMMIT;

-- -----------------------------------------------------
-- Data for table `es_users`.`es_user_phones`
-- -----------------------------------------------------
START TRANSACTION;
USE `es_users`;
INSERT INTO `es_users`.`es_user_phones` (`idUser`, `idPhoneType`, `number`) VALUES (1, 1, '+54 (11) 4621-1231');

COMMIT;

-- -----------------------------------------------------
-- Data for table `es_users`.`es_events_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `es_users`;
INSERT INTO `es_users`.`es_events_type` (`id`, `description`) VALUES (1, 'Create Session');
INSERT INTO `es_users`.`es_events_type` (`id`, `description`) VALUES (2, 'Destroy Session');
INSERT INTO `es_users`.`es_events_type` (`id`, `description`) VALUES (3, 'Create User');
INSERT INTO `es_users`.`es_events_type` (`id`, `description`) VALUES (4, 'Delete User');
INSERT INTO `es_users`.`es_events_type` (`id`, `description`) VALUES (5, 'Open Page');

COMMIT;
