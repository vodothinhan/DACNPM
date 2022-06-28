$(document).ready(function () {
    var table = $('#table-author').DataTable({
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
            { orderable: false, targets: 2 }
        ], dom: '<"overflow-auto"lf><B>rtip',
        buttons: [
            {
                text: 'Xóa tác giả',
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
                            return fetch("/deleteAuthor",{
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
                text: 'Thêm tác giả',
                className : 'btn btn-success btn-sm ms-4',
                action: async function (e, dt, node, config) {
                    const {value: author} = await Swal.fire({
                        title: 'Thêm mới tác giả',
                        input: 'text',
                        inputLabel: 'Vui lòng nhập tên tác giả:',
                        inputPlaceholder: 'Điền tên tác giả ở đây!',
                        showCancelButton: true,
                        cancelButtonColor: '#d33',
                        cancelButtonText: 'Hủy bỏ'
                    })
                    if (author) {
                        fetch("/addAuthor", {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: author
                        })
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error(response.statusText)
                                }
                                return response.json()
                            }).then((result) => {
                            if (result) {
                                if (result.data) {
                                    table.row.add([`<div class="form-check no-switch-parent"><input class="form-check-input no-switch" type="checkbox" value=${result.data.id}>
                                    <label class="form-check-label" >
                                            ${result.data.id}
                                    </label></div>`, result.data.name, `<i class="fa-solid fa-pen-to-square" data-name = ${result.data.name} data-id=${result.data.id}></i>`]).draw()
                                    Swal.fire(
                                        'Đã thêm',
                                        'Bạn đã thêm thành công',
                                        'success'
                                    )
                                }
                            }
                        })
                            .catch(error => {
                                Swal.showValidationMessage(
                                    "Thêm không thành công !"
                                )
                            })
                    }
                }
            }
        ]
    });

    function  countChecked(){
        return $(".selected").length
    }
    $("#table-author").on("click" ,".no-switch",function (){
        let checked = $(this).prop("checked")
        checked ? $(this).parents('tr').addClass('selected') : $(this).parents('tr').removeClass('selected')
        countChecked()===0?$(".btn-danger").addClass("disabled"):$(".btn-danger").removeClass("disabled")
    })

    $("#table-author").on("click",".fa-solid.fa-pen-to-square",async function () {
        let object = {id : $(this).attr('data-id'),
            name : $(this).attr('data-name') }
        let  row = $(this).parents('tr')[0]
        let name = $(this).attr('data-name')
        console.log(JSON.stringify(object))

        const {value: author} = await Swal.fire({
            title: 'Chỉnh sửa tên tác giả',
            input: 'text',
            inputLabel: 'Vui lòng nhập tên mới cho tác giả:',
            inputPlaceholder: 'Điền tên mới cho tác giả ở đây!',
            showCancelButton: true,
            cancelButtonColor: '#d33',
            cancelButtonText: 'Hủy bỏ',
            inputValidator: (value) => {
                if(value===name)
                    return 'Vui lòng điền tên khác!'
                if(!value){
                    return 'Vui lòng điền tên vào ô trống!'
                }
            }
        })

        if (author && !(name===author) && !(author==="")) {
            object.name = author;
            fetch("/updateAuthor", {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(object)
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error(response.statusText)
                    }
                    return response.json()
                }).then((result) => {
                if (result) {
                    if (result.data) {
                        table.row(table.row(row).index()).data([`<div class="form-check no-switch-parent"><input class="form-check-input no-switch" type="checkbox" value=${result.data.id}>
                                    <label class="form-check-label" >
                                            ${result.data.id}
                                    </label></div>`,result.data.name,`<i class="fa-solid fa-pen-to-square" data-name = ${result.data.name} data-id=${result.data.id}></i>`]).draw();
                        Swal.fire(
                            'Đã chỉnh sửa',
                            'Bạn đã chỉnh sửa thành công',
                            'success'
                        )
                    }
                }
            })
                .catch(error => {
                    Swal.showValidationMessage(
                        "Chỉnh sửa không thành công !"
                    )
                })
        }
    })
});