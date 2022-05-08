
var spinner = document.querySelector(".spinner-reset-otp")
var btn = document.querySelector(".btn-reset-otp")
var success = document.querySelector(".toast-success")
var danger = document.querySelector(".toast-danger")

btn.addEventListener("click" , (event) =>{
    event.preventDefault()
    let url = btn.href ;
    blockOrNone()
    fetch(url).then(res => res.json())
        .then(data =>{
            if(data.status==="stopped"){
                removeToast('danger')
                if(!success.classList.contains('active')) success.classList.toggle('active')
                blockOrNone()
                return
            }
            removeToast('success')
            if(!danger.classList.contains('active')) danger.classList.toggle('active')
            blockOrNone()
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