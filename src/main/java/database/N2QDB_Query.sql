-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.28-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for n2q
CREATE DATABASE IF NOT EXISTS `n2q` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `n2q`;

-- Dumping structure for table n2q.attributes
CREATE TABLE IF NOT EXISTS `attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.attributes: ~6 rows (approximately)
INSERT INTO `attributes` (`id`, `name`) VALUES
	(1, 'Màu'),
	(2, 'Số lượng vòi nước'),
	(3, 'Thể tích'),
	(4, 'Công suất'),
	(5, 'Nút chỉnh tốc độ'),
	(6, 'Kiểu lắp đặt');

-- Dumping structure for table n2q.brands
CREATE TABLE IF NOT EXISTS `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.brands: ~18 rows (approximately)
INSERT INTO `brands` (`id`, `name`) VALUES
	(1, 'Sunhouse'),
	(2, 'Kangaroo'),
	(3, 'Ava'),
	(4, 'BlueStone'),
	(5, 'Panasonic'),
	(6, 'Toshiba'),
	(7, 'Philips'),
	(8, 'Pramie'),
	(9, 'Delites'),
	(10, 'Electronux'),
	(11, 'Apex'),
	(12, 'Duxton'),
	(13, 'Namilux'),
	(14, 'Rinnai'),
	(15, 'Sharp'),
	(16, 'Tefal'),
	(17, 'Cystal'),
	(18, 'Hafele');

-- Dumping structure for table n2q.brand_vouchers
CREATE TABLE IF NOT EXISTS `brand_vouchers` (
  `voucherID` int(11) NOT NULL,
  `brandID` int(11) NOT NULL,
  PRIMARY KEY (`voucherID`,`brandID`),
  KEY `brandID` (`brandID`),
  CONSTRAINT `brand_vouchers_ibfk_1` FOREIGN KEY (`voucherID`) REFERENCES `vouchers` (`id`),
  CONSTRAINT `brand_vouchers_ibfk_2` FOREIGN KEY (`brandID`) REFERENCES `brands` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.brand_vouchers: ~0 rows (approximately)

-- Dumping structure for table n2q.carts
CREATE TABLE IF NOT EXISTS `carts` (
  `userID` varchar(20) NOT NULL,
  `modelID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`userID`,`modelID`),
  KEY `modelID` (`modelID`),
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`),
  CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`modelID`) REFERENCES `product_models` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.carts: ~0 rows (approximately)

-- Dumping structure for table n2q.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.categories: ~8 rows (approximately)
INSERT INTO `categories` (`id`, `name`) VALUES
	(1, 'Máy lọc nước'),
	(2, 'Nồi chiên'),
	(3, 'Bếp điện'),
	(4, 'Nồi cơm'),
	(5, 'Máy ép trái cây'),
	(6, 'Máy xay sinh tố'),
	(7, 'Bếp ga'),
	(8, 'Bình Đun');

-- Dumping structure for table n2q.catery_vouchers
CREATE TABLE IF NOT EXISTS `catery_vouchers` (
  `voucherID` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL,
  PRIMARY KEY (`voucherID`,`categoryID`),
  KEY `categoryID` (`categoryID`),
  CONSTRAINT `catery_vouchers_ibfk_1` FOREIGN KEY (`voucherID`) REFERENCES `vouchers` (`id`),
  CONSTRAINT `catery_vouchers_ibfk_2` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.catery_vouchers: ~0 rows (approximately)

-- Dumping structure for table n2q.genders
CREATE TABLE IF NOT EXISTS `genders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.genders: ~2 rows (approximately)
INSERT INTO `genders` (`id`, `name`) VALUES
	(1, 'Nam'),
	(2, 'Nữ'),
	(3, 'Khác');

-- Dumping structure for table n2q.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(20) DEFAULT NULL,
  `dateCreated` date NOT NULL,
  `lastUpdated` date NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  `statusID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userID` (`userID`),
  KEY `statusID` (`statusID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`statusID`) REFERENCES `order_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.orders: ~0 rows (approximately)

-- Dumping structure for table n2q.order_details
CREATE TABLE IF NOT EXISTS `order_details` (
  `orderID` int(11) NOT NULL,
  `modelID` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `discount` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`orderID`,`modelID`),
  KEY `modelID` (`modelID`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`modelID`) REFERENCES `product_models` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.order_details: ~0 rows (approximately)

-- Dumping structure for table n2q.order_status
CREATE TABLE IF NOT EXISTS `order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.order_status: ~4 rows (approximately)
INSERT INTO `order_status` (`id`, `name`) VALUES
	(1, 'Chờ xử lý'),
	(2, 'Đang giao'),
	(3, 'Đã hủy'),
	(4, 'Thành công');

-- Dumping structure for table n2q.personal_vouchers
CREATE TABLE IF NOT EXISTS `personal_vouchers` (
  `voucherID` int(11) NOT NULL,
  `userID` varchar(20) NOT NULL,
  PRIMARY KEY (`voucherID`),
  KEY `userID` (`userID`),
  CONSTRAINT `personal_vouchers_ibfk_1` FOREIGN KEY (`voucherID`) REFERENCES `vouchers` (`id`),
  CONSTRAINT `personal_vouchers_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.personal_vouchers: ~0 rows (approximately)

-- Dumping structure for table n2q.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `brandID` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `discount` bigint(20) NOT NULL,
  `lastUpdated` date NOT NULL DEFAULT curdate(),
  `amountSold` int(11) NOT NULL DEFAULT 0,
  `statusID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `brandID` (`brandID`),
  KEY `categoryID` (`categoryID`),
  KEY `statusID` (`statusID`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brandID`) REFERENCES `brands` (`id`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`id`),
  CONSTRAINT `products_ibfk_3` FOREIGN KEY (`statusID`) REFERENCES `product_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.products: ~262 rows (approximately)
INSERT INTO `products` (`id`, `name`, `brandID`, `description`, `categoryID`, `price`, `discount`, `lastUpdated`, `amountSold`, `statusID`) VALUES
	(1, 'Bếp ga đôi Apex APB3551', 6, 'Thiết kế đơn giản đẹp mắt nấu ăn tiện lợi Bếp gas Sakura SA-2181EB kiểu dáng vuông vức gọn gàng sử dụng 2 màu đỏ đen hài hòa sang trọng đẹp mắt Bếp với 2 lò nấu tiện lợi để nấu nhiều món ăn cùng lúc tiết kiệm thời gian Bếp gas với mặt bếp kim loại tráng m', 7, 1936597, 1316522, '2023-11-22', 0, 2),
	(2, 'Bếp ga đôi Kangaroo KG519M', 2, 'Bếp gas Sunhouse có 2 lò đun người dùng có thể chế biến cùng lúc nhiều món ăn tiết kiệm thời gian Đầu đốt bếp gas đôi bằng đồng thau chống bào mòn không biến dạng dưới nhiệt độ cao từ bếp siêu bền Cho ngọn lửa xanh khi cháy nấu ăn tiết kiệm gas với lượng ', 7, 2577922, 731732, '2023-11-22', 0, 2),
	(3, 'Bếp ga đôi Electrolux ETG7266GKR', 5, 'Thiết kế đơn giản đẹp mắt nấu ăn tiện lợi Bếp gas Sakura SA-2181EB kiểu dáng vuông vức gọn gàng sử dụng 2 màu đỏ đen hài hòa sang trọng đẹp mắt Bếp với 2 lò nấu tiện lợi để nấu nhiều món ăn cùng lúc tiết kiệm thời gian Bếp gas với mặt bếp kim loại tráng m', 7, 1753575, 417402, '2023-11-22', 0, 2),
	(4, 'Bếp ga đôi Sunhouse Mama MMBB0787MT', 2, 'Bếp gas Sunhouse có 2 lò đun người dùng có thể chế biến cùng lúc nhiều món ăn tiết kiệm thời gian Đầu đốt bếp gas đôi bằng đồng thau chống bào mòn không biến dạng dưới nhiệt độ cao từ bếp siêu bền Cho ngọn lửa xanh khi cháy nấu ăn tiết kiệm gas với lượng ', 7, 890473, 492605, '2023-11-22', 0, 2),
	(5, 'Bếp ga đôi Apex APB3551', 2, 'Thiết kế đơn giản đẹp mắt nấu ăn tiện lợi Bếp gas Sakura SA-2181EB kiểu dáng vuông vức gọn gàng sử dụng 2 màu đỏ đen hài hòa sang trọng đẹp mắt Bếp với 2 lò nấu tiện lợi để nấu nhiều món ăn cùng lúc tiết kiệm thời gian Bếp gas với mặt bếp kim loại tráng m', 7, 2588195, 1552696, '2023-11-22', 0, 2),
	(6, 'Bếp ga đôi Sunhouse SHB3326MT', 4, 'Thiết kế đơn giản đẹp mắt nấu ăn tiện lợi Bếp gas Sakura SA-2181EB kiểu dáng vuông vức gọn gàng sử dụng 2 màu đỏ đen hài hòa sang trọng đẹp mắt Bếp với 2 lò nấu tiện lợi để nấu nhiều món ăn cùng lúc tiết kiệm thời gian Bếp gas với mặt bếp kim loại tráng m', 7, 2047618, 1208387, '2023-11-22', 0, 2),
	(7, 'Bếp ga đôi Kangaroo KG519M', 4, 'Thiết kế đơn giản đẹp mắt nấu ăn tiện lợi Bếp gas Sakura SA-2181EB kiểu dáng vuông vức gọn gàng sử dụng 2 màu đỏ đen hài hòa sang trọng đẹp mắt Bếp với 2 lò nấu tiện lợi để nấu nhiều món ăn cùng lúc tiết kiệm thời gian Bếp gas với mặt bếp kim loại tráng m', 7, 1559012, 419269, '2023-11-22', 0, 2),
	(8, 'Bếp ga đôi Sunhouse SHB 201MT', 5, 'Thiết kế đơn giản đẹp mắt nấu ăn tiện lợi Bếp gas Sakura SA-2181EB kiểu dáng vuông vức gọn gàng sử dụng 2 màu đỏ đen hài hòa sang trọng đẹp mắt Bếp với 2 lò nấu tiện lợi để nấu nhiều món ăn cùng lúc tiết kiệm thời gian Bếp gas với mặt bếp kim loại tráng m', 7, 2303550, 825558, '2023-11-22', 0, 2),
	(9, 'Bếp ga đôi Sunhouse Mama MMBB0787MT', 1, 'Thiết kế đơn giản đẹp mắt nấu ăn tiện lợi Bếp gas Sakura SA-2181EB kiểu dáng vuông vức gọn gàng sử dụng 2 màu đỏ đen hài hòa sang trọng đẹp mắt Bếp với 2 lò nấu tiện lợi để nấu nhiều món ăn cùng lúc tiết kiệm thời gian Bếp gas với mặt bếp kim loại tráng m', 7, 2065534, 841664, '2023-11-22', 0, 2),
	(10, 'Bếp ga mini Namilux NH-P3031AS', 6, 'Thiết kế đơn giản đẹp mắt nấu ăn tiện lợi Bếp gas Sakura SA-2181EB kiểu dáng vuông vức gọn gàng sử dụng 2 màu đỏ đen hài hòa sang trọng đẹp mắt Bếp với 2 lò nấu tiện lợi để nấu nhiều món ăn cùng lúc tiết kiệm thời gian Bếp gas với mặt bếp kim loại tráng m', 7, 2022039, 759326, '2023-11-22', 0, 2),
	(11, 'Bếp ga đôi Sunhouse Mama MMBB0787MT', 6, 'Thiết kế đơn giản đẹp mắt nấu ăn tiện lợi Bếp gas Sakura SA-2181EB kiểu dáng vuông vức gọn gàng sử dụng 2 màu đỏ đen hài hòa sang trọng đẹp mắt Bếp với 2 lò nấu tiện lợi để nấu nhiều món ăn cùng lúc tiết kiệm thời gian Bếp gas với mặt bếp kim loại tráng m', 7, 2930221, 1252135, '2023-11-22', 0, 2),
	(12, 'Bếp ga đôi Electrolux ETG7266GKR', 6, 'Bếp gas Sunhouse có 2 lò đun người dùng có thể chế biến cùng lúc nhiều món ăn tiết kiệm thời gian Đầu đốt bếp gas đôi bằng đồng thau chống bào mòn không biến dạng dưới nhiệt độ cao từ bếp siêu bền Cho ngọn lửa xanh khi cháy nấu ăn tiết kiệm gas với lượng ', 7, 2074575, 1393837, '2023-11-22', 0, 2),
	(13, 'Bếp ga đôi Sakura SA-695SG', 4, 'Thiết kế hiện đại sang trọng trang nhã Bếp gas Sunhouse SHB3365 có kiểu dáng kết hợp hài hòa với hoa văn và màu sắc tạo nét sinh động mà không kém phần sang trọng cho không gian phòng bếp Lắp đặt thuận tiện dễ dàng Mặt bếp gas đôi bằng kính cường lực bền ', 7, 2092926, 953181, '2023-11-22', 0, 2),
	(14, 'Bếp ga mini Namilux NH-P3031AS', 5, 'Bếp gas Sunhouse có 2 lò đun người dùng có thể chế biến cùng lúc nhiều món ăn tiết kiệm thời gian Đầu đốt bếp gas đôi bằng đồng thau chống bào mòn không biến dạng dưới nhiệt độ cao từ bếp siêu bền Cho ngọn lửa xanh khi cháy nấu ăn tiết kiệm gas với lượng ', 7, 877963, 605657, '2023-11-22', 0, 2),
	(15, 'Bếp ga đôi Electrolux ETG7266GKR', 5, 'Thiết kế đẹp nấu ăn tiện lợi Bếp gas Sakura SA-695SG có kiểu dáng đơn giản màu sắc thời trang họa tiết sáng tạo gần gũi với người Việt Nam đem đến cho không gian bếp của bạn sự ấm áp thân thiện Bếp gas có 2 lò đun bạn có thể nấu nhiều món ăn cùng lúc dễ d', 7, 2067359, 737172, '2023-11-22', 0, 2),
	(16, 'Bếp ga đôi Sunhouse SHB3365', 4, 'Thiết kế hiện đại sang trọng trang nhã Bếp gas Sunhouse SHB3365 có kiểu dáng kết hợp hài hòa với hoa văn và màu sắc tạo nét sinh động mà không kém phần sang trọng cho không gian phòng bếp Lắp đặt thuận tiện dễ dàng Mặt bếp gas đôi bằng kính cường lực bền ', 7, 1174737, 349807, '2023-11-22', 0, 2),
	(17, 'Bếp ga đôi Rinnai RV-MC27BE', 6, 'Bếp gas Sunhouse có 2 lò đun người dùng có thể chế biến cùng lúc nhiều món ăn tiết kiệm thời gian Đầu đốt bếp gas đôi bằng đồng thau chống bào mòn không biến dạng dưới nhiệt độ cao từ bếp siêu bền Cho ngọn lửa xanh khi cháy nấu ăn tiết kiệm gas với lượng ', 7, 1810403, 1089574, '2023-11-22', 0, 2),
	(18, 'Bếp ga đôi Sunhouse SHB3365', 4, 'Bếp gas Sunhouse có 2 lò đun người dùng có thể chế biến cùng lúc nhiều món ăn tiết kiệm thời gian Đầu đốt bếp gas đôi bằng đồng thau chống bào mòn không biến dạng dưới nhiệt độ cao từ bếp siêu bền Cho ngọn lửa xanh khi cháy nấu ăn tiết kiệm gas với lượng ', 7, 719838, 433936, '2023-11-22', 0, 2),
	(19, 'Bếp ga đôi Kangaroo KG8G1C', 5, 'Thiết kế đơn giản đẹp mắt nấu ăn tiện lợi Bếp gas Sakura SA-2181EB kiểu dáng vuông vức gọn gàng sử dụng 2 màu đỏ đen hài hòa sang trọng đẹp mắt Bếp với 2 lò nấu tiện lợi để nấu nhiều món ăn cùng lúc tiết kiệm thời gian Bếp gas với mặt bếp kim loại tráng m', 7, 2030946, 860355, '2023-11-22', 0, 2),
	(20, 'Bếp ga đôi Sunhouse SHB3326MT', 5, 'Thiết kế đơn giản đẹp mắt nấu ăn tiện lợi Bếp gas Sakura SA-2181EB kiểu dáng vuông vức gọn gàng sử dụng 2 màu đỏ đen hài hòa sang trọng đẹp mắt Bếp với 2 lò nấu tiện lợi để nấu nhiều món ăn cùng lúc tiết kiệm thời gian Bếp gas với mặt bếp kim loại tráng m', 7, 2174749, 1495187, '2023-11-22', 0, 2),
	(21, 'Bếp ga đôi Sunhouse Mama MMBB0787MT', 5, 'Thiết kế đẹp nấu ăn tiện lợi Bếp gas Sakura SA-695SG có kiểu dáng đơn giản màu sắc thời trang họa tiết sáng tạo gần gũi với người Việt Nam đem đến cho không gian bếp của bạn sự ấm áp thân thiện Bếp gas có 2 lò đun bạn có thể nấu nhiều món ăn cùng lúc dễ d', 7, 1164187, 579941, '2023-11-22', 0, 2),
	(22, 'Bếp ga đôi Rinnai RV-MC27BE', 2, 'Thiết kế đẹp nấu ăn tiện lợi Bếp gas Sakura SA-695SG có kiểu dáng đơn giản màu sắc thời trang họa tiết sáng tạo gần gũi với người Việt Nam đem đến cho không gian bếp của bạn sự ấm áp thân thiện Bếp gas có 2 lò đun bạn có thể nấu nhiều món ăn cùng lúc dễ d', 7, 845994, 428908, '2023-11-22', 0, 2),
	(23, 'Bếp ga mini Namilux NH-P3031AS', 1, 'Thiết kế đơn giản đẹp mắt nấu ăn tiện lợi Bếp gas Sakura SA-2181EB kiểu dáng vuông vức gọn gàng sử dụng 2 màu đỏ đen hài hòa sang trọng đẹp mắt Bếp với 2 lò nấu tiện lợi để nấu nhiều món ăn cùng lúc tiết kiệm thời gian Bếp gas với mặt bếp kim loại tráng m', 7, 2544349, 598086, '2023-11-22', 0, 2),
	(24, 'Bếp ga đôi Sunhouse Mama MMBB0787MT', 3, 'Bếp gas Sunhouse có 2 lò đun người dùng có thể chế biến cùng lúc nhiều món ăn tiết kiệm thời gian Đầu đốt bếp gas đôi bằng đồng thau chống bào mòn không biến dạng dưới nhiệt độ cao từ bếp siêu bền Cho ngọn lửa xanh khi cháy nấu ăn tiết kiệm gas với lượng ', 7, 1650014, 858775, '2023-11-22', 0, 2),
	(25, 'Bếp ga đôi Kangaroo KG8G1A', 6, 'Thiết kế đẹp nấu ăn tiện lợi Bếp gas Sakura SA-695SG có kiểu dáng đơn giản màu sắc thời trang họa tiết sáng tạo gần gũi với người Việt Nam đem đến cho không gian bếp của bạn sự ấm áp thân thiện Bếp gas có 2 lò đun bạn có thể nấu nhiều món ăn cùng lúc dễ d', 7, 971956, 215730, '2023-11-22', 0, 2),
	(26, 'Bếp ga đôi Rinnai RV-MC27BE', 4, 'Thiết kế đơn giản đẹp mắt nấu ăn tiện lợi Bếp gas Sakura SA-2181EB kiểu dáng vuông vức gọn gàng sử dụng 2 màu đỏ đen hài hòa sang trọng đẹp mắt Bếp với 2 lò nấu tiện lợi để nấu nhiều món ăn cùng lúc tiết kiệm thời gian Bếp gas với mặt bếp kim loại tráng m', 7, 2757136, 1712879, '2023-11-22', 0, 2),
	(27, 'Bếp ga đôi Sunhouse SHB 201MT', 3, 'Thiết kế đơn giản đẹp mắt nấu ăn tiện lợi Bếp gas Sakura SA-2181EB kiểu dáng vuông vức gọn gàng sử dụng 2 màu đỏ đen hài hòa sang trọng đẹp mắt Bếp với 2 lò nấu tiện lợi để nấu nhiều món ăn cùng lúc tiết kiệm thời gian Bếp gas với mặt bếp kim loại tráng m', 7, 2664291, 1265850, '2023-11-22', 0, 2),
	(28, 'Bếp ga đôi Apex APB3551', 5, 'Bếp gas Sunhouse có 2 lò đun người dùng có thể chế biến cùng lúc nhiều món ăn tiết kiệm thời gian Đầu đốt bếp gas đôi bằng đồng thau chống bào mòn không biến dạng dưới nhiệt độ cao từ bếp siêu bền Cho ngọn lửa xanh khi cháy nấu ăn tiết kiệm gas với lượng ', 7, 2139598, 951061, '2023-11-22', 0, 2),
	(29, 'Bếp ga đôi Kangaroo KG8G1A', 5, 'Bếp gas Sunhouse có 2 lò đun người dùng có thể chế biến cùng lúc nhiều món ăn tiết kiệm thời gian Đầu đốt bếp gas đôi bằng đồng thau chống bào mòn không biến dạng dưới nhiệt độ cao từ bếp siêu bền Cho ngọn lửa xanh khi cháy nấu ăn tiết kiệm gas với lượng ', 7, 2817982, 855293, '2023-11-22', 0, 2),
	(30, 'Bếp từ hồng ngoại lắp âm Pramie PRTH-A1', 18, 'Tổng công suất 7400W khi mở cùng lúc 3 vùng nấu mỗi vùng nấu đều có chức năng Booster gia nhiệt nhanh Vùng bếp giữa 1200/1400W vùng bếp bên trái 2000/3000W và vùng bếp bên phải 2400/3700W tùy vào nguyên liệu và nhu cầu bạn chọn vùng nấu có mức công suất p', 3, 653383, 202757, '2023-11-22', 0, 2),
	(31, 'Bếp từ đôi lắp âm BlueStone ICB-6818', 5, 'Bếp từ hồng ngoại Sunhouse MMB9100VN thiết kế thời trang thanh lịch có thể lắp đặt âm dưới kệ bếp Giúp tăng diện tích trống cho không gian bếp thông thoáng hơn thích hợp sử dụng trong khách sạn quán ăn gia đình Mặt bếp siêu mỏng khi lắp đặt âm gần như nằm', 3, 974929, 624922, '2023-11-22', 0, 2),
	(32, 'Bếp từ hồng ngoại lắp âm Pramie PRTH-A1', 7, 'Bếp từ đôi Pramie PRTH-2022 đến từ thương hiệu Pramie - Đức sản xuất và nhập khẩu nguyên chiếc từ Thái Lan sở hữu thiết kế lắp âm hiện đại đồng thời có thể đặt nổi đa dạng tính năng an toàn công nghệ Smart Inverter tiết kiệm điện bếp có thể gia nhiệt liên', 3, 1587997, 576318, '2023-11-22', 0, 2),
	(33, 'Bếp từ đôi lắp âm BlueStone ICB-6818', 2, 'Bếp từ hồng ngoại Sunhouse MMB9100VN thiết kế thời trang thanh lịch có thể lắp đặt âm dưới kệ bếp Giúp tăng diện tích trống cho không gian bếp thông thoáng hơn thích hợp sử dụng trong khách sạn quán ăn gia đình Mặt bếp siêu mỏng khi lắp đặt âm gần như nằm', 3, 1928999, 802126, '2023-11-22', 0, 2),
	(34, 'Bếp từ đôi lắp âm BlueStone ICB-6818', 5, 'Bếp từ đôi Pramie PRTH-2022 đến từ thương hiệu Pramie - Đức sản xuất và nhập khẩu nguyên chiếc từ Thái Lan sở hữu thiết kế lắp âm hiện đại đồng thời có thể đặt nổi đa dạng tính năng an toàn công nghệ Smart Inverter tiết kiệm điện bếp có thể gia nhiệt liên', 3, 1923742, 971991, '2023-11-22', 0, 2),
	(35, 'Bếp từ hồng ngoại lắp âm Sunhouse Mama MMB9100VN', 15, 'Đây là sản phẩm thuộc dòng bếp từ đôi được thiết kế lắp âm hoặc lắp dương giúp sử dụng linh hoạt trong gian bếp Đến từ thương hiệu 100 năm - Hafele (Đức) sản xuất và nhập khẩu nguyên chiếc từ Malaysia đảm bảo chất lượng mẫu mã Bếp từ sở hữu công suất tổng', 3, 1856821, 496454, '2023-11-22', 0, 2),
	(36, 'Bếp hồng ngoại Delites 853', 3, 'Tổng công suất 7400W khi mở cùng lúc 3 vùng nấu mỗi vùng nấu đều có chức năng Booster gia nhiệt nhanh Vùng bếp giữa 1200/1400W vùng bếp bên trái 2000/3000W và vùng bếp bên phải 2400/3700W tùy vào nguyên liệu và nhu cầu bạn chọn vùng nấu có mức công suất p', 3, 705551, 282321, '2023-11-22', 0, 2),
	(37, 'Bếp từ đôi lắp âm Kangaroo KG855i', 4, 'Tổng công suất 7400W khi mở cùng lúc 3 vùng nấu mỗi vùng nấu đều có chức năng Booster gia nhiệt nhanh Vùng bếp giữa 1200/1400W vùng bếp bên trái 2000/3000W và vùng bếp bên phải 2400/3700W tùy vào nguyên liệu và nhu cầu bạn chọn vùng nấu có mức công suất p', 3, 702748, 214724, '2023-11-22', 0, 2),
	(38, 'Bếp từ đôi lắp âm Kangaroo KG855i', 9, 'Đây là sản phẩm thuộc dòng bếp từ đôi được thiết kế lắp âm hoặc lắp dương giúp sử dụng linh hoạt trong gian bếp Đến từ thương hiệu 100 năm - Hafele (Đức) sản xuất và nhập khẩu nguyên chiếc từ Malaysia đảm bảo chất lượng mẫu mã Bếp từ sở hữu công suất tổng', 3, 1860923, 780194, '2023-11-22', 0, 2),
	(39, 'Bếp từ AVA FYM20-71', 2, 'Tổng công suất 7400W khi mở cùng lúc 3 vùng nấu mỗi vùng nấu đều có chức năng Booster gia nhiệt nhanh Vùng bếp giữa 1200/1400W vùng bếp bên trái 2000/3000W và vùng bếp bên phải 2400/3700W tùy vào nguyên liệu và nhu cầu bạn chọn vùng nấu có mức công suất p', 3, 881093, 272422, '2023-11-22', 0, 2),
	(40, 'Bếp từ hồng ngoại lắp âm Pramie PRTH-A1', 2, 'Bếp từ đôi Pramie PRTH-2022 đến từ thương hiệu Pramie - Đức sản xuất và nhập khẩu nguyên chiếc từ Thái Lan sở hữu thiết kế lắp âm hiện đại đồng thời có thể đặt nổi đa dạng tính năng an toàn công nghệ Smart Inverter tiết kiệm điện bếp có thể gia nhiệt liên', 3, 1282987, 869722, '2023-11-22', 0, 2),
	(41, 'Bếp từ Galanz CH211E', 18, 'Bếp từ hồng ngoại Sunhouse MMB9100VN thiết kế thời trang thanh lịch có thể lắp đặt âm dưới kệ bếp Giúp tăng diện tích trống cho không gian bếp thông thoáng hơn thích hợp sử dụng trong khách sạn quán ăn gia đình Mặt bếp siêu mỏng khi lắp đặt âm gần như nằm', 3, 1610041, 910831, '2023-11-22', 0, 2),
	(42, 'Bếp từ đôi lắp âm BlueStone ICB-6818', 12, 'Bếp từ hồng ngoại Sunhouse MMB9100VN thiết kế thời trang thanh lịch có thể lắp đặt âm dưới kệ bếp Giúp tăng diện tích trống cho không gian bếp thông thoáng hơn thích hợp sử dụng trong khách sạn quán ăn gia đình Mặt bếp siêu mỏng khi lắp đặt âm gần như nằm', 3, 1705742, 513007, '2023-11-22', 0, 2),
	(43, 'Bếp hồng ngoại Delites 853', 10, 'Đây là sản phẩm thuộc dòng bếp từ đôi được thiết kế lắp âm hoặc lắp dương giúp sử dụng linh hoạt trong gian bếp Đến từ thương hiệu 100 năm - Hafele (Đức) sản xuất và nhập khẩu nguyên chiếc từ Malaysia đảm bảo chất lượng mẫu mã Bếp từ sở hữu công suất tổng', 3, 1121150, 507424, '2023-11-22', 0, 2),
	(44, 'Bếp từ đôi lắp âm BlueStone ICB-6818', 11, 'Bếp từ hồng ngoại Sunhouse MMB9100VN thiết kế thời trang thanh lịch có thể lắp đặt âm dưới kệ bếp Giúp tăng diện tích trống cho không gian bếp thông thoáng hơn thích hợp sử dụng trong khách sạn quán ăn gia đình Mặt bếp siêu mỏng khi lắp đặt âm gần như nằm', 3, 841317, 497107, '2023-11-22', 0, 2),
	(45, 'Bếp hồng ngoại Sunhouse SHD 6005(EMC)', 1, 'Tổng công suất 7400W khi mở cùng lúc 3 vùng nấu mỗi vùng nấu đều có chức năng Booster gia nhiệt nhanh Vùng bếp giữa 1200/1400W vùng bếp bên trái 2000/3000W và vùng bếp bên phải 2400/3700W tùy vào nguyên liệu và nhu cầu bạn chọn vùng nấu có mức công suất p', 3, 853453, 239584, '2023-11-22', 0, 2),
	(46, 'Bếp từ đôi lắp âm BlueStone ICB-6818', 14, 'Bếp từ đôi Pramie PRTH-2022 đến từ thương hiệu Pramie - Đức sản xuất và nhập khẩu nguyên chiếc từ Thái Lan sở hữu thiết kế lắp âm hiện đại đồng thời có thể đặt nổi đa dạng tính năng an toàn công nghệ Smart Inverter tiết kiệm điện bếp có thể gia nhiệt liên', 3, 640848, 132861, '2023-11-22', 0, 2),
	(47, 'Bếp từ đôi lắp âm Kangaroo KG855i', 1, 'Bếp từ đôi Pramie PRTH-2022 đến từ thương hiệu Pramie - Đức sản xuất và nhập khẩu nguyên chiếc từ Thái Lan sở hữu thiết kế lắp âm hiện đại đồng thời có thể đặt nổi đa dạng tính năng an toàn công nghệ Smart Inverter tiết kiệm điện bếp có thể gia nhiệt liên', 3, 1112585, 264794, '2023-11-22', 0, 2),
	(48, 'Bếp từ đôi lắp âm Hafele HC-I2712A (536.61.716)', 17, 'Đây là sản phẩm thuộc dòng bếp từ đôi được thiết kế lắp âm hoặc lắp dương giúp sử dụng linh hoạt trong gian bếp Đến từ thương hiệu 100 năm - Hafele (Đức) sản xuất và nhập khẩu nguyên chiếc từ Malaysia đảm bảo chất lượng mẫu mã Bếp từ sở hữu công suất tổng', 3, 1653730, 726453, '2023-11-22', 0, 2),
	(49, 'Bếp từ đôi lắp âm Kangaroo KG855i', 3, 'Bếp từ đôi Pramie PRTH-2022 đến từ thương hiệu Pramie - Đức sản xuất và nhập khẩu nguyên chiếc từ Thái Lan sở hữu thiết kế lắp âm hiện đại đồng thời có thể đặt nổi đa dạng tính năng an toàn công nghệ Smart Inverter tiết kiệm điện bếp có thể gia nhiệt liên', 3, 962969, 226895, '2023-11-22', 0, 2),
	(50, 'Bếp từ đôi lắp âm BlueStone ICB-6818', 15, 'Đây là sản phẩm thuộc dòng bếp từ đôi được thiết kế lắp âm hoặc lắp dương giúp sử dụng linh hoạt trong gian bếp Đến từ thương hiệu 100 năm - Hafele (Đức) sản xuất và nhập khẩu nguyên chiếc từ Malaysia đảm bảo chất lượng mẫu mã Bếp từ sở hữu công suất tổng', 3, 1347764, 656216, '2023-11-22', 0, 2),
	(51, 'Bếp từ đôi lắp âm Kangaroo KG855i', 17, 'Tổng công suất 7400W khi mở cùng lúc 3 vùng nấu mỗi vùng nấu đều có chức năng Booster gia nhiệt nhanh Vùng bếp giữa 1200/1400W vùng bếp bên trái 2000/3000W và vùng bếp bên phải 2400/3700W tùy vào nguyên liệu và nhu cầu bạn chọn vùng nấu có mức công suất p', 3, 1931409, 974123, '2023-11-22', 0, 2),
	(52, 'Bếp từ đôi lắp âm BlueStone ICB-6818', 14, 'Tổng công suất 7400W khi mở cùng lúc 3 vùng nấu mỗi vùng nấu đều có chức năng Booster gia nhiệt nhanh Vùng bếp giữa 1200/1400W vùng bếp bên trái 2000/3000W và vùng bếp bên phải 2400/3700W tùy vào nguyên liệu và nhu cầu bạn chọn vùng nấu có mức công suất p', 3, 1455814, 644735, '2023-11-22', 0, 2),
	(53, 'Bếp từ hồng ngoại lắp âm Sunhouse Mama MMB9100VN', 15, 'Bếp từ đôi Pramie PRTH-2022 đến từ thương hiệu Pramie - Đức sản xuất và nhập khẩu nguyên chiếc từ Thái Lan sở hữu thiết kế lắp âm hiện đại đồng thời có thể đặt nổi đa dạng tính năng an toàn công nghệ Smart Inverter tiết kiệm điện bếp có thể gia nhiệt liên', 3, 1846223, 1073082, '2023-11-22', 0, 2),
	(54, 'Bếp từ Galanz CH211E', 10, 'Bếp từ hồng ngoại Sunhouse MMB9100VN thiết kế thời trang thanh lịch có thể lắp đặt âm dưới kệ bếp Giúp tăng diện tích trống cho không gian bếp thông thoáng hơn thích hợp sử dụng trong khách sạn quán ăn gia đình Mặt bếp siêu mỏng khi lắp đặt âm gần như nằm', 3, 1680589, 1032082, '2023-11-22', 0, 2),
	(55, 'Bếp từ đôi lắp âm Hafele HC-I2712A (536.61.716)', 10, 'Bếp từ đôi Pramie PRTH-2022 đến từ thương hiệu Pramie - Đức sản xuất và nhập khẩu nguyên chiếc từ Thái Lan sở hữu thiết kế lắp âm hiện đại đồng thời có thể đặt nổi đa dạng tính năng an toàn công nghệ Smart Inverter tiết kiệm điện bếp có thể gia nhiệt liên', 3, 592986, 295675, '2023-11-22', 0, 2),
	(56, 'Bếp hồng ngoại Delites 853', 11, 'Đây là sản phẩm thuộc dòng bếp từ đôi được thiết kế lắp âm hoặc lắp dương giúp sử dụng linh hoạt trong gian bếp Đến từ thương hiệu 100 năm - Hafele (Đức) sản xuất và nhập khẩu nguyên chiếc từ Malaysia đảm bảo chất lượng mẫu mã Bếp từ sở hữu công suất tổng', 3, 1628184, 1072010, '2023-11-22', 0, 2),
	(57, 'Bếp từ đôi lắp âm BlueStone ICB-6818', 17, 'Bếp từ đôi Pramie PRTH-2022 đến từ thương hiệu Pramie - Đức sản xuất và nhập khẩu nguyên chiếc từ Thái Lan sở hữu thiết kế lắp âm hiện đại đồng thời có thể đặt nổi đa dạng tính năng an toàn công nghệ Smart Inverter tiết kiệm điện bếp có thể gia nhiệt liên', 3, 810834, 202199, '2023-11-22', 0, 2),
	(58, 'Bếp từ Galanz CH211E', 17, 'Đây là sản phẩm thuộc dòng bếp từ đôi được thiết kế lắp âm hoặc lắp dương giúp sử dụng linh hoạt trong gian bếp Đến từ thương hiệu 100 năm - Hafele (Đức) sản xuất và nhập khẩu nguyên chiếc từ Malaysia đảm bảo chất lượng mẫu mã Bếp từ sở hữu công suất tổng', 3, 1954503, 1320330, '2023-11-22', 0, 2),
	(59, 'Bếp từ hồng ngoại lắp âm Sunhouse Mama MMB9100VN', 9, 'Đây là sản phẩm thuộc dòng bếp từ đôi được thiết kế lắp âm hoặc lắp dương giúp sử dụng linh hoạt trong gian bếp Đến từ thương hiệu 100 năm - Hafele (Đức) sản xuất và nhập khẩu nguyên chiếc từ Malaysia đảm bảo chất lượng mẫu mã Bếp từ sở hữu công suất tổng', 3, 1951230, 1165346, '2023-11-22', 0, 2),
	(60, 'Bình đun siêu tốc Delites 1.8 lít ST18S05', 11, 'Bình đun siêu tốc Delites kiểu dáng đơn giản gọn đẹp dễ dùng trong mọi không gian Dung tích 18 lít phù hợp sử dụng tại gia đình văn phòng nhỏ ít người Bình đun siêu tốc công suất 1500 W đun nước sôi nhanh trong 8 – 9 phút người dùng không cần chờ lâu để c', 8, 325709, 169277, '2023-11-22', 0, 2),
	(61, 'Bình đun siêu tốc Delites 1.8 lít ST18S04', 17, 'Bình siêu tốc Sunhouse có tính năng tự ngắt khi nước sôi và khi cạn nước đảm bảo an toàn khi sử dụng Cung cấp đủ nước nóng cho gia đình có từ 4 - 6 thành viên với dung tích lớn 18 lít Thân bình sang trọng đẹp mắt vệ sinh dễ dàng sau khi dùng Công suất lớn', 8, 436336, 114635, '2023-11-22', 0, 2),
	(62, 'Bình đun siêu tốc Sunhouse 1.8 lít SHD1351', 14, 'Bình đun siêu tốc kiểu dáng hình trụ hiện đại màu xanh lá tông pastel trang nhã làm đẹp không gian sử dụng Bình đun siêu tốc Sunhouse thiết kế 2 lớp bền đẹp sử dụng an toàn với chất liệu cao cấp Ruột bình bằng inox 304 hạn chế gỉ sét tốt an toàn sức khỏe ', 8, 782784, 172789, '2023-11-22', 0, 2),
	(63, 'Bình đun siêu tốc Delites 1.8 lít ST18S04', 16, 'Bình siêu tốc Sunhouse có tính năng tự ngắt khi nước sôi và khi cạn nước đảm bảo an toàn khi sử dụng Cung cấp đủ nước nóng cho gia đình có từ 4 - 6 thành viên với dung tích lớn 18 lít Thân bình sang trọng đẹp mắt vệ sinh dễ dàng sau khi dùng Công suất lớn', 8, 415531, 112013, '2023-11-22', 0, 2),
	(64, 'Bình đun siêu tốc Sunhouse 1.7 lít SHD1382B', 11, 'Bình đun siêu tốc Delites kiểu dáng đơn giản gọn đẹp dễ dùng trong mọi không gian Dung tích 18 lít phù hợp sử dụng tại gia đình văn phòng nhỏ ít người Bình đun siêu tốc công suất 1500 W đun nước sôi nhanh trong 8 – 9 phút người dùng không cần chờ lâu để c', 8, 505679, 281400, '2023-11-22', 0, 2),
	(65, 'Bình đun siêu tốc Sunhouse Mama 1.8 lít SHD1389', 6, 'Bình đun siêu tốc Điện Quang 18 lít ĐQ EKT06 1518 BL có kiểu dáng đơn giản gọn đẹp ruột bình làm từ inox 201 với công suất 1500W hoạt động ổn định cùng với nhiều tiện ích và chế độ an toàn đáp ứng tốt nhu cầu sử dụng nước nóng của mỗi gia đình trong việc ', 8, 384339, 79165, '2023-11-22', 0, 2),
	(66, 'Bình đun siêu tốc Sunhouse Mama 1.7 lít SHD1330', 15, 'Bình đun siêu tốc kiểu dáng hình trụ hiện đại màu xanh lá tông pastel trang nhã làm đẹp không gian sử dụng Bình đun siêu tốc Sunhouse thiết kế 2 lớp bền đẹp sử dụng an toàn với chất liệu cao cấp Ruột bình bằng inox 304 hạn chế gỉ sét tốt an toàn sức khỏe ', 8, 680031, 300981, '2023-11-22', 0, 2),
	(67, 'Bình đun siêu tốc Sunhouse 1.7 lít SHD1382B', 10, 'Bình đun siêu tốc kiểu dáng hình trụ hiện đại màu xanh lá tông pastel trang nhã làm đẹp không gian sử dụng Bình đun siêu tốc Sunhouse thiết kế 2 lớp bền đẹp sử dụng an toàn với chất liệu cao cấp Ruột bình bằng inox 304 hạn chế gỉ sét tốt an toàn sức khỏe ', 8, 486414, 124986, '2023-11-22', 0, 2),
	(68, 'Bình đun siêu tốc Điện Quang 1.8 lít ĐQ EKT06 1518 BL', 17, 'Bình đun siêu tốc Điện Quang 18 lít ĐQ EKT06 1518 BL có kiểu dáng đơn giản gọn đẹp ruột bình làm từ inox 201 với công suất 1500W hoạt động ổn định cùng với nhiều tiện ích và chế độ an toàn đáp ứng tốt nhu cầu sử dụng nước nóng của mỗi gia đình trong việc ', 8, 420162, 286680, '2023-11-22', 0, 2),
	(69, 'Bình đun siêu tốc Toshiba 1.7 lít KT-17SH2NV', 6, 'Bình đun siêu tốc kiểu dáng hình trụ hiện đại màu xanh lá tông pastel trang nhã làm đẹp không gian sử dụng Bình đun siêu tốc Sunhouse thiết kế 2 lớp bền đẹp sử dụng an toàn với chất liệu cao cấp Ruột bình bằng inox 304 hạn chế gỉ sét tốt an toàn sức khỏe ', 8, 573243, 142986, '2023-11-22', 0, 2),
	(70, 'Bình đun siêu tốc Sunhouse Mama 1.8 lít SHD1389', 9, 'Bình đun siêu tốc Điện Quang 18 lít ĐQ EKT06 1518 BL có kiểu dáng đơn giản gọn đẹp ruột bình làm từ inox 201 với công suất 1500W hoạt động ổn định cùng với nhiều tiện ích và chế độ an toàn đáp ứng tốt nhu cầu sử dụng nước nóng của mỗi gia đình trong việc ', 8, 706397, 203450, '2023-11-22', 0, 2),
	(71, 'Bình đun siêu tốc Điện Quang 1.8 lít ĐQ EKT06 1518 BL', 18, 'Bình đun siêu tốc Điện Quang 18 lít ĐQ EKT06 1518 BL có kiểu dáng đơn giản gọn đẹp ruột bình làm từ inox 201 với công suất 1500W hoạt động ổn định cùng với nhiều tiện ích và chế độ an toàn đáp ứng tốt nhu cầu sử dụng nước nóng của mỗi gia đình trong việc ', 8, 595869, 305336, '2023-11-22', 0, 2),
	(72, 'Bình đun siêu tốc Sunhouse 1.8 lít SHD1182', 11, 'Bình đun siêu tốc Điện Quang 18 lít ĐQ EKT06 1518 BL có kiểu dáng đơn giản gọn đẹp ruột bình làm từ inox 201 với công suất 1500W hoạt động ổn định cùng với nhiều tiện ích và chế độ an toàn đáp ứng tốt nhu cầu sử dụng nước nóng của mỗi gia đình trong việc ', 8, 560427, 134016, '2023-11-22', 0, 2),
	(73, 'Bình đun siêu tốc Điện Quang 1.8 lít ĐQ EKT06 1518 BL', 10, 'Bình đun siêu tốc Delites kiểu dáng đơn giản gọn đẹp dễ dùng trong mọi không gian Dung tích 18 lít phù hợp sử dụng tại gia đình văn phòng nhỏ ít người Bình đun siêu tốc công suất 1500 W đun nước sôi nhanh trong 8 – 9 phút người dùng không cần chờ lâu để c', 8, 697573, 186563, '2023-11-22', 0, 2),
	(74, 'Bình đun siêu tốc BlueStone 1.7 lít KTB-3417', 6, 'Bình đun siêu tốc kiểu dáng hình trụ hiện đại màu xanh lá tông pastel trang nhã làm đẹp không gian sử dụng Bình đun siêu tốc Sunhouse thiết kế 2 lớp bền đẹp sử dụng an toàn với chất liệu cao cấp Ruột bình bằng inox 304 hạn chế gỉ sét tốt an toàn sức khỏe ', 8, 462069, 214864, '2023-11-22', 0, 2),
	(75, 'Bình đun siêu tốc Delites 1.8 lít ST18S04', 15, 'Bình đun siêu tốc Delites kiểu dáng đơn giản gọn đẹp dễ dùng trong mọi không gian Dung tích 18 lít phù hợp sử dụng tại gia đình văn phòng nhỏ ít người Bình đun siêu tốc công suất 1500 W đun nước sôi nhanh trong 8 – 9 phút người dùng không cần chờ lâu để c', 8, 339842, 141372, '2023-11-22', 0, 2),
	(76, 'Bình đun siêu tốc Sunhouse 1.8 lít SHD1182', 17, 'Bình đun siêu tốc Delites kiểu dáng đơn giản gọn đẹp dễ dùng trong mọi không gian Dung tích 18 lít phù hợp sử dụng tại gia đình văn phòng nhỏ ít người Bình đun siêu tốc công suất 1500 W đun nước sôi nhanh trong 8 – 9 phút người dùng không cần chờ lâu để c', 8, 484912, 161770, '2023-11-22', 0, 2),
	(77, 'Bình đun siêu tốc Sunhouse Mama 1.8 lít SHD1389', 7, 'Bình siêu tốc Sunhouse có tính năng tự ngắt khi nước sôi và khi cạn nước đảm bảo an toàn khi sử dụng Cung cấp đủ nước nóng cho gia đình có từ 4 - 6 thành viên với dung tích lớn 18 lít Thân bình sang trọng đẹp mắt vệ sinh dễ dàng sau khi dùng Công suất lớn', 8, 562117, 359562, '2023-11-22', 0, 2),
	(78, 'Bình đun siêu tốc thủy tinh Sunhouse 1.7 lít SHD1217 Đen', 14, 'Bình siêu tốc Sunhouse có tính năng tự ngắt khi nước sôi và khi cạn nước đảm bảo an toàn khi sử dụng Cung cấp đủ nước nóng cho gia đình có từ 4 - 6 thành viên với dung tích lớn 18 lít Thân bình sang trọng đẹp mắt vệ sinh dễ dàng sau khi dùng Công suất lớn', 8, 568659, 294870, '2023-11-22', 0, 2),
	(79, 'Bình đun siêu tốc Delites 1.8 lít ST18S04', 18, 'Bình đun siêu tốc Delites kiểu dáng đơn giản gọn đẹp dễ dùng trong mọi không gian Dung tích 18 lít phù hợp sử dụng tại gia đình văn phòng nhỏ ít người Bình đun siêu tốc công suất 1500 W đun nước sôi nhanh trong 8 – 9 phút người dùng không cần chờ lâu để c', 8, 328856, 153337, '2023-11-22', 0, 2),
	(80, 'Bình đun siêu tốc BlueStone 1.7 lít KTB-3417', 17, 'Bình siêu tốc Sunhouse có tính năng tự ngắt khi nước sôi và khi cạn nước đảm bảo an toàn khi sử dụng Cung cấp đủ nước nóng cho gia đình có từ 4 - 6 thành viên với dung tích lớn 18 lít Thân bình sang trọng đẹp mắt vệ sinh dễ dàng sau khi dùng Công suất lớn', 8, 753288, 483875, '2023-11-22', 0, 2),
	(81, 'Bình đun siêu tốc Sunhouse Mama 1.7 lít SHD1330', 6, 'Bình đun siêu tốc kiểu dáng hình trụ hiện đại màu xanh lá tông pastel trang nhã làm đẹp không gian sử dụng Bình đun siêu tốc Sunhouse thiết kế 2 lớp bền đẹp sử dụng an toàn với chất liệu cao cấp Ruột bình bằng inox 304 hạn chế gỉ sét tốt an toàn sức khỏe ', 8, 750168, 323068, '2023-11-22', 0, 2),
	(82, 'Bình đun siêu tốc Sunhouse 1.7 lít SHD1382B', 13, 'Bình đun siêu tốc kiểu dáng hình trụ hiện đại màu xanh lá tông pastel trang nhã làm đẹp không gian sử dụng Bình đun siêu tốc Sunhouse thiết kế 2 lớp bền đẹp sử dụng an toàn với chất liệu cao cấp Ruột bình bằng inox 304 hạn chế gỉ sét tốt an toàn sức khỏe ', 8, 694499, 299200, '2023-11-22', 0, 2),
	(83, 'Bình đun siêu tốc Delites 1.8 lít ST18DB01', 15, 'Bình siêu tốc Sunhouse có tính năng tự ngắt khi nước sôi và khi cạn nước đảm bảo an toàn khi sử dụng Cung cấp đủ nước nóng cho gia đình có từ 4 - 6 thành viên với dung tích lớn 18 lít Thân bình sang trọng đẹp mắt vệ sinh dễ dàng sau khi dùng Công suất lớn', 8, 792675, 506946, '2023-11-22', 0, 2),
	(84, 'Bình đun siêu tốc Delites 1.5 lít ST15S01', 8, 'Bình siêu tốc Sunhouse có tính năng tự ngắt khi nước sôi và khi cạn nước đảm bảo an toàn khi sử dụng Cung cấp đủ nước nóng cho gia đình có từ 4 - 6 thành viên với dung tích lớn 18 lít Thân bình sang trọng đẹp mắt vệ sinh dễ dàng sau khi dùng Công suất lớn', 8, 448694, 138759, '2023-11-22', 0, 2),
	(85, 'Bình đun siêu tốc thủy tinh Sunhouse 1.7 lít SHD1217 Đen', 13, 'Bình đun siêu tốc Delites kiểu dáng đơn giản gọn đẹp dễ dùng trong mọi không gian Dung tích 18 lít phù hợp sử dụng tại gia đình văn phòng nhỏ ít người Bình đun siêu tốc công suất 1500 W đun nước sôi nhanh trong 8 – 9 phút người dùng không cần chờ lâu để c', 8, 564092, 273171, '2023-11-22', 0, 2),
	(86, 'Bình đun siêu tốc Điện Quang 1.8 lít ĐQ EKT06 1518 BL', 18, 'Bình siêu tốc Sunhouse có tính năng tự ngắt khi nước sôi và khi cạn nước đảm bảo an toàn khi sử dụng Cung cấp đủ nước nóng cho gia đình có từ 4 - 6 thành viên với dung tích lớn 18 lít Thân bình sang trọng đẹp mắt vệ sinh dễ dàng sau khi dùng Công suất lớn', 8, 403024, 136323, '2023-11-22', 0, 2),
	(87, 'Bình đun siêu tốc BlueStone 1.5 lít KTB-3453 kem', 10, 'Bình siêu tốc Sunhouse có tính năng tự ngắt khi nước sôi và khi cạn nước đảm bảo an toàn khi sử dụng Cung cấp đủ nước nóng cho gia đình có từ 4 - 6 thành viên với dung tích lớn 18 lít Thân bình sang trọng đẹp mắt vệ sinh dễ dàng sau khi dùng Công suất lớn', 8, 312771, 88632, '2023-11-22', 0, 2),
	(88, 'Bình đun siêu tốc Điện Quang 1.8 lít ĐQ EKT06 1518 BL', 7, 'Bình đun siêu tốc kiểu dáng hình trụ hiện đại màu xanh lá tông pastel trang nhã làm đẹp không gian sử dụng Bình đun siêu tốc Sunhouse thiết kế 2 lớp bền đẹp sử dụng an toàn với chất liệu cao cấp Ruột bình bằng inox 304 hạn chế gỉ sét tốt an toàn sức khỏe ', 8, 349313, 230599, '2023-11-22', 0, 2),
	(89, 'Bình đun siêu tốc Delites 1.8 lít ST18S05', 11, 'Bình đun siêu tốc Delites kiểu dáng đơn giản gọn đẹp dễ dùng trong mọi không gian Dung tích 18 lít phù hợp sử dụng tại gia đình văn phòng nhỏ ít người Bình đun siêu tốc công suất 1500 W đun nước sôi nhanh trong 8 – 9 phút người dùng không cần chờ lâu để c', 8, 325709, 169277, '2023-11-22', 0, 2),
	(90, 'Bình đun siêu tốc Delites 1.8 lít ST18S04', 17, 'Bình siêu tốc Sunhouse có tính năng tự ngắt khi nước sôi và khi cạn nước đảm bảo an toàn khi sử dụng Cung cấp đủ nước nóng cho gia đình có từ 4 - 6 thành viên với dung tích lớn 18 lít Thân bình sang trọng đẹp mắt vệ sinh dễ dàng sau khi dùng Công suất lớn', 8, 436336, 114635, '2023-11-22', 0, 2),
	(91, 'Bình đun siêu tốc Sunhouse 1.8 lít SHD1351', 14, 'Bình đun siêu tốc kiểu dáng hình trụ hiện đại màu xanh lá tông pastel trang nhã làm đẹp không gian sử dụng Bình đun siêu tốc Sunhouse thiết kế 2 lớp bền đẹp sử dụng an toàn với chất liệu cao cấp Ruột bình bằng inox 304 hạn chế gỉ sét tốt an toàn sức khỏe ', 8, 782784, 172789, '2023-11-22', 0, 2),
	(92, 'Bình đun siêu tốc Delites 1.8 lít ST18S04', 16, 'Bình siêu tốc Sunhouse có tính năng tự ngắt khi nước sôi và khi cạn nước đảm bảo an toàn khi sử dụng Cung cấp đủ nước nóng cho gia đình có từ 4 - 6 thành viên với dung tích lớn 18 lít Thân bình sang trọng đẹp mắt vệ sinh dễ dàng sau khi dùng Công suất lớn', 8, 415531, 112013, '2023-11-22', 0, 2),
	(93, 'Bình đun siêu tốc Sunhouse 1.7 lít SHD1382B', 11, 'Bình đun siêu tốc Delites kiểu dáng đơn giản gọn đẹp dễ dùng trong mọi không gian Dung tích 18 lít phù hợp sử dụng tại gia đình văn phòng nhỏ ít người Bình đun siêu tốc công suất 1500 W đun nước sôi nhanh trong 8 – 9 phút người dùng không cần chờ lâu để c', 8, 505679, 281400, '2023-11-22', 0, 2),
	(94, 'Bình đun siêu tốc Sunhouse Mama 1.8 lít SHD1389', 6, 'Bình đun siêu tốc Điện Quang 18 lít ĐQ EKT06 1518 BL có kiểu dáng đơn giản gọn đẹp ruột bình làm từ inox 201 với công suất 1500W hoạt động ổn định cùng với nhiều tiện ích và chế độ an toàn đáp ứng tốt nhu cầu sử dụng nước nóng của mỗi gia đình trong việc ', 8, 384339, 79165, '2023-11-22', 0, 2),
	(95, 'Bình đun siêu tốc Sunhouse Mama 1.7 lít SHD1330', 15, 'Bình đun siêu tốc kiểu dáng hình trụ hiện đại màu xanh lá tông pastel trang nhã làm đẹp không gian sử dụng Bình đun siêu tốc Sunhouse thiết kế 2 lớp bền đẹp sử dụng an toàn với chất liệu cao cấp Ruột bình bằng inox 304 hạn chế gỉ sét tốt an toàn sức khỏe ', 8, 680031, 300981, '2023-11-22', 0, 2),
	(96, 'Bình đun siêu tốc Sunhouse 1.7 lít SHD1382B', 10, 'Bình đun siêu tốc kiểu dáng hình trụ hiện đại màu xanh lá tông pastel trang nhã làm đẹp không gian sử dụng Bình đun siêu tốc Sunhouse thiết kế 2 lớp bền đẹp sử dụng an toàn với chất liệu cao cấp Ruột bình bằng inox 304 hạn chế gỉ sét tốt an toàn sức khỏe ', 8, 486414, 124986, '2023-11-22', 0, 2),
	(97, 'Bình đun siêu tốc Điện Quang 1.8 lít ĐQ EKT06 1518 BL', 17, 'Bình đun siêu tốc Điện Quang 18 lít ĐQ EKT06 1518 BL có kiểu dáng đơn giản gọn đẹp ruột bình làm từ inox 201 với công suất 1500W hoạt động ổn định cùng với nhiều tiện ích và chế độ an toàn đáp ứng tốt nhu cầu sử dụng nước nóng của mỗi gia đình trong việc ', 8, 420162, 286680, '2023-11-22', 0, 2),
	(98, 'Bình đun siêu tốc Toshiba 1.7 lít KT-17SH2NV', 6, 'Bình đun siêu tốc kiểu dáng hình trụ hiện đại màu xanh lá tông pastel trang nhã làm đẹp không gian sử dụng Bình đun siêu tốc Sunhouse thiết kế 2 lớp bền đẹp sử dụng an toàn với chất liệu cao cấp Ruột bình bằng inox 304 hạn chế gỉ sét tốt an toàn sức khỏe ', 8, 573243, 142986, '2023-11-22', 0, 2),
	(99, 'Bình đun siêu tốc Sunhouse Mama 1.8 lít SHD1389', 9, 'Bình đun siêu tốc Điện Quang 18 lít ĐQ EKT06 1518 BL có kiểu dáng đơn giản gọn đẹp ruột bình làm từ inox 201 với công suất 1500W hoạt động ổn định cùng với nhiều tiện ích và chế độ an toàn đáp ứng tốt nhu cầu sử dụng nước nóng của mỗi gia đình trong việc ', 8, 706397, 203450, '2023-11-22', 0, 2),
	(100, 'Bình đun siêu tốc Điện Quang 1.8 lít ĐQ EKT06 1518 BL', 18, 'Bình đun siêu tốc Điện Quang 18 lít ĐQ EKT06 1518 BL có kiểu dáng đơn giản gọn đẹp ruột bình làm từ inox 201 với công suất 1500W hoạt động ổn định cùng với nhiều tiện ích và chế độ an toàn đáp ứng tốt nhu cầu sử dụng nước nóng của mỗi gia đình trong việc ', 8, 595869, 305336, '2023-11-22', 0, 2),
	(101, 'Bình đun siêu tốc Sunhouse 1.8 lít SHD1182', 11, 'Bình đun siêu tốc Điện Quang 18 lít ĐQ EKT06 1518 BL có kiểu dáng đơn giản gọn đẹp ruột bình làm từ inox 201 với công suất 1500W hoạt động ổn định cùng với nhiều tiện ích và chế độ an toàn đáp ứng tốt nhu cầu sử dụng nước nóng của mỗi gia đình trong việc ', 8, 560427, 134016, '2023-11-22', 0, 2),
	(102, 'Bình đun siêu tốc Điện Quang 1.8 lít ĐQ EKT06 1518 BL', 10, 'Bình đun siêu tốc Delites kiểu dáng đơn giản gọn đẹp dễ dùng trong mọi không gian Dung tích 18 lít phù hợp sử dụng tại gia đình văn phòng nhỏ ít người Bình đun siêu tốc công suất 1500 W đun nước sôi nhanh trong 8 – 9 phút người dùng không cần chờ lâu để c', 8, 697573, 186563, '2023-11-22', 0, 2),
	(103, 'Bình đun siêu tốc BlueStone 1.7 lít KTB-3417', 6, 'Bình đun siêu tốc kiểu dáng hình trụ hiện đại màu xanh lá tông pastel trang nhã làm đẹp không gian sử dụng Bình đun siêu tốc Sunhouse thiết kế 2 lớp bền đẹp sử dụng an toàn với chất liệu cao cấp Ruột bình bằng inox 304 hạn chế gỉ sét tốt an toàn sức khỏe ', 8, 462069, 214864, '2023-11-22', 0, 2),
	(104, 'Bình đun siêu tốc Delites 1.8 lít ST18S04', 15, 'Bình đun siêu tốc Delites kiểu dáng đơn giản gọn đẹp dễ dùng trong mọi không gian Dung tích 18 lít phù hợp sử dụng tại gia đình văn phòng nhỏ ít người Bình đun siêu tốc công suất 1500 W đun nước sôi nhanh trong 8 – 9 phút người dùng không cần chờ lâu để c', 8, 339842, 141372, '2023-11-22', 0, 2),
	(105, 'Bình đun siêu tốc Sunhouse 1.8 lít SHD1182', 17, 'Bình đun siêu tốc Delites kiểu dáng đơn giản gọn đẹp dễ dùng trong mọi không gian Dung tích 18 lít phù hợp sử dụng tại gia đình văn phòng nhỏ ít người Bình đun siêu tốc công suất 1500 W đun nước sôi nhanh trong 8 – 9 phút người dùng không cần chờ lâu để c', 8, 484912, 161770, '2023-11-22', 0, 2),
	(106, 'Bình đun siêu tốc Sunhouse Mama 1.8 lít SHD1389', 7, 'Bình siêu tốc Sunhouse có tính năng tự ngắt khi nước sôi và khi cạn nước đảm bảo an toàn khi sử dụng Cung cấp đủ nước nóng cho gia đình có từ 4 - 6 thành viên với dung tích lớn 18 lít Thân bình sang trọng đẹp mắt vệ sinh dễ dàng sau khi dùng Công suất lớn', 8, 562117, 359562, '2023-11-22', 0, 2),
	(107, 'Bình đun siêu tốc thủy tinh Sunhouse 1.7 lít SHD1217 Đen', 14, 'Bình siêu tốc Sunhouse có tính năng tự ngắt khi nước sôi và khi cạn nước đảm bảo an toàn khi sử dụng Cung cấp đủ nước nóng cho gia đình có từ 4 - 6 thành viên với dung tích lớn 18 lít Thân bình sang trọng đẹp mắt vệ sinh dễ dàng sau khi dùng Công suất lớn', 8, 568659, 294870, '2023-11-22', 0, 2),
	(108, 'Bình đun siêu tốc Delites 1.8 lít ST18S04', 18, 'Bình đun siêu tốc Delites kiểu dáng đơn giản gọn đẹp dễ dùng trong mọi không gian Dung tích 18 lít phù hợp sử dụng tại gia đình văn phòng nhỏ ít người Bình đun siêu tốc công suất 1500 W đun nước sôi nhanh trong 8 – 9 phút người dùng không cần chờ lâu để c', 8, 328856, 153337, '2023-11-22', 0, 2),
	(109, 'Bình đun siêu tốc BlueStone 1.7 lít KTB-3417', 17, 'Bình siêu tốc Sunhouse có tính năng tự ngắt khi nước sôi và khi cạn nước đảm bảo an toàn khi sử dụng Cung cấp đủ nước nóng cho gia đình có từ 4 - 6 thành viên với dung tích lớn 18 lít Thân bình sang trọng đẹp mắt vệ sinh dễ dàng sau khi dùng Công suất lớn', 8, 753288, 483875, '2023-11-22', 0, 2),
	(110, 'Bình đun siêu tốc Sunhouse Mama 1.7 lít SHD1330', 6, 'Bình đun siêu tốc kiểu dáng hình trụ hiện đại màu xanh lá tông pastel trang nhã làm đẹp không gian sử dụng Bình đun siêu tốc Sunhouse thiết kế 2 lớp bền đẹp sử dụng an toàn với chất liệu cao cấp Ruột bình bằng inox 304 hạn chế gỉ sét tốt an toàn sức khỏe ', 8, 750168, 323068, '2023-11-22', 0, 2),
	(111, 'Bình đun siêu tốc Sunhouse 1.7 lít SHD1382B', 13, 'Bình đun siêu tốc kiểu dáng hình trụ hiện đại màu xanh lá tông pastel trang nhã làm đẹp không gian sử dụng Bình đun siêu tốc Sunhouse thiết kế 2 lớp bền đẹp sử dụng an toàn với chất liệu cao cấp Ruột bình bằng inox 304 hạn chế gỉ sét tốt an toàn sức khỏe ', 8, 694499, 299200, '2023-11-22', 0, 2),
	(112, 'Bình đun siêu tốc Delites 1.8 lít ST18DB01', 15, 'Bình siêu tốc Sunhouse có tính năng tự ngắt khi nước sôi và khi cạn nước đảm bảo an toàn khi sử dụng Cung cấp đủ nước nóng cho gia đình có từ 4 - 6 thành viên với dung tích lớn 18 lít Thân bình sang trọng đẹp mắt vệ sinh dễ dàng sau khi dùng Công suất lớn', 8, 792675, 506946, '2023-11-22', 0, 2),
	(113, 'Bình đun siêu tốc Delites 1.5 lít ST15S01', 8, 'Bình siêu tốc Sunhouse có tính năng tự ngắt khi nước sôi và khi cạn nước đảm bảo an toàn khi sử dụng Cung cấp đủ nước nóng cho gia đình có từ 4 - 6 thành viên với dung tích lớn 18 lít Thân bình sang trọng đẹp mắt vệ sinh dễ dàng sau khi dùng Công suất lớn', 8, 448694, 138759, '2023-11-22', 0, 2),
	(114, 'Bình đun siêu tốc thủy tinh Sunhouse 1.7 lít SHD1217 Đen', 13, 'Bình đun siêu tốc Delites kiểu dáng đơn giản gọn đẹp dễ dùng trong mọi không gian Dung tích 18 lít phù hợp sử dụng tại gia đình văn phòng nhỏ ít người Bình đun siêu tốc công suất 1500 W đun nước sôi nhanh trong 8 – 9 phút người dùng không cần chờ lâu để c', 8, 564092, 273171, '2023-11-22', 0, 2),
	(115, 'Bình đun siêu tốc Điện Quang 1.8 lít ĐQ EKT06 1518 BL', 18, 'Bình siêu tốc Sunhouse có tính năng tự ngắt khi nước sôi và khi cạn nước đảm bảo an toàn khi sử dụng Cung cấp đủ nước nóng cho gia đình có từ 4 - 6 thành viên với dung tích lớn 18 lít Thân bình sang trọng đẹp mắt vệ sinh dễ dàng sau khi dùng Công suất lớn', 8, 403024, 136323, '2023-11-22', 0, 2),
	(116, 'Bình đun siêu tốc BlueStone 1.5 lít KTB-3453 kem', 10, 'Bình siêu tốc Sunhouse có tính năng tự ngắt khi nước sôi và khi cạn nước đảm bảo an toàn khi sử dụng Cung cấp đủ nước nóng cho gia đình có từ 4 - 6 thành viên với dung tích lớn 18 lít Thân bình sang trọng đẹp mắt vệ sinh dễ dàng sau khi dùng Công suất lớn', 8, 312771, 88632, '2023-11-22', 0, 2),
	(117, 'Bình đun siêu tốc Điện Quang 1.8 lít ĐQ EKT06 1518 BL', 7, 'Bình đun siêu tốc kiểu dáng hình trụ hiện đại màu xanh lá tông pastel trang nhã làm đẹp không gian sử dụng Bình đun siêu tốc Sunhouse thiết kế 2 lớp bền đẹp sử dụng an toàn với chất liệu cao cấp Ruột bình bằng inox 304 hạn chế gỉ sét tốt an toàn sức khỏe ', 8, 349313, 230599, '2023-11-22', 0, 2),
	(118, 'Máy lọc nước RO Midea MWP-S0820MR 8 lõi', 3, 'Máy lọc nước Toshiba thiết kế hiện đại kết cấu chắc chắn vững bền màu sắc trung tính trang nhã cho không gian sử dụng thêm sang trọng Vòi lấy nước thiết kế cứng cáp hạn chế rò rỉ nước lấy nước dễ dàng Có chế độ cút nối nhanh giúp việc lắp đặt thêm đơn giả', 1, 4493433, 3061223, '2023-11-22', 0, 2),
	(119, 'Máy lọc nước RO nóng nguội lạnh Karofi KAD-X56 11 lõi', 3, 'Máy lọc nước Midea MWP-S0820MR 8 lõi kiểu dáng sang trọng màu sắc hiện đại tạo ấn tượng trong không gian sử dụng Dung tích bình chứa nước 11 lít đáp ứng tối đa nhu cầu nước dùng hàng ngày của mọi gia đình cũng như các văn phòng làm việc hay cơ quan nhà hà', 1, 2997272, 623360, '2023-11-22', 0, 2),
	(120, 'Máy lọc nước RO nóng nguội lạnh Hòa Phát HPN635 10 lõi', 3, 'Máy lọc nước Daikiosan kiểu dáng sang trọng bền bỉ nhờ vỏ tủ bằng thép sơn tĩnh điện và kính cường lực Hệ thống bơm 1 chiều kết hợp hệ thống van điện từ phù hợp cho nhà có nguồn nước áp lực đủ mạnh như bể bồn chứa nước cao từ 3 mét trở lên Thoải mái sử dụ', 1, 3860312, 2330128, '2023-11-22', 0, 2),
	(121, 'Máy lọc nước RO nóng nguội lạnh Sunhouse SHA76213CK 10 lõi', 5, 'Máy lọc nước Midea MWP-S0820MR 8 lõi kiểu dáng sang trọng màu sắc hiện đại tạo ấn tượng trong không gian sử dụng Dung tích bình chứa nước 11 lít đáp ứng tối đa nhu cầu nước dùng hàng ngày của mọi gia đình cũng như các văn phòng làm việc hay cơ quan nhà hà', 1, 3993861, 1743285, '2023-11-22', 0, 2),
	(122, 'Máy lọc nước RO nóng nguội lạnh Sunhouse UltraPURE SHA76210KL 10 lõi', 2, 'Máy lọc nước Toshiba thiết kế hiện đại kết cấu chắc chắn vững bền màu sắc trung tính trang nhã cho không gian sử dụng thêm sang trọng Vòi lấy nước thiết kế cứng cáp hạn chế rò rỉ nước lấy nước dễ dàng Có chế độ cút nối nhanh giúp việc lắp đặt thêm đơn giả', 1, 3583630, 912128, '2023-11-22', 0, 2),
	(123, 'Máy lọc nước RO Daikiosan DXW-42010H 10 lõi', 2, 'Máy lọc nước Toshiba thiết kế hiện đại kết cấu chắc chắn vững bền màu sắc trung tính trang nhã cho không gian sử dụng thêm sang trọng Vòi lấy nước thiết kế cứng cáp hạn chế rò rỉ nước lấy nước dễ dàng Có chế độ cút nối nhanh giúp việc lắp đặt thêm đơn giả', 1, 5299225, 1960258, '2023-11-22', 0, 2),
	(124, 'Máy lọc nước RO nóng nguội lạnh Toshiba TWP-W1905SV(MB) 3 lõi', 1, 'Máy lọc nước Daikiosan kiểu dáng sang trọng bền bỉ nhờ vỏ tủ bằng thép sơn tĩnh điện và kính cường lực Hệ thống bơm 1 chiều kết hợp hệ thống van điện từ phù hợp cho nhà có nguồn nước áp lực đủ mạnh như bể bồn chứa nước cao từ 3 mét trở lên Thoải mái sử dụ', 1, 5559254, 1779826, '2023-11-22', 0, 2),
	(125, 'Máy lọc nước RO nóng nguội lạnh Sunhouse SHR76210CK 10 lõi', 6, 'Máy lọc nước Toshiba thiết kế hiện đại kết cấu chắc chắn vững bền màu sắc trung tính trang nhã cho không gian sử dụng thêm sang trọng Vòi lấy nước thiết kế cứng cáp hạn chế rò rỉ nước lấy nước dễ dàng Có chế độ cút nối nhanh giúp việc lắp đặt thêm đơn giả', 1, 5387154, 1430193, '2023-11-22', 0, 2),
	(126, 'Máy lọc nước RO nóng nguội lạnh Toshiba TWP-W1905SV(MB) 3 lõi', 4, 'Máy lọc nước Midea MWP-S0620MR 6 lõi có thiết kế sang trọng vỏ máy bền màu sắc hiện đại kết cấu vững chắc có thể lắp đặt và sử dụng thuận tiện ở nhiều vị trí trong gia đình công ty Công suất lọc đạt 10-12 lít/giờ dung tích bình chứa nước 11 lít cung cấp n', 1, 5620621, 3624865, '2023-11-22', 0, 2),
	(127, 'Máy lọc nước RO Midea MWP-S0620MR 6 lõi', 3, 'Máy lọc nước Midea MWP-S0620MR 6 lõi có thiết kế sang trọng vỏ máy bền màu sắc hiện đại kết cấu vững chắc có thể lắp đặt và sử dụng thuận tiện ở nhiều vị trí trong gia đình công ty Công suất lọc đạt 10-12 lít/giờ dung tích bình chứa nước 11 lít cung cấp n', 1, 3808160, 1188220, '2023-11-22', 0, 2),
	(128, 'Máy lọc nước RO Midea MWP-S0620MR 6 lõi', 1, 'Máy lọc nước Midea MWP-S0620MR 6 lõi có thiết kế sang trọng vỏ máy bền màu sắc hiện đại kết cấu vững chắc có thể lắp đặt và sử dụng thuận tiện ở nhiều vị trí trong gia đình công ty Công suất lọc đạt 10-12 lít/giờ dung tích bình chứa nước 11 lít cung cấp n', 1, 5155697, 1344973, '2023-11-22', 0, 2),
	(129, 'Máy lọc nước RO không vỏ Kangaroo KG110 9 lõi', 5, 'Máy lọc nước Midea MWP 9 lõi hay còn máy lọc nước uống trực tiếp thiết kế gọn gàng đẹp mắt dễ lắp đặt màu sắc sang trọng tối ưu hóa không gian sử dụng Trụ vòi rót nước inox cao cấp bền tốt không han gỉ giữ nước sạch vệ sinh khi sử dụng trực tiếp và dễ sử ', 1, 4593415, 2555373, '2023-11-22', 0, 2),
	(130, 'Máy lọc nước RO nóng nguội lạnh Sunhouse UltraPURE SHA76210KL 10 lõi', 3, 'Máy lọc nước Midea MWP 9 lõi hay còn máy lọc nước uống trực tiếp thiết kế gọn gàng đẹp mắt dễ lắp đặt màu sắc sang trọng tối ưu hóa không gian sử dụng Trụ vòi rót nước inox cao cấp bền tốt không han gỉ giữ nước sạch vệ sinh khi sử dụng trực tiếp và dễ sử ', 1, 2113663, 943135, '2023-11-22', 0, 2),
	(131, 'Máy lọc nước RO Hòa Phát HWS1B 1022 10 lõi', 1, 'Máy lọc nước Midea MWP-S0620MR 6 lõi có thiết kế sang trọng vỏ máy bền màu sắc hiện đại kết cấu vững chắc có thể lắp đặt và sử dụng thuận tiện ở nhiều vị trí trong gia đình công ty Công suất lọc đạt 10-12 lít/giờ dung tích bình chứa nước 11 lít cung cấp n', 1, 3553718, 1314379, '2023-11-22', 0, 2),
	(132, 'Máy lọc nước RO nóng nguội lạnh Karofi KAD-X56 11 lõi', 3, 'Máy lọc nước Midea MWP-S0620MR 6 lõi có thiết kế sang trọng vỏ máy bền màu sắc hiện đại kết cấu vững chắc có thể lắp đặt và sử dụng thuận tiện ở nhiều vị trí trong gia đình công ty Công suất lọc đạt 10-12 lít/giờ dung tích bình chứa nước 11 lít cung cấp n', 1, 3699297, 886973, '2023-11-22', 0, 2),
	(133, 'Máy lọc nước RO Midea MWP-S0820MR 8 lõi', 6, 'Máy lọc nước Midea MWP 9 lõi hay còn máy lọc nước uống trực tiếp thiết kế gọn gàng đẹp mắt dễ lắp đặt màu sắc sang trọng tối ưu hóa không gian sử dụng Trụ vòi rót nước inox cao cấp bền tốt không han gỉ giữ nước sạch vệ sinh khi sử dụng trực tiếp và dễ sử ', 1, 4757295, 2043231, '2023-11-22', 0, 2),
	(134, 'Máy lọc nước RO Toshiba TWP-N1686UV(W1) 3 lõi', 2, 'Máy lọc nước Midea MWP-S0620MR 6 lõi có thiết kế sang trọng vỏ máy bền màu sắc hiện đại kết cấu vững chắc có thể lắp đặt và sử dụng thuận tiện ở nhiều vị trí trong gia đình công ty Công suất lọc đạt 10-12 lít/giờ dung tích bình chứa nước 11 lít cung cấp n', 1, 2249555, 1401542, '2023-11-22', 0, 2),
	(135, 'Máy lọc nước RO nóng nguội lạnh Hòa Phát HPN635 10 lõi', 1, 'Máy lọc nước Midea MWP-S0620MR 6 lõi có thiết kế sang trọng vỏ máy bền màu sắc hiện đại kết cấu vững chắc có thể lắp đặt và sử dụng thuận tiện ở nhiều vị trí trong gia đình công ty Công suất lọc đạt 10-12 lít/giờ dung tích bình chứa nước 11 lít cung cấp n', 1, 4032764, 2048199, '2023-11-22', 0, 2),
	(136, 'Máy lọc nước RO Midea MWP-S0820MR 8 lõi', 1, 'Máy lọc nước Midea MWP-S0620MR 6 lõi có thiết kế sang trọng vỏ máy bền màu sắc hiện đại kết cấu vững chắc có thể lắp đặt và sử dụng thuận tiện ở nhiều vị trí trong gia đình công ty Công suất lọc đạt 10-12 lít/giờ dung tích bình chứa nước 11 lít cung cấp n', 1, 4917306, 1554170, '2023-11-22', 0, 2),
	(137, 'Máy lọc nước R.O Delites DES0820RO 8 lõi', 1, 'Máy lọc nước Midea MWP 9 lõi hay còn máy lọc nước uống trực tiếp thiết kế gọn gàng đẹp mắt dễ lắp đặt màu sắc sang trọng tối ưu hóa không gian sử dụng Trụ vòi rót nước inox cao cấp bền tốt không han gỉ giữ nước sạch vệ sinh khi sử dụng trực tiếp và dễ sử ', 1, 4634291, 2030706, '2023-11-22', 0, 2),
	(138, 'Máy lọc nước RO Midea MWP-S0620MR 6 lõi', 3, 'Máy lọc nước Daikiosan kiểu dáng sang trọng bền bỉ nhờ vỏ tủ bằng thép sơn tĩnh điện và kính cường lực Hệ thống bơm 1 chiều kết hợp hệ thống van điện từ phù hợp cho nhà có nguồn nước áp lực đủ mạnh như bể bồn chứa nước cao từ 3 mét trở lên Thoải mái sử dụ', 1, 2745948, 1901815, '2023-11-22', 0, 2),
	(139, 'Máy lọc nước RO nóng nguội lạnh Sunhouse UltraPURE SHA76210KL 10 lõi', 2, 'Máy lọc nước Daikiosan kiểu dáng sang trọng bền bỉ nhờ vỏ tủ bằng thép sơn tĩnh điện và kính cường lực Hệ thống bơm 1 chiều kết hợp hệ thống van điện từ phù hợp cho nhà có nguồn nước áp lực đủ mạnh như bể bồn chứa nước cao từ 3 mét trở lên Thoải mái sử dụ', 1, 4353089, 1044329, '2023-11-22', 0, 2),
	(140, 'Máy lọc nước RO Midea MWP-S0620MR 6 lõi', 2, 'Máy lọc nước Midea MWP-S0820MR 8 lõi kiểu dáng sang trọng màu sắc hiện đại tạo ấn tượng trong không gian sử dụng Dung tích bình chứa nước 11 lít đáp ứng tối đa nhu cầu nước dùng hàng ngày của mọi gia đình cũng như các văn phòng làm việc hay cơ quan nhà hà', 1, 5763346, 3629144, '2023-11-22', 0, 2),
	(141, 'Máy lọc nước RO nóng nguội lạnh Hòa Phát HPN635 10 lõi', 4, 'Máy lọc nước Daikiosan kiểu dáng sang trọng bền bỉ nhờ vỏ tủ bằng thép sơn tĩnh điện và kính cường lực Hệ thống bơm 1 chiều kết hợp hệ thống van điện từ phù hợp cho nhà có nguồn nước áp lực đủ mạnh như bể bồn chứa nước cao từ 3 mét trở lên Thoải mái sử dụ', 1, 2062110, 935850, '2023-11-22', 0, 2),
	(142, 'Máy lọc nước RO nóng nguội lạnh Sunhouse UltraPURE SHA76210KL 10 lõi', 1, 'Máy lọc nước Midea MWP 9 lõi hay còn máy lọc nước uống trực tiếp thiết kế gọn gàng đẹp mắt dễ lắp đặt màu sắc sang trọng tối ưu hóa không gian sử dụng Trụ vòi rót nước inox cao cấp bền tốt không han gỉ giữ nước sạch vệ sinh khi sử dụng trực tiếp và dễ sử ', 1, 4217064, 915935, '2023-11-22', 0, 2),
	(143, 'Máy lọc nước RO nóng nguội lạnh Karofi KAD-X39 10 lõi', 4, 'Máy lọc nước Midea MWP-S0620MR 6 lõi có thiết kế sang trọng vỏ máy bền màu sắc hiện đại kết cấu vững chắc có thể lắp đặt và sử dụng thuận tiện ở nhiều vị trí trong gia đình công ty Công suất lọc đạt 10-12 lít/giờ dung tích bình chứa nước 11 lít cung cấp n', 1, 2098402, 800457, '2023-11-22', 0, 2),
	(144, 'Máy lọc nước RO Hòa Phát HWS1B 1022 10 lõi', 1, 'Máy lọc nước Midea MWP 9 lõi hay còn máy lọc nước uống trực tiếp thiết kế gọn gàng đẹp mắt dễ lắp đặt màu sắc sang trọng tối ưu hóa không gian sử dụng Trụ vòi rót nước inox cao cấp bền tốt không han gỉ giữ nước sạch vệ sinh khi sử dụng trực tiếp và dễ sử ', 1, 5525450, 2572579, '2023-11-22', 0, 2),
	(145, 'Máy lọc nước R.O Delites DES0820RO 8 lõi', 2, 'Máy lọc nước Midea MWP 9 lõi hay còn máy lọc nước uống trực tiếp thiết kế gọn gàng đẹp mắt dễ lắp đặt màu sắc sang trọng tối ưu hóa không gian sử dụng Trụ vòi rót nước inox cao cấp bền tốt không han gỉ giữ nước sạch vệ sinh khi sử dụng trực tiếp và dễ sử ', 1, 2159202, 785018, '2023-11-22', 0, 2),
	(146, 'Máy lọc nước RO nóng nguội lạnh Karofi KAD-X56 11 lõi', 4, 'Máy lọc nước Midea MWP-S0620MR 6 lõi có thiết kế sang trọng vỏ máy bền màu sắc hiện đại kết cấu vững chắc có thể lắp đặt và sử dụng thuận tiện ở nhiều vị trí trong gia đình công ty Công suất lọc đạt 10-12 lít/giờ dung tích bình chứa nước 11 lít cung cấp n', 1, 5916494, 4114292, '2023-11-22', 0, 2),
	(147, 'Máy ép trái cây Tefal ZE420D38', 1, 'Máy ép trái cây Panasonic MJ-CS100WRA với thiết kế trang nhã gọn gàng vận hành với công suất 260W 2 tốc độ ép trang bị tính năng khóa an toàn đáp ứng nhu cầu sử dụng trong gia đình Sản phẩm thuộc dòng máy ép nhanh hoạt động với 2 tốc độ ép dễ dàng tùy chỉ', 5, 963154, 553450, '2023-11-22', 0, 2),
	(148, 'Máy ép trái cây BlueStone JEB-6545', 9, 'Máy ép chậm Crystal ZZJ821ML vận hành với công suất 200W ống tiếp nguyên liệu lớn được trang bị các tiện ích và tính năng an toàn đáp ứng nhu cầu sử dụng cơ bản trong gia đình Sản phẩm thuộc dòng máy ép chậm giúp nước không bị biến đổi màu sắc và hao hụt ', 5, 2156797, 933653, '2023-11-22', 0, 2),
	(149, 'Máy xay ép đa năng Panasonic MJ-M176PWRA', 1, 'Máy ép trái cây Panasonic MJ-CS100WRA với thiết kế trang nhã gọn gàng vận hành với công suất 260W 2 tốc độ ép trang bị tính năng khóa an toàn đáp ứng nhu cầu sử dụng trong gia đình Sản phẩm thuộc dòng máy ép nhanh hoạt động với 2 tốc độ ép dễ dàng tùy chỉ', 5, 2466816, 713188, '2023-11-22', 0, 2),
	(150, 'Máy ép trái cây Philips HR1811', 2, 'Máy ép chậm Crystal ZZJ821ML vận hành với công suất 200W ống tiếp nguyên liệu lớn được trang bị các tiện ích và tính năng an toàn đáp ứng nhu cầu sử dụng cơ bản trong gia đình Sản phẩm thuộc dòng máy ép chậm giúp nước không bị biến đổi màu sắc và hao hụt ', 5, 649723, 339000, '2023-11-22', 0, 2),
	(151, 'Máy ép chậm Kangaroo KG150SJ', 6, 'Máy ép trái cây thiết kế hiện đại sang trọng đẹp mắt trong không gian dùng Công suất 450W giúp ép trái cây rau củ nhanh chóng tiết kiệm điện năng Mẫu máy ép trái cây AVA này được trang bị lưỡi dao bằng chất liệu thép không gỉ sắc bén nghiền tốt mọi nguyên', 5, 2354671, 1349840, '2023-11-22', 0, 2),
	(152, 'Máy ép trái cây Philips HR1811', 7, 'Máy ép chậm AVA SJ-009 vận hành với công suất 200W tốc độ 45 - 85 vòng/phút trang bị các tiện ích và tính năng an toàn đáp ứng nhu cầu sử dụng cơ bản trong gia đìnhSản phẩm thuộc dòng máy ép chậm hoạt động với tốc độ 45 - 85 vòng/phút giúp nước không bị b', 5, 2485655, 1499260, '2023-11-22', 0, 2),
	(153, 'Máy ép trái cây Crystal GS-333', 1, 'Máy ép trái cây thiết kế hiện đại sang trọng đẹp mắt trong không gian dùng Công suất 450W giúp ép trái cây rau củ nhanh chóng tiết kiệm điện năng Mẫu máy ép trái cây AVA này được trang bị lưỡi dao bằng chất liệu thép không gỉ sắc bén nghiền tốt mọi nguyên', 5, 1493079, 864674, '2023-11-22', 0, 2),
	(154, 'Máy ép trái cây Philips HR1811', 1, 'Máy ép chậm AVA SJ-009 vận hành với công suất 200W tốc độ 45 - 85 vòng/phút trang bị các tiện ích và tính năng an toàn đáp ứng nhu cầu sử dụng cơ bản trong gia đìnhSản phẩm thuộc dòng máy ép chậm hoạt động với tốc độ 45 - 85 vòng/phút giúp nước không bị b', 5, 1929606, 552102, '2023-11-22', 0, 2),
	(155, 'Máy ép chậm Hafele HS-J32X (535.43.393)', 2, 'Máy ép chậm AVA SJ-009 vận hành với công suất 200W tốc độ 45 - 85 vòng/phút trang bị các tiện ích và tính năng an toàn đáp ứng nhu cầu sử dụng cơ bản trong gia đìnhSản phẩm thuộc dòng máy ép chậm hoạt động với tốc độ 45 - 85 vòng/phút giúp nước không bị b', 5, 1795494, 889396, '2023-11-22', 0, 2),
	(156, 'Máy ép chậm BlueStone SJB-6556', 3, 'Máy ép trái cây thiết kế hiện đại sang trọng đẹp mắt trong không gian dùng Công suất 450W giúp ép trái cây rau củ nhanh chóng tiết kiệm điện năng Mẫu máy ép trái cây AVA này được trang bị lưỡi dao bằng chất liệu thép không gỉ sắc bén nghiền tốt mọi nguyên', 5, 1057067, 667064, '2023-11-22', 0, 2),
	(157, 'Máy ép chậm BlueStone SJB-6556', 2, 'Máy ép chậm AVA SJ-009 vận hành với công suất 200W tốc độ 45 - 85 vòng/phút trang bị các tiện ích và tính năng an toàn đáp ứng nhu cầu sử dụng cơ bản trong gia đìnhSản phẩm thuộc dòng máy ép chậm hoạt động với tốc độ 45 - 85 vòng/phút giúp nước không bị b', 5, 1522969, 460058, '2023-11-22', 0, 2),
	(158, 'Máy ép trái cây BlueStone JEB-6545', 4, 'Máy ép trái cây Panasonic MJ-CS100WRA với thiết kế trang nhã gọn gàng vận hành với công suất 260W 2 tốc độ ép trang bị tính năng khóa an toàn đáp ứng nhu cầu sử dụng trong gia đình Sản phẩm thuộc dòng máy ép nhanh hoạt động với 2 tốc độ ép dễ dàng tùy chỉ', 5, 1251838, 623189, '2023-11-22', 0, 2),
	(159, 'Máy ép trái cây Sunhouse SHD5520', 6, 'Máy ép trái cây Panasonic MJ-CS100WRA với thiết kế trang nhã gọn gàng vận hành với công suất 260W 2 tốc độ ép trang bị tính năng khóa an toàn đáp ứng nhu cầu sử dụng trong gia đình Sản phẩm thuộc dòng máy ép nhanh hoạt động với 2 tốc độ ép dễ dàng tùy chỉ', 5, 1830299, 761680, '2023-11-22', 0, 2),
	(160, 'Máy ép trái cây Crystal GS-333', 4, 'Máy ép chậm AVA SJ-009 vận hành với công suất 200W tốc độ 45 - 85 vòng/phút trang bị các tiện ích và tính năng an toàn đáp ứng nhu cầu sử dụng cơ bản trong gia đìnhSản phẩm thuộc dòng máy ép chậm hoạt động với tốc độ 45 - 85 vòng/phút giúp nước không bị b', 5, 1352726, 576662, '2023-11-22', 0, 2),
	(161, 'Máy ép chậm Sunhouse Mama SHD5505', 7, 'Máy ép chậm Crystal ZZJ821ML vận hành với công suất 200W ống tiếp nguyên liệu lớn được trang bị các tiện ích và tính năng an toàn đáp ứng nhu cầu sử dụng cơ bản trong gia đình Sản phẩm thuộc dòng máy ép chậm giúp nước không bị biến đổi màu sắc và hao hụt ', 5, 2198086, 1398700, '2023-11-22', 0, 2),
	(162, 'Máy ép trái cây AVA AJ02', 5, 'Máy ép trái cây thiết kế hiện đại sang trọng đẹp mắt trong không gian dùng Công suất 450W giúp ép trái cây rau củ nhanh chóng tiết kiệm điện năng Mẫu máy ép trái cây AVA này được trang bị lưỡi dao bằng chất liệu thép không gỉ sắc bén nghiền tốt mọi nguyên', 5, 1301934, 751047, '2023-11-22', 0, 2),
	(163, 'Máy ép chậm Kangaroo KG150SJ', 10, 'Máy ép trái cây Panasonic MJ-CS100WRA với thiết kế trang nhã gọn gàng vận hành với công suất 260W 2 tốc độ ép trang bị tính năng khóa an toàn đáp ứng nhu cầu sử dụng trong gia đình Sản phẩm thuộc dòng máy ép nhanh hoạt động với 2 tốc độ ép dễ dàng tùy chỉ', 5, 946754, 224394, '2023-11-22', 0, 2),
	(164, 'Máy ép trái cây Sunhouse SHD5520', 2, 'Máy ép trái cây thiết kế hiện đại sang trọng đẹp mắt trong không gian dùng Công suất 450W giúp ép trái cây rau củ nhanh chóng tiết kiệm điện năng Mẫu máy ép trái cây AVA này được trang bị lưỡi dao bằng chất liệu thép không gỉ sắc bén nghiền tốt mọi nguyên', 5, 776520, 501269, '2023-11-22', 0, 2),
	(165, 'Máy ép trái cây Philips HR1811', 3, 'Máy ép chậm Crystal ZZJ821ML vận hành với công suất 200W ống tiếp nguyên liệu lớn được trang bị các tiện ích và tính năng an toàn đáp ứng nhu cầu sử dụng cơ bản trong gia đình Sản phẩm thuộc dòng máy ép chậm giúp nước không bị biến đổi màu sắc và hao hụt ', 5, 2404975, 877056, '2023-11-22', 0, 2),
	(166, 'Máy ép chậm Hafele GS-133N (535.43.811)', 4, 'Máy ép chậm AVA SJ-009 vận hành với công suất 200W tốc độ 45 - 85 vòng/phút trang bị các tiện ích và tính năng an toàn đáp ứng nhu cầu sử dụng cơ bản trong gia đìnhSản phẩm thuộc dòng máy ép chậm hoạt động với tốc độ 45 - 85 vòng/phút giúp nước không bị b', 5, 779081, 452846, '2023-11-22', 0, 2),
	(167, 'Máy ép chậm Hafele GS-133N (535.43.811)', 10, 'Máy ép chậm AVA SJ-009 vận hành với công suất 200W tốc độ 45 - 85 vòng/phút trang bị các tiện ích và tính năng an toàn đáp ứng nhu cầu sử dụng cơ bản trong gia đìnhSản phẩm thuộc dòng máy ép chậm hoạt động với tốc độ 45 - 85 vòng/phút giúp nước không bị b', 5, 1118236, 428453, '2023-11-22', 0, 2),
	(168, 'Máy ép trái cây Tefal ZE420D38', 9, 'Máy ép trái cây thiết kế hiện đại sang trọng đẹp mắt trong không gian dùng Công suất 450W giúp ép trái cây rau củ nhanh chóng tiết kiệm điện năng Mẫu máy ép trái cây AVA này được trang bị lưỡi dao bằng chất liệu thép không gỉ sắc bén nghiền tốt mọi nguyên', 5, 765424, 340901, '2023-11-22', 0, 2),
	(169, 'Máy ép trái cây AVA AJ02', 8, 'Máy ép chậm Crystal ZZJ821ML vận hành với công suất 200W ống tiếp nguyên liệu lớn được trang bị các tiện ích và tính năng an toàn đáp ứng nhu cầu sử dụng cơ bản trong gia đình Sản phẩm thuộc dòng máy ép chậm giúp nước không bị biến đổi màu sắc và hao hụt ', 5, 742984, 222061, '2023-11-22', 0, 2),
	(170, 'Máy ép chậm BlueStone SJB-6556', 10, 'Máy ép trái cây Panasonic MJ-CS100WRA với thiết kế trang nhã gọn gàng vận hành với công suất 260W 2 tốc độ ép trang bị tính năng khóa an toàn đáp ứng nhu cầu sử dụng trong gia đình Sản phẩm thuộc dòng máy ép nhanh hoạt động với 2 tốc độ ép dễ dàng tùy chỉ', 5, 2297632, 1220800, '2023-11-22', 0, 2),
	(171, 'Máy ép trái cây Tefal ZC150838', 1, 'Máy ép chậm AVA SJ-009 vận hành với công suất 200W tốc độ 45 - 85 vòng/phút trang bị các tiện ích và tính năng an toàn đáp ứng nhu cầu sử dụng cơ bản trong gia đìnhSản phẩm thuộc dòng máy ép chậm hoạt động với tốc độ 45 - 85 vòng/phút giúp nước không bị b', 5, 2004748, 864081, '2023-11-22', 0, 2),
	(172, 'Máy ép trái cây BlueStone JEB-6545', 10, 'Máy ép chậm Crystal ZZJ821ML vận hành với công suất 200W ống tiếp nguyên liệu lớn được trang bị các tiện ích và tính năng an toàn đáp ứng nhu cầu sử dụng cơ bản trong gia đình Sản phẩm thuộc dòng máy ép chậm giúp nước không bị biến đổi màu sắc và hao hụt ', 5, 1892285, 1049994, '2023-11-22', 0, 2),
	(173, 'Máy ép trái cây Sunhouse SHD5520', 9, 'Máy ép chậm Crystal ZZJ821ML vận hành với công suất 200W ống tiếp nguyên liệu lớn được trang bị các tiện ích và tính năng an toàn đáp ứng nhu cầu sử dụng cơ bản trong gia đình Sản phẩm thuộc dòng máy ép chậm giúp nước không bị biến đổi màu sắc và hao hụt ', 5, 713684, 230459, '2023-11-22', 0, 2),
	(174, 'Máy xay ép đa năng Panasonic MJ-M176PWRA', 1, 'Máy ép chậm AVA SJ-009 vận hành với công suất 200W tốc độ 45 - 85 vòng/phút trang bị các tiện ích và tính năng an toàn đáp ứng nhu cầu sử dụng cơ bản trong gia đìnhSản phẩm thuộc dòng máy ép chậm hoạt động với tốc độ 45 - 85 vòng/phút giúp nước không bị b', 5, 970604, 407568, '2023-11-22', 0, 2),
	(175, 'Máy xay ép đa năng BlueStone BLB-5343', 10, 'Máy ép chậm AVA SJ-009 vận hành với công suất 200W tốc độ 45 - 85 vòng/phút trang bị các tiện ích và tính năng an toàn đáp ứng nhu cầu sử dụng cơ bản trong gia đìnhSản phẩm thuộc dòng máy ép chậm hoạt động với tốc độ 45 - 85 vòng/phút giúp nước không bị b', 5, 1789841, 393220, '2023-11-22', 0, 2),
	(176, 'Máy làm sữa hạt Rapido RHB-1800D', 15, 'Máy xay sinh tố Sunhouse SHD 5112 Xanh màu sắc thời trang Công suất 350W mạnh mẽ giúp xay mịn mọi loại thực phẩm nhanh chóng Máy trang bị 2 cối xay bằng thuỷ tinh chịu lực hạn chế bám mùi dễ dàng vệ sinh sau khi dùng Cối xay sinh tố dung tích 1 lít xay đư', 6, 569438, 254579, '2023-11-22', 0, 2),
	(177, 'Máy xay sinh tố đa năng BlueStone BLB-5339', 9, 'Máy xay sinh tố AVA thiết kế đơn giản hiện đại đa chức năng: xay sinh tố xay hạt Phục vụ tốt cho nhu cầu làm sinh tố sơ chế thực phẩm chuẩn bị gia vị giúp bạn nấu ăn thuận tiện hơn Công suất 500W dùng động cơ có chất liệu hoàn toàn bằng đồng dẫn điện tốt ', 6, 1477735, 425347, '2023-11-22', 0, 2),
	(178, 'Máy xay sinh tố đa năng AVA YX-906N', 15, 'Máy xay sinh tố AVA thiết kế đơn giản hiện đại đa chức năng: xay sinh tố xay hạt Phục vụ tốt cho nhu cầu làm sinh tố sơ chế thực phẩm chuẩn bị gia vị giúp bạn nấu ăn thuận tiện hơn Công suất 500W dùng động cơ có chất liệu hoàn toàn bằng đồng dẫn điện tốt ', 6, 629022, 345584, '2023-11-22', 0, 2),
	(179, 'Máy xay sinh tố Kangaroo KGBL1000X', 13, 'Máy xay sinh tố AVA thiết kế đơn giản hiện đại đa chức năng: xay sinh tố xay hạt Phục vụ tốt cho nhu cầu làm sinh tố sơ chế thực phẩm chuẩn bị gia vị giúp bạn nấu ăn thuận tiện hơn Công suất 500W dùng động cơ có chất liệu hoàn toàn bằng đồng dẫn điện tốt ', 6, 608187, 294010, '2023-11-22', 0, 2),
	(180, 'Máy xay sinh tố đa năng Philips HR2041/50 - 3 cối', 12, 'Máy xay sinh tố Sunhouse SHD 5112 Xanh màu sắc thời trang Công suất 350W mạnh mẽ giúp xay mịn mọi loại thực phẩm nhanh chóng Máy trang bị 2 cối xay bằng thuỷ tinh chịu lực hạn chế bám mùi dễ dàng vệ sinh sau khi dùng Cối xay sinh tố dung tích 1 lít xay đư', 6, 978475, 229277, '2023-11-22', 0, 2),
	(181, 'Máy xay sinh tố đa năng BlueStone BLB-5339', 9, 'Máy xay sinh tố AVA thiết kế đơn giản hiện đại đa chức năng: xay sinh tố xay hạt Phục vụ tốt cho nhu cầu làm sinh tố sơ chế thực phẩm chuẩn bị gia vị giúp bạn nấu ăn thuận tiện hơn Công suất 500W dùng động cơ có chất liệu hoàn toàn bằng đồng dẫn điện tốt ', 6, 515954, 240451, '2023-11-22', 0, 2),
	(182, 'Máy xay sinh tố đa năng Sunhouse SHD 5112 Xanh', 14, 'Máy xay sinh tố Sunhouse SHD 5112 Xanh màu sắc thời trang Công suất 350W mạnh mẽ giúp xay mịn mọi loại thực phẩm nhanh chóng Máy trang bị 2 cối xay bằng thuỷ tinh chịu lực hạn chế bám mùi dễ dàng vệ sinh sau khi dùng Cối xay sinh tố dung tích 1 lít xay đư', 6, 772121, 523608, '2023-11-22', 0, 2),
	(183, 'Máy xay sinh tố đa năng Philips HR2041/50 - 3 cối', 13, 'Máy xay sinh tố Toshiba chất liệu nhựa cao cấp không chứa BPA (Bisphenol A) độc hại sử dụng an toàn sức khỏe Kiểu dáng đơn giản màu sắc trang nhã dùng đẹp trong mọi không gian Hoạt động hiệu quả với công suất 600W xay nhanh và nhuyễn mịn mọi nguyên liệu b', 6, 1103366, 603651, '2023-11-22', 0, 2),
	(184, 'Máy xay sinh tố đa năng Toshiba BL-70PR1NV', 5, 'Máy xay sinh tố AVA thiết kế đơn giản hiện đại đa chức năng: xay sinh tố xay hạt Phục vụ tốt cho nhu cầu làm sinh tố sơ chế thực phẩm chuẩn bị gia vị giúp bạn nấu ăn thuận tiện hơn Công suất 500W dùng động cơ có chất liệu hoàn toàn bằng đồng dẫn điện tốt ', 6, 1129139, 476169, '2023-11-22', 0, 2),
	(185, 'Máy làm sữa hạt Rapido RHB-1800D', 13, 'Máy xay sinh tố Delites BL2009 có thiết kế sang trọng tiện dụng với 1 cối xay sinh tố và 1 cối xay thực phẩm khô Cối xay sinh tố 15 lít bằng nhựa cao cấp không bám mùi dễ dàng vệ sinh sau khi sử dụng Cối xay thực phẩm khô dùng để xay tiêu cà phê các loại ', 6, 974542, 377013, '2023-11-22', 0, 2),
	(186, 'Máy làm sữa hạt đa năng Tefal BL83SD66', 5, 'Máy xay sinh tố Delites BL2009 có thiết kế sang trọng tiện dụng với 1 cối xay sinh tố và 1 cối xay thực phẩm khô Cối xay sinh tố 15 lít bằng nhựa cao cấp không bám mùi dễ dàng vệ sinh sau khi sử dụng Cối xay thực phẩm khô dùng để xay tiêu cà phê các loại ', 6, 877448, 546461, '2023-11-22', 0, 2),
	(187, 'Máy làm sữa hạt Rapido RHB-1800D', 10, 'Máy xay sinh tố Delites BL2009 có thiết kế sang trọng tiện dụng với 1 cối xay sinh tố và 1 cối xay thực phẩm khô Cối xay sinh tố 15 lít bằng nhựa cao cấp không bám mùi dễ dàng vệ sinh sau khi sử dụng Cối xay thực phẩm khô dùng để xay tiêu cà phê các loại ', 6, 322094, 202503, '2023-11-22', 0, 2),
	(188, 'Máy xay sinh tố đa năng AVA BL328', 6, 'Máy xay sinh tố Delites BL2009 có thiết kế sang trọng tiện dụng với 1 cối xay sinh tố và 1 cối xay thực phẩm khô Cối xay sinh tố 15 lít bằng nhựa cao cấp không bám mùi dễ dàng vệ sinh sau khi sử dụng Cối xay thực phẩm khô dùng để xay tiêu cà phê các loại ', 6, 1084421, 498883, '2023-11-22', 0, 2),
	(189, 'Máy làm sữa hạt đa năng Tefal BL967B66', 7, 'Máy xay sinh tố Delites BL2009 có thiết kế sang trọng tiện dụng với 1 cối xay sinh tố và 1 cối xay thực phẩm khô Cối xay sinh tố 15 lít bằng nhựa cao cấp không bám mùi dễ dàng vệ sinh sau khi sử dụng Cối xay thực phẩm khô dùng để xay tiêu cà phê các loại ', 6, 774905, 312029, '2023-11-22', 0, 2),
	(190, 'Máy xay sinh tố đa năng Sunhouse SHD 5112 Xanh', 12, 'Máy xay sinh tố AVA thiết kế đơn giản hiện đại đa chức năng: xay sinh tố xay hạt Phục vụ tốt cho nhu cầu làm sinh tố sơ chế thực phẩm chuẩn bị gia vị giúp bạn nấu ăn thuận tiện hơn Công suất 500W dùng động cơ có chất liệu hoàn toàn bằng đồng dẫn điện tốt ', 6, 782489, 514204, '2023-11-22', 0, 2),
	(191, 'Máy xay sinh tố đa năng AVA BL328', 14, 'Máy xay sinh tố Sunhouse SHD 5112 Xanh màu sắc thời trang Công suất 350W mạnh mẽ giúp xay mịn mọi loại thực phẩm nhanh chóng Máy trang bị 2 cối xay bằng thuỷ tinh chịu lực hạn chế bám mùi dễ dàng vệ sinh sau khi dùng Cối xay sinh tố dung tích 1 lít xay đư', 6, 980006, 300163, '2023-11-22', 0, 2),
	(192, 'Máy xay sinh tố đa năng AVA YX-906N', 6, 'Máy xay sinh tố AVA thiết kế đơn giản hiện đại đa chức năng: xay sinh tố xay hạt Phục vụ tốt cho nhu cầu làm sinh tố sơ chế thực phẩm chuẩn bị gia vị giúp bạn nấu ăn thuận tiện hơn Công suất 500W dùng động cơ có chất liệu hoàn toàn bằng đồng dẫn điện tốt ', 6, 384034, 230360, '2023-11-22', 0, 2),
	(193, 'Máy làm sữa hạt đa năng Tefal BL83SD66', 7, 'Máy xay sinh tố Delites BL2009 có thiết kế sang trọng tiện dụng với 1 cối xay sinh tố và 1 cối xay thực phẩm khô Cối xay sinh tố 15 lít bằng nhựa cao cấp không bám mùi dễ dàng vệ sinh sau khi sử dụng Cối xay thực phẩm khô dùng để xay tiêu cà phê các loại ', 6, 356158, 149708, '2023-11-22', 0, 2),
	(194, 'Máy làm sữa hạt đa năng Tefal BL967B66', 13, 'Máy xay sinh tố AVA thiết kế đơn giản hiện đại đa chức năng: xay sinh tố xay hạt Phục vụ tốt cho nhu cầu làm sinh tố sơ chế thực phẩm chuẩn bị gia vị giúp bạn nấu ăn thuận tiện hơn Công suất 500W dùng động cơ có chất liệu hoàn toàn bằng đồng dẫn điện tốt ', 6, 771118, 203212, '2023-11-22', 0, 2),
	(195, 'Máy xay sinh tố đa năng Sunhouse SHD 5112 Xanh', 11, 'Máy xay sinh tố AVA thiết kế đơn giản hiện đại đa chức năng: xay sinh tố xay hạt Phục vụ tốt cho nhu cầu làm sinh tố sơ chế thực phẩm chuẩn bị gia vị giúp bạn nấu ăn thuận tiện hơn Công suất 500W dùng động cơ có chất liệu hoàn toàn bằng đồng dẫn điện tốt ', 6, 686486, 216428, '2023-11-22', 0, 2),
	(196, 'Máy xay sinh tố đa năng Philips HR2041/10 - 2 cối', 8, 'Máy xay sinh tố Sunhouse SHD 5112 Xanh màu sắc thời trang Công suất 350W mạnh mẽ giúp xay mịn mọi loại thực phẩm nhanh chóng Máy trang bị 2 cối xay bằng thuỷ tinh chịu lực hạn chế bám mùi dễ dàng vệ sinh sau khi dùng Cối xay sinh tố dung tích 1 lít xay đư', 6, 738033, 312542, '2023-11-22', 0, 2),
	(197, 'Máy xay sinh tố Kangaroo KG4B3', 13, 'Máy xay sinh tố AVA thiết kế đơn giản hiện đại đa chức năng: xay sinh tố xay hạt Phục vụ tốt cho nhu cầu làm sinh tố sơ chế thực phẩm chuẩn bị gia vị giúp bạn nấu ăn thuận tiện hơn Công suất 500W dùng động cơ có chất liệu hoàn toàn bằng đồng dẫn điện tốt ', 6, 1085036, 500259, '2023-11-22', 0, 2),
	(198, 'Máy làm sữa hạt Rapido RHB-1800D', 14, 'Máy xay sinh tố AVA thiết kế đơn giản hiện đại đa chức năng: xay sinh tố xay hạt Phục vụ tốt cho nhu cầu làm sinh tố sơ chế thực phẩm chuẩn bị gia vị giúp bạn nấu ăn thuận tiện hơn Công suất 500W dùng động cơ có chất liệu hoàn toàn bằng đồng dẫn điện tốt ', 6, 1238263, 479969, '2023-11-22', 0, 2),
	(199, 'Máy xay sinh tố đa năng Philips HR2041/10 - 2 cối', 12, 'Máy xay sinh tố Delites BL2009 có thiết kế sang trọng tiện dụng với 1 cối xay sinh tố và 1 cối xay thực phẩm khô Cối xay sinh tố 15 lít bằng nhựa cao cấp không bám mùi dễ dàng vệ sinh sau khi sử dụng Cối xay thực phẩm khô dùng để xay tiêu cà phê các loại ', 6, 933247, 494632, '2023-11-22', 0, 2),
	(200, 'Máy xay sinh tố Kangaroo KG4B3', 8, 'Máy xay sinh tố Delites BL2009 có thiết kế sang trọng tiện dụng với 1 cối xay sinh tố và 1 cối xay thực phẩm khô Cối xay sinh tố 15 lít bằng nhựa cao cấp không bám mùi dễ dàng vệ sinh sau khi sử dụng Cối xay thực phẩm khô dùng để xay tiêu cà phê các loại ', 6, 1022905, 394475, '2023-11-22', 0, 2),
	(201, 'Máy xay sinh tố Kangaroo KG4B3', 6, 'Máy xay sinh tố Toshiba chất liệu nhựa cao cấp không chứa BPA (Bisphenol A) độc hại sử dụng an toàn sức khỏe Kiểu dáng đơn giản màu sắc trang nhã dùng đẹp trong mọi không gian Hoạt động hiệu quả với công suất 600W xay nhanh và nhuyễn mịn mọi nguyên liệu b', 6, 563729, 315557, '2023-11-22', 0, 2),
	(202, 'Máy xay sinh tố đa năng Kangaroo KG3B2', 10, 'Máy xay sinh tố Toshiba chất liệu nhựa cao cấp không chứa BPA (Bisphenol A) độc hại sử dụng an toàn sức khỏe Kiểu dáng đơn giản màu sắc trang nhã dùng đẹp trong mọi không gian Hoạt động hiệu quả với công suất 600W xay nhanh và nhuyễn mịn mọi nguyên liệu b', 6, 1248618, 856814, '2023-11-22', 0, 2),
	(203, 'Máy làm sữa hạt đa năng Magic A-96 bạc', 15, 'Máy xay sinh tố AVA thiết kế đơn giản hiện đại đa chức năng: xay sinh tố xay hạt Phục vụ tốt cho nhu cầu làm sinh tố sơ chế thực phẩm chuẩn bị gia vị giúp bạn nấu ăn thuận tiện hơn Công suất 500W dùng động cơ có chất liệu hoàn toàn bằng đồng dẫn điện tốt ', 6, 579594, 235782, '2023-11-22', 0, 2),
	(204, 'Máy xay sinh tố đa năng AVA YX-906N', 6, 'Máy xay sinh tố Sunhouse SHD 5112 Xanh màu sắc thời trang Công suất 350W mạnh mẽ giúp xay mịn mọi loại thực phẩm nhanh chóng Máy trang bị 2 cối xay bằng thuỷ tinh chịu lực hạn chế bám mùi dễ dàng vệ sinh sau khi dùng Cối xay sinh tố dung tích 1 lít xay đư', 6, 572687, 236716, '2023-11-22', 0, 2),
	(205, 'Nồi chiên không dầu AVA KDF-593D 7.5 lít', 13, 'Nồi chiên không dầu AVA màu đen sang trọng chất liệu vỏ nhựa PVC cao cấp kháng vỡ chịu nhiệt tốt dễ bố trí ở nhiều nơi trong bếp Nồi chiên không dầu có dung tích sử dụng 55 lít nướng 4 - 5 đùi gà cùng lúc hoặc gà nguyên con khoảng 12 kg Công nghệ Rapid Ai', 2, 1893837, 1133712, '2023-11-22', 0, 2),
	(206, 'Nồi chiên không dầu Kangaroo KG42AF1 4 lít', 12, 'Nồi chiên không dầu AVA màu đen sang trọng chất liệu vỏ nhựa PVC cao cấp kháng vỡ chịu nhiệt tốt dễ bố trí ở nhiều nơi trong bếp Nồi chiên không dầu có dung tích sử dụng 55 lít nướng 4 - 5 đùi gà cùng lúc hoặc gà nguyên con khoảng 12 kg Công nghệ Rapid Ai', 2, 1947957, 759290, '2023-11-22', 0, 2),
	(207, 'Nồi chiên không dầu Sunhouse SHD4062 6 lít', 11, 'Nồi chiên không dầu Rapido SMART-70M 7 lít rộng rãi giúp chiên nướng được gà nguyên con điều chỉnh bằng nút xoay đơn giản dễ dùng thiết kế mặt trước trong suốt và đèn chiếu sáng bên trong thuận tiện quan sát thực phẩm trong quá trình nấu Dung tích 7 lít r', 2, 2439481, 1306283, '2023-11-22', 0, 2),
	(208, 'Nồi chiên không dầu AVA KDF-593D 7.5 lít', 14, 'Nồi chiên không dầu Rapido SMART-70M 7 lít rộng rãi giúp chiên nướng được gà nguyên con điều chỉnh bằng nút xoay đơn giản dễ dùng thiết kế mặt trước trong suốt và đèn chiếu sáng bên trong thuận tiện quan sát thực phẩm trong quá trình nấu Dung tích 7 lít r', 2, 1544638, 594818, '2023-11-22', 0, 2),
	(209, 'Nồi chiên không dầu AVA KDF-593D 7.5 lít', 5, 'Nồi chiên không dầu Bear QZG-A15T2 45 lít có dung tích phù hợp cho nhu cầu sử dụng của gia đình 3 - 4 người công nghệ làm nóng bằng không khí nóng đối lưu giúp chiên nướng chín đều và ngon không cần dầu 8 chế độ cài đặt sẵn giúp chế biến món ăn đa dạng sử', 2, 681201, 218678, '2023-11-22', 0, 2),
	(210, 'Nồi chiên không dầu Rapido SMART-7.0M 7 lít', 8, 'Thiết kế gọn đẹp vỏ máy chất liệu nhựa cao cấp cách nhiệt màu đen sang trọng bền bỉ hài hòa trong không gian nội thất hiện đại Chân đế chống trượt dùng chắc chắn trên mọi mặt phẳng để nồi hoạt động ổn định tránh nghiêng đổ Nồi chiên không dầu với dung tíc', 2, 2163536, 1391168, '2023-11-22', 0, 2),
	(211, 'Nồi chiên không dầu Bear QZG-A15T2 4.5 lít', 9, 'Thiết kế gọn đẹp vỏ máy chất liệu nhựa cao cấp cách nhiệt màu đen sang trọng bền bỉ hài hòa trong không gian nội thất hiện đại Chân đế chống trượt dùng chắc chắn trên mọi mặt phẳng để nồi hoạt động ổn định tránh nghiêng đổ Nồi chiên không dầu với dung tíc', 2, 521009, 354828, '2023-11-22', 0, 2),
	(212, 'Nồi chiên không dầu Rapido RAF-8.0M 8 lít', 12, 'Nồi chiên không dầu Rapido SMART-70M 7 lít rộng rãi giúp chiên nướng được gà nguyên con điều chỉnh bằng nút xoay đơn giản dễ dùng thiết kế mặt trước trong suốt và đèn chiếu sáng bên trong thuận tiện quan sát thực phẩm trong quá trình nấu Dung tích 7 lít r', 2, 2277295, 932341, '2023-11-22', 0, 2),
	(213, 'Nồi chiên không dầu Rapido RAF-8.0M 8 lít', 6, 'Nồi chiên không dầu Rapido SMART-70M 7 lít rộng rãi giúp chiên nướng được gà nguyên con điều chỉnh bằng nút xoay đơn giản dễ dùng thiết kế mặt trước trong suốt và đèn chiếu sáng bên trong thuận tiện quan sát thực phẩm trong quá trình nấu Dung tích 7 lít r', 2, 1098095, 676192, '2023-11-22', 0, 2),
	(214, 'Nồi chiên không dầu Sunhouse SHD4026 6 lít', 11, 'Nồi chiên không dầu AVA màu đen sang trọng chất liệu vỏ nhựa PVC cao cấp kháng vỡ chịu nhiệt tốt dễ bố trí ở nhiều nơi trong bếp Nồi chiên không dầu có dung tích sử dụng 55 lít nướng 4 - 5 đùi gà cùng lúc hoặc gà nguyên con khoảng 12 kg Công nghệ Rapid Ai', 2, 2469623, 782040, '2023-11-22', 0, 2),
	(215, 'Nồi chiên không dầu Kangaroo KG42AF1 4 lít', 10, 'Nồi chiên không dầu AVA màu đen sang trọng chất liệu vỏ nhựa PVC cao cấp kháng vỡ chịu nhiệt tốt dễ bố trí ở nhiều nơi trong bếp Nồi chiên không dầu có dung tích sử dụng 55 lít nướng 4 - 5 đùi gà cùng lúc hoặc gà nguyên con khoảng 12 kg Công nghệ Rapid Ai', 2, 1241857, 498026, '2023-11-22', 0, 2),
	(216, 'Nồi chiên không dầu Bear QZG-A15T2 4.5 lít', 14, 'Nồi chiên không dầu AVA màu đen sang trọng chất liệu vỏ nhựa PVC cao cấp kháng vỡ chịu nhiệt tốt dễ bố trí ở nhiều nơi trong bếp Nồi chiên không dầu có dung tích sử dụng 55 lít nướng 4 - 5 đùi gà cùng lúc hoặc gà nguyên con khoảng 12 kg Công nghệ Rapid Ai', 2, 1174901, 425661, '2023-11-22', 0, 2),
	(217, 'Nồi chiên không dầu Rapido RAF-8.0M 8 lít', 9, 'Nồi chiên không dầu Bear QZG-A15T2 45 lít có dung tích phù hợp cho nhu cầu sử dụng của gia đình 3 - 4 người công nghệ làm nóng bằng không khí nóng đối lưu giúp chiên nướng chín đều và ngon không cần dầu 8 chế độ cài đặt sẵn giúp chế biến món ăn đa dạng sử', 2, 1524077, 760229, '2023-11-22', 0, 2),
	(218, 'Nồi chiên không dầu AVA AF40155D 5 lít', 12, 'Nồi chiên không dầu Bear QZG-A15T2 45 lít có dung tích phù hợp cho nhu cầu sử dụng của gia đình 3 - 4 người công nghệ làm nóng bằng không khí nóng đối lưu giúp chiên nướng chín đều và ngon không cần dầu 8 chế độ cài đặt sẵn giúp chế biến món ăn đa dạng sử', 2, 1495332, 704676, '2023-11-22', 0, 2),
	(219, 'Nồi chiên không dầu AVA KDF-593D 7.5 lít', 6, 'Nồi chiên không dầu AVA màu đen sang trọng chất liệu vỏ nhựa PVC cao cấp kháng vỡ chịu nhiệt tốt dễ bố trí ở nhiều nơi trong bếp Nồi chiên không dầu có dung tích sử dụng 55 lít nướng 4 - 5 đùi gà cùng lúc hoặc gà nguyên con khoảng 12 kg Công nghệ Rapid Ai', 2, 591983, 340900, '2023-11-22', 0, 2),
	(220, 'Nồi chiên không dầu AVA KDF-593D 7.5 lít', 9, 'Thiết kế gọn đẹp vỏ máy chất liệu nhựa cao cấp cách nhiệt màu đen sang trọng bền bỉ hài hòa trong không gian nội thất hiện đại Chân đế chống trượt dùng chắc chắn trên mọi mặt phẳng để nồi hoạt động ổn định tránh nghiêng đổ Nồi chiên không dầu với dung tíc', 2, 1601219, 896979, '2023-11-22', 0, 2),
	(221, 'Nồi chiên không dầu Sunhouse SHD4026 6 lít', 12, 'Nồi chiên không dầu AVA màu đen sang trọng chất liệu vỏ nhựa PVC cao cấp kháng vỡ chịu nhiệt tốt dễ bố trí ở nhiều nơi trong bếp Nồi chiên không dầu có dung tích sử dụng 55 lít nướng 4 - 5 đùi gà cùng lúc hoặc gà nguyên con khoảng 12 kg Công nghệ Rapid Ai', 2, 1118426, 716605, '2023-11-22', 0, 2),
	(222, 'Lò chiên không dầu Ferroli FAF-12M 12 lít', 6, 'Nồi chiên không dầu Bear QZG-A15T2 45 lít có dung tích phù hợp cho nhu cầu sử dụng của gia đình 3 - 4 người công nghệ làm nóng bằng không khí nóng đối lưu giúp chiên nướng chín đều và ngon không cần dầu 8 chế độ cài đặt sẵn giúp chế biến món ăn đa dạng sử', 2, 1947444, 593192, '2023-11-22', 0, 2),
	(223, 'Nồi chiên không dầu Sunhouse SHD4062 6 lít', 8, 'Nồi chiên không dầu Bear QZG-A15T2 45 lít có dung tích phù hợp cho nhu cầu sử dụng của gia đình 3 - 4 người công nghệ làm nóng bằng không khí nóng đối lưu giúp chiên nướng chín đều và ngon không cần dầu 8 chế độ cài đặt sẵn giúp chế biến món ăn đa dạng sử', 2, 1411565, 674378, '2023-11-22', 0, 2),
	(224, 'Nồi chiên không dầu Bear QZG-A15T2 4.5 lít', 14, 'Nồi chiên không dầu Bear QZG-A15T2 45 lít có dung tích phù hợp cho nhu cầu sử dụng của gia đình 3 - 4 người công nghệ làm nóng bằng không khí nóng đối lưu giúp chiên nướng chín đều và ngon không cần dầu 8 chế độ cài đặt sẵn giúp chế biến món ăn đa dạng sử', 2, 1587007, 977619, '2023-11-22', 0, 2),
	(225, 'Nồi chiên không dầu AVA AF40155D 5 lít', 10, 'Thiết kế gọn đẹp vỏ máy chất liệu nhựa cao cấp cách nhiệt màu đen sang trọng bền bỉ hài hòa trong không gian nội thất hiện đại Chân đế chống trượt dùng chắc chắn trên mọi mặt phẳng để nồi hoạt động ổn định tránh nghiêng đổ Nồi chiên không dầu với dung tíc', 2, 1678404, 1043990, '2023-11-22', 0, 2),
	(226, 'Nồi chiên không dầu AVA 55K07A 5.5 lít', 7, 'Nồi chiên không dầu Rapido SMART-70M 7 lít rộng rãi giúp chiên nướng được gà nguyên con điều chỉnh bằng nút xoay đơn giản dễ dùng thiết kế mặt trước trong suốt và đèn chiếu sáng bên trong thuận tiện quan sát thực phẩm trong quá trình nấu Dung tích 7 lít r', 2, 1512761, 832378, '2023-11-22', 0, 2),
	(227, 'Nồi chiên không dầu AVA AF40155D 5 lít', 9, 'Thiết kế gọn đẹp vỏ máy chất liệu nhựa cao cấp cách nhiệt màu đen sang trọng bền bỉ hài hòa trong không gian nội thất hiện đại Chân đế chống trượt dùng chắc chắn trên mọi mặt phẳng để nồi hoạt động ổn định tránh nghiêng đổ Nồi chiên không dầu với dung tíc', 2, 1770824, 840939, '2023-11-22', 0, 2),
	(228, 'Nồi chiên không dầu Kangaroo KG42AF1 4 lít', 8, 'Nồi chiên không dầu AVA màu đen sang trọng chất liệu vỏ nhựa PVC cao cấp kháng vỡ chịu nhiệt tốt dễ bố trí ở nhiều nơi trong bếp Nồi chiên không dầu có dung tích sử dụng 55 lít nướng 4 - 5 đùi gà cùng lúc hoặc gà nguyên con khoảng 12 kg Công nghệ Rapid Ai', 2, 1718243, 1156767, '2023-11-22', 0, 2),
	(229, 'Nồi chiên không dầu Kangaroo KG42AF1 4 lít', 9, 'Nồi chiên không dầu Bear QZG-A15T2 45 lít có dung tích phù hợp cho nhu cầu sử dụng của gia đình 3 - 4 người công nghệ làm nóng bằng không khí nóng đối lưu giúp chiên nướng chín đều và ngon không cần dầu 8 chế độ cài đặt sẵn giúp chế biến món ăn đa dạng sử', 2, 1769948, 622265, '2023-11-22', 0, 2),
	(230, 'Nồi chiên không dầu Sunhouse SHD4026 6 lít', 11, 'Nồi chiên không dầu AVA màu đen sang trọng chất liệu vỏ nhựa PVC cao cấp kháng vỡ chịu nhiệt tốt dễ bố trí ở nhiều nơi trong bếp Nồi chiên không dầu có dung tích sử dụng 55 lít nướng 4 - 5 đùi gà cùng lúc hoặc gà nguyên con khoảng 12 kg Công nghệ Rapid Ai', 2, 1681425, 522387, '2023-11-22', 0, 2),
	(231, 'Nồi chiên không dầu Rapido RAF-8.0M 8 lít', 11, 'Nồi chiên không dầu Rapido SMART-70M 7 lít rộng rãi giúp chiên nướng được gà nguyên con điều chỉnh bằng nút xoay đơn giản dễ dùng thiết kế mặt trước trong suốt và đèn chiếu sáng bên trong thuận tiện quan sát thực phẩm trong quá trình nấu Dung tích 7 lít r', 2, 1872283, 1247413, '2023-11-22', 0, 2),
	(232, 'Lò chiên không dầu Ferroli FAF-12M 12 lít', 15, 'Nồi chiên không dầu AVA màu đen sang trọng chất liệu vỏ nhựa PVC cao cấp kháng vỡ chịu nhiệt tốt dễ bố trí ở nhiều nơi trong bếp Nồi chiên không dầu có dung tích sử dụng 55 lít nướng 4 - 5 đùi gà cùng lúc hoặc gà nguyên con khoảng 12 kg Công nghệ Rapid Ai', 2, 635821, 362253, '2023-11-22', 0, 2),
	(233, 'Nồi chiên không dầu AVA KDF-593D 7.5 lít', 11, 'Nồi chiên không dầu Bear QZG-A15T2 45 lít có dung tích phù hợp cho nhu cầu sử dụng của gia đình 3 - 4 người công nghệ làm nóng bằng không khí nóng đối lưu giúp chiên nướng chín đều và ngon không cần dầu 8 chế độ cài đặt sẵn giúp chế biến món ăn đa dạng sử', 2, 1661800, 722876, '2023-11-22', 0, 2),
	(234, 'Nồi cơm điện tử Toshiba 1 lít RC-10NMFVN(WT)', 15, 'Nồi cơm điện Delites NCR1502 màu sắc hiện đại sang trọng kiểu dáng trẻ trung bắt mắt sản phẩm đẹp cho không gian dùng thêm đẹp Nồi cơm nắp rời dung tích 15 lít tiện dùng cho các gia đình 2 – 4 người ăn Lòng nồi hợp kim nhôm tráng men chống dính bền tốt nấ', 4, 799313, 414051, '2023-11-22', 0, 2),
	(235, 'Nồi cơm cao tần Sharp 1.8 lít KS-IH191V-BK', 16, 'Nồi cơm điện nắp gài thiết kế màu sắc nhã nhặn kiểu dáng sang trọng phù hợp với mọi gian bếp trong gia đình Lòng nồi dày 13 mm dạng tổ ong bằng hợp kim nhôm phủ chống dính Hạn chế cháy dính cơm an toàn sức khỏe dễ dàng làm sạch sau khi dùng Nắp trong nồi ', 4, 1157559, 533251, '2023-11-22', 0, 2),
	(236, 'Nồi cơm nắp gài Sunhouse 1.8 lít SHD8602', 15, 'Nồi cơm nắp gài Sunhouse 1 lít SHD8208C kiểu dáng nhỏ gọn thanh lịch màu sắc tươi sáng Dung tích nồi cơm điện 1 lít đáp ứng đủ nhu cầu nấu cơm cho gia đình từ 2 - 4 người Bảng điều khiển nút gạt với 2 chức năng Cook (nấu)/Warm (giữ ấm) đơn giản dễ dùng Lò', 4, 622790, 384832, '2023-11-22', 0, 2),
	(237, 'Nồi cơm nắp gài Delites 1.8 lít NCG1805', 16, 'Nồi cơm điện Delites NCR1502 màu sắc hiện đại sang trọng kiểu dáng trẻ trung bắt mắt sản phẩm đẹp cho không gian dùng thêm đẹp Nồi cơm nắp rời dung tích 15 lít tiện dùng cho các gia đình 2 – 4 người ăn Lòng nồi hợp kim nhôm tráng men chống dính bền tốt nấ', 4, 1302687, 617142, '2023-11-22', 0, 2),
	(238, 'Nồi cơm điện tử Toshiba 1 lít RC-10NMFVN(WT)', 16, 'Nồi cơm nắp gài Sunhouse 1 lít SHD8208C kiểu dáng nhỏ gọn thanh lịch màu sắc tươi sáng Dung tích nồi cơm điện 1 lít đáp ứng đủ nhu cầu nấu cơm cho gia đình từ 2 - 4 người Bảng điều khiển nút gạt với 2 chức năng Cook (nấu)/Warm (giữ ấm) đơn giản dễ dùng Lò', 4, 1263461, 852529, '2023-11-22', 0, 2),
	(239, 'Nồi cơm nắp gài Sharp 1.8 lít KS-NR191STV', 18, 'Nồi cơm điện Delites NCR1502 màu sắc hiện đại sang trọng kiểu dáng trẻ trung bắt mắt sản phẩm đẹp cho không gian dùng thêm đẹp Nồi cơm nắp rời dung tích 15 lít tiện dùng cho các gia đình 2 – 4 người ăn Lòng nồi hợp kim nhôm tráng men chống dính bền tốt nấ', 4, 1443360, 299895, '2023-11-22', 0, 2),
	(240, 'Nồi cơm nắp gài Delites 1.8 lít NCG1805', 16, 'Nồi cơm nắp gài Sunhouse 1 lít SHD8208C kiểu dáng nhỏ gọn thanh lịch màu sắc tươi sáng Dung tích nồi cơm điện 1 lít đáp ứng đủ nhu cầu nấu cơm cho gia đình từ 2 - 4 người Bảng điều khiển nút gạt với 2 chức năng Cook (nấu)/Warm (giữ ấm) đơn giản dễ dùng Lò', 4, 1298352, 743350, '2023-11-22', 0, 2),
	(241, 'Nồi cơm điện tử Philips 1.8 lít HD4515/55', 15, 'Nồi cơm điện Delites NCR1502 màu sắc hiện đại sang trọng kiểu dáng trẻ trung bắt mắt sản phẩm đẹp cho không gian dùng thêm đẹp Nồi cơm nắp rời dung tích 15 lít tiện dùng cho các gia đình 2 – 4 người ăn Lòng nồi hợp kim nhôm tráng men chống dính bền tốt nấ', 4, 1241820, 370336, '2023-11-22', 0, 2),
	(242, 'Nồi cơm nắp gài Sunhouse 1.8 lít SHD8602', 16, 'Nồi cơm điện Delites NCR1502 màu sắc hiện đại sang trọng kiểu dáng trẻ trung bắt mắt sản phẩm đẹp cho không gian dùng thêm đẹp Nồi cơm nắp rời dung tích 15 lít tiện dùng cho các gia đình 2 – 4 người ăn Lòng nồi hợp kim nhôm tráng men chống dính bền tốt nấ', 4, 832473, 383556, '2023-11-22', 0, 2),
	(243, 'Nồi cơm nắp gài Sunhouse 1 lít SHD8208C', 16, 'Nồi cơm điện Delites NCR1502 màu sắc hiện đại sang trọng kiểu dáng trẻ trung bắt mắt sản phẩm đẹp cho không gian dùng thêm đẹp Nồi cơm nắp rời dung tích 15 lít tiện dùng cho các gia đình 2 – 4 người ăn Lòng nồi hợp kim nhôm tráng men chống dính bền tốt nấ', 4, 1297620, 714233, '2023-11-22', 0, 2),
	(244, 'Nồi cơm điện tử AVA 1.8 lít TP40-CT01E', 10, 'Nồi cơm điện nắp gài thiết kế màu sắc nhã nhặn kiểu dáng sang trọng phù hợp với mọi gian bếp trong gia đình Lòng nồi dày 13 mm dạng tổ ong bằng hợp kim nhôm phủ chống dính Hạn chế cháy dính cơm an toàn sức khỏe dễ dàng làm sạch sau khi dùng Nắp trong nồi ', 4, 803172, 363025, '2023-11-22', 0, 2),
	(245, 'Nồi cơm điện tử AVA 1.8 lít TP40-CT01E', 12, 'Nồi cơm điện Delites NCR1502 màu sắc hiện đại sang trọng kiểu dáng trẻ trung bắt mắt sản phẩm đẹp cho không gian dùng thêm đẹp Nồi cơm nắp rời dung tích 15 lít tiện dùng cho các gia đình 2 – 4 người ăn Lòng nồi hợp kim nhôm tráng men chống dính bền tốt nấ', 4, 324425, 71907, '2023-11-22', 0, 2),
	(246, 'Nồi cơm điện tử AVA 1.8 lít TP40-CT01E', 18, 'Nồi cơm nắp gài Sunhouse 1 lít SHD8208C kiểu dáng nhỏ gọn thanh lịch màu sắc tươi sáng Dung tích nồi cơm điện 1 lít đáp ứng đủ nhu cầu nấu cơm cho gia đình từ 2 - 4 người Bảng điều khiển nút gạt với 2 chức năng Cook (nấu)/Warm (giữ ấm) đơn giản dễ dùng Lò', 4, 873375, 276015, '2023-11-22', 0, 2),
	(247, 'Nồi cơm điện tử AVA 1.8 lít TP40-CT01E', 17, 'Nồi cơm điện Delites NCR1502 màu sắc hiện đại sang trọng kiểu dáng trẻ trung bắt mắt sản phẩm đẹp cho không gian dùng thêm đẹp Nồi cơm nắp rời dung tích 15 lít tiện dùng cho các gia đình 2 – 4 người ăn Lòng nồi hợp kim nhôm tráng men chống dính bền tốt nấ', 4, 1283475, 796162, '2023-11-22', 0, 2),
	(248, 'Nồi cơm điện tử Sunhouse mama 1.8 lít SHD8903', 11, 'Nồi cơm điện Toshiba RC-18NMFVN(WT) thiết kế chắc chắn màu trắng sang trọng Góp phần tôn thêm nét đẹp hiện đại của mọi không gian bếp Nồi cơm điện này có dung tích 18 lít đáp ứng nhu cầu cơm cho gia đình 4 – 6 thành viên Nấu cơm nhanh chín tiết kiệm điện ', 4, 583595, 224923, '2023-11-22', 0, 2),
	(249, 'Nồi cơm điện tử Toshiba 1 lít RC-10NMFVN(WT)', 14, 'Nồi cơm nắp gài Sunhouse 1 lít SHD8208C kiểu dáng nhỏ gọn thanh lịch màu sắc tươi sáng Dung tích nồi cơm điện 1 lít đáp ứng đủ nhu cầu nấu cơm cho gia đình từ 2 - 4 người Bảng điều khiển nút gạt với 2 chức năng Cook (nấu)/Warm (giữ ấm) đơn giản dễ dùng Lò', 4, 1045577, 652264, '2023-11-22', 0, 2),
	(250, 'Nồi cơm điện tử AVA 1.8 lít TP40-CT01E', 14, 'Nồi cơm nắp gài Sunhouse 1 lít SHD8208C kiểu dáng nhỏ gọn thanh lịch màu sắc tươi sáng Dung tích nồi cơm điện 1 lít đáp ứng đủ nhu cầu nấu cơm cho gia đình từ 2 - 4 người Bảng điều khiển nút gạt với 2 chức năng Cook (nấu)/Warm (giữ ấm) đơn giản dễ dùng Lò', 4, 620205, 410300, '2023-11-22', 0, 2),
	(251, 'Nồi cơm điện cao tần Kangaroo 1.8 lít KG599N', 16, 'Nồi cơm điện Delites NCR1502 màu sắc hiện đại sang trọng kiểu dáng trẻ trung bắt mắt sản phẩm đẹp cho không gian dùng thêm đẹp Nồi cơm nắp rời dung tích 15 lít tiện dùng cho các gia đình 2 – 4 người ăn Lòng nồi hợp kim nhôm tráng men chống dính bền tốt nấ', 4, 1261005, 542820, '2023-11-22', 0, 2),
	(252, 'Nồi cơm nắp gài Delites 1.8 lít NCG1805', 10, 'Nồi cơm điện Delites NCR1502 màu sắc hiện đại sang trọng kiểu dáng trẻ trung bắt mắt sản phẩm đẹp cho không gian dùng thêm đẹp Nồi cơm nắp rời dung tích 15 lít tiện dùng cho các gia đình 2 – 4 người ăn Lòng nồi hợp kim nhôm tráng men chống dính bền tốt nấ', 4, 1378647, 766340, '2023-11-22', 0, 2),
	(253, 'Nồi cơm điện tử Toshiba 1 lít RC-10NMFVN(WT)', 18, 'Nồi cơm điện nắp gài thiết kế màu sắc nhã nhặn kiểu dáng sang trọng phù hợp với mọi gian bếp trong gia đình Lòng nồi dày 13 mm dạng tổ ong bằng hợp kim nhôm phủ chống dính Hạn chế cháy dính cơm an toàn sức khỏe dễ dàng làm sạch sau khi dùng Nắp trong nồi ', 4, 541026, 139626, '2023-11-22', 0, 2),
	(254, 'Nồi cơm cao tần Sharp 1.8 lít KS-IH191V-BK', 11, 'Nồi cơm nắp gài Sunhouse 1 lít SHD8208C kiểu dáng nhỏ gọn thanh lịch màu sắc tươi sáng Dung tích nồi cơm điện 1 lít đáp ứng đủ nhu cầu nấu cơm cho gia đình từ 2 - 4 người Bảng điều khiển nút gạt với 2 chức năng Cook (nấu)/Warm (giữ ấm) đơn giản dễ dùng Lò', 4, 1162332, 622177, '2023-11-22', 0, 2),
	(255, 'Nồi cơm cao tần Sunhouse Mama 1.5 lít SHD8955', 14, 'Nồi cơm điện nắp gài thiết kế màu sắc nhã nhặn kiểu dáng sang trọng phù hợp với mọi gian bếp trong gia đình Lòng nồi dày 13 mm dạng tổ ong bằng hợp kim nhôm phủ chống dính Hạn chế cháy dính cơm an toàn sức khỏe dễ dàng làm sạch sau khi dùng Nắp trong nồi ', 4, 684482, 293880, '2023-11-22', 0, 2),
	(256, 'Nồi cơm điện cao tần Kangaroo 1.8 lít KG599N', 12, 'Nồi cơm điện Delites NCR1502 màu sắc hiện đại sang trọng kiểu dáng trẻ trung bắt mắt sản phẩm đẹp cho không gian dùng thêm đẹp Nồi cơm nắp rời dung tích 15 lít tiện dùng cho các gia đình 2 – 4 người ăn Lòng nồi hợp kim nhôm tráng men chống dính bền tốt nấ', 4, 1038223, 443612, '2023-11-22', 0, 2),
	(257, 'Nồi cơm nắp gài BlueStone 1.8 lít RCB-5520', 13, 'Nồi cơm điện Toshiba RC-18NMFVN(WT) thiết kế chắc chắn màu trắng sang trọng Góp phần tôn thêm nét đẹp hiện đại của mọi không gian bếp Nồi cơm điện này có dung tích 18 lít đáp ứng nhu cầu cơm cho gia đình 4 – 6 thành viên Nấu cơm nhanh chín tiết kiệm điện ', 4, 1478433, 633525, '2023-11-22', 0, 2),
	(258, 'Nồi cơm điện tử Philips 1.8 lít HD4515/55', 17, 'Nồi cơm điện Delites NCR1502 màu sắc hiện đại sang trọng kiểu dáng trẻ trung bắt mắt sản phẩm đẹp cho không gian dùng thêm đẹp Nồi cơm nắp rời dung tích 15 lít tiện dùng cho các gia đình 2 – 4 người ăn Lòng nồi hợp kim nhôm tráng men chống dính bền tốt nấ', 4, 371633, 74713, '2023-11-22', 0, 2),
	(259, 'Nồi cơm điện tử Sunhouse mama 1.8 lít SHD8903', 14, 'Nồi cơm điện Delites NCR1502 màu sắc hiện đại sang trọng kiểu dáng trẻ trung bắt mắt sản phẩm đẹp cho không gian dùng thêm đẹp Nồi cơm nắp rời dung tích 15 lít tiện dùng cho các gia đình 2 – 4 người ăn Lòng nồi hợp kim nhôm tráng men chống dính bền tốt nấ', 4, 640126, 170840, '2023-11-22', 0, 2),
	(260, 'Nồi cơm cao tần Sunhouse Mama 1.5 lít SHD8955', 14, 'Nồi cơm điện Toshiba RC-18NMFVN(WT) thiết kế chắc chắn màu trắng sang trọng Góp phần tôn thêm nét đẹp hiện đại của mọi không gian bếp Nồi cơm điện này có dung tích 18 lít đáp ứng nhu cầu cơm cho gia đình 4 – 6 thành viên Nấu cơm nhanh chín tiết kiệm điện ', 4, 1098739, 428391, '2023-11-22', 0, 2),
	(261, 'Nồi cơm nắp gài Sunhouse 1.2 lít SHD8217W', 11, 'Nồi cơm điện nắp gài thiết kế màu sắc nhã nhặn kiểu dáng sang trọng phù hợp với mọi gian bếp trong gia đình Lòng nồi dày 13 mm dạng tổ ong bằng hợp kim nhôm phủ chống dính Hạn chế cháy dính cơm an toàn sức khỏe dễ dàng làm sạch sau khi dùng Nắp trong nồi ', 4, 912500, 197417, '2023-11-22', 0, 2),
	(262, 'Nồi cơm điện cao tần Kangaroo 1.8 lít KG599N', 10, 'Nồi cơm điện nắp gài thiết kế màu sắc nhã nhặn kiểu dáng sang trọng phù hợp với mọi gian bếp trong gia đình Lòng nồi dày 13 mm dạng tổ ong bằng hợp kim nhôm phủ chống dính Hạn chế cháy dính cơm an toàn sức khỏe dễ dàng làm sạch sau khi dùng Nắp trong nồi ', 4, 729471, 160969, '2023-11-22', 0, 2);

-- Dumping structure for table n2q.product_details
CREATE TABLE IF NOT EXISTS `product_details` (
  `productID` int(11) NOT NULL,
  `attributeID` int(11) NOT NULL,
  `value` varchar(50) NOT NULL,
  PRIMARY KEY (`productID`,`attributeID`),
  KEY `attributeID` (`attributeID`),
  CONSTRAINT `product_details_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `products` (`id`),
  CONSTRAINT `product_details_ibfk_2` FOREIGN KEY (`attributeID`) REFERENCES `attributes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.product_details: ~0 rows (approximately)

-- Dumping structure for table n2q.product_models
CREATE TABLE IF NOT EXISTS `product_models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productID` int(11) NOT NULL,
  `optionValue` varchar(50) NOT NULL,
  `statusID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productID` (`productID`),
  KEY `statusID` (`statusID`),
  CONSTRAINT `product_models_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `products` (`id`),
  CONSTRAINT `product_models_ibfk_2` FOREIGN KEY (`statusID`) REFERENCES `product_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=540 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.product_models: ~294 rows (approximately)
INSERT INTO `product_models` (`id`, `productID`, `optionValue`, `statusID`) VALUES
	(246, 1, 'Đơn - Trắng', 1),
	(247, 1, 'Đôi - Đen', 2),
	(248, 2, 'Đôi - Đen', 2),
	(249, 3, 'Đơn - Trắng', 2),
	(250, 3, 'Đôi - Đen', 2),
	(251, 4, 'Đôi - Đen', 2),
	(252, 4, 'Đơn - Trắng', 3),
	(253, 5, 'Đơn - Trắng', 2),
	(254, 5, 'Đôi - Đen', 3),
	(255, 6, 'Đôi - Đen', 3),
	(256, 7, 'Đơn - Trắng', 2),
	(257, 9, 'Đôi - Đen', 2),
	(258, 9, 'Đơn - Trắng', 2),
	(259, 10, 'Đơn - Trắng', 2),
	(260, 10, 'Đôi - Đen', 2),
	(261, 12, 'Đôi - Đen', 3),
	(262, 12, 'Đơn - Trắng', 3),
	(263, 13, 'Đôi - Đen', 2),
	(264, 14, 'Đôi - Đen', 3),
	(265, 15, 'Đơn - Trắng', 2),
	(266, 15, 'Đôi - Đen', 2),
	(267, 16, 'Đôi - Đen', 1),
	(268, 16, 'Đơn - Trắng', 2),
	(269, 17, 'Đơn - Trắng', 1),
	(270, 18, 'Đôi - Đen', 3),
	(271, 19, 'Đôi - Đen', 1),
	(272, 19, 'Đơn - Trắng', 2),
	(273, 20, 'Đôi - Đen', 2),
	(274, 20, 'Đơn - Trắng', 3),
	(275, 23, 'Đơn - Trắng', 1),
	(276, 25, 'Đôi - Đen', 2),
	(277, 25, 'Đơn - Trắng', 1),
	(278, 26, 'Đơn - Trắng', 3),
	(279, 26, 'Đôi - Đen', 2),
	(280, 27, 'Đơn - Trắng', 2),
	(281, 27, 'Đôi - Đen', 2),
	(282, 28, 'Đơn - Trắng', 1),
	(283, 28, 'Đôi - Đen', 2),
	(284, 29, 'Đơn - Trắng', 2),
	(285, 61, 'Từ 1.8 lít trở lên - Trắng', 2),
	(286, 64, 'Nhỏ hơn 1.8 lít - Đen', 1),
	(287, 65, 'Nhỏ hơn 1.8 lít - Đen', 2),
	(288, 65, 'Từ 1.8 lít trở lên - Trắng', 3),
	(289, 66, 'Từ 1.8 lít trở lên - Trắng', 1),
	(290, 69, 'Từ 1.8 lít trở lên - Trắng', 1),
	(291, 69, 'Nhỏ hơn 1.8 lít - Đen', 1),
	(292, 70, 'Nhỏ hơn 1.8 lít - Đen', 2),
	(293, 72, 'Từ 1.8 lít trở lên - Trắng', 2),
	(294, 75, 'Từ 1.8 lít trở lên - Trắng', 2),
	(295, 76, 'Nhỏ hơn 1.8 lít - Đen', 1),
	(296, 76, 'Từ 1.8 lít trở lên - Trắng', 2),
	(297, 77, 'Từ 1.8 lít trở lên - Trắng', 1),
	(298, 77, 'Nhỏ hơn 1.8 lít - Đen', 2),
	(299, 80, 'Từ 1.8 lít trở lên - Trắng', 2),
	(300, 83, 'Nhỏ hơn 1.8 lít - Đen', 3),
	(301, 84, 'Nhỏ hơn 1.8 lít - Đen', 2),
	(302, 86, 'Từ 1.8 lít trở lên - Trắng', 3),
	(303, 88, 'Nhỏ hơn 1.8 lít - Đen', 2),
	(304, 89, 'Nhỏ hơn 1.8 lít - Đen', 3),
	(305, 91, 'Từ 1.8 lít trở lên - Trắng', 3),
	(306, 91, 'Nhỏ hơn 1.8 lít - Đen', 2),
	(307, 92, 'Nhỏ hơn 1.8 lít - Đen', 2),
	(308, 93, 'Nhỏ hơn 1.8 lít - Đen', 3),
	(309, 93, 'Từ 1.8 lít trở lên - Trắng', 3),
	(310, 94, 'Từ 1.8 lít trở lên - Trắng', 3),
	(311, 95, 'Nhỏ hơn 1.8 lít - Đen', 3),
	(312, 95, 'Từ 1.8 lít trở lên - Trắng', 2),
	(313, 96, 'Nhỏ hơn 1.8 lít - Đen', 1),
	(314, 97, 'Nhỏ hơn 1.8 lít - Đen', 2),
	(315, 98, 'Nhỏ hơn 1.8 lít - Đen', 2),
	(316, 98, 'Từ 1.8 lít trở lên - Trắng', 2),
	(317, 100, 'Từ 1.8 lít trở lên - Trắng', 2),
	(318, 100, 'Nhỏ hơn 1.8 lít - Đen', 2),
	(319, 101, 'Nhỏ hơn 1.8 lít - Đen', 2),
	(320, 101, 'Từ 1.8 lít trở lên - Trắng', 3),
	(321, 103, 'Nhỏ hơn 1.8 lít - Đen', 3),
	(322, 107, 'Nhỏ hơn 1.8 lít - Đen', 1),
	(323, 108, 'Nhỏ hơn 1.8 lít - Đen', 3),
	(324, 109, 'Từ 1.8 lít trở lên - Trắng', 3),
	(325, 110, 'Từ 1.8 lít trở lên - Trắng', 3),
	(326, 110, 'Nhỏ hơn 1.8 lít - Đen', 3),
	(327, 112, 'Từ 1.8 lít trở lên - Trắng', 1),
	(328, 113, 'Nhỏ hơn 1.8 lít - Đen', 3),
	(329, 113, 'Từ 1.8 lít trở lên - Trắng', 2),
	(330, 116, 'Từ 1.8 lít trở lên - Trắng', 3),
	(331, 117, 'Từ 1.8 lít trở lên - Trắng', 1),
	(332, 147, 'Cảm ứng - Trắng - 300W', 1),
	(333, 147, 'Cảm ứng - Đen - 300W', 1),
	(334, 148, 'Nút gạt - Đen - 200W', 3),
	(335, 148, 'Nút xoay - Trắng - 200W', 3),
	(336, 149, 'Nút gạt - Đen - 200W', 2),
	(337, 149, 'Nút xoay - Trắng - 200W', 3),
	(338, 150, 'Nút xoay - Trắng - 200W', 2),
	(339, 150, 'Nút gạt - Đen - 200W', 2),
	(340, 151, 'Nút gạt - Đen - 200W', 3),
	(341, 152, 'Nút xoay - Trắng - 200W', 1),
	(342, 152, 'Nút nhấn - Trắng - 300W', 2),
	(343, 152, 'Cảm ứng - Đen - 300W', 3),
	(344, 152, 'Nút gạt - Đen - 200W', 3),
	(345, 153, 'Nút xoay - Trắng - 200W', 2),
	(346, 154, 'Cảm ứng - Đen - 300W', 2),
	(347, 155, 'Nút xoay - Trắng - 200W', 2),
	(348, 155, 'Cảm ứng - Đen - 300W', 3),
	(349, 156, 'Nút xoay - Trắng - 200W', 3),
	(350, 156, 'Cảm ứng - Trắng - 300W', 2),
	(351, 157, 'Nút xoay - Trắng - 200W', 3),
	(352, 157, 'Cảm ứng - Trắng - 300W', 3),
	(353, 158, 'Nút gạt - Đen - 200W', 3),
	(354, 158, 'Cảm ứng - Trắng - 300W', 3),
	(355, 158, 'Nút xoay - Trắng - 200W', 2),
	(356, 160, 'Cảm ứng - Đen - 300W', 1),
	(357, 161, 'Cảm ứng - Đen - 300W', 3),
	(358, 161, 'Cảm ứng - Trắng - 300W', 2),
	(359, 163, 'Nút gạt - Đen - 200W', 3),
	(360, 164, 'Nút nhấn - Trắng - 300W', 2),
	(361, 164, 'Cảm ứng - Đen - 300W', 2),
	(362, 164, 'Nút gạt - Đen - 200W', 2),
	(363, 165, 'Nút xoay - Trắng - 200W', 1),
	(364, 166, 'Nút gạt - Đen - 200W', 3),
	(365, 167, 'Nút nhấn - Trắng - 300W', 2),
	(366, 167, 'Nút gạt - Đen - 200W', 2),
	(367, 169, 'Nút gạt - Đen - 200W', 2),
	(368, 169, 'Cảm ứng - Trắng - 300W', 3),
	(369, 171, 'Cảm ứng - Trắng - 300W', 2),
	(370, 171, 'Nút nhấn - Trắng - 300W', 1),
	(371, 171, 'Cảm ứng - Đen - 300W', 3),
	(372, 172, 'Nút gạt - Đen - 200W', 1),
	(373, 173, 'Cảm ứng - Đen - 300W', 2),
	(374, 175, 'Nút nhấn - Trắng - 300W', 1),
	(375, 175, 'Cảm ứng - Trắng - 300W', 1),
	(376, 118, '2 vòi - Đen', 2),
	(377, 118, '1 vòi - Đen', 3),
	(378, 119, '2 vòi - Đen', 3),
	(379, 119, '1 vòi - Đen', 3),
	(380, 120, '1 vòi - Đen', 2),
	(381, 121, '1 vòi - Đen', 2),
	(382, 122, '1 vòi - Đen', 1),
	(383, 124, '1 vòi - Đen', 1),
	(384, 124, '2 vòi - Đen', 2),
	(385, 126, '1 vòi - Đen', 3),
	(386, 126, '2 vòi - Đen', 1),
	(387, 127, '1 vòi - Đen', 2),
	(388, 128, '2 vòi - Đen', 1),
	(389, 128, '1 vòi - Đen', 2),
	(390, 129, '1 vòi - Đen', 2),
	(391, 129, '2 vòi - Đen', 2),
	(392, 130, '1 vòi - Đen', 2),
	(393, 131, '1 vòi - Đen', 1),
	(394, 132, '1 vòi - Đen', 2),
	(395, 132, '2 vòi - Đen', 1),
	(396, 133, '1 vòi - Đen', 3),
	(397, 133, '2 vòi - Đen', 2),
	(398, 135, '2 vòi - Đen', 2),
	(399, 137, '1 vòi - Đen', 3),
	(400, 137, '2 vòi - Đen', 1),
	(401, 138, '1 vòi - Đen', 1),
	(402, 138, '2 vòi - Đen', 3),
	(403, 139, '1 vòi - Đen', 2),
	(404, 139, '2 vòi - Đen', 2),
	(405, 140, '1 vòi - Đen', 2),
	(406, 140, '2 vòi - Đen', 2),
	(407, 142, '2 vòi - Đen', 2),
	(408, 143, '2 vòi - Đen', 3),
	(409, 144, '2 vòi - Đen', 2),
	(410, 144, '1 vòi - Đen', 2),
	(411, 145, '2 vòi - Đen', 3),
	(412, 145, '1 vòi - Đen', 2),
	(413, 174, 'Dưới 1 lít - Dưới 300W', 3),
	(414, 174, '1.5 lít trở lên - 600W trở lên', 1),
	(415, 175, 'Dưới 1 lít - Dưới 300W', 1),
	(416, 175, 'Dưới 1 lít - 300W đến 600W', 1),
	(417, 177, 'Dưới 1 lít - Dưới 300W', 1),
	(418, 177, 'Từ 1 lít đến 1.5 lít - 600W trở lên', 2),
	(419, 178, 'Từ 1 lít đến 1.5 lít - 600W trở lên', 1),
	(420, 179, '1.5 lít trở lên - 600W trở lên', 2),
	(421, 180, 'Dưới 1 lít - Dưới 300W', 3),
	(422, 180, 'Từ 1 lít đến 1.5 lít - 600W trở lên', 2),
	(423, 181, 'Từ 1 lít đến 1.5 lít - 600W trở lên', 2),
	(424, 183, 'Dưới 1 lít - 300W đến 600W', 2),
	(425, 183, 'Từ 1 lít đến 1.5 lít - 600W trở lên', 2),
	(426, 184, 'Dưới 1 lít - 300W đến 600W', 2),
	(427, 185, '1.5 lít trở lên - 600W trở lên', 1),
	(428, 186, 'Dưới 1 lít - Dưới 300W', 1),
	(429, 187, 'Dưới 1 lít - Dưới 300W', 1),
	(430, 187, 'Dưới 1 lít - 300W đến 600W', 2),
	(431, 190, 'Từ 1 lít đến 1.5 lít - 600W trở lên', 3),
	(432, 191, 'Dưới 1 lít - Dưới 300W', 2),
	(433, 191, 'Dưới 1 lít - 300W đến 600W', 2),
	(434, 191, '1.5 lít trở lên - 600W trở lên', 3),
	(435, 192, 'Dưới 1 lít - 300W đến 600W', 1),
	(436, 192, '1.5 lít trở lên - 600W trở lên', 1),
	(437, 194, 'Dưới 1 lít - Dưới 300W', 1),
	(438, 194, 'Từ 1 lít đến 1.5 lít - 600W trở lên', 2),
	(439, 195, 'Dưới 1 lít - 300W đến 600W', 2),
	(440, 196, 'Từ 1 lít đến 1.5 lít - 600W trở lên', 2),
	(441, 196, '1.5 lít trở lên - 600W trở lên', 3),
	(442, 197, 'Dưới 1 lít - Dưới 300W', 1),
	(443, 198, 'Dưới 1 lít - 300W đến 600W', 3),
	(444, 198, '1.5 lít trở lên - 600W trở lên', 3),
	(445, 199, 'Dưới 1 lít - Dưới 300W', 2),
	(446, 199, 'Dưới 1 lít - 300W đến 600W', 1),
	(447, 199, '1.5 lít trở lên - 600W trở lên', 1),
	(448, 200, 'Dưới 1 lít - Dưới 300W', 2),
	(449, 200, 'Từ 1 lít đến 1.5 lít - 600W trở lên', 2),
	(450, 201, 'Dưới 1 lít - Dưới 300W', 1),
	(451, 201, 'Từ 1 lít đến 1.5 lít - 600W trở lên', 3),
	(452, 201, '1.5 lít trở lên - 600W trở lên', 1),
	(453, 202, 'Từ 1 lít đến 1.5 lít - 600W trở lên', 2),
	(454, 205, 'Dưới 5 lít - Đen', 2),
	(455, 205, 'Từ 5 lít đến 10 lít - Đen', 1),
	(456, 206, 'Từ 5 lít đến 10 lít - Đen', 1),
	(457, 206, '10 lít trở lên - Trắng', 2),
	(458, 207, 'Dưới 5 lít - Trắng', 3),
	(459, 208, 'Dưới 5 lít - Đen', 2),
	(460, 208, 'Từ 5 lít đến 10 lít - Đen', 1),
	(461, 209, 'Dưới 5 lít - Đen', 1),
	(462, 209, 'Dưới 5 lít - Trắng', 2),
	(463, 210, 'Dưới 5 lít - Trắng', 2),
	(464, 211, 'Từ 5 lít đến 10 lít - Đen', 2),
	(465, 212, 'Dưới 5 lít - Trắng', 3),
	(466, 212, 'Từ 5 lít đến 10 lít - Đen', 2),
	(467, 212, '10 lít trở lên - Trắng', 2),
	(468, 213, 'Dưới 5 lít - Đen', 1),
	(469, 213, 'Dưới 5 lít - Trắng', 2),
	(470, 215, 'Dưới 5 lít - Trắng', 3),
	(471, 216, 'Từ 5 lít đến 10 lít - Đen', 1),
	(472, 216, '10 lít trở lên - Trắng', 2),
	(473, 217, 'Từ 5 lít đến 10 lít - Đen', 1),
	(474, 218, 'Dưới 5 lít - Đen', 1),
	(475, 218, '10 lít trở lên - Trắng', 1),
	(476, 219, 'Dưới 5 lít - Đen', 3),
	(477, 219, 'Từ 5 lít đến 10 lít - Đen', 3),
	(478, 219, '10 lít trở lên - Trắng', 2),
	(479, 220, 'Dưới 5 lít - Đen', 3),
	(480, 220, 'Từ 5 lít đến 10 lít - Đen', 1),
	(481, 221, 'Dưới 5 lít - Trắng', 1),
	(482, 223, 'Dưới 5 lít - Trắng', 2),
	(483, 223, 'Từ 5 lít đến 10 lít - Đen', 2),
	(484, 225, 'Từ 5 lít đến 10 lít - Đen', 2),
	(485, 226, 'Dưới 5 lít - Đen', 2),
	(486, 226, '10 lít trở lên - Trắng', 2),
	(487, 228, '10 lít trở lên - Trắng', 2),
	(488, 229, 'Dưới 5 lít - Đen', 2),
	(489, 229, 'Từ 5 lít đến 10 lít - Đen', 1),
	(490, 230, 'Dưới 5 lít - Trắng', 2),
	(491, 230, 'Dưới 5 lít - Đen', 2),
	(492, 230, '10 lít trở lên - Trắng', 2),
	(493, 231, 'Dưới 5 lít - Đen', 2),
	(494, 231, '10 lít trở lên - Trắng', 3),
	(495, 234, 'Từ 1 lít đến 1.5 lít (2 - 4 người) - Đen', 1),
	(496, 234, 'Từ 2.2 lít đến 3 lít (6 - 8 người) - Đen', 3),
	(497, 234, 'Từ 5 lít trở lên (trên 8 người) - Trắng', 2),
	(498, 235, 'Từ 1 lít đến 1.5 lít (2 - 4 người) - Đen', 2),
	(499, 237, 'Từ 1 lít đến 1.5 lít (2 - 4 người) - Trắng', 1),
	(500, 237, 'Từ 1 lít đến 1.5 lít (2 - 4 người) - Đen', 2),
	(501, 238, 'Dưới 1 lít (1 - 2 người) - Đen', 2),
	(502, 238, 'Từ 5 lít trở lên (trên 8 người) - Trắng', 3),
	(503, 239, 'Từ 1 lít đến 1.5 lít (2 - 4 người) - Trắng', 2),
	(504, 239, 'Từ 1 lít đến 1.5 lít (2 - 4 người) - Đen', 2),
	(505, 239, 'Từ 1.8 lít đến 2 lít (4 - 6 người) - Trắng', 3),
	(506, 240, 'Từ 1.8 lít đến 2 lít (4 - 6 người) - Trắng', 2),
	(507, 241, 'Từ 1 lít đến 1.5 lít (2 - 4 người) - Trắng', 2),
	(508, 243, 'Từ 1 lít đến 1.5 lít (2 - 4 người) - Đen', 3),
	(509, 244, 'Từ 2.2 lít đến 3 lít (6 - 8 người) - Đen', 3),
	(510, 245, 'Từ 1 lít đến 1.5 lít (2 - 4 người) - Trắng', 2),
	(511, 245, 'Từ 2.2 lít đến 3 lít (6 - 8 người) - Đen', 1),
	(512, 248, 'Từ 5 lít trở lên (trên 8 người) - Trắng', 1),
	(513, 249, 'Dưới 1 lít (1 - 2 người) - Đen', 3),
	(514, 250, 'Từ 1 lít đến 1.5 lít (2 - 4 người) - Đen', 2),
	(515, 250, 'Từ 2.2 lít đến 3 lít (6 - 8 người) - Đen', 3),
	(516, 251, 'Dưới 1 lít (1 - 2 người) - Đen', 2),
	(517, 251, 'Từ 1 lít đến 1.5 lít (2 - 4 người) - Đen', 2),
	(518, 251, 'Từ 5 lít trở lên (trên 8 người) - Trắng', 2),
	(519, 252, 'Từ 1 lít đến 1.5 lít (2 - 4 người) - Trắng', 2),
	(520, 252, 'Từ 2.2 lít đến 3 lít (6 - 8 người) - Đen', 1),
	(521, 252, 'Từ 1.8 lít đến 2 lít (4 - 6 người) - Trắng', 2),
	(522, 253, 'Dưới 1 lít (1 - 2 người) - Đen', 3),
	(523, 253, 'Từ 1 lít đến 1.5 lít (2 - 4 người) - Trắng', 2),
	(524, 255, 'Dưới 1 lít (1 - 2 người) - Đen', 2),
	(525, 255, 'Từ 1 lít đến 1.5 lít (2 - 4 người) - Đen', 3),
	(526, 255, 'Từ 2.2 lít đến 3 lít (6 - 8 người) - Đen', 2),
	(527, 256, 'Dưới 1 lít (1 - 2 người) - Đen', 2),
	(528, 256, 'Từ 1 lít đến 1.5 lít (2 - 4 người) - Trắng', 2),
	(529, 256, 'Từ 1 lít đến 1.5 lít (2 - 4 người) - Đen', 2),
	(530, 256, 'Từ 5 lít trở lên (trên 8 người) - Trắng', 2),
	(531, 257, 'Dưới 1 lít (1 - 2 người) - Đen', 2),
	(532, 257, 'Từ 1 lít đến 1.5 lít (2 - 4 người) - Đen', 3),
	(533, 258, 'Từ 2.2 lít đến 3 lít (6 - 8 người) - Đen', 3),
	(534, 259, 'Từ 1 lít đến 1.5 lít (2 - 4 người) - Trắng', 2),
	(535, 259, 'Từ 2.2 lít đến 3 lít (6 - 8 người) - Đen', 1),
	(536, 260, 'Từ 1 lít đến 1.5 lít (2 - 4 người) - Đen', 2),
	(537, 260, 'Từ 1 lít đến 1.5 lít (2 - 4 người) - Trắng', 2),
	(538, 261, 'Từ 1.8 lít đến 2 lít (4 - 6 người) - Trắng', 3),
	(539, 262, 'Từ 5 lít trở lên (trên 8 người) - Trắng', 3);

-- Dumping structure for table n2q.product_status
CREATE TABLE IF NOT EXISTS `product_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.product_status: ~3 rows (approximately)
INSERT INTO `product_status` (`id`, `name`) VALUES
	(1, 'Ẩn'),
	(2, 'Khả dụng'),
	(3, 'Hết hàng');

-- Dumping structure for table n2q.product_vouchers
CREATE TABLE IF NOT EXISTS `product_vouchers` (
  `voucherID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  PRIMARY KEY (`voucherID`,`productID`),
  KEY `productID` (`productID`),
  CONSTRAINT `product_vouchers_ibfk_1` FOREIGN KEY (`voucherID`) REFERENCES `vouchers` (`id`),
  CONSTRAINT `product_vouchers_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.product_vouchers: ~0 rows (approximately)

-- Dumping structure for table n2q.rates
CREATE TABLE IF NOT EXISTS `rates` (
  `userID` varchar(20) NOT NULL,
  `productID` int(11) NOT NULL,
  `lastUpdated` date NOT NULL,
  `ratePoint` int(11) NOT NULL,
  `rateComment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userID`,`productID`),
  KEY `productID` (`productID`),
  CONSTRAINT `rates_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`),
  CONSTRAINT `rates_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.rates: ~0 rows (approximately)

-- Dumping structure for table n2q.role_user
CREATE TABLE IF NOT EXISTS `role_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.role_user: ~2 rows (approximately)
INSERT INTO `role_user` (`id`, `name`) VALUES
	(1, 'User'),
	(2, 'Admin');

-- Dumping structure for table n2q.unknown_vouchers
CREATE TABLE IF NOT EXISTS `unknown_vouchers` (
  `voucherID` int(11) NOT NULL,
  `remain` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`voucherID`),
  CONSTRAINT `unknown_vouchers_ibfk_1` FOREIGN KEY (`voucherID`) REFERENCES `vouchers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.unknown_vouchers: ~0 rows (approximately)

-- Dumping structure for table n2q.used_vouchers
CREATE TABLE IF NOT EXISTS `used_vouchers` (
  `userID` varchar(20) NOT NULL,
  `voucherID` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  PRIMARY KEY (`userID`,`voucherID`),
  KEY `voucherID` (`voucherID`),
  KEY `orderID` (`orderID`),
  CONSTRAINT `used_vouchers_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`),
  CONSTRAINT `used_vouchers_ibfk_2` FOREIGN KEY (`voucherID`) REFERENCES `vouchers` (`id`),
  CONSTRAINT `used_vouchers_ibfk_3` FOREIGN KEY (`orderID`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.used_vouchers: ~0 rows (approximately)

-- Dumping structure for table n2q.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `encryptedPassword` varchar(30) NOT NULL,
  `fullName` varchar(50) NOT NULL,
  `genderID` int(11) NOT NULL,
  `dob` date DEFAULT NULL,
  `roleID` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `statusID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `statusID` (`statusID`),
  KEY `genderID` (`genderID`),
  KEY `roleID` (`roleID`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`statusID`) REFERENCES `user_status` (`id`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`genderID`) REFERENCES `genders` (`id`),
  CONSTRAINT `users_ibfk_3` FOREIGN KEY (`roleID`) REFERENCES `role_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.users: ~3 rows (approximately)
INSERT INTO `users` (`id`, `email`, `phone`, `encryptedPassword`, `fullName`, `genderID`, `dob`, `roleID`, `address`, `statusID`) VALUES
	('ABCD', 'nam123@gmail.com', '901123254', 'JK^%!HJHJ', 'Nguyễn Nhật Nam', 1, '2003-01-03', 2, 'BH', 3),
	('AHDJ', 'quan123@gmail.com', '821431247', 'IOPHJ78#!S', 'Nguyễn Hoàng Khánh Quân', 1, '2003-12-02', 1, 'TPHCM', 3),
	('KLSL', 'knam123@gmail.com', '761324312', 'HJ%HJ&^!7J', 'Cao Khải Nam', 1, '2003-01-03', 2, 'TPHCM', 3);

-- Dumping structure for table n2q.user_status
CREATE TABLE IF NOT EXISTS `user_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.user_status: ~3 rows (approximately)
INSERT INTO `user_status` (`id`, `name`) VALUES
	(1, 'Khóa tài khoản'),
	(2, 'Hoạt động');

-- Dumping structure for table n2q.verifying_users
CREATE TABLE IF NOT EXISTS `verifying_users` (
  `userID` varchar(20) NOT NULL,
  `verifyCode` char(8) NOT NULL,
  `expiredTime` datetime NOT NULL,
  PRIMARY KEY (`userID`),
  CONSTRAINT `verifying_users_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.verifying_users: ~0 rows (approximately)

-- Dumping structure for table n2q.vouchers
CREATE TABLE IF NOT EXISTS `vouchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucherCode` varchar(20) NOT NULL,
  `dateStart` date NOT NULL,
  `dateEnd` date NOT NULL,
  `discount` bigint(20) NOT NULL DEFAULT 0,
  `typeID` int(11) NOT NULL,
  `scopeID` int(11) NOT NULL,
  `statusID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `statusID` (`statusID`),
  KEY `typeID` (`typeID`),
  KEY `scopeID` (`scopeID`),
  CONSTRAINT `vouchers_ibfk_1` FOREIGN KEY (`statusID`) REFERENCES `voucher_status` (`id`),
  CONSTRAINT `vouchers_ibfk_2` FOREIGN KEY (`typeID`) REFERENCES `voucher_type` (`id`),
  CONSTRAINT `vouchers_ibfk_3` FOREIGN KEY (`scopeID`) REFERENCES `voucher_scope` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.vouchers: ~0 rows (approximately)

-- Dumping structure for table n2q.voucher_scope
CREATE TABLE IF NOT EXISTS `voucher_scope` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.voucher_scope: ~0 rows (approximately)

-- Dumping structure for table n2q.voucher_status
CREATE TABLE IF NOT EXISTS `voucher_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.voucher_status: ~0 rows (approximately)

-- Dumping structure for table n2q.voucher_type
CREATE TABLE IF NOT EXISTS `voucher_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.voucher_type: ~0 rows (approximately)

-- Dumping structure for table n2q.wishlists
CREATE TABLE IF NOT EXISTS `wishlists` (
  `userID` varchar(20) NOT NULL,
  `modelID` int(11) NOT NULL,
  PRIMARY KEY (`userID`,`modelID`),
  KEY `modelID` (`modelID`),
  CONSTRAINT `wishlists_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`),
  CONSTRAINT `wishlists_ibfk_2` FOREIGN KEY (`modelID`) REFERENCES `product_models` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table n2q.wishlists: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
