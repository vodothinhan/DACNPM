<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 5/30/2022
  Time: 2:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

    <!-- Custom stylesheet -->
    <link type="text/css" rel="stylesheet" href="css/main_style.css"/>

    <!-- SlideShow -->
    <link type="text/css" rel="stylesheet" href="css/slider.css"/>

</head>
<body>
<header>
    <!-- VERTICAL MENU -->
    <div>
        <!-- MENU -->
        <div id="right-menu">
            <!-- NAVIGATION -->
            <nav id="navigation">
                <!-- container -->
                <div class="container">
                    <!-- responsive-nav -->
                    <div id="responsive-nav" style="float: left; margin-left: 0px ;">
                        <!-- NAV -->
                        <ul class="main-nav nav navbar-nav">
                            <li><a href="#">Trang chủ</a></li>
                            <li><a href="#">Playlist</a></li>
                            <li><a href="#">Bảng xếp hạng</a></li>
                            <li><a href="#">Chủ đề</a></li>
                            <li><a href="#">Liên hệ</a></li>
                        </ul>
                        <!-- /NAV -->
                        <!-- SEARCH -->
                        <div class="header-search" style="float: left;">
                            <form>
                                <input class="input" placeholder="Tìm kiếm...">
                                <button class="search-btn">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" style="height: 15px; width: 15px;">
                                        <path d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"/>
                                    </svg>
                                </button>
                            </form>
                        </div>
                        <!-- /SEARCH -->
                        <!-- ACCOUNT -->
                        <ul class="main-nav nav navbar-nav" style="margin-left: 30px;">
                            <li class="dropdown">
                                <a href="#">
                                    <img style="cursor:pointer; border-radius: 100%;" src="./img/banner0.jpg" alt="Big" width="40" height="40">
                                    <span><strong> Tài khoản </strong>↴ </span>
                                    <i class="bi bi-chevron-down"></i>
                                </a>
                                <ul>
                                    <li><a href="#" style="color: rgb(29, 29, 29);">Thông tin tài khoản</a></li>
                                    <li><a href="#" style="color: rgb(29, 29, 29);">Quản lý user</a></li>
                                    <li><a href="#" style="color: rgb(29, 29, 29);">Quản lý nhạc</a></li>
                                    <li><a href="#" style="color: rgb(29, 29, 29);">Tải nhạc lên</a></li>
                                </ul>
                            </li>
                        </ul>
                        <!-- /ACCOUNT -->
                    </div>
                    <!-- /responsive-nav -->
                </div>
                <!-- /container -->
            </nav>
            <!-- /NAVIGATION -->
        </div>
    </div>

</header>
</body>
</html>
