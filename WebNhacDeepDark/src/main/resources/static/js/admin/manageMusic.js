$(document).ready(function () {
   var table = $('#table-song').DataTable({
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
                            "Thay đổi trạng thái không thành công !"
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
                    check.attr("checked" , true)
                }

            }
        })

    })

});