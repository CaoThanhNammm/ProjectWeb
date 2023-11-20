<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="icon" href="../image/general/logo.png" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="../css/headAdmin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/productAdmin.css">
    <link rel="stylesheet" href="../css/orderAdmin.css">
    <title>Quản lý đơn hàng</title>
</head>

<body style="display: flex;">
    <%@include file="headerAdmin.jsp"%>

    <div id="product">
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark container">
            <div class="container-fluid">
                <span class="navbar-brand">Đơn hàng</span>
            </div>
        </nav>

        <nav class="navbar navbar-expand-sm bg-light">
            <div class="container-fluid">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <div class="header_search">
                            <input type="text" class="search" placeholder="Tìm theo mã đơn hàng">
                            <i class="fa-solid fa-magnifying-glass search_logo"></i>
                        </div>
                    </li>

                    <li class="nav-item">
                        <div class="header_search">
                            <input type="text" class="search" placeholder="Tìm theo mã khách hàng">
                            <i class="fa-solid fa-magnifying-glass search_logo"></i>
                        </div>
                    </li>

                    <li class="nav-item">
                        <select>
                            <option value="all">Tất cả</option>
                            <option value="waiting">Chờ xử lý</option>
                            <option value="shipping">Đang giao</option>
                            <option value="canceled">Bị hủy</option>
                            <option value="completed">Hoàn thành</option>
                        </select>
                    </li>
                </ul>
            </div>
        </nav>

        <table>
            <thead>
                <tr>
                    <th>Mã đơn</th>
                    <th>Tài khoản</th>
                    <th>Tên KH</th>
                    <th>Tổng giá</th>
                    <th>Ngày tạo</th>
                    <th>Trạng thái</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>tranta123</td>
                    <td>Trần Ta</td>
                    <td>500.000</td>
                    <td>2023-11-05</td>
                    <td>
                        <span class="status-box waiting">Chờ xử lý</span>
                    </td>
                    <td>
                        <button class="details-btn">Chi tiết</button>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>conmeongungoc</td>
                    <td>Phan Tấn Ba</td>
                    <td>1.200.000</td>
                    <td>2023-11-06</td>
                    <td>
                        <span class="status-box shipping">Đang giao</span>
                    </td>
                    <td>
                        <button class="details-btn">Chi tiết</button>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>littlebiggirl</td>
                    <td>Nguyễn Thị Bé</td>
                    <td>300.000</td>
                    <td>2023-11-07</td>
                    <td>
                        <span class="status-box canceled">Đã hủy đơn</span>
                    </td>
                    <td>
                        <button class="details-btn">Chi tiết</button>
                    </td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>chodien</td>
                    <td>User321</td>
                    <td>1.000.000</td>
                    <td>2023-11-08</td>
                    <td>
                        <span class="status-box completed">Hoàn thành</span>
                    </td>
                    <td>
                        <button class="details-btn">Chi tiết</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous">
        </script>

</body>

</html>