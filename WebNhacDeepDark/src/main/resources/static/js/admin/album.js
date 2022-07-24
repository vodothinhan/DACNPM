$(document).ready(function () {
  $('#table-album').DataTable({
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
            { orderable: false, targets: 4},
        ], dom: '<"overflow-auto"lf><B>rtip',
        buttons: [
            {
                text: 'Xóa album',
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
                            return fetch("/deleteAlbum",{
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
                text: 'Thêm album',
                className : 'btn btn-success btn-sm ms-4',
                action: function ( e, dt, node, config ) {
                    $(".direct-page-add-album").trigger("click")
                }
            }
        ]
    });
    $(".direct-page-add-album").on("click" , function (){
        let url = $(this).attr("href")
        $(location).attr("href", url)
    })

    function  countChecked(){
        return $(".selected").length
    }
    $("#table-album").on("click" ,".no-switch",function (){
        let checked = $(this).prop("checked")
        checked ? $(this).parents('tr').addClass('selected') : $(this).parents('tr').removeClass('selected')
        countChecked()===0?$(".btn-danger").addClass("disabled"):$(".btn-danger").removeClass("disabled")
    })
    if($('.alert-success')){
        setTimeout(()=>{
            $('.alert-success').hide('fast')
        },5000)
    }

});