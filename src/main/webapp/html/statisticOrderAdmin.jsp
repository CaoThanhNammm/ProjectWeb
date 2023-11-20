<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../image/general/logo.png" type="image/x-icon">
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/headAdmin.css">
    <link rel="stylesheet" href="../css/orderAdmin.css">
    <title>Thống kê doanh thu</title>
</head>

<!-- 
    Create: Nguyễn Khải Nam
    Date: 15/11/2023
    Note: Thống kê doanh thu
 -->

<body class="d-flex">
   <%@include file="headerAdmin.jsp"%>

    <div class="statistic_admin ms-2 me-2 mt-2">
        <div class="row">
            <div class="row">
                <div class="card-group">
                    <div class="card text-white bg-dark">
                        <div class="card-body">
                            <h5 class="card-title">Doanh thu</h5>
                            <p class="card-text">
                                Doanh thu: 1.200.000.000 VND
                            </p>
                        </div>
                    </div>
                    <div class="card text-white bg-warning">
                        <div class="card-body">
                            <h5 class="card-title">Giá trị bị hủy bỏ</h5>
                            <p class="card-text">
                                Giá trị bị hủy bỏ: 2.000.000 VND
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-3">
                <div class="row bg-light">
                    <div class="col-lg-2 pt-1 pb-1 ps-2">
                        <h1>Thống kê</h1>
                    </div>
                    <div class="col-lg-10 my-auto">
                        <ul class="d-flex nav">
                            <li class="nav-item">
                                <button class="btn">Ngày</button>
                            </li>
                            <li class="nav-item ms-1 me-1">
                                <button class="btn">Tuần</button>
                            </li>
                            <li class="nav-item">
                                <button class="btn">Tháng</button>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="row text-white bg-secondary pt-2 pb-2 ps-2 pe-2">
                    <div class="col-lg-2">
                        <div class="mt-5">
                            <p>Doanh thu</p>
                            <h2>1.200.000.000</h2>
                        </div>

                        <div class="mt-5 mb-5">
                            <p>Giá trị bị hủy bỏ</p>
                            <h2>2.000.000</h2>
                        </div>
                    </div>

                    <div class="col-lg-10">
                        <div class="row">
                            <div class="operating-systems">
                                <span class="os2-os">
                                    <span></span>Giá trị bị hủy bỏ
                                </span>
                                <span class="os3-os">
                                    <span></span>Doanh thu
                                </span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="chart">
                                <div class="os3-stats">
                                    <span></span>453.67
                                </div>
                                <div class="os1-stats">
                                    <span></span>453.67
                                </div>
                                <div class="os2-stats">
                                    <span></span>453.67
                                </div>

                                <div class="svg-container">
                                    <svg width="100%" height="100%" class="data-chart" viewBox="0 0 563 204"
                                        xmlns="https://www.w3.org/2000/svg">
                                        <g fill="none" fill-rule="evenodd">
                                            <path class="dataset-1"
                                                d="M30.046 97.208c2.895-.84 5.45-2.573 7.305-4.952L71.425 48.52c4.967-6.376 14.218-7.38 20.434-2.217l29.447 34.46c3.846 3.195 9.08 4.15 13.805 2.52l31.014-20.697c4.038-1.392 8.485-.907 12.13 1.32l3.906 2.39c5.03 3.077 11.43 2.753 16.124-.814l8.5-6.458c6.022-4.577 14.563-3.676 19.5 2.056l54.63 55.573c5.622 6.526 15.686 6.647 21.462.258l37.745-31.637c5.217-5.77 14.08-6.32 19.967-1.24l8.955 7.726c5.42 4.675 13.456 4.63 18.82-.11 4.573-4.036 11.198-4.733 16.508-1.735l61.12 34.505c4.88 2.754 10.916 2.408 15.45-.885L563 90.915V204H0v-87.312-12.627c5.62-.717 30.046-6.852 30.046-6.852z"
                                                fill="#7DC855" opacity=".9" />
                                            <path class="dataset-2"
                                                d="M563 141.622l-21.546-13.87c-3.64-2.343-8.443-1.758-11.408 1.39l-7.565 8.03c-3.813 4.052-10.378 3.688-13.718-.758L469.83 84.58c-3.816-5.08-11.588-4.687-14.867.752l-28.24 46.848c-2.652 4.402-8.48 5.673-12.74 2.78l-15.828-10.76c-3.64-2.475-8.55-1.948-11.575 1.245l-53.21 43.186c-3.148 3.32-8.305 3.74-11.953.974l-100.483-76.2c-3.364-2.55-8.06-2.414-11.27.326l-18.24 15.58c-3.25 2.773-8.015 2.874-11.38.24L159.91 93.79c-3.492-2.733-8.467-2.51-11.697.525l-41.58 39.075c-2.167 2.036-5.21 2.868-8.117 2.218L39.05 112.5c-4.655-1.808-9.95-.292-12.926 3.7L0 137.31V204h563v-62.378z"
                                                fill="#F8E71C" opacity=".6" />
                                            <path class="lines" fill="#FFF" opacity=".2"
                                                d="M0 203h563v1H0zM0 153h563v1H0zM0 102h563v1H0zM0 51h563v1H0zM0 0h563v1H0z" />
                                        </g>
                                    </svg>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

</html>