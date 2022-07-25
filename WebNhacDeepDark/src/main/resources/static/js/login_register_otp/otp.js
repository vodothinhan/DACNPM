var spinner = document.querySelector(".spinner-reset-otp")
var btn = document.querySelector(".btn-reset-otp")
var success = document.querySelector(".toast-success")
var danger = document.querySelector(".toast-danger")
var otp = document.querySelector(".input-otp")
var errOtp = document.querySelector(".err-otp")
var btnComplete = document.querySelector(".btn-complete");
var isOTP = false

btnComplete.addEventListener("click" , (event) =>{
    if(!isOTP) {
        event.preventDefault()
        checkOTP()
    }
})

otp.addEventListener("blur" , () =>{
    checkOTP()

})
otp.addEventListener("input" , () =>{
checkOTP()
})

function checkOTP(){
    let value = otp.value.trim()
    let regex = new RegExp(/^[0-9]{6}$/)
    if(value.length===0) {
        isOTP = false
        errOtp.innerHTML = " Trường này không được trống !"
        otp.classList.contains('is-valid')&& otp.classList.remove('is-valid')
        otp.classList.add('is-invalid')
        return
    }
    if(!regex.test(value)){
        isOTP = false
        errOtp.innerHTML = " Mã OTP gồm 6 chữ số !"
        otp.classList.contains('is-valid')&& otp.classList.remove('is-valid')
        otp.classList.add('is-invalid')
        return
    }
    isOTP = true
    otp.classList.contains('is-invalid')&& otp.classList.remove('is-invalid')
    otp.classList.add('is-valid')
    return;
}

btn.addEventListener("click" ,  (event) =>{

       event.preventDefault()
    blockOrNone()
    let url = btn.href ;
    fetch(url).then(res => res.json())
        .then(data =>{
            if(data.message==="SUCCESS"){
                removeToast('danger')
                if(!success.classList.contains('active')) success.classList.toggle('active')
                blockOrNone()
                return
            }
           if(data.message==="RUNNING"){
               removeToast('success')
               if(!danger.classList.contains('active')) danger.classList.toggle('active')
               blockOrNone()
               return;
           }
        })
        .catch(err =>{
            removeToast('success')
            if(!danger.classList.contains('active')) danger.classList.toggle('active')
            blockOrNone()
        })
})
// remove toast success when err or remove toast when success
function removeToast(toast){
    switch(toast){
        case 'success' :
            if(  success.classList.contains('active')) success.classList.remove('active')
            break ;
        case 'danger':
            if(  danger.classList.contains('active')) danger.classList.remove('active')
    }
}
//display spiner when click link reset-otp then hidden link reset otp
function blockOrNone(){
    btn.classList.toggle('active')
    spinner.classList.toggle('active')
}
if(document.querySelector(".alert-danger")){
    setTimeout(() =>{
        document.querySelector(".alert-danger").classList.add("d-none")
    } ,2000)
}