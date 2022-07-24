$(document).ready(function () {
  var table =  $('#table-contact').DataTable(
      { "language": {
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
          }, responsive: {
            details: false
        },
        columnDefs: [
            { orderable: false, targets: 4},
        ], dom: '<"overflow-auto"lf><B>rtip',
        buttons: [
            {
                text: 'Xóa contact',
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
                            return fetch("/deleteContact",{
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

        ]
    });


    function  countChecked(){
        return $(".selected").length
    }
    $("#table-contact").on("click" ,".no-switch",function (){
        let checked = $(this).prop("checked")
        checked ? $(this).parents('tr').addClass('selected') : $(this).parents('tr').removeClass('selected')
        countChecked()===0?$(".btn-danger").addClass("disabled"):$(".btn-danger").removeClass("disabled")
    })
    function format(d) {

        return (
            '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">' +
            '<tr>' +
            '<td>Nội dung:</td>' +
            '<td style="font-size: 18px ; padding-left: 20px">' +
            d[5] +
            '</td>' +
            '</tr>' +
            '</table>') ;
    }
    $('#table-contact tbody').on('click', 'td.dt-control', function () {
        var tr = $(this).closest('tr');
        var row = table.row(tr);

        if (row.child.isShown()) {
            row.child.hide();
            tr.removeClass('shown');
        } else {
            console.log(row.data())
            row.child(format(row.data())).show();
            tr.addClass('shown');
        }
    });

    $('.fa-solid.fa-comment-dots').on("click",function (){
        let id = $(this).attr('data-id')
        Swal.fire({
            title: `Phản hồi liên hệ`,
            text: "Nhập tin nhắn của bạn",
            icon: 'question',
            input: 'textarea',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Gửi',
            cancelButtonText: 'Hủy bỏ',
            showLoaderOnConfirm: true,
            inputValidator: (value) => {
                if (!value) {
                    return 'Bạn cần phải viết tin nhắn để gửi đi!'
                }
            },
            preConfirm: (message) => {
                return fetch("/replayContact",{
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify([id,message])
                })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error(response.statusText)
                        }
                        return response.json()
                    })
                    .catch(error => {
                        Swal.showValidationMessage(
                            "Gửi không thành công !"
                        )
                    })
            },
            allowOutsideClick: () => !Swal.isLoading()
        }).then((result) => {
            if (result.isConfirmed) {
                if (result.value.data){
                    Swal.fire(
                        'Đã gửi',
                        'Bạn đã gửi thành công',
                        'success'
                    )
                }

            }
        })
    })


});