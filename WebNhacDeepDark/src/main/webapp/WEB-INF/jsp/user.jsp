<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/27/2022
  Time: 3:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/usercss.css">
    <link rel="stylesheet" href="/fontawesome/css/all.css">
    <title>Document</title>
</head>

<body>
<div id="wrapper">
    <jsp:include page="header.jsp" />
<%--    <div id="header">--%>
<%--        <ul class="list-items">--%>
<%--            <li class="item"><a href="">Trang chủ</a></li>--%>
<%--            <li class="item"><a href="">Playlist</a></li>--%>
<%--            <li class="item"><a href="">Bảng xếp hạng</a></li>--%>
<%--            <li class="item"><a href="">Chủ đề</a></li>--%>
<%--            <li class="item"><a href="">Top 100</a></li>--%>
<%--        </ul>--%>
<%--        <form action="#" class="search">--%>
<%--            <input type="text" class="content-search" placeholder="Tìm kiếm">--%>
<%--            <button class="icon-search" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>--%>
<%--        </form>--%>
<%--        <div class="login">--%>
<%--            <button class="btn-login">Đăng nhập</button>--%>
<%--        </div>--%>
<%--    </div>--%>

    <div id="banner">
        <img src="img/userimage/background.jpg" alt="">
    </div>
    <div id="profile">
        <div class="profile-infor">
            <div class="profile-avatar"> <img src="/img/userimage/download.jpg" alt="">
            </div>
            <span class="profile-name">${user.email}</span>
        </div>
        <%--        <div class="profile-btn-img">--%>
        <%--            <button>Chọn ảnh <i class="fa-solid fa-camera"></i></button>--%>
        <%--        </div>--%>
    </div>
    <div id="category">
        <ul class="list-items">
            <li class="item visited">Thông tin cá nhân</li>
            <li class="item">Đổi mật khẩu</li>
            <%--            <li class="item">Nghe gần đây</li>--%>
            <li class="item">Đã thích</li>
            <li class="item">Playlist</li>
        </ul>

        <div class="infor">
            <form action="doiTT" method="get" class="infor-detail">

                <div class="infor-row">
                    <label >Tên:</label>
                    <input type="text" name="name" value=${user.email} >
                </div>
                <div class="infor-row">
                    <label >Email:</label>
                    <input type="text" name="email" value=${user.email}>
                </div>
                <div class="infor-row">
                    <label >Ngày sinh:</label>
                    <input type="text" name="date" value=${user.dateOfBirth}>
                </div>
                <div class="infor-row">
                    <label >Giới tính:</label>
                    <input type="text" name="gender" value=${user.gender}>
                </div>
                <p class="success">${success}</p>
                <p class="failed">${error}</p>
                <div class="submit">

                    <input class="btn-submit" type="submit" value="Lưu thay đổi">
                </div>
            </form>
        </div>

        <div class="change-pass display-none">
            <form action="doiMK" class="change" method="post">
                <div class="infor-row">
                    <label >Mật khẩu mới:</label>
                    <input type="password" name="pass1">
                </div>
                <div class="infor-row">
                    <label >Xác nhận mật khẩu:</label>
                    <input type="password" name="pass2">
                </div>
                <p class="success">${success1}</p>
                <p class="failed">${error1}</p>
                <div class="submit">
                    <input class="btn-submit" type="submit" value="Thay đổi mật khẩu">
                </div>
            </form>
        </div>
        <%--        <div class="recent display-none">--%>
        <%--            <div class="song">--%>
        <%--                <div class="song-img">--%>
        <%--                    <img src="img/userimage/song2.jpg" alt="">--%>
        <%--                </div>--%>

        <%--                <div class="song-infor">--%>
        <%--                    <div class="row1">--%>
        <%--                        <div class="image">--%>
        <%--                            <img src="img/userimage/play.png" alt="">--%>
        <%--                        </div>--%>
        <%--                        <div class="song-detail">--%>
        <%--                            <div class="song-name">--%>
        <%--                                Chúng ta của hiện tại--%>
        <%--                            </div>--%>
        <%--                            <div class="song-author">--%>
        <%--                                Sơn tùng M-TP--%>
        <%--                            </div>--%>
        <%--                        </div>--%>
        <%--                    </div>--%>
        <%--                    <div class="row2">--%>
        <%--                        <div class="retangle1">--%>
        <%--                            <img src="img/userimage/black-heart.png" alt="">--%>
        <%--                            <span class="count">10K</span>--%>
        <%--                        </div>--%>
        <%--                        <div class="retangle1">--%>
        <%--                            <img src="img/userimage/next.png" alt="">--%>
        <%--                            <span class="count">Thêm vào tiếp theo</span>--%>
        <%--                        </div>--%>
        <%--                        <div class="retangle1">--%>
        <%--                            <img src="img/userimage/add.png" alt="">--%>
        <%--                            <span class="count">Thêm vào playlist</span>--%>
        <%--                        </div>--%>

        <%--                    </div>--%>

        <%--                </div>--%>
        <%--                <div class="clear"></div>--%>
        <%--                <hr>--%>
        <%--            </div>--%>
        <%--            <div class="song">--%>
        <%--                <div class="song-img">--%>
        <%--                    <img src="img/userimage/song2.jpg" alt="">--%>
        <%--                </div>--%>

        <%--                <div class="song-infor">--%>
        <%--                    <div class="row1">--%>
        <%--                        <div class="image">--%>
        <%--                            <img src="img/userimage/play.png" alt="">--%>
        <%--                        </div>--%>
        <%--                        <div class="song-detail">--%>
        <%--                            <div class="song-name">--%>
        <%--                                Chúng ta của hiện tại--%>
        <%--                            </div>--%>
        <%--                            <div class="song-author">--%>
        <%--                                Sơn tùng M-TP--%>
        <%--                            </div>--%>
        <%--                        </div>--%>
        <%--                    </div>--%>
        <%--                    <div class="row2">--%>
        <%--                        <div class="retangle1">--%>
        <%--                            <img src="img/userimage/black-heart.png" alt="">--%>
        <%--                            <span class="count">10K</span>--%>
        <%--                        </div>--%>
        <%--                        <div class="retangle1">--%>
        <%--                            <img src="img/userimage/next.png" alt="">--%>
        <%--                            <span class="count">Thêm vào tiếp theo</span>--%>
        <%--                        </div>--%>
        <%--                        <div class="retangle1">--%>
        <%--                            <img src="img/userimage/add.png" alt="">--%>
        <%--                            <span class="count">Thêm vào playlist</span>--%>
        <%--                        </div>--%>

        <%--                    </div>--%>

        <%--                </div>--%>
        <%--                <div class="clear"></div>--%>
        <%--                <hr>--%>
        <%--            </div>--%>
        <%--            <div class="song">--%>
        <%--                <div class="song-img">--%>
        <%--                    <img src="img/userimage/song2.jpg" alt="">--%>
        <%--                </div>--%>

        <%--                <div class="song-infor">--%>
        <%--                    <div class="row1">--%>
        <%--                        <div class="image">--%>
        <%--                            <img src="img/userimage/play.png" alt="">--%>
        <%--                        </div>--%>
        <%--                        <div class="song-detail">--%>
        <%--                            <div class="song-name">--%>
        <%--                                Chúng ta của hiện tại--%>
        <%--                            </div>--%>
        <%--                            <div class="song-author">--%>
        <%--                                Sơn tùng M-TP--%>
        <%--                            </div>--%>
        <%--                        </div>--%>
        <%--                    </div>--%>
        <%--                    <div class="row2">--%>
        <%--                        <div class="retangle1">--%>
        <%--                            <img src="img/userimage/black-heart.png" alt="">--%>
        <%--                            <span class="count">10K</span>--%>
        <%--                        </div>--%>
        <%--                        <div class="retangle1">--%>
        <%--                            <img src="img/userimage/next.png" alt="">--%>
        <%--                            <span class="count">Thêm vào tiếp theo</span>--%>
        <%--                        </div>--%>
        <%--                        <div class="retangle1">--%>
        <%--                            <img src="img/userimage/add.png" alt="">--%>
        <%--                            <span class="count">Thêm vào playlist</span>--%>
        <%--                        </div>--%>

        <%--                    </div>--%>

        <%--                </div>--%>
        <%--                <div class="clear"></div>--%>
        <%--                <hr>--%>
        <%--            </div>--%>
        <%--        </div>--%>

        <div class="liked display-none">
            <div class="song">
                <div class="song-img">
                    <img src=${song.linkImage} alt="">
                </div>

                <div class="song-infor">
                    <div class="row1">
                        <div class="image">
                            <img src="img/userimage/play.png" alt="">
                        </div>
                        <div class="song-detail">
                            <div class="song-name">
                                ${song.name}
                            </div>
                            <div class="song-author">
                                ${song.singer.name}
                            </div>
                        </div>
                    </div>
                    <div class="row2">
                        <div class="retangle1">
                            <img src="img/userimage/orange-heart.png" alt="">
                            <span class="count">10K</span>
                        </div>
                        <div class="retangle1">
                            <img src="img/userimage/next.png" alt="">
                            <span class="count">Thêm vào tiếp theo</span>
                        </div>
                        <div class="retangle1">
                            <img src="img/userimage/add.png" alt="">
                            <span class="count">Thêm vào playlist</span>
                        </div>

                    </div>

                </div>
                <div class="clear"></div>
                <hr>
            </div>

        </div>

        <div class="playlist display-none">

            <c:forEach var="l" items="${user.playLists}">
                <div class="song">
                    <div class="song-img">
                        <img src="img/userimage/playlist.jpg" alt="">
                    </div>

                    <div class="song-infor">
                        <div class="row1">
                            <div class="image">
                                <img src="img/userimage/play.png" alt="">
                            </div>
                            <div class="song-detail">
                                <div class="song-name">
                                        ${l.name}
                                </div>
                                <div class="song-author">
                                    Admin
                                </div>
                            </div>
                        </div>
                        <div class="row2">
                            <c:forEach var="ss" items="${l.getListSongs()}">
                                <div class="song-item">
                                    <div class="image">
                                        <img src=${ss.linkImage} alt="">
                                    </div>
                                    <div class="song-detail">
                                        <span class="name">${ss.name} </span>
                                        <span class="author"> ${ss.singer.name}</span>
                                    </div>
                                </div>
                            </c:forEach>



                        </div>

                    </div>
                        <%--                <div class="profile-btn-img">--%>
                        <%--                    <button>Chọn ảnh <i class="fa-solid fa-camera"></i></button>--%>
                        <%--                </div>--%>
                    <div class="clear"></div>

                </div>
                <hr>
            </c:forEach>

        </div>
    </div>



</div>
<%--<jsp:include page="footer.jsp" />--%>
<div id="footer">

</div>
</div>
<script>
    var a = document.querySelectorAll("#category .item");
    var d = document.querySelectorAll("#category >div");
    var c = [false, false, false, false, false];

    a[0].onclick = function (e) {

        for (var j = 0; j < a.length; j++) {
            a[j].classList.remove("visited");

        }
        this.classList.add("visited");
        for (var j = 0; j < d.length; j++) {
            d[j].classList.add("display-none");

        }
        d[0].classList.remove("display-none");
    }


    a[1].onclick = function (e) {

        for (var j = 0; j < a.length; j++) {
            a[j].classList.remove("visited");

        }
        this.classList.add("visited");
        for (var j = 0; j < d.length; j++) {
            d[j].classList.add("display-none");

        }
        d[1].classList.remove("display-none");
    }

    a[2].onclick = function (e) {

        for (var j = 0; j < a.length; j++) {
            a[j].classList.remove("visited");

        }
        this.classList.add("visited");
        for (var j = 0; j < d.length; j++) {
            d[j].classList.add("display-none");

        }
        d[2].classList.remove("display-none");
    }

    a[3].onclick = function (e) {

        for (var j = 0; j < a.length; j++) {
            a[j].classList.remove("visited");

        }
        this.classList.add("visited");
        for (var j = 0; j < d.length; j++) {
            d[j].classList.add("display-none");

        }
        d[3].classList.remove("display-none");
    }






</script>
</body>

</html>