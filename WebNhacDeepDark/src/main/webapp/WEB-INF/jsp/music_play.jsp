<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 5/22/2022
  Time: 6:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deep Dark Theme</title>

    <link rel="stylesheet" href="/css/playMusic2.css">
    <link rel="stylesheet" href="/fontawesome/css/all.css">

</head>

<body>

<div class="background"></div>
<div> <canvas id="myCanvas"></canvas></div>

<div class="header" style="width: 100%; height: 100px;">
    <jsp:include page="header.jsp" />
</div>

<div class="list" style="width: 100%; height: 550px;">

    <div class="recommend" style="overflow-y: auto">
        <h2 style="color: white">GỢI Ý</h2>
        <div class="recommend-list">
            <c:forEach items="${authorlist}" var="authorSong">
                <div class="list-group">
                    <div style="display: flex;">
                        <a href="/play/${authorSong.id}" class="list-group-item" style="width: 70%;">${authorSong.name}</a>
                        <a href="#" class="list-group-item" style="width: 30%; text-align: right;">${authorSong.type}</a>
                    </div>

                </div>
            </c:forEach>
        </div>
    </div>

    <div class="current" style="overflow-y: auto">
        <h2 style="color: white">DANH SÁCH PHÁT</h2>
        <div class="recommend-list">
            <c:forEach items="${playlist}" var="song" >
                <div class="list-group">
                    <div style="display: flex;">
                        <a href="javascript:" onclick="playSpecificSong('<c:out value='${song.linkMP3}' />');" class="list-group-item" style="width: 70%;">${song.name}</a>
                        <a href="#" class="list-group-item" style="width: 30%; text-align: right;">${song.author.name}</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

</div>

<dic class="music-container" id="music-container">

    <div class="progress-container" id="progress-container">
        <div class="progress" id="progress"></div>
    </div>

    <audio id="audio"></audio>

    <div class="audio-container" id="audio-container">

        <audio id="audio"></audio>

        <div class="img-container">
            <img src="/img/musicplay/musicNote.png" id="song-image" alt="music-cover" id="cover" height="36" width="36"/>
        </div>

        <div class="like">
            <button id="like" class="action-btn">
                <i class="fa-solid fa-heart" title="Thích"></i>
            </button>
        </div>

        <div class="add-playlist">
            <button id="add-playlist" class="action-btn">
                <i class="fa-solid fa-list" title="Thêm vào danh sách"></i>
            </button>
        </div>

        <div class="lyrics">
            <button id="lyrics" class="action-btn">
                <i class="fa-solid fa-music" title="Mở lời bài hát"></i>
            </button>
        </div>

        <div class="navigation">
            <button id="random" class="action-btn">
                <i class="fa-solid fa-shuffle" title="Phát ngẫu nhiên"></i>
            </button>
            <button id="repeat" class="action-btn">
                <p class="repeat-one" id="repeat-one">1</p>
                <i class="fa-solid fa-repeat" title="Phát lại"></i>
            </button>
            <button id="prev" class="action-btn">
                <i class="fas fa-backward"></i>
            </button>
            <button id="play" class="action-btn action-btn-big">
                <i class="fas fa-play"></i>
            </button>
            <button id="next" class="action-btn">
                <i class="fas fa-forward"></i>
            </button>
        </div>

        <div class="music-info">
            <div class="song-name" id="song-name">
                Song No.1 are playing
            </div>
        </div>

        <div class="volume">
            <div class="volume-button">
                <button id="volume" class="action-btn">
                    <i class="fa-solid fa-volume-high"></i>
                </button>
            </div>
            <div class="volume-slider">
                <input type="range" class="slider" id="volume-slider" step="0.05" min="0" max="1" value="1">
            </div>
        </div>

        <div class="song-length" id="song-length">
            0:00/0:00
        </div>

    </div>
</dic>

<script>
    function a (){
        alert("ok");
    }

    class Song {
        constructor(name, url) {
            this.name = name;
            this.url = url;
        }
    }

    var listSongName = new Array(0);
    <c:forEach var="song" items="${playlist}">
        listSongName.push(new Song(`${song.name}`, `${song.linkMP3}`));
    </c:forEach>
</script>
<script src="/js/audioVisualizers.js"></script>
<script src="/js/audioPlayer.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="/js/musicPlayPage.js"></script>

<script>
    function playSpecificSong(linkMP3){
        console.log(songs[0]);
        console.log(songs.findIndex(item => item.url === linkMP3));
        songIndex = songs.findIndex(item => item.url === linkMP3);
        checkSong();
        main(url, 'next');
    }
</script>

</body>

</html>