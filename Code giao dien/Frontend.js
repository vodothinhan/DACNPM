

var button1 = document.getElementById("btn1");
var button2 = document.getElementById("btn2");
var button3 = document.getElementById('btn3');
var button4 = document.getElementById('btn4');

button1.onclick = function () {
    button1.style.background = "#ff5500";
    button2.style.background = "white";
    button3.style.background = "white";
    button4.style.background = "white";
};
 
button2.onclick = function () {
    button1.style.background = "white";
    button2.style.background = "#ff5500";
    button3.style.background = "white";
    button4.style.background = "white";
};
button3.onclick = function () {
    button1.style.background = "white";
    button2.style.background = "white";
    button3.style.background = "#ff5500";
    button4.style.background = "white";
};
button4.onclick = function () {
    button1.style.background = "white";
    button2.style.background = "white";
    button3.style.background = "white";
    button4.style.background = "#ff5500";
};