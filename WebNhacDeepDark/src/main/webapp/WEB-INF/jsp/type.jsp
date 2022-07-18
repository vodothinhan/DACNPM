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
<jsp:include page="header.jsp" />
<!-- /HEADER -->

<div class="container">
  <div class="row">
    <div class="col-md-8 total-song">
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
            <a href="/play/${song.id}">
              <h4>${song.name}</h4>
            </a>
            <p>${song.singer.name}</p>
          </div>
          <div class="col-md-1">
            <button data-id="${song.id}" data-user="${sessionScope.user.id}" class="music-btn btn-playlist" style="height: 40px; width: 40px; background: #8e8e8e; color: #FFF; font-weight: 700; border: none; border-radius: 100%;">
              <c:if test="${ song.idUserPlaylist==null||!(sessionScope.user.id==song.idUserPlaylist)}"  >
                <svg class="no-playlist" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" style="height: 25px; width: 25px;">
                  <path d="M256 368C256 403.7 266.6 436.9 284.9 464.6L279.4 470.3C266.4 483.2 245.5 483.2 233.5 470.3L39.71 270.5C-16.22 212.5-13.23 116.6 49.7 62.68C103.6 15.73 186.5 24.72 236.5 75.67L256.4 96.64L275.4 75.67C325.4 24.72 407.3 15.73 463.2 62.68C506.1 100.1 520.7 157.6 507 208.7C484.3 198 458.8 192 432 192C334.8 192 256 270.8 256 368zM288 368C288 288.5 352.5 224 432 224C511.5 224 576 288.5 576 368C576 447.5 511.5 512 432 512C352.5 512 288 447.5 288 368zM448 303.1C448 295.2 440.8 287.1 432 287.1C423.2 287.1 416 295.2 416 303.1V351.1H368C359.2 351.1 352 359.2 352 367.1C352 376.8 359.2 383.1 368 383.1H416V431.1C416 440.8 423.2 447.1 432 447.1C440.8 447.1 448 440.8 448 431.1V383.1H496C504.8 383.1 512 376.8 512 367.1C512 359.2 504.8 351.1 496 351.1H448V303.1z"/>
                </svg>
              </c:if>
              <c:if test="${song.idUserPlaylist!=null&&(sessionScope.user.id==song.idUserPlaylist)}"  >
                <svg class="in-playlist" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" style="height: 25px; width: 25px;">
                  <path d="M256 368C256 403.7 266.6 436.9 284.9 464.6L279.4 470.3C266.4 483.2 245.5 483.2 233.5 470.3L39.71 270.5C-16.22 212.5-13.23 116.6 49.7 62.68C103.6 15.73 186.5 24.72 236.5 75.67L256.4 96.64L275.4 75.67C325.4 24.72 407.3 15.73 463.2 62.68C506.1 100.1 520.7 157.6 507 208.7C484.3 198 458.8 192 432 192C334.8 192 256 270.8 256 368zM576 368C576 447.5 511.5 512 432 512C352.5 512 288 447.5 288 368C288 288.5 352.5 224 432 224C511.5 224 576 288.5 576 368zM476.7 324.7L416 385.4L387.3 356.7C381.1 350.4 370.9 350.4 364.7 356.7C358.4 362.9 358.4 373.1 364.7 379.3L404.7 419.3C410.9 425.6 421.1 425.6 427.3 419.3L499.3 347.3C505.6 341.1 505.6 330.9 499.3 324.7C493.1 318.4 482.9 318.4 476.7 324.7H476.7z"/>
                </svg>
              </c:if>
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
<jsp:include page="footer.jsp" />
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="js/slider.js"></script>
<script src="js/typePage.js"></script>

</body>
</html>
