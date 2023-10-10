# ProjectWeb

Giới thiệu trang web:
	Trang web bán sản phẩm gia dụng: Sử dụng JSP, HTMl, CSS, JDBC, Servlet, JS

---------------------------------------------------------------------------------------------

1.	Tạo file của FE
File được tạo theo cấu trúc phân chia. Mỗi tác vụ sẽ nằm ở một thư mục riêng biệt (ngoại trừ file index.html). Mô hình:
 
Nếu trong quá trình làm xuất hiện thêm các thể loại file khác thì tạo theo thư mục tương ứng. Ví dụ sau đây là một cấu trúc thư mục:
 
Nếu một thư mục có các file con như img hoặc text thì sử dụng đuôi để phân ra với nhau.
2.	Tạo file của BE
3.	Comment, in ra console
	3.1	Đối với HTML và CSS
HTML: Trước mỗi thẻ parent phải chú thích theo cú pháp: 
 
CSS: Chú thích được sử dụng để nhóm các khu vực. Tuân theo cú pháp: 
 
	3.2	Đối với JS và Java
Cả hai đều khá tương đồng với nhau nên sử dụng chung qui tắc comment và in ra console.
Comment:
 
In ra console:
 
4.	Đặt tên
	4.1	HTML
Các class được đặt tên theo cú pháp BEM nhưng có chút biến đổi để gọn hơn:
 
Class thì đặt tên như bình thường, còn id thì thêm i- ở phía trước. 
 
	4.2	CSS
Hạn chế việc viết Inline và Internal. Nếu sử dụng cú pháp Descendant thì không được phép chọn trực tiếp thẻ:
 
Các thuộc tính màu sắc, kích thước,... thì phải được sử dụng thông qua biến
 
Đặt tên biến cho css:
 
Gợi ý thêm: Nếu có thể nên qui toàn bộ kích thước về rem
Các file phải được viết riêng biệt và chú thích về độ ưu tiên nếu có với nhau.

	4.3	JS và Java
Cả hai đều là code nên sẽ tương đồng nhau. Tên viết theo cú pháp camel.
Tên class: folderName
 
Tên Abstaract phải thêm A ở phía trước, tên Interface phải thêm I ở phía trước.
Tên biến:
	 
Chỉ riêng js: tên function nên bắt đầu là _:
 
	4.4	Ngôn ngữ khác (nếu có)
 
5.	Github
Nên kiểm tra mỗi lần trước khi chạy dù cho đang làm ở branch khác.
Hoặc nên sử dụng file log để ghi lại các sự thay đổi (tối ưu hơn và cũng đúng ý nghĩa hơn)
6.	Qui định làm nhóm
Không hoàn thành yêu cầu hoặc không tốt (nếu là nhóm trưởng thì do cả team bầu), sẽ có đánh giá cuối cùng ở file word cuối
	Mỗi cá nhân đều phải có công việc như nhau (trừ trường hợp cá nhân đã xác định theo 1 hướng nào đó thì nhóm trưởng nên ưu tiên)
	Phải tuân thủ theo qui tắc vì đây là qui tắc thực tế trong công việc tuy nhiên đã được làm gọn để phù hợp
	Nhóm trưởng luôn phải ghi nhận đóng góp của từng cá nhân và phải đưa ra lý do cụ thể nếu không chấp nhận yêu cầu đó
	Mỗi cá nhân phải tự tìm hiểu và hạn chế nhờ sự giúp đỡ từ thành viên khác, nếu không cá nhân được nhờ sẽ đưa ra yêu cầu tương ứng và do nhóm trưởng thống nhất
	Nhóm trưởng có trách nhiệm giám sát mọi công việc và là người kiểm tra cuối
Hình phạt: (Do nhóm trưởng qui định)
