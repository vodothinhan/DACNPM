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

    <div id="banner">
        <img src="img/userimage/background.jpg" alt="">
    </div>
    <div id="profile">
        <div class="profile-infor">
            <div class="profile-avatar"> <img src="/img/userimage/download.jpg" alt="">
            </div>
            <span class="profile-name">${user.email}</span>
        </div>

    </div>
    <div id="category">
        <ul class="list-items">
            <li class="item visited">Thông tin cá nhân</li>
            <li class="item">Đổi mật khẩu</li>
            <%--            <li class="item">Nghe gần đây</li>--%>
            <li class="item">Đã thích</li>
<%--            <li class="item">Playlist</li>--%>
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

        <div class="playlist display-none">

            <c:forEach var="l" items="${list}">
                <div class="song">
                    <div class="song-img">
                        <img src="img/userimage/playlist.jpg" alt="">
                    </div>

                    <div class="song-infor">
                        <div class="row1">
                            <div class="image">
                                <a href="/play/list/${l.id}">
                                    <img src="img/userimage/play.png" alt="">
                                </a>
                            </div>
                            <div class="song-detail">
                                <div class="song-name">
                                        List yêu thích
                                </div>
                            </div>
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