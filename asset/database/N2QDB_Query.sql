CREATE DATABASE n2q CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
drop database n2q
USE n2q;

CREATE TABLE genders(
	id INT AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE user_status(
	id INT AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE role(
	id INT AUTO_INCREMENT,
	`name` varchar(10) NOT NULL,
	PRIMARY KEY (id)
)

CREATE TABLE users(
	id VARCHAR(20),
	email VARCHAR(100) UNIQUE NOT NULL,
	phone VARCHAR(15) UNIQUE NOT NULL,
	encryptedPassword VARCHAR(30) NOT NULL,
	fullName VARCHAR(50) NOT NULL,
	genderID INT NOT NULL,
	dob date,
	roleID INT NOT NULL,
	address VARCHAR(255) NOT NULL,
	statusID INT NOT NULL,
	
	PRIMARY KEY (id),
	FOREIGN KEY (statusID) REFERENCES user_status(id),
	FOREIGN KEY (genderID) REFERENCES genders(id),
	FOREIGN KEY (roleID) REFERENCES role(id)
);

CREATE TABLE verifying_users(
	userID VARCHAR(20),
	verifyCode CHAR(8) NOT NULL,
	expiredTime DATETIME NOT NULL,
	
	PRIMARY KEY (userID),
	FOREIGN KEY (userID) REFERENCES users(id)
);

CREATE TABLE product_status(
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
	brandID INT NOT NULL,
	`description` VARCHAR(255) NOT NULL,
	categoryID INT NOT NULL,
	price BIGINT NOT NULL,
	discount BIGINT NOT NULL,
	lastUpdated DATE NOT NULL DEFAULT CURRENT_DATE(),
	amountSold INT NOT NULL DEFAULT 0,
	statusID INT NOT NULL,
	
	PRIMARY KEY (id),
	FOREIGN KEY (brandID) REFERENCES brands(id),
	FOREIGN KEY (categoryID) REFERENCES categories(id),
	FOREIGN KEY (statusID) REFERENCES product_status(id)
);

CREATE TABLE product_details(
	productID INT,
	attributeID INT,
	`value` VARCHAR(50) NOT NULL,
	
	PRIMARY KEY (productID, attributeID),
	FOREIGN KEY (productID) REFERENCES products(id),
	FOREIGN KEY (attributeID) REFERENCES attributes(id)
);

CREATE TABLE product_models(
	id INT AUTO_INCREMENT,
	productID INT NOT NULL,
	optionValue VARCHAR(50) NOT NULL,
	statusID INT NOT NULL,

	PRIMARY KEY (id),
	FOREIGN KEY (productID) REFERENCES products(id),
	FOREIGN KEY (statusID) REFERENCES product_status(id)
);

CREATE TABLE rates(
	userID VARCHAR(20),
	productID INT,
	lastUpdated DATE NOT NULL,
	ratePoint INT NOT NULL,
	rateComment VARCHAR(100),
	
	PRIMARY KEY (userID, productID),
	FOREIGN KEY (userID) REFERENCES users(id),
	FOREIGN KEY (productID) REFERENCES products(id)
);

CREATE TABLE carts(
	userID VARCHAR(20),
	modelID INT,
	quantity INT NOT NULL DEFAULT 1,
	
	PRIMARY KEY (userID, modelID),
	FOREIGN KEY (userID) REFERENCES users(id),
	FOREIGN KEY (modelID) REFERENCES product_models(id)
);

CREATE TABLE wishlists(
	userID VARCHAR(20),
	modelID INT,
	
	PRIMARY KEY (userID, modelID),
	FOREIGN KEY (userID) REFERENCES users(id),
	FOREIGN KEY (modelID) REFERENCES product_models(id)
);

CREATE TABLE order_status(
	id INT AUTO_INCREMENT,
	`name` VARCHAR(10) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE orders(
	id INT AUTO_INCREMENT,
	userID VARCHAR(20),
	dateCreated DATE NOT NULL,
	lastUpdated DATE NOT NULL,
	phone VARCHAR(15) NOT NULL,
	address VARCHAR(255) NOT NULL,
	statusID INT NOT NULL,
	
	PRIMARY KEY (id),
	FOREIGN KEY (userID) REFERENCES users(id),
	FOREIGN KEY (statusID) REFERENCES order_status(id)
);

CREATE TABLE order_details(
	orderID INT,
	modelID INT,
	price BIGINT NOT NULL,
	discount BIGINT NOT NULL,
	quantity INT NOT NULL,
	
	PRIMARY KEY (orderID, modelID),
	FOREIGN KEY (orderID) REFERENCES orders(id),
	FOREIGN KEY (modelID) REFERENCES product_models(id)
);

CREATE TABLE voucher_type(
	id INT AUTO_INCREMENT,
	`name` VARCHAR(20) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE voucher_scope(
	id INT AUTO_INCREMENT,
	`name` VARCHAR(20) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE voucher_status(
	id INT AUTO_INCREMENT,
	`name` VARCHAR(20) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE vouchers(
	id INT AUTO_INCREMENT,
	voucherCode VARCHAR(20) NOT NULL,
	dateStart DATE NOT NULL,
	dateEnd DATE NOT NULL,
	discount BIGINT NOT NULL DEFAULT 0,
	typeID INT NOT NULL,
	scopeID INT NOT NULL,
	statusID INT NOT NULL,
	
	PRIMARY KEY (id),
	FOREIGN KEY (statusID) REFERENCES voucher_status(id),
	FOREIGN KEY (typeID) REFERENCES voucher_type(id),
	FOREIGN KEY (scopeID) REFERENCES voucher_scope(id)
);

CREATE TABLE personal_vouchers(
	voucherID INT,
	userID VARCHAR(20) NOT NULL,
	
	PRIMARY KEY(voucherID),
	FOREIGN KEY (voucherID) REFERENCES vouchers(id),
	FOREIGN KEY (userID) REFERENCES users(id)
);

CREATE TABLE unknown_vouchers(
	voucherID INT,
	remain INT NOT NULL DEFAULT 0,
	
	PRIMARY KEY(voucherID),
	FOREIGN KEY (voucherID) REFERENCES vouchers(id)
);

CREATE TABLE product_vouchers(
	voucherID INT,
	productID INT,

	PRIMARY KEY(voucherID, productID),
	FOREIGN KEY (voucherID) REFERENCES vouchers(id),
	FOREIGN KEY (productID) REFERENCES products(id)
);

CREATE TABLE category_vouchers(
	voucherID INT,
	categoryID INT,

	PRIMARY KEY(voucherID, categoryID),
	FOREIGN KEY (voucherID) REFERENCES vouchers(id),
	FOREIGN KEY (categoryID) REFERENCES categories(id)
);

CREATE TABLE brand_vouchers(
	voucherID INT,
	brandID INT,

	PRIMARY KEY(voucherID, brandID),
	FOREIGN KEY (voucherID) REFERENCES vouchers(id),
	FOREIGN KEY (brandID) REFERENCES brands(id)
);

CREATE TABLE used_vouchers(
	userID VARCHAR(20),
	voucherID INT NOT NULL,
	orderID INT NOT NULL,
	
	PRIMARY KEY (userID, voucherID),
	FOREIGN KEY (userID) REFERENCES users(id),
	FOREIGN KEY (voucherID) REFERENCES vouchers(id),
	FOREIGN KEY (orderID) REFERENCES orders(id)
);

select * from role
insert into role(name) values
("User"),
("Admin")

select * from users
-- users
insert into users values
("ABCD", "nam123@gmail.com", 0901123254, "JK^%!HJHJ", "Nguyễn Nhật Nam", 1, "2003-01-03", 2, "BH", 3) ,
("AHDJ", "quan123@gmail.com", 0821431247, "IOPHJ78#!S", "Nguyễn Hoàng Khánh Quân", 1, "2003-12-02", 1, "TPHCM", 3),
("KLSL", "knam123@gmail.com", 0761324312, "HJ%HJ&^!7J", "Cao Khải Nam", 1, "2003-01-03", 2,"TPHCM" ,3)

-- userstatus
select * from user_status
insert into user_status(name) values 
("Chưa xác minh"), 
("Khóa tài khoản"), 
("Hoạt động")

-- genders
select * from genders
insert into genders(name) values("Nam"), ("Nữ")

-- productstatus
select * from product_status
insert into product_status(name) values("Ẩn"),("Khả dụng"),("Hết hàng")

-- brands
select * from brands
insert into brands(name) values
("Sunhouse"),
("Kangaroo"),
("Ava"),
("BlueStone"),
("Panasonic"),
("Toshiba"),
("Philips"),
("Pramie"),
("Delites"),
("Electronux"),
("Apex"),
("Duxton"),
("Namilux"),
("Rinnai"),
("Sharp"),
("Tefal"),
("Cystal"),
("Hafele")

-- categories
select * from categories
insert into categories(name) values
("Máy lọc nước"),
("Nồi chiên"),
("Bếp điện"),
("Nồi cơm"),
("Máy ép trái cây"),
("Máy xay sinh tố"),
("Bếp ga"),
("Bình Đun")

-- attributes
insert into attributes(`name`) values
("Màu"),
("Số lượng vòi nước"),
("Thể tích"),
("Công suất"),
("Nút chỉnh tốc độ"),
("Kiểu lắp đặt")


select * from product_models
select * from products

-- order_status
insert into order_status(`name`) values
("Chờ xử lý"),
("Đang giao"),
("Đã hủy"),
("Thành công")

