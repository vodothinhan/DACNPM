<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/26/2022
  Time: 1:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" href="/css/search.css" rel="stylesheet"/>
    <link type="text/css" rel="stylesheet" href="/css/bootstrap.min.css"/>
    <%--    <link type="text/css" href="/bootstrap/boostrap_PhamVanHa/bootstrap.min.css" rel="stylesheet"/>--%>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>home</title>
</head>


<body>
<jsp:include page="header.jsp"/>
<div class="container-fluid">
    <div class="row">
        <div class="col-1">
        </div>
        <div class="col-10">
            <h3>Kết quả cho "${inputSearch}"</h3>
            <div class="underlined"></div>
            <div class="col-2" style="padding: 0px; float: left;">
                <div class="btn-group-vertical" style="width: 100%">
                    <button type="button active" data-toggle="tab" href="#All" class="btn" id="btn1"
                            style="background-color: #ff5500;text-align: left;">Tất cả
                    </button>
                    <button type="button" data-toggle="tab" href="#menu1" class="btn" id="btn2"
                            style="; text-align: left;">Bài hát
                    </button>
                    <button type="button" data-toggle="tab" href="#Singer" class="btn" id="btn3"
                            style="; text-align: left;">Ca sĩ
                    </button>
                    <button type="button" data-toggle="tab" href="#Allbums" class="btn" id="btn4"
                            style="; text-align: left;">Albums
                    </button>
                    <div class="underlined" style="margin-top: 8px;"></div>
                </div>
            </div>
            <div class="tab-content">
                <div id="All" class="tab-pane fade in active">
                    <div class="col-8" style="float: left; margin-left: 40px; padding: 0px">
                        <c:forEach var="list" items="${listSearchName}">
                            <%--                        <h1>${list.getAuthor().getName()}</h1>--%>
                            <div class="col-12" style="padding : 0px">
                                <img src="${list.getLinkImage()}" class="img col-2">
                                <div class="col-9">
                                    <div class="col-12">
                                        <img src="/img/Play.jpg" class="circle">
                                        <div class="title-Song col-10">
                                            <p class="nameSong">${list.getName()}</p>
                                            <p class="nameSinger">${list.getSinger().getName()}</p>
                                        </div>
                                    </div>
                                    <div class="col-12" id="bottom12">
                                        <button class="col-2" style="margin-left: 0px">
                                            <img src="/img/Heart.jpg">
                                            <p style="float: left; text-align: left;">${list.getNumListen()}</p>
                                        </button>
                                        <button class="col-4">
                                            <img src="/img/Add.png">
                                            <p style="float: left; text-align: left;">Thêm vào tiếp theo</p>
                                        </button>
                                        <button class="col-4">
                                            <img src="/img/Add.png">
                                            <p style="float: left; text-align: left;">Thêm vào playlist</p>
                                        </button>
                                    </div>
                                </div>
                                <div class="underlined" style="float: left; margin-top: 20px"></div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div id="menu1" class="tab-pane fade">
                    <div class="col-8" style="float: left; margin-left: 40px; padding: 0px">
                        <c:forEach var="list" items="${listSearchNameSong}">
                            <%--                        <h1>${list.getAuthor().getName()}</h1>--%>
                            <div class="col-12" style="padding : 0px">
                                <img src="${list.getLinkImage()}" class="img col-2">
                                <div class="col-9">
                                    <div class="col-12">
                                        <img src="/img/Play.jpg" class="circle">
                                        <div class="title-Song col-10">
                                            <p class="nameSong">${list.getName()}</p>
                                            <p class="nameSinger">${list.getSinger().getName()}</p>
                                        </div>
                                    </div>
                                    <div class="col-12" id="bottom12">
                                        <button class="col-2" style="margin-left: 0px">
                                            <img src="/img/Heart.jpg">
                                            <p style="float: left; text-align: left;">${list.getNumListen()}</p>
                                        </button>
                                        <button class="col-4">
                                            <img src="/img/Add.png">
                                            <p style="float: left; text-align: left;">Thêm vào tiếp theo</p>
                                        </button>
                                        <button class="col-4">
                                            <img src="/img/Add.png">
                                            <p style="float: left; text-align: left;">Thêm vào playlist</p>
                                        </button>
                                    </div>
                                </div>
                                <div class="underlined" style="float: left; margin-top: 20px"></div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div id="Singer" class="tab-pane fade">
                    <%--                    <div class="col-8" style="float: left; margin-left: 40px; padding: 0px">--%>
                    <%--                        <c:forEach var="singer" items="${singer}">--%>
                    <%--                            <div class="col-12" style="padding : 0px">--%>
                    <%--                                <img src="/img/MTP.jpg" class="img col-2" style="border-radius:50%;">--%>
                    <%--                                <div class="col-9">--%>
                    <%--                                    <div class="col-12">--%>
                    <%--                                        <div class="title-Song" style="margin: 0 1% 0 0">--%>
                    <%--                                            <p class="nameSong">Sơn Tùng M_TP Officail</p>--%>
                    <%--                                            <p class="nameSinger">${singer.name}</p>--%>
                    <%--                                        </div>--%>
                    <%--                                        <img src="/img/tichXanh.jpg" class="circle" style="height: 2em; width: 2em">--%>
                    <%--                                    </div>--%>
                    <%--                                    <div class="col-12" id="bottom12" style="margin: 25px 0 0 15px; padding: 0">--%>
                    <%--                                        <div class="col-4"--%>
                    <%--                                             style="margin: 10px 0 0 0; padding: 0px; float: none; border : none">--%>
                    <%--                                            <p style="text-align: left; line-height: 15px;">26K người theo dõi</p>--%>
                    <%--                                        </div>--%>
                    <%--                                        <button class="col-4" style="margin: 0; width: 20%">--%>
                    <%--                                            <img src="/img/Add.png">--%>
                    <%--                                            <p style="text-align: left; font-size: small;">Theo dõi</p>--%>
                    <%--                                        </button>--%>
                    <%--                                    </div>--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                        </c:forEach>--%>
                    <%--                    </div>--%>

                    <div class="col-8" style="float: left; margin-left: 40px; padding: 0px">
                        <c:forEach var="list" items="${listSearchSinger}">
                            <%--                        <h1>${list.getAuthor().getName()}</h1>--%>
                            <div class="col-12" style="padding : 0px">
                                <img src="${list.getLinkImage()}" class="img col-2">
                                <div class="col-9">
                                    <div class="col-12">
                                        <img src="/img/Play.jpg" class="circle">
                                        <div class="title-Song col-10">
                                            <p class="nameSong">${list.getName()}</p>
                                            <p class="nameSinger">${list.getSinger().getName()}</p>
                                        </div>
                                    </div>
                                    <div class="col-12" id="bottom12">
                                        <button class="col-2" style="margin-left: 0px">
                                            <img src="/img/Heart.jpg">
                                            <p style="float: left; text-align: left;">${list.getNumListen()}</p>
                                        </button>
                                        <button class="col-4">
                                            <img src="/img/Add.png">
                                            <p style="float: left; text-align: left;">Thêm vào tiếp theo</p>
                                        </button>
                                        <button class="col-4">
                                            <img src="/img/Add.png">
                                            <p style="float: left; text-align: left;">Thêm vào playlist</p>
                                        </button>
                                    </div>
                                </div>
                                <div class="underlined" style="float: left; margin-top: 20px"></div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div id="Allbums" class="tab-pane fade">
                    <div class="col-8" style="float: left; margin-left: 40px; padding: 0px">
                        <c:forEach var="list" items="${album}">
                        <div class="col-12" style="padding : 0px">
                            <img src="/img/Chilles.jpg" class="img col-2">
                            <div class="col-9">
                                <div class="col-12">
                                    <img src="/img/Play.jpg" class="circle">
                                    <div class="title-Song col-10">
                                        <p class="nameSong">${list.name}</p>
                                        <p class="nameSinger">${list.author.name}</p>
                                    </div>
                                </div>
                                <div id="smallSup">
                                    <div class="col-12 small" style="margin-top: 15px;">
                                        <img class="smallImage" src="">
                                        <div class="smallTitle">
                                            <c:forEach varStatus="loop" var="songAlbum" items="${list.songList}">
                                            <p>${loop.index + 1} - ${songAlbum.name} | ${songAlbum.singer.name}</p>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12" id="bottom122">
                                    <button class="col-2" style="margin-left: 0px">
                                        <img src="/img/Heart.jpg">
                                        <p style="float: left; text-align: left;">20K</p>
                                    </button>
                                    <button class="col-4">
                                        <img src="/img/Add.png">
                                        <p style="float: left; text-align: left;">Thêm vào tiếp theo</p>
                                    </button>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-1">
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
