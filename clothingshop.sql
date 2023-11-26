CREATE TABLE `Department` (
	`department_id` INT(10) NOT NULL,
	`department_name` varchar(70) NOT NULL,
	`city` varchar(30) NOT NULL,
	`street` varchar(30) NOT NULL,
	`building` varchar(5),
	PRIMARY KEY (`department_id`)
);

CREATE TABLE `Employee` (
	`employee_id` INT(10) NOT NULL,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`birth_date` DATE NOT NULL,
	`phone_number` varchar(25) NOT NULL,
	`email` varchar(60) NOT NULL,
	`position` varchar(40) NOT NULL,
	`employment_date` DATE NOT NULL,
	`department_id` INT(10),
	`manager_id` INT,
	`rate` FLOAT(15) NOT NULL,
	`bonus` FLOAT(15),
	PRIMARY KEY (`employee_id`)
);

CREATE TABLE `Supplier` (
	`supplier_id` INT(10) NOT NULL,
	`company_name` varchar(70) NOT NULL,
	`phone_number` varchar(25) NOT NULL,
	`email` varchar(100) NOT NULL,
	`physical_address` varchar(150) NOT NULL,
	PRIMARY KEY (`supplier_id`)
);

CREATE TABLE `Customer` (
	`customer_id` INT(50) NOT NULL AUTO_INCREMENT,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`birth_date` DATE NOT NULL,
	`gender` varchar(1) NOT NULL,
	`city` varchar(30) NOT NULL,
	`street` varchar(30) NOT NULL,
	`building` varchar(5),
	`phone_number` varchar(25) NOT NULL,
	`email` varchar(60) NOT NULL,
	`discount` INT(5),
	PRIMARY KEY (`customer_id`)
);

CREATE TABLE `Product` (
	`product_id` INT(15) NOT NULL AUTO_INCREMENT,
	`product_name` varchar(60) NOT NULL,
	`product_description` varchar(200) NOT NULL,
	`category` varchar(50) NOT NULL,
	`manufacture` varchar(50) NOT NULL,
	`supplier_id` INT(10) NOT NULL,
	`amount_warehouse` INT(5),
	`amount_store` INT(5),
	`total_amount` INT(5),
	`storage_location_warehouse` varchar(150),
	`size` varchar(5) NOT NULL,
	`color` varchar(30) NOT NULL,
	`price` FLOAT(15) NOT NULL,
	PRIMARY KEY (`product_id`)
);

CREATE TABLE `Warehouse` (
	`warehouse_id` INT(10) NOT NULL,
	`city` varchar(30) NOT NULL,
	`street` varchar(30) NOT NULL,
	`bulding` varchar(5),
	`manager_id` INT NOT NULL,
	`inventory_date` DATE NOT NULL,
	PRIMARY KEY (`warehouse_id`)
);

CREATE TABLE `Customer_Orders` (
	`customer_orders_id` INT NOT NULL AUTO_INCREMENT,
	`customer_orders_number` INT(30) NOT NULL AUTO_INCREMENT,
	`employee_id` INT(10) NOT NULL,
	`customer_id` INT NOT NULL,
	`new_delivery_address` varchar(150),
	`product_id` INT NOT NULL,
	`product_amount` INT(10) NOT NULL,
	`discount` INT(5),
	`order_amount` INT(10) NOT NULL,
	`customer_order_datetime` DATETIME NOT NULL,
	`status` varchar(30) NOT NULL,
	PRIMARY KEY (`customer_orders_id`)
);

CREATE TABLE `Сustomer_Invoice` (
	`customer_invoice_id` INT NOT NULL AUTO_INCREMENT,
	`customer_invoice_number` INT(50) NOT NULL AUTO_INCREMENT,
	`customer_orders_id` INT NOT NULL,
	`payment_method` varchar(30) NOT NULL,
	`transaction_moment` DATETIME NOT NULL,
	`status` varchar(30) NOT NULL,
	PRIMARY KEY (`customer_invoice_id`)
);

CREATE TABLE `Supplier_Orders` (
	`supplier_orders_id` INT(30) NOT NULL AUTO_INCREMENT,
	`supplier_orders_number` INT(30) NOT NULL AUTO_INCREMENT,
	`supplier_id` INT(10) NOT NULL,
	`employee_id` INT(10) NOT NULL,
	`product_id` INT(15) NOT NULL,
	`size` varchar(5) NOT NULL,
	`color` varchar(30) NOT NULL,
	`product_amount` INT(10) NOT NULL,
	`price` FLOAT(15) NOT NULL,
	`order_amount` INT(10) NOT NULL,
	`supplier_order_datetime` DATETIME NOT NULL,
	`status` varchar(30) NOT NULL,
	PRIMARY KEY (`supplier_orders_id`)
);

CREATE TABLE `Supplier_Invoice` (
	`supplier_invoice_id` INT(30) NOT NULL AUTO_INCREMENT,
	`supplier_invoice_number` INT(30) NOT NULL AUTO_INCREMENT,
	`supplier_orders_id` INT(30) NOT NULL,
	`payment_method` varchar(30) NOT NULL,
	`transaction_moment` DATETIME NOT NULL,
	`status` varchar(30) NOT NULL,
	PRIMARY KEY (`supplier_invoice_id`)
);

ALTER TABLE `Employee` ADD CONSTRAINT `Employee_fk0` FOREIGN KEY (`department_id`) REFERENCES `Department`(`department_id`);

ALTER TABLE `Employee` ADD CONSTRAINT `Employee_fk1` FOREIGN KEY (`manager_id`) REFERENCES `Employee`(`employee_id`);

ALTER TABLE `Product` ADD CONSTRAINT `Product_fk0` FOREIGN KEY (`supplier_id`) REFERENCES `Supplier`(`supplier_id`);

ALTER TABLE `Warehouse` ADD CONSTRAINT `Warehouse_fk0` FOREIGN KEY (`manager_id`) REFERENCES `Employee`(`manager_id`);

ALTER TABLE `Customer_Orders` ADD CONSTRAINT `Customer_Orders_fk0` FOREIGN KEY (`employee_id`) REFERENCES `Employee`(`employee_id`);

ALTER TABLE `Customer_Orders` ADD CONSTRAINT `Customer_Orders_fk1` FOREIGN KEY (`customer_id`) REFERENCES `Customer`(`customer_id`);

ALTER TABLE `Customer_Orders` ADD CONSTRAINT `Customer_Orders_fk2` FOREIGN KEY (`product_id`) REFERENCES `Product`(`product_id`);

ALTER TABLE `Сustomer_Invoice` ADD CONSTRAINT `Сustomer_Invoice_fk0` FOREIGN KEY (`customer_orders_id`) REFERENCES `Customer_Orders`(`customer_orders_id`);

ALTER TABLE `Supplier_Orders` ADD CONSTRAINT `Supplier_Orders_fk0` FOREIGN KEY (`supplier_id`) REFERENCES `Supplier`(`supplier_id`);

ALTER TABLE `Supplier_Orders` ADD CONSTRAINT `Supplier_Orders_fk1` FOREIGN KEY (`employee_id`) REFERENCES `Employee`(`employee_id`);

ALTER TABLE `Supplier_Orders` ADD CONSTRAINT `Supplier_Orders_fk2` FOREIGN KEY (`product_id`) REFERENCES `Product`(`product_id`);

ALTER TABLE `Supplier_Invoice` ADD CONSTRAINT `Supplier_Invoice_fk0` FOREIGN KEY (`supplier_orders_id`) REFERENCES `Supplier_Orders`(`supplier_orders_id`);











