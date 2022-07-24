$(document).ready(function () {
   var table = $('#table-song').DataTable({
       "language": {
           "lengthMenu": "Hiển thị _MENU_ dòng trong trang",
           "zeroRecords": "Không có kết quả tìm thấy!",
           "info": "Trang _PAGE_ trong tổng số _PAGES_ trang",
           "infoEmpty": "Không có trang",
           "infoFiltered": "(Lọc từ tổng số _MAX_ kết quả)",
           "search":         "Tìm kiếm:",
           "paginate": {
               "first":      "Đầu",
               "last":       "Cuối",
               "next":       "Tiếp theo",
               "previous":   "Trở về"
           }
       },
        columnDefs: [
            { orderable: false, targets: 9 },
            { orderable: false, targets: 8 }
        ], dom: '<"overflow-auto"lf><B>rtip',
        buttons: [
            {
                text: 'Xóa bài hát',
                className : 'btn btn-danger btn-sm disabled',
                action: function ( e, dt, node, config ) {
                    let array = []
                $(".no-switch-parent input:checked").each( function (){
                 array.push($(this).val())
                })
                    Swal.fire({
                        title: `Bạn có chắc chắn xóa ${countChecked()} dòng`,
                        text: "Bạn không thể khôi phục sau khi xóa",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Xóa',
                        cancelButtonText: 'Hủy bỏ',
                        showLoaderOnConfirm: true,
                        preConfirm: () => {
                            return fetch("/deleteSong",{
                                method: 'POST',
                                headers: {
                                    'Content-Type': 'application/json'
                                },
                                body: JSON.stringify(array)
                            })
                                .then(response => {
                                    if (!response.ok) {
                                        throw new Error(response.statusText)
                                    }
                                    return response.json()
                                })
                                .catch(error => {
                                    Swal.showValidationMessage(
                                        "Xóa không thành công !"
                                    )
                                })
                        },
                        allowOutsideClick: () => !Swal.isLoading()
                    }).then((result) => {
                        if (result.isConfirmed) {
                            if (result.value.data){
                                dt.rows( '.selected' )
                                    .remove()
                                    .draw();
                                $(".btn-danger").addClass("disabled")
                                Swal.fire(
                                    'Đã xóa',
                                    'Bạn đã xóa thành công',
                                    'success'
                                )
                            }

                        }
                    })

                }
            },
            {
                text: 'Thêm bài hát',
                className : 'btn btn-success btn-sm ms-4',
                action: function ( e, dt, node, config ) {
                    $(".direct-page-add-music").trigger("click")
                }
            }
        ]
    });
    $(".direct-page-add-music").on("click" , function (){
        let url = $(this).attr("href")
        $(location).attr("href", url)
    })

    function  countChecked(){
        return $(".selected").length
    }
    $("#table-song").on("click" ,".no-switch",function (){
       let checked = $(this).prop("checked")
        checked ? $(this).parents('tr').addClass('selected') : $(this).parents('tr').removeClass('selected')
        countChecked()===0?$(".btn-danger").addClass("disabled"):$(".btn-danger").removeClass("disabled")
    })
    $("#table-song .form-switch").on("click" , "input[type=checkbox]" , function (){
        let  id = $(this).val()
        let check = $(this)
        check.prop("checked" , !check.prop("checked"))
        Swal.fire({
            title: 'Bạn có chắc chắn thay đổi',
            text: "Trạng thái của bài hát này",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            showLoaderOnConfirm: true,
            confirmButtonText: 'Thay đổi',preConfirm: () => {
                return fetch("/update-status-song",{
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(id)
                })
                    .then(response => {
                        if (!response.ok) {

                            throw new Error(response.statusText)
                        }
                        return response.json()
                    })
                    .catch(error => {
                        Swal.showValidationMessage(
                           "Thay đổi trạng thái không thành công ! "
                        )
                    })
            },
            allowOutsideClick: () => !Swal.isLoading()
        }).then((result) => {
            if (result.isConfirmed) {
                if(result.value.data){
                    Swal.fire(
                        'Thành công',
                        'Bạn đã thay đổi trạng thái thành công',
                        'success'
                    )

                   if(result.value.data.status==="ACTIVE"){
                       check.prop("checked" , true)
                   }else  check.prop("checked" , false)

                }

            }
        })

    })
    if($('.alert-success')){
        setTimeout(()=>{
            $('.alert-success').hide('fast')
        },5000)
    }

    // upload mp3
    $('#table-song').on("click" , ".fa-solid.fa-video" , function (){
        let id = $(this).attr('data-id')
        Swal.fire({
            title: 'Upload file mp3',
            input :'file',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            showLoaderOnConfirm: true,
            confirmButtonText: 'Upload',
            inputValidator: (value) => {
                if (!value) return 'Bạn chưa chọn file upload'
                if(['video/mp3','video/mp4','audio/mpeg'].indexOf(value.type)===-1) return 'File không đúng định dạng'
            }
            ,preConfirm: (file) => {
                let form = new FormData()
                form.append('id' , id)
                form.append('file',file)
                return fetch("/edit-file-mp3",{
                    method: 'POST',
                    body: form
                })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error(response.statusText)
                        }
                        return response.json()
                    })
                    .catch(error => {
                        Swal.showValidationMessage(
                            "Upload file không thành công ! "
                        )
                    })
            },
            allowOutsideClick: () => !Swal.isLoading()
        }).then((result) => {
            if (result.isConfirmed) {
                if(result.value.data){
                    Swal.fire(
                        'Thành công',
                        'Bạn đã upload file thành công',
                        'success'
                    )
                }

            }
        })
    })
    $('#table-song').on("click",'.fa-solid.fa-image',function (){
        let linkImage = $(this).attr('data-image')
        let id = $(this).attr('data-id')
        Swal.fire({
            title: 'Thay đổi thumbnail',
            imageUrl: linkImage,
            input :'file',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            showLoaderOnConfirm: true,
            confirmButtonText: 'Upload',
            imageWidth: 300,
            imageHeight: 300,
            inputValidator: (value) => {
                if (!value) return 'Bạn chưa chọn file upload'
                if(['image/png', 'image/jpeg','image/jpeg'].indexOf(value.type)===-1) return 'File không đúng định dạng'
            },
            didOpen: () => {
                const inputRange = Swal.getInput()
                $(inputRange).on("change",function (event){
                     let file = event.target.files[0]
                        if(file) reader.readAsDataURL(file)
                })
                let reader = new FileReader();
                reader.onload = () =>{
                    Swal.update({ imageUrl: reader.result})
                }
            }
            ,preConfirm: (file) => {
                let formdata = new FormData()
                formdata.append('id',id)
                formdata.append('file',file)
                return fetch("/edit-file-thumbnail",{
                    method: 'POST',
                    body: formdata
                }).then(response => {
                    if (!response.ok) {
                        throw new Error(response.statusText)
                    }
                    return response.json()
                }).catch(error => {
                    Swal.showValidationMessage(
                        "Upload file không thành công ! "
                    )
                })
        }
        }).then(result =>{
            if (result.isConfirmed) {
                if(result.value.data){
                    Swal.fire(
                        'Thành công',
                        'Bạn đã upload file thành công',
                        'success'
                    )
                }
            }
        })
    })

});