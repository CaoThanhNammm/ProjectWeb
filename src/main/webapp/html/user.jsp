<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="icon" href="../image/general/logo.png" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="../css/indexRes.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/headerRes.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="../css/user.css">
    <link rel="stylesheet" href="../css/tab.css">
    <title>Thông tin tài khoản</title>
</head>

<body>
     <%@include file="header.jsp"%>
     
    <div class="user">
        <div class="tab">
            <button class="tablinks active" onclick="_switchTab(event, 'form')">Thông tin người dùng</button>
            <button class="tablinks" onclick="_switchTab(event, 'password')">Đổi mật khẩu</button>
            <button class="tablinks" onclick="_switchTab(event, 'order')">Lịch sử mua hàng</button>
        </div>
        <div id="form" class="tabcontent active">
            <h2>Chỉnh sửa thông tin người dùng</h2>
            <form action="#" method="POST">
                <div class="form-group">
                    <label for="name">Tên:</label>
                    <input type="text" id="name" name="name" placeholder="Trần Minh Quân" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" placeholder="vuiveluon@gmail.com" required>
                </div>
                <div class="form-group">
                    <label for="phone">Số điện thoại:</label>
                    <input type="tel" id="phone" name="phone" placeholder="0123456789" required>
                </div>
                <div class="form-group">
                    <label for="address">Địa chỉ:</label>
                    <input type="text" id="address" name="address"
                        placeholder="155/11 Đường 8 khu phố 1 phường Gì đó quận Nào đây" required>
                </div>
                <div class="form-group">
                    <label for="gender">Giới tính:</label>
                    <select id="gender" name="gender">
                        <option value="nam">Nam</option>
                        <option value="nữ">Nữ</option>
                        <option value="khac">Khác</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="dob">Ngày sinh:</label>
                    <input type="date" id="dob" name="dob" required>
                </div>
                <div class="form-actions">
                    <button type="submit">Lưu thông tin</button>
                </div>
            </form>
        </div>
        <div id="password" class="tabcontent">
            <h3>Đổi mật khẩu</h3>
            <form action="#" method="POST">
                <div class="form-group">
                    <label for="oldPassword">Mật khẩu cũ:</label>
                    <input type="password" id="oldPassword" name="oldPassword" placeholder="Nhập mật khẩu cũ" required>
                </div>
                <div class="form-group">
                    <label for="newPassword">Mật khẩu mới:</label>
                    <input type="password" id="newPassword" name="newPassword" placeholder="Nhập mật khẩu mới" required>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Nhập lại mật khẩu mới:</label>
                    <input type="password" id="confirmPassword" name="confirmPassword"
                        placeholder="Nhập lại mật khẩu mới" required>
                </div>
                <div class="form-actions">
                    <button type="submit">Đổi mật khẩu</button>
                </div>
            </form>
        </div>
        <div id="order" class="tabcontent">
            <table>
                <thead>
                    <tr>
                        <th>ID Đơn hàng</th>
                        <th>Ngày tạo</th>
                        <th>Ngày giao hàng</th>
                        <th>Giá tiền tổng</th>
                        <th>Trạng thái đơn hàng</th>
                        <th>Chi tiết</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>2023-01-05</td>
                        <td>2023-01-10</td>
                        <td>$100.00</td>
                        <td>Đã đặt</td>
                        <td><a class="details-button" href="#">Chi tiết</a></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>2023-02-10</td>
                        <td>2023-02-15</td>
                        <td>$75.50</td>
                        <td>Đang giao</td>
                        <td><a class="details-button" href="#">Chi tiết</a></td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>2023-03-20</td>
                        <td>2023-03-25</td>
                        <td>$50.25</td>
                        <td>Bị hủy</td>
                        <td><a class="details-button" href="#">Chi tiết</a></td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>2023-04-15</td>
                        <td>2023-04-20</td>
                        <td>$120.75</td>
                        <td>Hoàn thành</td>
                        <td><a class="details-button" href="#">Chi tiết</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
      <%@include file="footer.jsp"%>
      
    <script src="../js/index.js"></script>
    <script src="../js/tab.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous">
        </script>
 
</body>

</html>