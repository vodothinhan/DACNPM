<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/12/2022
  Time: 6:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/admin/fontawesome-free-6.0.0-web/css/all.css">
    <link rel="stylesheet" href="/css/admin/styleCommon.css">
    <link rel="stylesheet" href="/css/admin/addMusic.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>AddMusic</title>
</head>

<body>
<div class="container-admin">

    <div class="navigation-admin">
        <ul>

            <li>
                <a href="#">
                    <span class="icon"><i class="fa-solid fa-music"></i></i></i> </span>
                    <span class="title">
                            <h2 style="line-height: 60px;">Admin</h2>
                        </span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon"><i class="fa fa-home" aria-hidden="true"></i> </span>
                    <span class="title">Dashboard</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon"><i class="fa fa-address-book" aria-hidden="true"></i> </span>
                    <span class="title">Customer</span>
                </a>

            </li>
            <li>
                <a href="#">
                    <span class="icon"> <i class="fa-solid fa-message" aria-hidden="true"></i></span>
                    <span class="title">Message</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon"><i class="fa-solid fa-circle-question"></i> </span>
                    <span class="title">Help</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon"> <i class="fa-solid fa-key"></i> </span>
                    <span class="title">PassWord</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon"> <i class="fa-solid fa-right-from-bracket"></i></span>
                    <span class="title">Sign Out</span>
                </a>
            </li>
        </ul>

    </div>
    <div class="main">
        <div class="topbar">
            <div class="toggle" onclick="toggleMenu()"></div>
            <div class="search">
                <label >
                    <input type="text" placeholder="Search here">
                    <i class="fa-solid fa fa-magnifying-glass"></i>
                </label>

            </div>
            <div class="user">
                <img src="image/pexels-kateryna-babaieva-2853422.jpg" alt="">
            </div>

        </div>
        <nav class="p-2" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Quản lí nhạc</a></li>
                <li class="breadcrumb-item active" aria-current="page">Thêm nhạc</li>
            </ol>
        </nav>
        <div class="d-flex justify-content-center align-content-center my-2">
            <form class="form-upload shadow-sm rounded-3 novalidate">
                <div class="form-music">
                    <div class="progress d-none">
                        <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25"
                             aria-valuemin="0" aria-valuemax="100">25%</div>
                    </div>
                    <div class="mb-2">
                        <label for="validationServer01" class="form-label">Tên bài hát</label>
                        <input type="text" class="form-control form-control-sm form-music-input input-value" name="nameSong" >
                        <div class="invalid-feedback">

                        </div>

                    </div>
                    <div class="mb-2">
                        <label for="validationServer01" class="form-label">Tên ca sĩ</label>
                        <input type="text" class="form-control form-control-sm form-music-input nameSinger" name="nameSinger"/>
                        <input class="hidden-singer" type="hidden" name="idSinger"/>
                        <div class="dropdown ">
                            <ul class="dropdown-menu  ps-2 displaySinger"
                                style="overflow-y: auto; max-height: 200px;">
                                <div class="d-flex justify-content-center">
                                    <div class="spinner-border spinner-border-sm" role="status">
                                        <span class="visually-hidden">Loading...</span>
                                    </div>
                                </div>

                            </ul>
                        </div>
                        <div class="invalid-feedback">

                        </div>


                    </div>
                    <div class="mb-2">
                        <label for="validationServer01" class="form-label">Tên tác giả</label>
                        <input type="text" class="form-control form-control-sm form-music-input nameAuthor" id="validationServer01" name="nameAuthor">
                        <input class="hidden-author" type="hidden" name="idAuthor">
                        <div class="dropdown">
                            <ul class="dropdown-menu  ps-2 displayAuthor"
                                style="overflow-y: auto; max-height: 200px;">
                                <div class="d-flex justify-content-center">
                                    <div class="spinner-border spinner-border-sm" role="status">
                                        <span class="visually-hidden">Loading...</span>
                                    </div>
                                </div>
                            </ul>
                        </div>
                        <div class="invalid-feedback">

                        </div>

                    </div>
                    <label  class="form-label">Album</label>
                    <div class="input-group input-group-sm mb-2">
                        <input type="text" class="form-control form-music-input nameAlbum" placeholder="Nhập tên album hiện có"
                               aria-label="Recipient's username" aria-describedby="button-addon2">
                        <input class="hidden-album" type="hidden" name="idAlbum">
                        <button class="btn btn-success add-new-album" type="button" id="button-addon2">Thêm album mới</button>
                        <div class="invalid-feedback err-album">

                        </div>
                    </div>
                    <div class="dropdown">
                        <ul class="dropdown-menu ps-2 displayAlbum"
                            style="overflow-y: auto; max-height: 200px; margin-top: -8px;">
                            <div class="d-flex justify-content-center">
                                <div class="spinner-border spinner-border-sm" role="status">
                                    <span class="visually-hidden">Loading...</span>
                                </div>
                            </div>
                        </ul>
                    </div>




                    <div class="mb-2">
                        <label for="validationServer04" class="form-label">Thể loại</label>
                        <select name="typeSong" class="form-select form-select-sm " id="validationServer04" aria-describedby="validationServer04Feedback" required>
                            <option selected disabled value="">Choose...</option>
                            <c:forEach var="item" items="${listType}">
                                <option value="${item}">${item}</option>
                            </c:forEach>

                        </select>
                        <div id="validationServer04Feedback" class="invalid-feedback">
                            Vui lòng chọn thể loại nhạc !
                        </div>
                    </div>
                    <div class="mb-2">
                        <label  class="form-label">Thumbnail</label>
                        <input type="file" class="form-control form-control-sm file-thumbnail form-music-input" name="fileThumbnail"
                               enctype="multipart/form-data" aria-label="file example" >
                        <div class="invalid-feedback"></div>
                    </div>
                    <div class="mb-5">
                        <label  class="form-label">File music</label>
                        <input type="file" class="form-control form-control-sm file-music form-music-input" name="fileMusic"
                               enctype="multipart/form-data" aria-label="file example">
                        <div class="invalid-feedback"></div>
                    </div>

                    <div>
                        <button class="btn btn-success me-4 btn-upload" type="submit">Thêm bài hát</button>
                        <button class="btn btn-danger" type="submit">Reset form</button>

                    </div>

                </div>

                <div class="form-album d-none">
                    <div class="mb-2">
                        <h1 class="display-6">Thêm Album mới</h1>
                        <label  class="form-label">Tên album</label>
                        <input type="text" class="form-control form-control-sm input-value inputNameOfAlbum" name="nameNewAlbum" >
                        <input class="hidden-of-album" type="hidden"/>
                        <div class="invalid-feedback">

                        </div>

                    </div>
                    <div class="mb-2 ">
                        <label class="form-label">Tên tác giả</label>
                        <input type="text" class="form-control form-control-sm nameAuthorOfAlbum" name="nameAuthorNewAlbm">
                        <div class="dropdown">
                            <ul class="dropdown-menu  ps-2 display-form-author" style="overflow-y: auto; max-height: 200px;">
                                <div class="d-flex justify-content-center">
                                    <div class="spinner-border spinner-border-sm" role="status">
                                        <span class="visually-hidden">Loading...</span>
                                    </div>
                                </div>

                            </ul>
                        </div>
                        <div class="invalid-feedback">

                        </div>
                        <div class="mt-5">
                            <button class="btn btn-success me-4 btn-add-new-album">Thêm Album mới</button>
                            <button class="btn btn-danger cancel-new-album" >Hủy bỏ</button>

                        </div>

                    </div>
                </div>


            </form>
        </div>







    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/js/admin/common.js"></script>
<script src="/js/admin/addMusic.js"></script>
</body>

</html>