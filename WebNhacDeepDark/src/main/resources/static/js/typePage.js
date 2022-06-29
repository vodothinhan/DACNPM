$(document).ready(function () {
    $(".col-md-8.total-song").on("click",".music-btn.btn-playlist", function () {
        let idSong = $(this).attr('data-id');
        let idUser = $(this).attr('data-user');
        fetch("/updatePlaylist", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify([idSong,idUser])
        }).then(response => {
            if (!response.ok) {
                throw new Error(response.statusText)
            }
            return response.json()
        }).then((result) => {
            if (result) {
                if (result.data){
                    $(this).html('<button data-id="${song.id}" data-user="${sessionScope.user.id}" class="music-btn btn-playlist" style="height: 40px; width: 40px; background: #8e8e8e; color: #FFF; font-weight: 700; border: none; border-radius: 100%;">\n' +
                        '                <svg class="in-playlist" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" style="height: 25px; width: 25px;">\n' +
                        '                  <path d="M256 368C256 403.7 266.6 436.9 284.9 464.6L279.4 470.3C266.4 483.2 245.5 483.2 233.5 470.3L39.71 270.5C-16.22 212.5-13.23 116.6 49.7 62.68C103.6 15.73 186.5 24.72 236.5 75.67L256.4 96.64L275.4 75.67C325.4 24.72 407.3 15.73 463.2 62.68C506.1 100.1 520.7 157.6 507 208.7C484.3 198 458.8 192 432 192C334.8 192 256 270.8 256 368zM576 368C576 447.5 511.5 512 432 512C352.5 512 288 447.5 288 368C288 288.5 352.5 224 432 224C511.5 224 576 288.5 576 368zM476.7 324.7L416 385.4L387.3 356.7C381.1 350.4 370.9 350.4 364.7 356.7C358.4 362.9 358.4 373.1 364.7 379.3L404.7 419.3C410.9 425.6 421.1 425.6 427.3 419.3L499.3 347.3C505.6 341.1 505.6 330.9 499.3 324.7C493.1 318.4 482.9 318.4 476.7 324.7H476.7z"/>\n' +
                        '                </svg>\n' +
                        '            </button>');
                    Swal.fire(
                        'Đã thêm',
                        'Thêm thành công bài hát vào danh sách yêu thích',
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
    })
});