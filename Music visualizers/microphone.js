class Microphone {
    constructor(fftSize){
        this.initialized = false;
        navigator.mediaDevices.getUserMedia({audio:true})
        .then(function(stream){
            this.audioContext = new AudioContext();
            this.microphone = this.audioContext.createMediaStreamSource(stream);
            this.analyser = this.audioContext.createAnalyser();  
            //setting analyzer
            this.analyser.fftSize = fftSize; //fast fourier algorithm, slide audio to k sample
            const bufferLength = this.analyser.frequencyBinCount; //create count for available bar, always 1/2 ffsiza
            this.dataArray = new Uint8Array(bufferLength);
            //feed microphone data to analyzer
            this.microphone.connect(this.analyser);
            BaseAudioContext.destination;
            this.initialized = true;

        }.bind(this)).catch(function(err){
            alert(err);
        });
    }

    getSample() {
        this.analyser.getByteTimeDomainData(this.dataArray);
        // let normSample = [...this.dataArray].map(e => -Math.abs(e/128 - 1));
        let normSample = [...this.dataArray].map(e => e/128 - 1);
        return normSample;
    }

    getVolume(){
        this.analyser.getByteTimeDomainData(this.dataArray);
        let normSample = [...this.dataArray].map(e => e/128 - 1);
        let sum = 0;
        for (let index = 0; index < normSample.length; index++) {
            sum += normSample[index] * normSample[index];
        }

        let volume = Math.sqrt(sum / normSample.length);
        return volume;
    }

}
