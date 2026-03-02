-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema goit_rdb_hw_02
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema goit_rdb_hw_02
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `goit_rdb_hw_02` DEFAULT CHARACTER SET utf8 ;
USE `goit_rdb_hw_02` ;

-- -----------------------------------------------------
-- Table `goit_rdb_hw_02`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goit_rdb_hw_02`.`customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `address` VARCHAR(255) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goit_rdb_hw_02`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goit_rdb_hw_02`.`products` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goit_rdb_hw_02`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goit_rdb_hw_02`.`orders` (
  `order_id` INT NOT NULL,
  `order_date` DATE NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_orders_customers_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_customers`
    FOREIGN KEY (`customer_id`)
    REFERENCES `goit_rdb_hw_02`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goit_rdb_hw_02`.`order_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goit_rdb_hw_02`.`order_items` (
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`order_id`, `product_id`),
  INDEX `fk_order_items_products_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_items_orders`
    FOREIGN KEY (`order_id`)
    REFERENCES `goit_rdb_hw_02`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_items_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `goit_rdb_hw_02`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
