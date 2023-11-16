CREATE DATABASE n2q CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE n2q;

CREATE TABLE genders(
	gender_id INT AUTO_INCREMENT,
	gender VARCHAR(10) NOT NULL,
	PRIMARY KEY (gender_id)
);

CREATE TABLE user_status(
	status_id INT AUTO_INCREMENT,
	status_name VARCHAR(10) NOT NULL,
	PRIMARY KEY (status_id)
);

CREATE TABLE users(
	user_account VARCHAR(20),
	email VARCHAR(100) UNIQUE NOT NULL,
	phone VARCHAR(15) UNIQUE NOT NULL,
	encrypted_password VARCHAR(30) NOT NULL,
	full_name VARCHAR(50) NOT NULL,
	gender_id INT NOT NULL,
	dob DATE,
	address VARCHAR(255) NOT NULL,
	status_id INT NOT NULL,
	
	PRIMARY KEY (user_account),
	FOREIGN KEY (status_id) REFERENCES user_status(status_id),
	FOREIGN KEY (gender_id) REFERENCES genders(gender_id)
);

CREATE TABLE verify_users(
	user_account VARCHAR(20),
	verify_code CHAR(8) NOT NULL,
	expired_time DATETIME NOT NULL,
	
	PRIMARY KEY (user_account),
	FOREIGN KEY (user_account) REFERENCES users(user_account)
);

CREATE TABLE product_status(
	status_id INT AUTO_INCREMENT,
	status_name VARCHAR(10) NOT NULL,
	
	PRIMARY KEY (status_id)
);

CREATE TABLE brands(
	brand_id INT AUTO_INCREMENT,
	brand_name VARCHAR(50) NOT NULL,
	origin VARCHAR(50) NOT NULL,
	
	PRIMARY KEY (brand_id)
);

CREATE TABLE categories(
	category_id INT AUTO_INCREMENT,
	category_name VARCHAR(50) NOT NULL,
	
	PRIMARY KEY (category_id)
);

CREATE TABLE products(
	product_id INT AUTO_INCREMENT,
	product_name VARCHAR(100) NOT NULL,
	brand_id INT NOT NULL,
	category_id INT NOT NULL,
	product_dimension VARCHAR(20) NOT NULL,
	product_description VARCHAR(512) NOT NULL,
	color VARCHAR(10) NOT NULL,
	weight VARCHAR(10) NOT NULL,
	material VARCHAR(10) NOT NULL,
	last_updated DATE NOT NULL,
	amount_sold INT NOT NULL DEFAULT 0,
	price BIGINT NOT NULL,
	discount BIGINT DEFAULT 0,
	status_id INT NOT NULL DEFAULT 0,
	
	PRIMARY KEY (product_id),
	FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
	FOREIGN KEY (category_id) REFERENCES categories(category_id),
	FOREIGN KEY (status_id) REFERENCES product_status(status_id)
);

CREATE TABLE products_eav(
	product_id INT,
	product_attribute VARCHAR(50),
	attribute_value VARCHAR(50),
	
	PRIMARY KEY (product_id, product_attribute),
	FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE rates(
	user_account VARCHAR(20),
	product_id INT,
	date_created DATE NOT NULL,
	rate_point INT NOT NULL,
	rate_comment VARCHAR(100),
	
	PRIMARY KEY (user_account, product_id),
	FOREIGN KEY (user_account) REFERENCES users(user_account),
	FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE carts(
	user_account VARCHAR(20),
	product_id INT,
	quantity INT NOT NULL DEFAULT 1,
	
	PRIMARY KEY (user_account, product_id),
	FOREIGN KEY (user_account) REFERENCES users(user_account),
	FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE wishlists(
	user_account VARCHAR(20),
	product_id INT,
	
	PRIMARY KEY (user_account, product_id),
	FOREIGN KEY (user_account) REFERENCES users(user_account),
	FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE order_status(
	status_id INT AUTO_INCREMENT,
	status_name VARCHAR(10),
	
	PRIMARY KEY (status_id)
);

CREATE TABLE voucher_type(
	type_id INT AUTO_INCREMENT,
	type_name VARCHAR(20) NOT NULL,
	PRIMARY KEY (type_id)
);

CREATE TABLE voucher_scope(
	scope_id INT AUTO_INCREMENT,
	scope_name VARCHAR(20) NOT NULL,
	PRIMARY KEY (scope_id)
);

CREATE TABLE voucher_status(
	status_id INT AUTO_INCREMENT,
	status_name VARCHAR(20) NOT NULL,
	PRIMARY KEY (status_id)
);

CREATE TABLE vouchers(
	voucher_id INT AUTO_INCREMENT,
	voucher_code VARCHAR(20) NOT NULL,
	date_start DATE NOT NULL,
	date_end DATE NOT NULL,
	discount BIGINT NOT NULL DEFAULT 0,
	status_id INT NOT NULL,
	type_id INT NOT NULL,
	scope_id INT NOT NULL,
	
	PRIMARY KEY (voucher_id),
	FOREIGN KEY (status_id) REFERENCES voucher_status(status_id),
	FOREIGN KEY (type_id) REFERENCES voucher_type(type_id),
	FOREIGN KEY (scope_id) REFERENCES voucher_scope(scope_id)
);

CREATE TABLE personal_vouchers(
	voucher_id INT,
	user_account VARCHAR(20) NOT NULL,
	
	PRIMARY KEY(voucher_id),
	FOREIGN KEY (voucher_id) REFERENCES vouchers(voucher_id),
	FOREIGN KEY (user_account) REFERENCES users(user_account)
);

CREATE TABLE unknown_vouchers(
	voucher_id INT,
	remain INT NOT NULL DEFAULT 0,
	
	PRIMARY KEY(voucher_id),
	FOREIGN KEY (voucher_id) REFERENCES vouchers(voucher_id)
);

CREATE TABLE used_vouchers(
	user_account VARCHAR(20),
	voucher_id INT,
	
	PRIMARY KEY (user_account, voucher_id),
	FOREIGN KEY (user_account) REFERENCES users(user_account),
	FOREIGN KEY (voucher_id) REFERENCES vouchers(voucher_id)
);

CREATE TABLE orders(
	order_id INT AUTO_INCREMENT,
	user_account VARCHAR(20),
	date_created DATE NOT NULL,
	phone VARCHAR(15) NOT NULL,
	address VARCHAR(255) NOT NULL,
	voucher_id INT,
	ship_price BIGINT NOT NULL DEFAULT 0,
	status_id INT NOT NULL,
	
	PRIMARY KEY (order_id),
	FOREIGN KEY (user_account) REFERENCES users(user_account),
	FOREIGN KEY (voucher_id) REFERENCES vouchers(voucher_id),
	FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);

CREATE TABLE orders_detail(
	order_id INT,
	product_id INT,
	price BIGINT NOT NULL,
	discount BIGINT NOT NULL,
	quantity INT NOT NULL,
	
	PRIMARY KEY (order_id, product_id),
	FOREIGN KEY (order_id) REFERENCES orders(order_id),
	FOREIGN KEY (product_id) REFERENCES products(product_id)
);