<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 25/5/2022
  Time: 4:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<header>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>Thể loại</title>

  <!-- Bootstrap -->
  <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

  <!-- Custom stylesheet -->
  <link type="text/css" rel="stylesheet" href="css/main_style.css"/>

  <!-- SlideShow -->
  <link type="text/css" rel="stylesheet" href="css/slider.css"/>

</header>
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
              <li><a href="#">Top 100</a></li>
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
<!-- /HEADER -->

<div class="container">
  <div class="row">
    <div class="col-md-8">
      <div class="section-title">
        <h3 class="title" style="float: left;">${typeName}</h3>
      </div>
      <br>
      <c:forEach items="${songsWithName}" var="song">
        <div class="row"  style="margin-top: 10px; margin-bottom: 10px; border-bottom: 2px solid #E4E7ED;">
          <div class="col-md-1">
            <img style="cursor:pointer; border-radius: 100%;" src="./img/banner0.jpg" alt="Big" width="50" height="50">
          </div>
          <div class="col-md-6">
            <h4>${song.name}</h4>
            <p>${song.singer.name}</p>
          </div>
          <div class="col-md-1">
            <button class="music-btn" style="height: 40px; width: 40px; background: #8e8e8e; color: #FFF; font-weight: 700; border: none; border-radius: 100%;">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" style="height: 25px; width: 25px;">
                <path d="M256 368C256 403.7 266.6 436.9 284.9 464.6L279.4 470.3C266.4 483.2 245.5 483.2 233.5 470.3L39.71 270.5C-16.22 212.5-13.23 116.6 49.7 62.68C103.6 15.73 186.5 24.72 236.5 75.67L256.4 96.64L275.4 75.67C325.4 24.72 407.3 15.73 463.2 62.68C506.1 100.1 520.7 157.6 507 208.7C484.3 198 458.8 192 432 192C334.8 192 256 270.8 256 368zM288 368C288 288.5 352.5 224 432 224C511.5 224 576 288.5 576 368C576 447.5 511.5 512 432 512C352.5 512 288 447.5 288 368zM448 303.1C448 295.2 440.8 287.1 432 287.1C423.2 287.1 416 295.2 416 303.1V351.1H368C359.2 351.1 352 359.2 352 367.1C352 376.8 359.2 383.1 368 383.1H416V431.1C416 440.8 423.2 447.1 432 447.1C440.8 447.1 448 440.8 448 431.1V383.1H496C504.8 383.1 512 376.8 512 367.1C512 359.2 504.8 351.1 496 351.1H448V303.1z"/>
              </svg>
            </button>
          </div>
          <div class="col-md-1">
            <button class="music-btn" style="height: 40px; width: 40px; background: #8e8e8e; color: #FFF; font-weight: 700; border: none; border-radius: 100%;">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" style="height: 25px; width: 25px;">
                <path d="M503.7 226.2l-176 151.1c-15.38 13.3-39.69 2.545-39.69-18.16V272.1C132.9 274.3 66.06 312.8 111.4 457.8c5.031 16.09-14.41 28.56-28.06 18.62C39.59 444.6 0 383.8 0 322.3c0-152.2 127.4-184.4 288-186.3V56.02c0-20.67 24.28-31.46 39.69-18.16l176 151.1C514.8 199.4 514.8 216.6 503.7 226.2z"/>
              </svg>
            </button>
          </div>
          <div class="col-md-1">
            <button class="music-btn" style="height: 40px; width: 40px; background: #8e8e8e; color: #FFF; font-weight: 700; border: none; border-radius: 100%;">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" style="height: 25px; width: 25px;">
                <path d="M432 256c0 17.69-14.33 32.01-32 32.01H256v144c0 17.69-14.33 31.99-32 31.99s-32-14.3-32-31.99v-144H48c-17.67 0-32-14.32-32-32.01s14.33-31.99 32-31.99H192v-144c0-17.69 14.33-32.01 32-32.01s32 14.32 32 32.01v144h144C417.7 224 432 238.3 432 256z"/>
              </svg>
            </button>
          </div>
          <div class="col-md-1">
            <button class="music-btn" style="height: 40px; width: 40px; background: #8e8e8e; color: #FFF; font-weight: 700; border: none; border-radius: 100%;">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" style="height: 25px; width: 25px;">
                <path d="M144 480C64.47 480 0 415.5 0 336C0 273.2 40.17 219.8 96.2 200.1C96.07 197.4 96 194.7 96 192C96 103.6 167.6 32 256 32C315.3 32 367 64.25 394.7 112.2C409.9 101.1 428.3 96 448 96C501 96 544 138.1 544 192C544 204.2 541.7 215.8 537.6 226.6C596 238.4 640 290.1 640 352C640 422.7 582.7 480 512 480H144zM303 392.1C312.4 402.3 327.6 402.3 336.1 392.1L416.1 312.1C426.3 303.6 426.3 288.4 416.1 279C407.6 269.7 392.4 269.7 383 279L344 318.1V184C344 170.7 333.3 160 320 160C306.7 160 296 170.7 296 184V318.1L256.1 279C247.6 269.7 232.4 269.7 223 279C213.7 288.4 213.7 303.6 223 312.1L303 392.1z"/>
              </svg>
            </button>
          </div>
        </div>
      </c:forEach>
    </div>
    <div class="col-md-4" style=" border-left: 2px solid #E4E7ED;">
      <div id="left-menu" style="float: left; margin:20px">
        <img style="cursor:pointer" src="./img/banner0.jpg" alt="Big" width="300" height="300">
      </div>
      <br>
      <h3 class="title" style="float: left;">Chủ đề nổi bật</h3>
      <img style="cursor:pointer; margin:20px; float: left" src="./img/banner1.jpg" alt="Big" width="300" height="120" >
      <img style="cursor:pointer; margin:20px; float: left" src="./img/banner2.jpg" alt="Big" width="300" height="120" >
      <img style="cursor:pointer; margin:20px; float: left" src="./img/banner3.jpg" alt="Big" width="300" height="120" >
      <img style="cursor:pointer; margin:20px; float: left" src="./img/banner4.jpg" alt="Big" width="300" height="120" >
      <img style="cursor:pointer; margin:20px; float: left" src="./img/banner 5.jpg" alt="Big" width="300" height="120" >
      <img style="cursor:pointer; margin:20px; float: left" src="./img/banner6.jpg" alt="Big" width="300" height="120" >
      <img style="cursor:pointer; margin:20px; float: left" src="./img/banner7.png" alt="Big" width="300" height="120" >
      <img style="cursor:pointer; margin:20px; float: left" src="./img/banner8.jpg" alt="Big" width="300" height="120" >
    </div>
  </div>
</div>

<!-- DOI TAC-->
<div id="newsletter" class="section">
  <!-- container -->
  <div class="container">
    <!-- row -->
    <div class="row">
      <div class="col-md-12">
        <div class="newsletter">
          <form>
            <br>
            <p>Các <strong>ĐỐI TÁC</strong> cùng hợp tác</p>
            <br>
          </form>
        </div>
      </div>
      <div class="col-md-2">
        <img style="cursor:pointer; border-radius: 15%;" src="./img/DoiTac/mtp.png" alt="Big" width="160" height="80">
      </div>
      <div class="col-md-2">
        <img style="cursor:pointer; border-radius: 15%;" src="./img/DoiTac/PhuongNam.png" alt="Big" width="160" height="80">
      </div>
      <div class="col-md-2">
        <img style="cursor:pointer; border-radius: 15%;" src="./img/DoiTac/sm.jpg" alt="Big" width="160" height="80">
      </div>
      <div class="col-md-2">
        <img style="cursor:pointer; border-radius: 15%;" src="./img/DoiTac/sonymusic.png" alt="Big" width="160" height="80">
      </div>
      <div class="col-md-2">
        <img style="cursor:pointer; border-radius: 15%;" src="./img/DoiTac/Universal.png" alt="Big" width="160" height="80">
      </div>
      <div class="col-md-2">
        <img style="cursor:pointer; border-radius: 15%;" src="./img/DoiTac/Warner-Music-Group.png" alt="Big" width="160" height="80">
      </div>
    </div>
    <!-- /row -->
  </div>
  <!-- /container -->
</div>
<!-- /DOI TAC -->

<!-- FOOTER -->
<footer id="footer">
  <!-- top footer -->
  <div class="section">
    <!-- container -->
    <div class="container">
      <!-- row -->
      <div class="row">
        <div class="col-md-3 col-xs-6">
          <div class="footer">
            <h3 class="footer-title">Liên hệ</h3>
            <p>JB nhận đặt hàng trực tuyến và giao hàng tận nơi. KHÔNG hỗ trợ đặt mua và nhận hàng
              trực tiếp tại Hệ thống cửa hàng JB trên toàn quốc.</p>
            <ul class="footer-links">
              <li><a href="#"><i class="fa fa-map-marker"></i>Khu 6, Linh Trung, Thủ Đức</a></li>
              <li><a href="#"><i class="fa fa-phone"></i>+963-49-46-74</a></li>
              <li><a href="#"><i class="fa fa-envelope-o"></i>Trangnghenhac@gmail.com.vn</a></li>
            </ul>
          </div>
        </div>

        <div class="col-md-3 col-xs-6">
          <div class="footer">
            <h3 class="footer-title">Dịch vụ</h3>
            <ul class="footer-links">
              <li><a href="termsOfUse.jsp">Điều khoản sử dụng</a></li>
              <li><a href="privacyPolicy.jsp">Chính sách bảo mật</a></li>
              <li><a href="storeIntroduced.jsp">Giới thiệu về JB</a></li>
              <li><a href="shopCenterSystem.jsp">Hệ thống trung tâm cửa hàng</a></li>
            </ul>
          </div>
        </div>

        <div class="clearfix visible-xs"></div>

        <div class="col-md-3 col-xs-6">
          <div class="footer">
            <h3 class="footer-title">Hỗ trợ</h3>
            <ul class="footer-links">
              <li><a href="returnPolicy.jsp">Chính sách đổi trả</a></li>
              <li><a href="purchasePolicy.jsp">Đối tác khách sỉ</a></li>
              <li><a href="shipping.jsp">Phương thức vận chuyển</a></li>
              <li><a href="payment.jsp">Phương thức thanh toán</a></li>
            </ul>
          </div>
        </div>

        <div class="col-md-3 col-xs-6">
          <div class="footer">
            <h3 class="footer-title">Tài khoản của tôi</h3>
            <ul class="footer-links">
              <li><a href="#" data-toggle="modal" data-target="#id01">Đăng nhập</a></li>
              <li><a href="#" data-toggle="modal" data-target="#exampleModal">Đăng ký</a></li>
              <li><a href="account.jsp">Chi tiết tài khoản</a></li>
              <li><a href="shoppingHistories.jsp">Lịch sử mua hàng</a></li>
            </ul>
          </div>
        </div>
      </div>
      <!-- /row -->
    </div>
    <!-- /container -->
  </div>
  <!-- /top footer -->

  <!-- bottom footer -->
  <div id="bottom-footer" class="section">
    <div class="container">
      <!-- row -->
      <div class="row">
        <div class="col-md-12 text-center">
          <ul class="footer-payments">
            <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
            <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
            <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
            <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
            <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
            <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
          </ul>
        </div>
      </div>
      <!-- /row -->
    </div>
    <!-- /container -->
  </div>
  <!-- /bottom footer -->
</footer>
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="js/slider.js"></script>

</body>
</html>
