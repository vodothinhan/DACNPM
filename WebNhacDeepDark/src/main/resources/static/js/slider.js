var slider = document.getElementById('sync1'),
    sliderItems = document.querySelector('.owl-wrapper'),
    prev = document.querySelector('.owl-prev'),
    next = document.querySelector('.owl-next');

function slide(wrapper, items, prev, next) {
    var posX1 = 0,
        posX2 = 0,
        posInitial,
        posFinal,
        threshold = 100,
        slides = items.getElementsByClassName('owl-item'),
        slidesLength = slides.length,
        slideSize = items.getElementsByClassName('owl-item')[0].offsetWidth,
        firstSlide = slides[0],
        lastSlide = slides[slidesLength - 1],
        cloneFirst = firstSlide.cloneNode(true),
        cloneLast = lastSlide.cloneNode(true),
        index = 0;


    const slidetime = 4500;

    const sync1 = document.getElementById('sync1');
    const sync2 = document.getElementById('sync2');
    const item_description = sync2.querySelectorAll('.owl-item');

    function nextSlide() {

        // move item_description
        const sync2_carousel = sync2.querySelector('.owl-wrapper');
        const owl_wrapper_outer = sync2.querySelector(".owl-wrapper-outer");

        if (index < 0) {
            index = 7;
            sync2_carousel.style.transform = 'translate3d(' + -((index - 4) * 158) + 'px, 0px, 0px)';
        }
        if (index > 7) {
            index = 0;
            sync2_carousel.style.transform = 'translate3d(' + -(index * 158) + 'px, 0px, 0px)';
        }


        const leftParentBound = owl_wrapper_outer.getBoundingClientRect().left;
        const leftItemBound = item_description[index].getBoundingClientRect().left;
        if (leftItemBound === leftParentBound) {
            if (index > 0) {
                sync2_carousel.style.transform = 'translate3d(' + -((index - 1) * 158) + 'px, 0px, 0px)';
            }
        }

        const rightParentBound = owl_wrapper_outer.getBoundingClientRect().right;
        const rightItemBound = item_description[index].getBoundingClientRect().right;
        if (rightItemBound === rightParentBound) {
            if (index < 7) {
                sync2_carousel.style.transform = 'translate3d(' + -((index - 3) * 158) + 'px, 0px, 0px)';
            }
        }

        // bold item_description
        for (let j = 0; j < item_description.length; j++) {
            item_description[j].classList.remove("synced");
        }
        item_description[index].classList.add("synced");

        // move image
        const sync1_carousel = sync1.querySelector('.owl-wrapper');
        sync1_carousel.style.transform = 'translate3d(' + -index * 790 + 'px, 0px, 0px)';
    }

    // On click next button
    prev.onclick = function () {
        index--;
        nextSlide();
    };
    // On click previous button
    next.onclick = function () {
        index++;
        nextSlide();
    };
    // On click on description
    for (let j = 0; j < item_description.length; j++) {
        item_description[j].onclick = function () {
            index = j;
            nextSlide();
        };
    }

    // Pause loop slide show on hover
    const homebanner = document.querySelector('#sync1');
    homebanner.onmouseover = function timer() {
        clearInterval(loopSliderShow);
    };
    homebanner.onmouseout = function () {
        loopSliderShow = setInterval(loop_slides, slidetime);
    };


    // Loop slide show each slide time
    let loopSliderShow = setInterval(loop_slides, slidetime);

    function loop_slides() {
        index++;
        nextSlide();
    }

    // Mouse and Touch events
    items.onmousedown = dragStart;

    // Touch events
    items.addEventListener('touchstart', dragStart);
    items.addEventListener('touchend', dragEnd);
    items.addEventListener('touchmove', dragAction);

    function dragStart(e) {
        e = e || window.event;

        items.style.transition = '';
        e.preventDefault();
        stopLink();
        posInitial = getMatrix(items).x;
        if (e.type === 'touchstart') {
            posX1 = e.touches[0].clientX;
        } else {
            posX1 = e.clientX;
            document.onmouseup = dragEnd;
            document.onmousemove = dragAction;
        }
    }

    function dragAction(e) {
        e = e || window.event;
        if (e.type === 'touchmove') {
            posX2 = posX1 - e.touches[0].clientX;
            posX1 = e.touches[0].clientX;
        } else {
            posX2 = posX1 - e.clientX;
            posX1 = e.clientX;
        }
        // items.style.transform = (0 - posX2) + "px";
        items.style.transform = 'translate3d(' + (getMatrix(items).x - posX2) + 'px, 0px, 0px)';
    }

    function dragEnd(e) {
        e = e || window.event;

        items.style.transition = 'all 800ms ease 0s';
        posFinal = getMatrix(items).x;
        if (posFinal - posInitial > threshold) {
            shiftSlide('left');
        } else {
            if (posFinal - posInitial < -threshold) {
                shiftSlide('right');
            } else {
                items.style.transform = 'translate3d(' + (posInitial) + 'px, 0px, 0px)';
            }
        }
        document.onmouseup = null;
        document.onmousemove = null;
        openLink();
    }

    function shiftSlide(direction) {
        if (direction === 'left') {
            index--;
            nextSlide();
        }
        if (direction === 'right') {
            index++;
            nextSlide();
        }
    }
}

function stopLink() {
    console.log('vo chưa');
    const sync1 = document.getElementById('sync1');
    var xxx = sync1.querySelectorAll(".item");
    for (let j = 0; j < xxx.length; j++) {
        xxx[j].querySelector('a').addEventListener("click", preventClick);
    }
}

function preventClick(e) {
    event.preventDefault();
}

function openLink() {
    const sync1 = document.getElementById('sync1');
    var xxx = sync1.querySelectorAll(".item");
    for (let j = 0; j < xxx.length; j++) {
        xxx[j].querySelector('a').removeEventListener("click", preventClick);
    }
}

slide(slider, sliderItems, prev, next);

function getMatrix(element) {
    const values = element.style.transform.split(/\w+\(|\);?/);
    const transform = values[1].split(/,\s?/g).map(parseInt);

    return {
        x: transform[0],
        y: transform[1],
        z: transform[2]
    };
}