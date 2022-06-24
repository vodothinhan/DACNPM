var listInput = document.querySelectorAll('.input-value')
var fileThumnail = document.querySelector('.file-thumbnail')
var fileMusic = document.querySelector('.file-music')
var btnUpload = document.querySelector('.btn-upload')
const extendsionThumnail =['image/png', 'image/jpeg','image/jpeg'];
const extendsionMusic = ['video/mp3','video/mp4','audio/mpeg']
const  NOT_NULL = "Trường này không được trống !"
const FILE_OVER_SIZE = "Kích thước file quá lớn !"
const FILE_EXTENSION_THUMBNAIL = "Kiểu file phải là file ảnh (png , jpg ,....) !"
const FILE_EXTENSION_MUSIC  ="Kiểu file phải là file music (mp3 , mp4 ) !"
const MAX_SIZE = 5*1024*1024
const NOT_EXIST = " Bạn cần phải thêm album mới!"
var inputNameSinger = document.querySelector(".nameSinger")
var inputNameAuthor = document.querySelector(".nameAuthor")
var inputNameAlbum =  document.querySelector(".nameAlbum")
var inputCurrent
var setTimeId
const TIME_REQUEST = 1000
var formMusic = document.querySelector('.form-music')
var formAlbum = document.querySelector('.form-album')
var btnCancelNewmAlbum = document.querySelector(".cancel-new-album")
var btnAddNewAlbum = document.querySelector('.add-new-album')
var inputNameOfAlbum = document.querySelector('.inputNameOfAlbum')
var inputNameAuthorOfAlbum = document.querySelector('.nameAuthorOfAlbum')
var btnAddNewAlbumOfAlbum = document.querySelector('.btn-add-new-album')
var hiddenSinger = document.querySelector('.hidden-singer')
var hiddenAuthor = document.querySelector('.hidden-author')
var hiddenAlbum = document.querySelector('.hidden-album')
var hiddenAuthorOfAlbum = document.querySelector('.hidden-of-album')

btnAddNewAlbumOfAlbum.addEventListener('click' , (event) =>{
    event.preventDefault()

    if(checkValueInput(inputNameOfAlbum,NOT_NULL)){
        removeClassCSS(formAlbum , 'd-block')
        addClassCss(formAlbum,'d-none')
        removeClassCSS(formMusic, 'd-none')
        addClassCss(formMusic, 'd-block')

        inputNameAlbum.value = inputNameOfAlbum.value
    }
})

btnAddNewAlbum.addEventListener('click', (event) => {
    event.preventDefault()
    inputNameAlbum.value =''
    removeClassCSS(formMusic, 'd-block')
    addClassCss(formMusic, 'd-none')
    removeClassCSS(formAlbum, 'd-none')
    addClassCss(formAlbum, 'd-block')
    inputNameOfAlbum.value =''
    inputNameAuthorOfAlbum.value = ''
    inputNameOfAlbum.classList.remove('is-valid')
    inputNameAuthorOfAlbum.classList.remove('is-valid')
    inputNameOfAlbum.classList.remove('is-invalid')
    inputNameAuthorOfAlbum.classList.remove('is-invalid')

})
btnCancelNewmAlbum.addEventListener('click', (event) => {
    event.preventDefault()
    removeClassCSS(formAlbum , 'd-block')
    addClassCss(formAlbum,'d-none')
    removeClassCSS(formMusic, 'd-none')
    addClassCss(formMusic, 'd-block')
    inputNameOfAlbum.value =''
    inputNameAuthorOfAlbum.value = ''
    inputNameOfAlbum.classList.remove('is-valid')
    inputNameAuthorOfAlbum.classList.remove('is-valid')
    inputNameOfAlbum.classList.remove('is-invalid')
    inputNameAuthorOfAlbum.classList.remove('is-invalid')


})
btnUpload.addEventListener('click' ,   (event) =>{
    event.preventDefault()
    uploadFile()
    inputCurrent = null
    if(!checkAllPrevUpload(document.querySelectorAll(".form-music-input"))){
        return
    }

    let str1 = hiddenAlbum.value.trim().length===0?false:true
    let str2 =  inputNameAuthorOfAlbum.value.trim().length===0?false:true
    if(str2||str1){

    }
    else {

        let  err = document.querySelector(".err-album")
        err.innerHTML=NOT_EXIST
        inputNameAlbum.classList.contains('is-valid')&&inputNameAlbum.classList.remove('is-valid')
        inputNameAlbum.classList.add('is-invalid')

    }



})
function checkFileSize(file , element, message){
    if(file.size>MAX_SIZE){
        element.classList.contains('is-valid') && element.classList.remove('is-valid')
        element.classList.add('is-invalid')
        let err = element.parentElement.querySelector(".invalid-feedback")
        err.innerHTML = message ;
        return false
    }
    element.classList.contains('is-invalid') && element.classList.remove('is-invalid')
    element.classList.add('is-valid')
    return true

}
function checkExtendsionFile(listExtendsion ,file, element,message){

    if( listExtendsion.indexOf(file.type)===-1) {
        element.classList.contains('is-valid') && element.classList.remove('is-valid')
        element.classList.add('is-invalid')
        let err = element.parentElement.querySelector(".invalid-feedback")
        err.innerHTML = message ;
        return false
    }
    element.classList.contains('is-invalid') && element.classList.remove('is-invalid')
    element.classList.add('is-valid')
    return true

}
function checkValueInput(element, message){
    let value = element.value.trim()
    if(!value.length){
        element.classList.contains('is-valid') && element.classList.remove('is-valid')
        element.classList.add('is-invalid')
        let err = element.parentElement.querySelector(".invalid-feedback")
        err.innerHTML = message ;
        return false
    }
    element.classList.contains('is-invalid') && element.classList.remove('is-invalid')
    element.classList.add('is-valid')
    return true

}


listInput.forEach(element =>{
    element.addEventListener('blur' ,() =>{
        checkValueInput(element,NOT_NULL)
    })
})
listInput.forEach(element =>{
    element.addEventListener('input' ,() =>{
        checkValueInput(element,NOT_NULL )
    })
})
fileMusic.addEventListener('change' , (event) =>{
    let file = event.target.files[0]
    if(!checkExtendsionFile(extendsionMusic,file,fileMusic,FILE_EXTENSION_MUSIC)) return
    checkFileSize(file,fileMusic,FILE_OVER_SIZE)


})
fileThumnail.addEventListener('change',(event) =>{
    let file = event.target.files[0]
    if(!checkExtendsionFile(extendsionThumnail,file,fileThumnail,FILE_EXTENSION_THUMBNAIL)) return
    checkFileSize(file,fileThumnail,FILE_OVER_SIZE)
})

inputNameSinger.addEventListener('input' , () =>{
    checkValueInput(inputNameSinger, NOT_NULL)
    hiddenSinger.value = ''
    if(inputNameSinger.value.trim().length>0){
        setTimeId && clearTimeout(setTimeId)
        setTimeId = setTimeout( async ()=>{
            renderUILoading( document.querySelector(".displaySinger"))
          let name = inputNameSinger.value
            let  data =  await fetchDataFromServer(`/findNameSinger?name=${name}`)
             if(Array.isArray(data.data.data)){
                 UIWithData(data ,document.querySelector(".displaySinger"))
             }

        },TIME_REQUEST)
    }
})
inputNameAuthor.addEventListener('input' , () =>{
    checkValueInput(inputNameAuthor, NOT_NULL)
    hiddenAuthor.value = ''
    if(inputNameAuthor.value.trim().length>0){
        setTimeId && clearTimeout(setTimeId)
        setTimeId = setTimeout( async ()=>{
            renderUILoading( document.querySelector(".displayAuthor"))
            let name = inputNameAuthor.value
            let  data =  await fetchDataFromServer(`/findNameAuthor?name=${name}`)
            if(Array.isArray(data.data.data)){
                UIWithData(data ,document.querySelector(".displayAuthor"))
            } else document.querySelector(".displayAuthor").innerHTML = NOT_RESULT

        },TIME_REQUEST)
    }
})
inputNameAuthorOfAlbum.addEventListener('input' , () =>{
    checkValueInput(inputNameAuthorOfAlbum, NOT_NULL)
    hiddenAuthorOfAlbum.value = ''
    if(inputNameAuthorOfAlbum.value.trim().length>0){
        setTimeId && clearTimeout(setTimeId)
        setTimeId = setTimeout( async ()=>{
            renderUILoading( document.querySelector(".display-form-author"))
            let name = inputNameAuthorOfAlbum.value
            let  data =  await fetchDataFromServer(`/findNameAuthor?name=${name}`)
            if(Array.isArray(data.data.data)){
                UIWithData(data ,document.querySelector(".display-form-author"))
            } else document.querySelector(".displayAuthor").innerHTML = NOT_RESULT

        },TIME_REQUEST)
    }
})
inputNameAlbum.addEventListener('input' , () =>{
    checkValueInput(inputNameAlbum, NOT_NULL)
    hiddenAlbum.value =''
    inputNameAuthorOfAlbum.value=''
    if(inputNameAlbum.value.trim().length>0){
        setTimeId && clearTimeout(setTimeId)
        setTimeId = setTimeout( async ()=>{
            renderUILoading( document.querySelector(".displayAlbum"))
            let name = inputNameAlbum.value
            let  data =  await fetchDataFromServer(`/findNameAlbum?name=${name}`)
            if(Array.isArray(data.data.data)){
                UIWithData(data ,document.querySelector(".displayAlbum"))
            } else document.querySelector(".displayAlbum").innerHTML = NOT_RESULT

        },TIME_REQUEST)
    }
})
inputNameAuthor.addEventListener('focus' ,async () =>{
    let DOMParent = document.querySelector(".displayAuthor")
    inputCurrent = inputNameAuthor
    addClassCss(DOMParent,'show')
    if(inputNameAuthor.value.trim().length===0){
        let data = await fetchDataFromServer('/getAllAuthor')
        UIWithData(data, DOMParent)
    }
})
inputNameAuthorOfAlbum.addEventListener('focus' ,async () =>{
    let DOMParent = document.querySelector(".display-form-author")
    inputCurrent = inputNameAuthorOfAlbum
    addClassCss(DOMParent,'show')
    if(inputNameAuthorOfAlbum.value.trim().length===0){
        let data = await fetchDataFromServer('/getAllAuthor')
        UIWithData(data, DOMParent)
    }
})

inputNameSinger.addEventListener('focus' ,  async () =>{
    let DOMParent = document.querySelector(".displaySinger")
    inputCurrent = inputNameSinger
    addClassCss(DOMParent,'show')
    if(inputNameSinger.value.length===0){
        let data = await fetchDataFromServer('/getAllSinger')
        UIWithData(data, DOMParent)
    }
})
inputNameAlbum.addEventListener('focus' , async () =>{
    inputCurrent = inputNameAlbum
    let DOMParent = document.querySelector('.displayAlbum')
    addClassCss(DOMParent ,'show')
    if(inputNameAlbum.value.trim().length===0){
        let data = await fetchDataFromServer('/getAllAlbum')
        UIWithData(data,DOMParent)
    }

})
document.addEventListener('click' , (event) =>{
    setValueInputAndHiddenDropdown(event,"nameSinger",'displaySinger',inputNameSinger)
    setValueInputAndHiddenDropdown(event,"nameAuthor",'displayAuthor',inputNameAuthor)
    setValueInputAndHiddenDropdown(event,"nameAuthorOfAlbum",'display-form-author',inputNameAuthorOfAlbum)
    setValueInputAndHiddenDropdown(event,"nameAlbum",'displayAlbum',inputNameAlbum)
})

async function  fetchDataFromServer(url){
    let data = await axios.get(url)
    return data
}
function UIWithData(data , DOMParent){
    let UI = ''
    data.data.data.forEach(data =>{
        UI +=`<li data-id=${data.id}>${data.name}</li>`
    })
    DOMParent.innerHTML = UI
}
function changeInput(dom , input){
    input.value = dom.innerText
}

function addClassCss(dom , classCSS){
    dom.classList.add(classCSS)
}
function removeClassCSS(dom , classCSS){
    dom.classList.remove(classCSS)
}
function setValueInputAndHiddenDropdown(event , classTagInput,classTagUl,elementInput){
    let target = event.target
    if(!target.classList.contains(classTagInput)){
        let boolean = target.nodeName=='LI'&& target.parentElement.classList.contains(classTagUl)
        if(boolean){
            elementInput.value=target.innerText
            elementInput.nextElementSibling.value=target.getAttribute('data-id')
           console.log(elementInput.nextElementSibling)
            checkValueInput(elementInput, NOT_NULL)
        }
        let DOMParent = document.querySelector("."+classTagUl)
        removeClassCSS(DOMParent , 'show')
        if( inputCurrent && !inputCurrent.isEqualNode(target)) checkValueInput(inputCurrent,NOT_NULL)

    }
    return
}

function checkAllPrevUpload(listAll){
    let count = 0 ;
    listAll.forEach(input =>{
        let typeInput = input.getAttribute('type')
        if(typeInput==='text'){
            checkValueInput(input,NOT_NULL)
        }
        if(typeInput==='file'){
            if(input.files[0]){
                if(input.files[0].length===0) input.classList.add('is-invalid')
            }
            else input.classList.add('is-invalid')
        }


    })
    listAll.forEach(input =>{
        input.classList.contains('is-valid') && count ++
    })
    return count===listAll.length
}
function renderUILoading(dom){
    dom.innerHTML =`<div class="d-flex justify-content-center">
        <div class="spinner-border spinner-border-sm " role="status">
          <span class="visually-hidden">Loading...</span>
        </div>
      </div>`
}

function  uploadFile() {
    let form = document.querySelector('.form-upload')
    let formData = new FormData(form)
    axios({
        method: "post",
        url: "/addMusic",
        data: formData,
        headers: { "Content-Type": "multipart/form-data" },
    }).then(res => console.log(res.data))
      .catch(err => console.log(err))
}







