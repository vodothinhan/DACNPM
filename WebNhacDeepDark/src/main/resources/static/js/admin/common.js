function toggleMenu() {
    let toggle = document.querySelector('.toggle')
    let navigation = document.querySelector('.navigation-admin')
    toggle.classList.toggle('active')
    navigation.classList.toggle('active')
    let main = document.querySelector('.main')
    main.classList.toggle('active')
}
toggleMenu()