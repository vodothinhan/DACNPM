const musicContainer = document.getElementById('music-container');
const playButton = document.getElementById('play');
const prevButton = document.getElementById('prev');
const nextButton = document.getElementById('next');
const randomButton = document.getElementById('random');
const repeatButton = document.getElementById('repeat');
const addIcon = document.getElementById('repeat-one');
const audio = document.getElementById('audio');
const audioContainer = document.getElementById('audio-container');
const progressContainer = document.getElementById('progress-container');
const progress = document.getElementById('progress');
const songImage = document.getElementById('song-image');
const songName = document.getElementById('song-name');
const songLength = document.getElementById('song-length');
const volumeButton = document.getElementById('volume');
const volumeSlider = document.getElementById('volume-slider');
var listRandom = [];     //stored left index that not be used
var muteState = 'unmuted';
var repeatState = 'off';
var randomState = 'off';
var songState = 'playing';
//var url = "https://firebasestorage.googleapis.com/v0/b/projectandroidgroup6.appspot.com/o/Who%20let%20The%20Frog%20Out_.mp3?alt=media&token=4fd87408-03d0-4289-9fd3-3a07b35dd23f";
//var url2 = "Evan2.mp3";
var url;



// class Song {
//     constructor(name, url) {
//         this.name = name;
//         this.url = url;
//     }
// }

function createListRandom() {
    for (let i = 0; i < songs.length; i++) {
        listRandom[i] = i;
    }
}

//list song
const songs = new Array(listSongName.length);
for (let i = 0; i < songs.length; i++) {
    songs[i] = new Song(listSongName[i].name, listSongName[i].url);
    console.log(songs[i]);
}

let songIndex = 0;
createListRandom();
listRandom.splice(0, 1); //remove the first song index at the first play
//load song
function loadSong(song) {
    songName.innerText = song.name;
    url = song.url;

}

function checkSong() {
    if (songIndex < 0) {
        songIndex = songs.length - 1;
    }
    if (songIndex > songs.length - 1) {
        songIndex = 0;
    }

    loadSong(songs[songIndex]);

    const isPlaying = audioContainer.classList.contains('play');
    const audio = document.getElementById('audio');

    if (isPlaying) {
        playSong(audio);
    }
    else {
        playSong(audio);
    }
}

loadSong(songs[songIndex]);
// main(url, 'play');

//play song
function playSong(audio) {
    audioContainer.classList.add('play');
    playButton.childNodes[1].classList.remove('fa-play');
    playButton.childNodes[1].classList.add('fa-pause');
    audio.play();
}

function pauseSong(audio) {
    audioContainer.classList.remove('play');
    playButton.childNodes[1].classList.remove('fa-pause');
    playButton.childNodes[1].classList.add('fa-play');
    audio.pause();
}

function repeatSong(audio) {
    audioContainer.classList.add('play');
    playButton.childNodes[1].classList.remove('fa-rotate-right');
    playButton.childNodes[1].classList.add('fa-pause');
    audio.play();
}

//button event
playButton.addEventListener('click', () => {
    const isPlaying = audioContainer.classList.contains('play');
    const audio = document.getElementById('audio');

    if (songState === 'ended' && (randomState === 'on' || randomState === 'off') && repeatState === 'off') {
        createListRandom();
        songState = 'playing';
        audioContainer.classList.add('play');
        playButton.childNodes[1].classList.remove('fa-rotate-right');
        playButton.childNodes[1].classList.add('fa-pause');
        randomSong();
    }
    else {
        if (songState === 'ended') {
            repeatSong(audio);
            songState = 'playing';
        }
    }

    if (isPlaying) {
        pauseSong(audio);
    }
    else {
        playSong(audio);
    }


    main(url, 'play');
});

nextButton.addEventListener('click', () => {
    if (randomState === 'on') {
        randomSong();
    }
    else {
        songIndex++;
        checkSong();
        main(url, 'next');
    }
});

prevButton.addEventListener('click', () => {
    if (randomState === 'on') {
        randomSong();
    }
    else {
        songIndex--;
        checkSong();
        main(url, 'next');
    }
});

// function playSpecificSong(linkMP3){
//     alert("ok");
//     // songIndex = songs.findIndex(s => s.url === linkMP3);
//     // checkSong();
//     // main(url, 'next');
// }

//adio event
audio.addEventListener('timeupdate', updateProgress);

progressContainer.addEventListener('click', setProgress);

audio.addEventListener('ended', () => {                         //next song
    if (repeatState === 'off' && randomState === 'off') {
        if (songIndex === songs.length - 1) {
            songState = 'ended';
            audioContainer.classList.remove('play');
            playButton.childNodes[1].classList.remove('fa-pause');
            playButton.childNodes[1].classList.add('fa-rotate-right');
            audio.pause();
        }
        else {
            randomSong();
        }
    }
    else {
        if (repeatState === 'off' && randomState === 'on') {
            randomSong();
        }
        else {
            if (randomState === 'on') {
                if (repeatState === 'one') {
                    audio.play();
                }
                if (repeatState === 'all') {
                    randomSong();
                }
            }
            else {
                if (repeatState === 'one') {
                    audio.play();
                }
                if (repeatState === 'all') {
                    songIndex++;
                    checkSong();
                    main(url, 'next');
                }
            }
        }
    }

});

function updateProgress(e) {
    const { duration, currentTime } = e.srcElement;
    const progressPercent = (currentTime / duration) * 100;
    progress.style.width = `${progressPercent}%`;

    //update time
    const currentTimeInMinute = Math.floor(currentTime / 60);
    const currentTimeInSecond = Math.round(currentTime % 60)
    const durationInMinute = Math.floor(duration / 60);
    const durationInSecond = Math.round(duration % 60);

    var r = `${currentTimeInMinute}:` + (currentTimeInSecond < 10 ? '0' : '') +
        `${currentTimeInSecond}/${durationInMinute}:` + (durationInSecond < 10 ? '0' : '') + `${durationInSecond}`;

    songLength.innerHTML = r;

}

function setProgress(e) {
    const width = this.clientWidth;
    const clickX = e.offsetX;
    const duration = audio.duration;

    audio.currentTime = (clickX / width) * duration;

}

function randomSong() {
    if (listRandom.length === 0 && repeatState === 'all' || repeatState === 'one') {
        createListRandom();
    }
    else {
        if (listRandom.length === 0) {
            songState = 'ended';
            audioContainer.classList.remove('play');
            playButton.childNodes[1].classList.remove('fa-pause');
            playButton.childNodes[1].classList.add('fa-rotate-right');
            audio.pause();
        }
    }

    if (randomState === "on") {
        var random = Math.floor(Math.random() * (listRandom.length));
        console.log('song length: ' + songs.length);
        console.log('listRandom lenght ' + listRandom.length);
        console.log('random out if ' + random + ' value in list: ' + listRandom[random]);

        songIndex = listRandom[random];
        listRandom.splice(random, 1);
        console.log(listRandom);

        console.log('song index: ' + songIndex);
        checkSong();
        main(url, 'next');
    }
    else {
        songIndex++;
        checkSong();
        main(url, 'next');
    }

}

//volume event
volumeSlider.addEventListener('click', setVolume);

function setVolume(e) {
    const value = e.target.value;
    audio.volume = value;

    //mute if volume = 0
    if (value <= 0) {
        volumeButton.childNodes[1].classList.remove('fa-volume-high');
        volumeButton.childNodes[1].classList.add('fa-volume-xmark');
        audio.muted = true;
        muteState = 'muted';
    }
    if (value > 0 && muteState === 'muted') {
        volumeButton.childNodes[1].classList.remove('fa-volume-xmark');
        volumeButton.childNodes[1].classList.add('fa-volume-high');
        audio.muted = false;
        muteState = 'unmuted';
    }
}

volumeButton.addEventListener('click', (e) => {
    if (muteState === 'muted') {
        volumeButton.childNodes[1].classList.remove('fa-volume-xmark');
        volumeButton.childNodes[1].classList.add('fa-volume-high');
        audio.muted = false;
        muteState = 'unmuted';
    }
    else {
        volumeButton.childNodes[1].classList.remove('fa-volume-high');
        volumeButton.childNodes[1].classList.add('fa-volume-xmark');
        audio.muted = true;
        muteState = 'muted';
    }
});

//random button and repeat button
randomButton.addEventListener('click', (e) => {
    if (randomState === 'off') {
        randomState = 'on';
        e.target.style.filter = "brightness(200%)";
        e.target.style.color = "red";
    }
    else {
        randomState = 'off';
        e.target.style.filter = "brightness(100%)";
        e.target.style.color = "white";
    }
});

repeatButton.addEventListener('click', (e) => {
    if (repeatState === 'off') {
        repeatState = 'all';
        e.target.style.filter = "brightness(200%)";
        e.target.style.color = "red";
        addIcon.style.filter = "brightness(0%)"
    }
    else {
        if (repeatState === 'all') {
            repeatState = 'one';
            e.target.style.filter = "brightness(200%)";
            e.target.style.color = "red";
            addIcon.style.filter = "brightness(200%)"
            addIcon.style.color = "red";
        }
        else {
            repeatState = 'off';
            e.target.style.filter = "brightness(100%)";
            e.target.style.color = "white";
            addIcon.style.filter = "brightness(0%)"
            addIcon.style.color = "transparent";
        }
    }
});