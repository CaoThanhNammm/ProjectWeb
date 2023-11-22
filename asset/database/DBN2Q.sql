CREATE DATABASE n2q CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE n2q;

CREATE TABLE genders(
	id INT AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE userStatus(
	id INT AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE users(
	id VARCHAR(20),
	email VARCHAR(100) UNIQUE NOT NULL,
	phone VARCHAR(15) UNIQUE NOT NULL,
	encrypted_password VARCHAR(30) NOT NULL,
	full_name VARCHAR(50) NOT NULL,
	gender_id INT NOT NULL,
	dob DATE,
	address VARCHAR(255) NOT NULL,
	status_id INT NOT NULL,
	
	PRIMARY KEY (id),
	FOREIGN KEY (status_id) REFERENCES userStatus(id),
	FOREIGN KEY (gender_id) REFERENCES genders(id)
);

CREATE TABLE verifyingUsers(
	user_id VARCHAR(20),
	verify_code CHAR(8) NOT NULL,
	expired_time DATETIME NOT NULL,
	
	PRIMARY KEY (user_id),
	FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE productStatus(
	id INT AUTO_INCREMENT,
	`name` VARCHAR(10) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE brands(
	id INT AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE categories(
	id INT AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE attributes(
	id INT AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE products(
	id INT AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	brand_id INT NOT NULL,
	category_id INT NOT NULL,
	description VARCHAR(255) NOT NULL,
	price BIGINT NOT NULL,
	discount BIGINT NOT NULL,
	last_updated DATE NOT NULL,
	amount_sold INT NOT NULL DEFAULT 0,
	status_id INT NOT NULL,
	
	PRIMARY KEY (id),
	FOREIGN KEY (brand_id) REFERENCES brands(id),
	FOREIGN KEY (category_id) REFERENCES categories(id),
	FOREIGN KEY (status_id) REFERENCES productStatus(id)
);

CREATE TABLE productDetails(
	product_id INT,
	attribute_id INT,
	`value` VARCHAR(50),
	
	PRIMARY KEY (product_id, attribute_id),
	FOREIGN KEY (product_id) REFERENCES products(id),
	FOREIGN KEY (attribute_id) REFERENCES attributes(id)
);

CREATE TABLE productModels(
	id INT AUTO_INCREMENT,
	product_id INT NOT NULL,

	PRIMARY KEY (id),
	FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE modelDetails(
	model_id INT,
	attribute_id INT,
	`value` VARCHAR(50),
	
	PRIMARY KEY (model_id, attribute_id),
	FOREIGN KEY (model_id) REFERENCES productModels(id),
	FOREIGN KEY (`attribute_id`) REFERENCES attributes(id)
);

CREATE TABLE rates(
	user_id VARCHAR(20),
	product_id INT,
	last_updated DATE NOT NULL,
	rate_point INT NOT NULL,
	rate_comment VARCHAR(100),
	
	PRIMARY KEY (user_id, product_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE carts(
	user_id VARCHAR(20),
	model_id INT,
	quantity INT NOT NULL DEFAULT 1,
	
	PRIMARY KEY (user_id, model_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (model_id) REFERENCES productModels(id)
);

CREATE TABLE wishlists(
	user_id VARCHAR(20),
	model_id INT,
	
	PRIMARY KEY (user_id, model_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (model_id) REFERENCES productModels(id)
);

CREATE TABLE orderStatus(
	id INT AUTO_INCREMENT,
	`name` VARCHAR(10),
	PRIMARY KEY (id)
);

CREATE TABLE orders(
	id INT AUTO_INCREMENT,
	user_id VARCHAR(20),
	date_created DATE NOT NULL,
	phone VARCHAR(15) NOT NULL,
	address VARCHAR(255) NOT NULL,
	ship_price BIGINT NOT NULL DEFAULT 0,
	status_id INT NOT NULL,
	
	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (status_id) REFERENCES orderStatus(id)
);

CREATE TABLE orderDetails(
	order_id INT,
	model_id INT,
	price BIGINT NOT NULL,
	discount BIGINT NOT NULL,
	quantity INT NOT NULL,
	
	PRIMARY KEY (order_id, model_id),
	FOREIGN KEY (order_id) REFERENCES orders(id),
	FOREIGN KEY (model_id) REFERENCES productModels(id)
);

CREATE TABLE voucherType(
	id INT AUTO_INCREMENT,
	`name` VARCHAR(20) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE voucherScope(
	id INT AUTO_INCREMENT,
	`name` VARCHAR(20) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE voucherStatus(
	id INT AUTO_INCREMENT,
	`name` VARCHAR(20) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE vouchers(
	id INT AUTO_INCREMENT,
	voucher_code VARCHAR(20) NOT NULL,
	date_start DATE NOT NULL,
	date_end DATE NOT NULL,
	discount BIGINT NOT NULL DEFAULT 0,
	type_id INT NOT NULL,
	scope_id INT NOT NULL,
	status_id INT NOT NULL,
	
	PRIMARY KEY (id),
	FOREIGN KEY (status_id) REFERENCES voucherStatus(id),
	FOREIGN KEY (type_id) REFERENCES voucherType(id),
	FOREIGN KEY (scope_id) REFERENCES voucherScope(id)
);

CREATE TABLE personalVouchers(
	voucher_id INT,
	user_id VARCHAR(20) NOT NULL,
	
	PRIMARY KEY(voucher_id),
	FOREIGN KEY (voucher_id) REFERENCES vouchers(id),
	FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE unknownVouchers(
	voucher_id INT,
	remain INT NOT NULL DEFAULT 0,
	
	PRIMARY KEY(voucher_id),
	FOREIGN KEY (voucher_id) REFERENCES vouchers(id)
);

CREATE TABLE productVouchers(
	voucher_id INT,
	product_id INT,

	PRIMARY KEY(voucher_id, product_id),
	FOREIGN KEY (voucher_id) REFERENCES vouchers(id),
	FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE categoryVouchers(
	voucher_id INT,
	category_id INT,

	PRIMARY KEY(voucher_id, category_id),
	FOREIGN KEY (voucher_id) REFERENCES vouchers(id),
	FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE brandVouchers(
	voucher_id INT,
	brand_id INT,

	PRIMARY KEY(voucher_id, brand_id),
	FOREIGN KEY (voucher_id) REFERENCES vouchers(id),
	FOREIGN KEY (brand_id) REFERENCES brands(id)
);

CREATE TABLE usedVouchers(
	user_id VARCHAR(20),
	voucher_id INT NOT NULL,
	order_id INT NOT NULL,
	
	PRIMARY KEY (user_id, voucher_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (voucher_id) REFERENCES vouchers(id),
	FOREIGN KEY (order_id) REFERENCES orders(id)
);



-- users
insert into users values("ABCD", "nam123@gmail.com", 0901123254, "JK^%!HJHJ", "Nguyễn Nhật Nam", 1, "3/1/2003", "BH", 3) 
insert into users values("AHDJ", "quan123@gmail.com", 0821431247, "IOPHJ78#!S", "Nguyễn Hoàng Khánh Quân", 1, "12/12/2003", "TPHCM", 3) 
insert into users values("KLSL", "knam123@gmail.com", 0761324312, "HJ%HJ&^!7J", "Cao Khải Nam", 1, "3/1/2003", "TPHCM", 3)

-- userstatus
insert into (name) values("Chưa xác minh") 
insert into userstatus(name) values("Khóa tài khoản") 
insert into userstatus(name) values("Hoạt động")

-- genders
insert into genders values("Nam") 
insert into genders values("Nữ")

-- productstatus
select * from productstatus
insert into productstatus(name) values("Ẩn")
insert into productstatus(name) values("Khả dụng")
insert into productstatus(name) values("Hết hàng")

-- 





