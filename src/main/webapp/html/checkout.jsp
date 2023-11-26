<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../image/general/logo.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="../css/indexRes.css">
    <link rel="stylesheet" href="../css/checkout.css">
    <title>Thanh toán</title>
</head>

<body>
    <div id="page">


    
        <div class="checkout">
            <form class="checkout-form" action="user.jsp">
                <h2>Thông tin khách hàng</h2>
                <label>Tên khách hàng:</label>
                <input type="text" name="username" placeholder="Nhập tên" value="Trần Minh Quân" required>
    
                <label>Email:</label>
                <input type="email" name="email" placeholder="Nhập email..." value="21130494@st.hcmuaf.edu.vn" required>
    
                <label>Số điện thoại:</label>
                <input type="text" name="phone" placeholder="Số điện thoại..." value="0123456789" required>
    
                <label for="shipping">Địa chỉ:</label>
                <input type="text" name="address" placeholder="Địa chỉ..." required>
    
                <div style="display: flex; justify-content: space-between;">
                    <a href="cart.jsp" class="button">Trở về giỏ hàng</a>
                    <button>Đặt hàng</button>
                </div>
            </form>
    
            <div class="summary">
                <h2>Tóm tắt đơn hàng</h2>
                <div class="summary-item">
                    <span>Nồi cơm không dính x1:</span>
                    <span><strong>1.200.000đ</strong></span>
                </div>
                <div class="summary-item">
                    <span>Máy lọc nước x2:</span>
                    <span><strong>2.400.000đ</strong></span>
                </div>
                <hr>
                <div class="summary-item">
                    <span>Giảm giá từ voucher:</span>
                    <span><strong>- 300.000đ</strong></span>
                </div>
                <hr>
                <div class="summary-item">
                    <span>Phí vận chuyển:</span>
                    <span><strong>0đ</strong></span>
                </div>
                <hr>
                <div class="summary-item">
                    <span>Tổng</span>
                    <span><strong>3.300.000đ</strong></span>
                </div>
                <div class="summary-item">
                    <span>Phương pháp thanh toán</span>
                    <span><strong>Trả tiền mặt (COD)</strong></span>
                </div>
            </div>
        </div>
    
    
        <%@include file="footer.jsp"%>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous">
        </script>

    <script>
        function redirect(page){
            window.location.href = 'https://www.example.com';
        }
    </script>

    <script src="../js/index.js"></script>
</body>

</html>