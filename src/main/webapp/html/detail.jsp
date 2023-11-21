<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../image/general/logo.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="../css/product.css">

    <link rel="stylesheet" href="../css/detail.css">
    <link rel="stylesheet" href="../css/tab.css">
    <link rel="stylesheet" href="../css/indexRes.css">
    <title>Chi tiết</title>
</head>

<body>
    <div id="page">

       <%@include file="header.jsp"%>
        <!-- 
            Tạo bởi: Trần Minh Quân
            Ngày: 24-10-2023
            Chức năng: Chức năng detail
         -->
        <div class="detail container">
            <div class="row detail_part">
                <div class="col-5">
                    <div class="slider_main">
                        <img src="../image/detail/img1.jpg" alt="img1">
                    </div>
                    <div class="slider_images">
                        <img class="slider_image active" src="../image/detail/img1.jpg" alt="img1">
                        <img class="slider_image" src="../image/detail/img2.jpg" alt="img2">
                        <img class="slider_image" src="../image/detail/img3.jpg" alt="img3">
                        <img class="slider_image" src="../image/detail/img4.jpg" alt="img4">
                        <img class="slider_image" src="../image/detail/img5.jpg" alt="img5">
                        <img class="slider_image" src="../image/detail/img6.jpg" alt="img6">
                    </div>
                </div>
                <div class="col-7">
                    <h2>Nồi điện đa năng, nồi lẩu mini đa năng kèm khay hấp, chất liệu chống dính, dung tích 1,8L tốc độ
                        sôi cực nhanh</h2>
                    <a href="../../../../index.jsp" class="brand">Thương hiệu: Aroma</a>
                    <div class="rate">
                        <p class="starrate">5.0</p>
                        <img class="star" src="../image/detail/star.png" alt="star">
                        <img class="star" src="../image/detail/star.png" alt="star">
                        <img class="star" src="../image/detail/star.png" alt="star">
                        <img class="star" src="../image/detail/star.png" alt="star">
                        <img class="star" src="../image/detail/star.png" alt="star">
                    </div>
                    <div class="line"></div>
                    <div class="price">
                        <h3 class="final_price">1.100.000đ</h3>
                        <h3 class="old_price">2.000.000đ</h3>
                    </div>
                    <table class="quickview">
                        <tr>
                            <td class="quickview_title">Thương hiệu:</td>
                            <td>Aroma Housewares</td>
                        </tr>
                        <tr>
                            <td class="quickview_title">Màu:</td>
                            <td>Trắng</td>
                        </tr>
                        <tr>
                            <td class="quickview_title">Chất liệu:</td>
                            <td>Nhôm</td>
                        </tr>
                        <tr>
                            <td class="quickview_title">Kích thước (Dài x Rộng x Cao):</td>
                            <td>3cm x 3cm x 3cm</td>
                        </tr>
                        <tr>
                            <td class="quickview_title">Dung tích</td>
                            <td>2 lít</td>
                        </tr>
                    </table>
                    <div>
                        <form action="checkout.jsp" style="display: inline;">
                            <button class="buy_button">Mua ngay!</button>
                        </form>
                        <form action="cart.jsp" style="display: inline;">
                            <button class="addcart_button">Thêm vào giỏ</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="row detail_part" style="margin-top: 30px;">
                <div class="tab">
                    <button class="tablinks active" onclick="_switchTab(event, 'describe')">Giới thiệu</button>
                    <button class="tablinks" onclick="_switchTab(event, 'info')">Thông tin sản phẩm</button>
                    <button class="tablinks" onclick="_switchTab(event, 'rates')">Đánh giá</button>
                </div>
                <div id="describe" class="tabcontent active">
                    <h2 class="title">Giới thiệu</h2>
                    <p style="white-space: pre-line; font-size: 16px;">
                        - BỀ MẶT NẤU DUAL: Nồi điện mới của chúng tôi vừa là NƯỚNG vừa là Lẩu, giúp nấu nướng linh hoạt hơn
                        mà ít tốn công sức hơn - để chuẩn bị những bữa ăn ngon.
                        - ĐA CHỨC NĂNG: Bạn có thể điều chỉnh nhiệt độ từ 300° đến 450° F, giúp bạn thoải mái chế biến các
                        món súp thịnh soạn, nướng thịt và rau - và nhiều hơn thế nữa.
                        - NẤU CHE: Nắp kính cường lực ngăn ngừa bắn tung tóe khi nướng và nấu. Nó có thể ngăn ngừa sự lộn
                        xộn trong nhà bếp và vết bẩn trên quần áo của bạn.
                        - RỘNG RÃI & DI ĐỘNG: Nồi nấu bằng thép không gỉ cực lớn của chúng tôi có dung tích 2,5 lít và đảm
                        bảo phân phối nhiệt đều và dễ dàng làm sạch – đó là máy rửa chén an toàn.
                        - PHỤ KIỆN: Nồi này đi kèm đế nhiệt có thể điều chỉnh, nồi nấu bằng thép không gỉ, chảo nướng chống
                        dính và nắp thủy tinh - cho những bữa ăn hoàn hảo mọi lúc.
                    </p>
                </div>
                <div id="info" class="tabcontent">
                    <h2 class="title">Thông tin sản phẩm</h2>
                    <table class="table_full">
                        <tr>
                            <td class="table_title">Mã sản phẩm</td>
                            <td>ND-123</td>
                        </tr>
                        <tr>
                            <td class="table_title">Thương hiệu</td>
                            <td>Aroma Housewares</td>
                        </tr>
                        <tr>
                            <td class="table_title">Màu</td>
                            <td>Trắng</td>
                        </tr>
                        <tr>
                            <td class="table_title">Chất liệu</td>
                            <td>Nhôm</td>
                        </tr>
                        <tr>
                            <td class="table_title">Kích thước (Dài x Rộng x Cao)</td>
                            <td>3cm x 3cm x 3cm</td>
                        </tr>
                        <tr>
                            <td class="table_title">Dung tích</td>
                            <td>2 lít</td>
                        </tr>
                        <tr>
                            <td class="table_title">Công suất</td>
                            <td>500 Wát</td>
                        </tr>
                        <tr>
                            <td class="table_title">Khối lượng</td>
                            <td>3 Kg</td>
                        </tr>
                        <tr>
                            <td class="table_title">Dung tích</td>
                            <td>5 Lít</td>
                        </tr>
                        <tr>
                            <td class="table_title">Vôn</td>
                            <td>220 Vôn</td>
                        </tr>
                    </table>
                </div>
                <div id="rates" class="tabcontent">
                    <div class="row">
                        <div class="col-6">
                            <div class="user_review">
                                <div class="user_info">
                                    <h4 class="name">Trần Minh Quân</h4>
                                    <small class="date">Ngày: 30/10/2023</small>
                                </div>
                                <div class="rate">
                                    <img class="star" src="../image/detail/star.png" alt="star">
                                    <img class="star" src="../image/detail/star.png" alt="star">
                                    <img class="star" src="../image/detail/star.png" alt="star">
                                    <img class="star" src="../image/detail/star.png" alt="star">
                                    <img class="star" src="../image/detail/star.png" alt="star">
                                </div>
                                <div class="review">
                                    <p>Good
                                    </p>
                                </div>
                            </div>
                            <div class="user_review">
                                <div class="user_info">
                                    <h4 class="name">Cao Thành Nam</h4>
                                    <small class="date">Ngày: 29/10/2023</small>
                                </div>
                                <div class="rate">
                                    <img class="star" src="../image/detail/star.png" alt="star">
                                    <img class="star" src="../image/detail/star.png" alt="star">
                                    <img class="star" src="../image/detail/star.png" alt="star">
                                    <img class="star" src="../image/detail/star.png" alt="star">
                                    <img class="star" src="../image/detail/star.png" alt="star">
                                </div>
                                <div class="review">
                                    <p>Gạo nấu ghè tan, cực ngây, êm.</p>
                                </div>
                            </div>
                            <div class="user_review">
                                <div class="user_info">
                                    <h4 class="name">Nguyễn Khải Nam</h4>
                                    <small class="date">Ngày: 28/10/2023</small>
                                </div>
                                <div class="rate">
                                    <img class="star" src="../image/detail/star.png" alt="star">
                                </div>
                                <div class="review">
                                    <p>1 sao cho giống cờ Việt Nam.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <h2 class="title">Để lại đánh giá</h2>
                            <br>
                            <p style="color: gray; text-align: center;">Hãy đăng nhập để gửi đánh giá</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row detail_part">
                <h2 class="title" style="font-size: 28px; padding-bottom: 20px;">Các sản phẩm tương tự</h2>
                <div class="product_list container">
                    <div class="row mb-3">
    
                    </div>
                </div>
            </div>
        </div>
        
       <%@include file="footer.jsp"%>
    </div>

    <script src="../js/detail.js"></script>
    <script src="../js/index.js"></script>
    <script src="../js/tab.js"></script>
    <script src="../js/product.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous">
        </script>
    
</body>

</html>