const canvas = document.getElementById('myCanvas');
const context = canvas.getContext('2d');

function main(){
    canvas.width = window.innerWidth;   /*Make canvas full content page*/
    canvas.height = window.innerHeight;
}

class Bar {
    constructor(x, y, width, height, color, index){
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
        this.color = color;
        this.index = index;
    }

    update(micInput){
        const sound = micInput * 500;
        if(sound > this.height){
            this.height = sound;
        }
        else{
            this.height -= this.height * 0.05;
        }
    }

    draw(ctx, volume){
        ctx.strokeStyle = this.color;
        ctx.save();

        ctx.translate(0, 0);
        ctx.rotate(this.index * 0.03);
        ctx.scale(1 + volume / 20, 1 + volume / 10);

        ctx.beginPath();
        ctx.strokeStyle = this.color;
        ctx.moveTo(0, 0);
        ctx.lineTo(0, this.height);
        //ctx.strokeRect(this.x, this.y, this.x, this.height);
        //ctx.strokeRect(0, 0, 1, this.height / 2);
        ctx.stroke();

        ctx.beginPath();
        ctx.strokeStyle = 'blue';
        ctx.moveTo(this.x, this.y);
        //ctx.strokeRect(this.x, this.y, this.x, this.height);
        ctx.strokeRect(0, 250, 10, this.height / 2);
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
const fftSize = 1024
const microphone = new  Microphone(fftSize);

let bars = [];

function createBars(){
    for (let i = 0; i < fftSize / 2; i++) {
        let color = 'hsl('+ i +', 100%, 50%)';
        //bars.push(new Bar(i * canvas.width / 256, canvas.height / 2, 5, 20, color, i));
        bars.push(new Bar(0, i * 0.5, 5, 20, color, i));
    }
}

let angle = 0;

function animate(){
    
    context.clearRect(0, 0, canvas.width, canvas.height);
    //generate audio sample 
    const sample = microphone.getSample();
    const volume = microphone.getVolume();
    //animate bars
    angle += 0.005 + volume / 5;
    context.save();
    context.translate(canvas.width / 2, canvas.height / 2);
    context.rotate(angle);

    bars.forEach(function(bar, i){
        bar.update(sample[i]);
        bar.draw(context, volume);
    });
    context.restore();
    
    requestAnimationFrame(animate);
}

//run
main();
createBars();
animate();