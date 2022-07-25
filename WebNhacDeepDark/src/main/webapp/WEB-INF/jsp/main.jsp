<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 25/5/2022
  Time: 4:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<header>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Trang nghe nhạc</title>

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

<!-- LEFT BANNER -->
<div id="left-menu" style="float: left; margin-top: 20px; margin-left: 120px; margin-right: 50px;">
    <img style="cursor:pointer" src="./img/banner0.jpg" alt="Big" width="350" height="350">
</div>
<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- Slider -->
            <div class="homebanner">
                <div id="sync1" class="owl-carousel owl-theme" style="opacity: 1; display: block;">
                    <div class="owl-wrapper-outer">
                        <div class="owl-wrapper"
                             style="width: 12640px; left: 0; display: block; transition: all 800ms ease 0s; transform: translate3d(0px, 0px, 0px);">
                            <div class="owl-item" style="width: 790px;">
                                <div class="item">
                                    <a href="#">
                                        <img style="cursor:pointer" src="./img/banner1.jpg" alt="Big"
                                             width="800" height="300">
                                    </a>
                                </div>
                            </div>
                            <div class="owl-item" style="width: 790px;">
                                <div class="item">
                                    <a href="#">
                                        <img style="cursor:pointer" src="./img/banner2.jpg"
                                             alt="Samsung Tet" width="800" height="300"></a></div>
                            </div>
                            <div class="owl-item" style="width: 790px;">
                                <div class="item">
                                    <a href="#">
                                        <img style="cursor:pointer" src="./img/banner3.jpg"
                                             alt="Big OPPO" width="800" height="300"></a></div>
                            </div>
                            <div class="owl-item" style="width: 790px;">
                                <div class="item">
                                    <a href="#">
                                        <img style="cursor:pointer" src="./img/banner4.jpg" alt="A51"
                                             width="800" height="300"></a></div>
                            </div>
                            <div class="owl-item" style="width: 790px;">
                                <div class="item">
                                    <a href="#">
                                        <img style="cursor:pointer" src="./img/banner 5.jpg"
                                             alt="iphone" width="800" height="300"></a></div>
                            </div>
                            <div class="owl-item" style="width: 790px;">
                                <div class="item">
                                    <a href="#">
                                        <img style="cursor:pointer" src="./img/banner6.jpg"
                                             alt="dong ho thoi trang" width="800" height="300"></a></div>
                            </div>
                            <div class="owl-item" style="width: 790px;">
                                <div class="item">
                                    <a href="#">
                                        <img style="cursor:pointer" src="./img/banner7.png"
                                             alt="Sắm Apple Watch" width="800" height="300"></a></div>
                            </div>
                            <div class="owl-item" style="width: 790px;">
                                <div class="item">
                                    <a href="#">
                                        <img style="cursor:pointer" src="./img/banner8.jpg" alt="phu kien"
                                             width="800" height="300"></a></div>
                            </div>
                        </div>
                    </div>


                    <div class="owl-controls clickable">
                        <div class="owl-buttons">
                            <div class="owl-prev">‹</div>
                            <div class="owl-next">›</div>
                        </div>
                    </div>
                </div>
                <div id="sync2" class="owl-carousel owl-theme" style="opacity: 1; display: block;">
                    <div class="owl-wrapper-outer">
                        <div class="owl-wrapper"
                             style="width: 2528px; left: 0; display: block; transition: all 200ms ease 0s; transform: translate3d(0px, 0px, 0px);">
                            <div class="owl-item synced" style="width: 158px;">
                                <div class="item">
                                    <h3>Hôm qua<br>nghe gì?</h3>
                                    <i class="arrowbar"></i>
                                </div>
                            </div>
                            <div class="owl-item" style="width: 158px;">
                                <div class="item">
                                    <i class="arrowbarleft"></i>
                                    <h3>Hot remix<br>tháng 5</h3>
                                    <i class="arrowbar"></i>
                                </div>
                            </div>
                            <div class="owl-item" style="width: 158px;">
                                <div class="item">
                                    <i class="arrowbarleft"></i>
                                    <h3>Hot USUK<br>tháng 5</h3>
                                    <i class="arrowbar"></i>
                                </div>
                            </div>
                            <div class="owl-item" style="width: 158px;">
                                <div class="item">
                                    <i class="arrowbarleft"></i>
                                    <h3>iKON 4th mini album<br>FLASH BACK</h3>
                                    <i class="arrowbar"></i>
                                </div>
                            </div>
                            <div class="owl-item" style="width: 158px;">
                                <div class="item">
                                    <i class="arrowbarleft"></i>
                                    <h3>Verivery series o round III:<br>WHOLE</h3>
                                    <i class="arrowbar"></i>
                                </div>
                            </div>
                            <div class="owl-item" style="width: 158px;">
                                <div class="item">
                                    <i class="arrowbarleft"></i>
                                    <h3>Xin dủ lòng thương<br>Nguyễn Hồng Ân</h3>
                                    <i class="arrowbar"></i>
                                </div>
                            </div>
                            <div class="owl-item" style="width: 158px;">
                                <div class="item">
                                    <i class="arrowbarleft"></i>
                                    <h3>Hot<br>Sơn Tùng MTP</h3>
                                    <i class="arrowbar"></i>
                                </div>
                            </div>
                            <div class="owl-item" style="width: 158px;">
                                <div class="item">
                                    <i class="arrowbarleft"></i>
                                    <h3>Nhạc Việt nghe gì?<br>#Trend now</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ./Slider -->
        </div>
    </div>
</div>
</div>
<!-- /SECTION -->


<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div class="section-title">
                <h3 class="title" style="float: left;">Nhạc Mới</h3>
            </div>
            <br>
            <div class="row">
                <div class="col-md-3">
                    <a href="/play/${top4New.get(0).id}">
                        <img style="cursor:pointer; position: relative;" src="./img/NhacHot/Bae.jpg" alt="Big" width="160" height="160">
                    </a>
                    <div style="margin-top: 10px;">
                        <h5>${top4New.get(0).name}</h5>
                        ${top4New.get(0).singer.name}
                    </div>
                </div>
                <div class="col-md-3">
                    <a href="/play/${top4New.get(1).id}">
                        <img style="cursor:pointer; position: relative;" src="./img/NhacHot/CuoiEm.jpg" alt="Big" width="160" height="160">
                    </a>
                    <div style="margin-top: 10px;">
                        <h5>${top4New.get(1).name}</h5>
                        ${top4New.get(1).singer.name}
                    </div>
                </div>
                <div class="col-md-3">
                    <a href="/play/${top4New.get(2).id}">
                        <img style="cursor:pointer; position: relative;" src="./img/NhacHot/OK Em Buon.jpg" alt="Big" width="160" height="160">
                    </a>
                    <div style="margin-top: 10px;">
                        <h5>${top4New.get(2).name}</h5>
                        ${top4New.get(2).singer.name}
                    </div>
                </div>
                <div class="col-md-3">
                    <a href="/play/${top4New.get(3).id}">
                        <img style="cursor:pointer; position: relative;" src="./img/NhacHot/Cho Anh Xin Loi Duoc Khong.jpg" alt="Big" width="160" height="160">
                    </a>
                    <div style="margin-top: 10px;">
                        <h5>${top4New.get(3).name}</h5>
                        ${top4New.get(3).singer.name}
                    </div>
                </div>
            </div>
            <div class="section-title">
                <h3 class="title" style="float: left;">Thể loại</h3>
            </div>
            <br>
            <div class="row">
                <div class="col-md-3">
                    <a href="/type?type=kpop&action=songType"><img style="cursor:pointer; position: relative;" src="./img/TheLoai/Kpop.jpg" alt="Big" width="160" height="160"></a>
                    <div style="margin-top: 10px;">
                        <h5 >K-POP</h5>
                    </div>
                </div>
                <div class="col-md-3">
                    <a href="/type?type=US-UK&action=songType"><img style="cursor:pointer; position: relative;" src="./img/TheLoai/Usuk.jpg" alt="Big" width="160" height="160"></a>
                    <div style="margin-top: 10px;">
                        <h5 >USUK</h5>
                    </div>
                </div>
                <div class="col-md-3">
                    <a href="/type?type=vpop&action=songType"><img style="cursor:pointer; position: relative;" src="./img/TheLoai/Vpop.jpg" alt="Big" width="160" height="160"></a>
                    <div style="margin-top: 10px;">
                        <h5 >V-POP</h5>
                    </div>
                </div>
                <div class="col-md-3">
                    <a href="/type?type=remix&action=songType"><img style="cursor:pointer; position: relative;" src="./img/TheLoai/Remix.jpg" alt="Big" width="160" height="160"></a>
                    <div style="margin-top: 10px;">
                        <h5 >Remix</h5>
                    </div>
                </div>
            </div>
            <div class="section-title">
                <h3 class="title" style="float: left;">Nhạc sĩ</h3>
            </div>
            <br>
            <div class="row">
                <div class="col-md-3">
                    <a href="/type?type=47&action=singerName"><img style="cursor:pointer; position: relative;" src="./img/NhacSi/Henry.jpg" alt="Big" width="160" height="160"></a>
                    <div style="margin-top: 10px;">
                        <h5 >Henry</h5>
                    </div>
                </div>
                <div class="col-md-3">
                    <a href="/type?type=48&action=singerName"><img style="cursor:pointer; position: relative;" src="./img/NhacSi/HoaiLam.jpg" alt="Big" width="160" height="160"></a>
                    <div style="margin-top: 10px;">
                        <h5 >Hoài Lâm</h5>
                    </div>
                </div>
                <div class="col-md-3">
                    <a href="/type?type=49&action=singerName"><img style="cursor:pointer; position: relative;" src="./img/NhacSi/PhanDuyAnh.jpg" alt="Big" width="160" height="160"></a>
                    <div style="margin-top: 10px;">
                        <h5 >Phan Duy Anh</h5>
                    </div>
                </div>
                <div class="col-md-3">
                    <a href="/type?type=52&action=singerName"><img style="cursor:pointer; position: relative;" src="./img/NhacSi/VuongAnhTu.jpg" alt="Big" width="160" height="160"></a>
                    <div style="margin-top: 10px;">
                        <h5 >Vương Anh Tú</h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4" style=" border-left: 2px solid #E4E7ED;">
            <div class="section-title">
                <h3 class="title" style="float: left;">Bảng xếp hạng: </h3>
            </div>
            <br>

            <div class="row" style="margin-top: 10px; margin-bottom: 10px; border-bottom: 2px solid #E4E7ED;">
                <div class="col-md-3" style="text-align: center;">
                    <h2 style="position: absolute; margin-top: 50px; color: rgb(231, 231, 231); background-color: rgb(213, 240, 31); height: 30px; width: 30px;">
                        1</h2>
                    <img style="cursor:pointer;" src="./img/bestSong.jpg" alt="Big" width="80" height="80">
                </div>
                <div class="col-md-8" style="padding: 10px;">
                    <a href="/play/${listTop10.get(0).id}">
                        <h5>${listTop10.get(0).name}</h5>
                    </a>
                    ${listTop10.get(0).singer.name}
                </div>


            </div>

            <div class="row" style="margin-top: 10px; margin-bottom: 10px; border-bottom: 2px solid #E4E7ED;">
                <div class="col-md-2" style="text-align: center;">
                    <h1 style="color: aqua;">2</h1>
                </div>
                <div class="col-md-8">
                    <a href="/play/${listTop10.get(1).id}">
                        <h5>${listTop10.get(1).name}</h5>
                    </a>
                    ${listTop10.get(1).singer.name}
                </div>
            </div>

            <div class="row" style="margin-top: 10px; margin-bottom: 10px; border-bottom: 2px solid #E4E7ED;">
                <div class="col-md-2" style="text-align: center;">
                    <h1 style="color: rgb(213, 77, 77);">3</h1>
                </div>
                <div class="col-md-8">
                    <a href="/play/${listTop10.get(2).id}">
                        <h5>${listTop10.get(2).name}</h5>
                    </a>
                    ${listTop10.get(2).singer.name}
                </div>
            </div>

            <div class="row" style="margin-top: 10px; margin-bottom: 10px; border-bottom: 2px solid #E4E7ED;">
                <div class="col-md-2"style="text-align: center;">
                    <h1>4</h1>
                </div>
                <div class="col-md-8">
                    <a href="/play/${listTop10.get(3).id}">
                        <h5>${listTop10.get(3).name}</h5>
                    </a>
                    ${listTop10.get(3).singer.name}
                </div>
            </div>

            <div class="row" style="margin-top: 10px; margin-bottom: 10px; border-bottom: 2px solid #E4E7ED;">
                <div class="col-md-2"style="text-align: center;">
                    <h1>5</h1>
                </div>
                <div class="col-md-8">
                    <h5>${listTop10.get(4).name}</h5>
                    ${listTop10.get(4).singer.name}
                </div>
            </div>

            <div class="row" style="margin-top: 10px; margin-bottom: 10px; border-bottom: 2px solid #E4E7ED;">
                <div class="col-md-2"style="text-align: center;">
                    <h1>6</h1>
                </div>
                <div class="col-md-8">
                    <h5>${listTop10.get(5).name}</h5>
                    ${listTop10.get(5).singer.name}
                </div>
            </div>

            <div class="row" style="margin-top: 10px; margin-bottom: 10px; border-bottom: 2px solid #E4E7ED;">
                <div class="col-md-2"style="text-align: center;">
                    <h1>7</h1>
                </div>
                <div class="col-md-8">
                    <h5>${listTop10.get(6).name}</h5>
                    ${listTop10.get(6).singer.name}
                </div>
            </div>

            <div class="row" style="margin-top: 10px; margin-bottom: 10px; border-bottom: 2px solid #E4E7ED;">
                <div class="col-md-2"style="text-align: center;">
                    <h1>8</h1>
                </div>
                <div class="col-md-8" >
                    <h5>${listTop10.get(7).name}</h5>
                    ${listTop10.get(7).singer.name}
                </div>
            </div>

            <div class="row" style="margin-top: 10px; margin-bottom: 10px; border-bottom: 2px solid #E4E7ED;">
                <div class="col-md-2"style="text-align: center;">
                    <h1>9</h1>
                </div>
                <div class="col-md-8">
                    <h5>${listTop10.get(8).name}</h5>
                    ${listTop10.get(8).singer.name}
                </div>
            </div>

            <div class="row" style="margin-top: 10px; margin-bottom: 10px; border-bottom: 2px solid #E4E7ED;">
                <div class="col-md-2"style="text-align: center;">
                    <h1>10</h1>
                </div>
                <div class="col-md-8" style="padding: 10px;">
                    <h5>${listTop10.get(9).name}</h5>
                    ${listTop10.get(9).singer.name}
                </div>
            </div>
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
<script src="js/slider.js"></script>

</body>
</html>
