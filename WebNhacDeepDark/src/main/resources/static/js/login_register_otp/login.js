

var  email = document.querySelector(".input-email")
var pass = document.querySelector(".input-pass")
var err = document.querySelector(".err-from-server")
var login = document.querySelector(".btn-login")
var isEmail = false
var isPass = false

login.addEventListener('click' , (event) =>{
    if(!isEmail || !isPass){
        event.preventDefault()
        checkEmail()
        checkPass()
    }
})

email.addEventListener('blur' , () =>{
    checkEmail()
 })
email.addEventListener('input' , () =>{
    checkEmail()

})
pass.addEventListener('blur' , () =>{
    checkPass()
})
pass.addEventListener('input' , () =>{
    checkPass()
})

function checkEmail(){
    err.innerHTML = ' Trường này phải là email !'
    let value = email.value.trim()
    let regex = new RegExp(/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/)
    if(regex.test(value)){
        isEmail = true
        email.classList.contains('is-invalid') && email.classList.remove('is-invalid')
        email.classList.add('is-valid')
        return
    }
    isEmail = false
    email.classList.contains('is-valid')&& email.classList.remove('is-valid')
    email.classList.add('is-invalid')
    return
}
function checkPass(){
    let value = pass.value.trim()
    if(value.length>0){
        isPass = true
        pass.classList.contains('is-invalid') && pass.classList.remove('is-invalid')
        pass.classList.add('is-valid')
        return
    }
    isPass = false
    pass.classList.contains('is-valid') && pass.classList.remove('is-valid')
    pass.classList.add('is-invalid')
    return
}