$(document).ready(function () {
    let listAuthor = []
    let forms = $('.needs-validation')
    forms.each(function (){
        $(this).on("submit" , function (event){
            if (!this.checkValidity()) {
                event.preventDefault()
                event.stopPropagation()
                $(this).addClass('was-validated')
            }

        })
    })

    function renderAuthor(list){
        let str = ''
        $.each(list , function (index , value){
            str += `<li data-id =${value.id}  class="dropdown-item " style="cursor: pointer">${value.name}</li>`
        })
        $('.dropdown-menu').html(str)
    }
    function filterAuthor(list, strFilter){
        let listFiltered = []
        if(strFilter.trim().length===0) return list
        $.each(list , function (index , value){
            if(value.name.includes(strFilter)) listFiltered.push(value)
        })
        return listFiltered
    }
    $('#validationCustom04').on('input'  , function (){
        renderAuthor(filterAuthor(listAuthor,$(this).val()))
        $('.idAuthor').attr('value' , '')
    })
    if($('.alert.alert-danger')) {
        setTimeout(() =>{
            $('.alert.alert-danger').hide('fast')
        },5000)
    }

    $(document).on("click", function (event){
            let target = $(event.target)
            if(target.hasClass('validationCustom04')){
                $('.dropdown-menu').show()
                $.ajax({
                    url : "/getAllAuthor",
                    success : function (result){
                        renderAuthor(result.data)
                        listAuthor = result.data
                    } ,
                    dataType : 'json' ,

                })
            }else {
                if(target.hasClass('dropdown-item')){
                    $('.idAuthor').attr('value' , target.attr('data-id'))
                    $('.validationCustom04').val(target.text())
                    $('.dropdown-menu').hide()
                }else $('.dropdown-menu').hide()
            }

        }
    )
})