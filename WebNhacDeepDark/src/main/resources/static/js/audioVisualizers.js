const canvas = document.getElementById('myCanvas');
const context = canvas.getContext('2d');
canvas.width = window.innerWidth;   /*Make canvas full content page*/
canvas.height = window.innerHeight;
let audioSource;
let analyser;
let audioContext;
var song = 'save me';

const fftSize = 1024;

//class Bar
class Bar {
    constructor(x, y, width, height, color, index) {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
        this.color = color;
        this.index = index;
    }

    update(soundInput) {
        const sound = soundInput;
        if (sound > this.height) {
            this.height = sound;
        }
        else {
            this.height -= this.height * 0.05;
        }
    }

    draw(ctx, volume) {
        ctx.strokeStyle = this.color;
        ctx.save();

        ctx.translate(0, 0);
        ctx.rotate(this.index * 0.04);
        ctx.scale(1 + volume / 5, 1 + volume / 4);

        ctx.beginPath();
        ctx.strokeStyle = 'yellow';
        ctx.moveTo(0, 0);
        ctx.lineTo(0, this.height / 4);
        //ctx.strokeRect(this.x, this.y, this.x, this.height);
        //ctx.strokeRect(230, this.height + volume * 50, 4, 4);
        ctx.stroke();

        ctx.beginPath();
        ctx.strokeStyle = 'blue';
        ctx.moveTo(this.x, this.y);
        //ctx.strokeRect(this.x, this.y, this.x, this.height);
        ctx.strokeRect(0, 190, 10, this.height / 4);
        ctx.stroke();

        ctx.beginPath();
        ctx.strokeStyle = this.color;
        ctx.moveTo(this.x, this.y);
        ctx.strokeRect(-195, 0, this.height / 20 + volume * 10, 1);
        ctx.stroke();

        // ctx.beginPath();
        // ctx.strokeStyle = this.color;
        // ctx.moveTo(this.x, this.y);
        // ctx.strokeRect(this.x, this.y, this.x, this.height);
        // ctx.stroke();

        ctx.restore();
    }
}

//create Bar

let bars = [];

function createBars() {
    for (let i = 0; i < fftSize / 2; i++) {
        let color = 'hsl(' + i + ', 100%, 50%)';
        //bars.push(new Bar(i * canvas.width / 256, canvas.height / 2, 5, 20, color, i));
        bars.push(new Bar(0, i * 0.5, 5, 20, color, i));
    }
}

createBars();

//first on load animation
function animateFirstTime() {
    context.save();
    context.translate(canvas.width / 2, canvas.height / 2);

    bars.forEach(function (bar, i) {
        bar.draw(context, volume / 200);
    });

    context.restore();
}
animateFirstTime();


//audio analyzers animate
function main(songName, action) {

    if (action === 'play') {
        if (!audioContext) {
            const audio = document.getElementById('audio');
            audio.src = `${songName}`;

            audioContext = new AudioContext();

            audio.play();

            audioSource = audioContext.createMediaElementSource(audio);
            analyser = audioContext.createAnalyser();
            audioSource.connect(analyser);
            analyser.connect(audioContext.destination);
            analyser.fftSize = fftSize;
            const bufferLength = analyser.frequencyBinCount;
            const dataArray = new Uint8Array(bufferLength);
            console.log(dataArray);

            function getVolume() {
                analyser.getByteFrequencyData(dataArray);
                let normSample = [...dataArray];
                let sum = 0;
                for (let index = 0; index < normSample.length; index++) {
                    sum += normSample[index] * normSample[index];
                }

                let volume = Math.sqrt(sum / normSample.length);
                return volume;
            }

            let angle = 0;
            function animated() {
                context.clearRect(0, 0, canvas.width, canvas.height);
                analyser.getByteFrequencyData(dataArray);
                const volume = getVolume();

                angle += 0.001 + volume / 40000;
                context.save();
                context.translate(canvas.width / 2, canvas.height / 2);
                context.rotate(angle);

                bars.forEach(function (bar, i) {
                    bar.update(dataArray[i]);
                    bar.draw(context, volume / 200);
                });

                context.restore();
                requestAnimationFrame(animated);
            }
            animated();
        }
        else {
            return;
        }
    }

    if (action === 'next') {
        const audio = document.getElementById('audio');
        audio.src = `${songName}`;

        audioContext = new AudioContext();

        audio.play();

        audioSource = audioContext.createMediaElementSource(audio);
        analyser = audioContext.createAnalyser();
        audioSource.connect(analyser);
        analyser.connect(audioContext.destination);
        analyser.fftSize = fftSize;
        const bufferLength = analyser.frequencyBinCount;
        const dataArray = new Uint8Array(bufferLength);
        console.log(dataArray);

        function getVolume() {
            analyser.getByteFrequencyData(dataArray);
            let normSample = [...dataArray];
            let sum = 0;
            for (let index = 0; index < normSample.length; index++) {
                sum += normSample[index] * normSample[index];
            }

            let volume = Math.sqrt(sum / normSample.length);
            return volume;
        }

        let angle = 0;
        function animated() {
            context.clearRect(0, 0, canvas.width, canvas.height);
            analyser.getByteFrequencyData(dataArray);
            const volume = getVolume();

            angle += 0.001 + volume / 40000
            context.save();
            context.translate(canvas.width / 2, canvas.height / 2);
            context.rotate(angle);

            bars.forEach(function (bar, i) {
                bar.update(dataArray[i]);
                bar.draw(context, volume / 200);
            });

            context.restore();
            requestAnimationFrame(animated);
        }
        animated();
    }

}



