const validate = document.querySelector('.input');
const button = document.querySelector('.search-btn');
button.addEventListener('click', function (e) {
    const s = validate.value.trim();
    if(s.length === 0)
        e.preventDefault();
});
