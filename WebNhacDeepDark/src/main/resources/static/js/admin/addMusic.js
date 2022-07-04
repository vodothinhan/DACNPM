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
const MAX_SIZE = 500*1024*1024
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
var selectTypesong = document.querySelector('.select-type-song')

btnAddNewAlbumOfAlbum.addEventListener('click' , (event) =>{
    event.preventDefault()
    let checkDate = false
    let count = 0
    document.querySelectorAll(".form-select.album").forEach(item =>{
        if (item.value.length===0) {
            item.classList.remove('is-valid')
            item.classList.add('is-invalid')
        }else {
            item.classList.remove('is-invalid')
            item.classList.add('is-valid')
            count++
        }

    })
    if(count===3) checkDate = true
    if(checkDate & checkAllPrevUpload(document.querySelectorAll('.form-of-album'))){
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
    inputCurrent=null
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
    document.querySelectorAll('.form-select.album').forEach((item) =>{
        item.value=''
        item.classList.remove('is-valid')
        item.classList.remove('is-invalid')
    })

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
    inputCurrent = null
    if(!checkAllPrevUpload(document.querySelectorAll(".form-music-input")) | !checkTypeSong()){
        return
    }
   let valueAlbum = document.querySelector('.form-control.nameAlbum').value

    if(valueAlbum.trim().length!==0){
        let str1 = hiddenAlbum.value.trim().length===0?false:true
        let str2 =  inputNameAuthorOfAlbum.value.trim().length===0?false:true
        if(str2||str1){
            uploadFile()
            return;
        }
        else {
            let  err = document.querySelector(".err-album")
            err.innerHTML=NOT_EXIST
            inputNameAlbum.classList.contains('is-valid')&&inputNameAlbum.classList.remove('is-valid')
            inputNameAlbum.classList.add('is-invalid')
            return;
        }
    }else uploadFile()



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
    // checkValueInput(inputNameAlbum, NOT_NULL)
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
            }

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
        UI +=`<li class="dropdown-item " style="cursor: pointer" data-id=${data.id}>${data.name}</li>`
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
            checkValueInput(elementInput, NOT_NULL)
        }
        let DOMParent = document.querySelector("."+classTagUl)
        removeClassCSS(DOMParent , 'show')
        if( inputCurrent && !inputCurrent.isEqualNode(target)){

            if(!inputCurrent.classList.contains('nameAlbum')) inputCurrent.classList.contains('nameAlbum')
        }

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
function  checkTypeSong(){
    if(selectTypesong.value.length===0){
        selectTypesong.classList.contains('is-valid') && selectTypesong.classList.remove('is-valid')
        selectTypesong.classList.add('is-invalid')
        return false
    }
    selectTypesong.classList.contains('is-invalid') && selectTypesong.classList.remove('is-invalid')
    selectTypesong.classList.add('is-valid')
    return  true
}

  function  uploadFile() {
    let form = document.querySelector('.form-upload')
    let formData = new FormData(form)
    let progress =  document.querySelector('.progress-bar')
      let progressBar =  document.querySelector('.progress')
      removeClassCSS(progressBar,'d-none')
      addClassCss(progressBar,'d-block')
      progress.innerHTML = "0%"
      progress.setAttribute("aria-valuenow", 0);
      progress.style.width = "0%";
      const  onUploadProgress = (event) =>{
        const percentage = Math.round(((100*event.loaded)/event.total)-1)
         progress.setAttribute('aria-valuenow' , percentage)
          progress.innerHTML = percentage + "%"
          progress.style.width = percentage + "%";
      }
    axios({
        method: "post",
        url: "/addMusic",
        data: formData,
        headers: { "Content-Type": "multipart/form-data" },
        onUploadProgress
    }).then(res => {
        let alterSucess = document.querySelector('.alert-success')
        removeClassCSS(progressBar , 'd-block')
        addClassCss(progressBar,'d-none')
        removeClassCSS(alterSucess , 'd-none')
        addClassCss(alterSucess,'d-block')
        resetForm()
        setTimeout(() =>{
            removeClassCSS(alterSucess , 'd-blobk')
            addClassCss(alterSucess,'d-none')
        } , 10000)
        console.log(res.data)
        }
    )
      .catch(err =>{
          let alterDanger = document.querySelector('.alert-danger')
          removeClassCSS(alterDanger , 'd-none')
          addClassCss(alterDanger,'d-block')
          setTimeout(() =>{
              removeClassCSS(alterDanger , 'd-blobk')
              addClassCss(alterDanger,'d-none')
          },10000)
          console.log(err)
      })
}

function resetForm(){
    document.querySelector('.form-upload').reset()
    let errs = document.querySelectorAll('.form-control')
    errs.forEach(err =>{
        err.classList.remove('is-valid')
        err.classList.remove('is-invalid')
    })
    selectTypesong.classList.remove('is-valid')
    selectTypesong.classList.remove('is-invalid')
    inputCurrent=null

}







