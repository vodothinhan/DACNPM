var  email = document.querySelector(".input-email")
var pass = document.querySelector(".input-pass")
var repeat = document.querySelector(".repeat")
var errEmail = document.querySelector(".err-from-email")
var errPass = document.querySelector(".err-from-pass")
var errRepeat = document.querySelector(".err-from-repeat")
var dates = document.querySelectorAll(".date")
var register = document.querySelector(".btn-register")

var isEmail = false
var isPass = false
var isRepeat = false
var isDate = false
var isExist = false

register.addEventListener('click' , (event) =>{
    if(!isDate || !isEmail || !isPass || !isRepeat || !isExist){
        event.preventDefault()
        checkDate()
        checkEmail()
        checkPass()
        checkRepeat()
        checkExist()

    }
})

email.addEventListener('blur' , () =>{
    checkExist()
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
repeat.addEventListener('blur' , () =>{
    checkRepeat()
})
repeat.addEventListener('input' , () =>{
    checkRepeat()
})
function checkPass(){
    let value = pass.value.trim()
    if(value.length>=8){
        isPass = true
        pass.classList.contains('is-invalid') && pass.classList.remove('is-invalid')
        pass.classList.add('is-valid')
        return
    }
    if(value.length==0){
        errPass.innerHTML = " Trường này không được trống !"
        isPass = false
        pass.classList.contains('is-valid') && pass.classList.remove('is-valid')
        pass.classList.add('is-invalid')
        return
    }
    errPass.innerHTML = " Mật khẩu tối thiểu 8 kí tự !"
    isPass = false
    pass.classList.contains('is-valid') && pass.classList.remove('is-valid')
    pass.classList.add('is-invalid')
    return

}
function checkEmail(){
    errEmail.innerHTML = ' Trường này phải là email !'
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

function checkRepeat(){
    let passValue = document.querySelector(".input-pass").value.trim()
    let repeatValue = document.querySelector(".repeat").value.trim()
    if(repeatValue.length===0) {
        isRepeat = false
        errRepeat.innerHTML = " Trường này không được trống!"
        repeat.classList.contains('is-valid')&& repeat.classList.remove('is-valid')
        repeat.classList.add('is-invalid')
        return
    }

    if(passValue.length>=8){
        if(!(passValue===repeatValue)) {
            isRepeat = false
            errRepeat.innerHTML = " Trường này không trùng khớp!"
            repeat.classList.contains('is-valid')&& repeat.classList.remove('is-valid')
            repeat.classList.add('is-invalid')

        }else{
            isRepeat = true
            repeat.classList.contains('is-invalid') && repeat.classList.remove('is-invalid')
            repeat.classList.add('is-valid')
        }
    }


    return

}

function checkDate(){
    let count = 0
    dates.forEach(date =>{
        let option = date.value;

        if(option.trim().length===0){

            isDate = false
            date.classList.contains('is-valid')&& date.classList.remove('is-valid')
            date.classList.add('is-invalid')        }
        else  count++
    })
    if(count===dates.length) {
        isDate = true
        return
    }
    return
}
function checkExist(){
    email.value.trim().length>0 && fetch(`isExistEmail?email=${email.value}`)
        .then(res => res.json())
        .then(data =>{
            if(data.message==="FALSE"){
                isExist=false
                email.classList.contains('is-valid') && email.classList.remove('is-valid')
                email.classList.add('is-invalid')
                errEmail.innerHTML = ' Email này đã tồn tại trong hệ thống !'
            }
            if(data.message==="TRUE"){
                isExist = true
                return
            }
            isExist = false
        })
        .catch(error =>{
            isExist=false
            email.classList.contains('is-valid')&& email.classList.remove('is-valid')
            email.classList.add('is-invalid')
            errEmail.innerHTML = ' Vui lòng thử lại trong vài phút!'
        })
}

dates.forEach(date =>{
    date.addEventListener('change' , () =>{
        let option = date.value
        if(option.trim().length===0){

            date.classList.contains('is-valid')&& date.classList.remove('is-valid')
            date.classList.add('is-invalid')
        }
        else{

            date.classList.contains('is-invalid')&& date.classList.remove('is-invalid')
            date.classList.add('is-valid')
        }
    })
})


