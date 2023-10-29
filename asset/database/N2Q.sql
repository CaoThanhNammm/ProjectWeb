CREATE DATABASE N2Q;

USE N2Q;

CREATE TABLE products(
	id INT IDENTITY(1,1) PRIMARY KEY,
	model_name VARCHAR(30) NOT NULL,
	name NVARCHAR(100) NOT NULL,
	brand NVARCHAR(100) NOT NULL,
	category NVARCHAR(100) NOT NULL,
	origin NVARCHAR(100) NOT NULL,
	upsell_date DATE NOT NULL DEFAULT GETDATE(),
	price INT NOT NULL DEFAULT 0,
	discount INT NOT NULL DEFAULT 0
);

CREATE TABLE brands(
	name NVARCHAR(100) PRIMARY KEY
);

CREATE TABLE categorys(
	name NVARCHAR(100) PRIMARY KEY
);

CREATE TABLE product_infos(
	product_id INT,
	info_name NVARCHAR(100),
	content NVARCHAR(100) NOT NULL,
	PRIMARY KEY (product_id, info_name)
)

CREATE TABLE product_images(
	product_id INT PRIMARY KEY,
	main_image_file NVARCHAR(100)
)

CREATE TABLE users(
	id INT IDENTITY(1,1) PRIMARY KEY,
	username VARCHAR(10) UNIQUE NOT NULL,
	email VARCHAR(320) UNIQUE NOT NULL,
	phone VARCHAR(20) UNIQUE NOT NULL,
	encrypted_password VARCHAR(20) NOT NULL,
	name NVARCHAR(100) NOT NULL,
	gender NVARCHAR(20),
	address NVARCHAR(500),
	dob DATE,
	role VARCHAR(20) NOT NULL,
	status VARCHAR(20) NOT NULL
);

CREATE TABLE verify_users(
	user_id INT PRIMARY KEY,
	verify_code INT NOT NULL,
	expried_time DATETIME NOT NULL
);

CREATE TABLE carts(
	user_id INT,
	product_id INT,
	quantity INT NOT NULL,

	PRIMARY KEY (user_id, product_id)
);

CREATE TABLE wish_list(
	user_id INT,
	product_id INT,

	PRIMARY KEY (user_id, product_id)
);

CREATE TABLE rates(
	user_id INT,
	product_id INT,
	rating_point SMALLINT,
	comment NVARCHAR(300),
	date DATE NOT NULL DEFAULT GETDATE()

	PRIMARY KEY (user_id, product_id)
);

CREATE TABLE orders(
	id INT IDENTITY(1,1) PRIMARY KEY,
	user_id INT NOT NULL,
	date_created DATE NOT NULL DEFAULT GETDATE(),
	status NVARCHAR(100) NOT NULL,
	email VARCHAR(320) NOT NULL,
	phone VARCHAR(20) NOT NULL, 
	address VARCHAR(20) NOT NULL
);

CREATE TABLE order_status(
	name NVARCHAR(100) PRIMARY KEY
);

CREATE TABLE orders_detail(
	user_id INT,
	product_id INT,
	price INT NOT NULL,
	discount INT NOT NULL,
	quantity SMALLINT NOT NULL,

	PRIMARY KEY (user_id, product_id)
);

-- Thêm khóa ngoại
ALTER TABLE products
ADD FOREIGN KEY (brand) REFERENCES brands(name);

ALTER TABLE products
ADD FOREIGN KEY (category) REFERENCES categorys(name);

ALTER TABLE product_images
ADD FOREIGN KEY (product_id) REFERENCES products(id);

ALTER TABLE product_infos
ADD FOREIGN KEY (product_id) REFERENCES products(id);

ALTER TABLE rates
ADD FOREIGN KEY (product_id) REFERENCES products(id);

ALTER TABLE rates
ADD FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE verify_users
ADD FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE wish_list
ADD FOREIGN KEY (product_id) REFERENCES products(id);

ALTER TABLE wish_list
ADD FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE carts
ADD FOREIGN KEY (product_id) REFERENCES products(id);

ALTER TABLE carts
ADD FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE orders
ADD FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE orders
ADD FOREIGN KEY (status) REFERENCES order_status(name);

ALTER TABLE orders_detail
ADD FOREIGN KEY (product_id) REFERENCES products(id);

ALTER TABLE orders_detail
ADD FOREIGN KEY (user_id) REFERENCES users(id);
