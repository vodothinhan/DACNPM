
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/12/2022
  Time: 6:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <a href="/admin/manage-user">
                    <span class="icon"><i class="fa fa-address-book" aria-hidden="true"></i> </span>
                    <span class="title">Quản lí tài khoản</span>
                </a>

            </li>
            <li>
                <a href="/admin/manage-song">
                    <span class="icon"> <i class="fa-solid fa-message" aria-hidden="true"></i></span>
                    <span class="title">Quản lí bài hát</span>
                </a>
            </li>
            <li>
                <a href="/admin/manage-album">
                    <span class="icon"><i class="fa-solid fa-circle-question"></i> </span>
                    <span class="title">Quản lí album</span>
                </a>
            </li>
            <li>
                <a href="/admin/manage-singer">
                    <span class="icon"> <i class="fa-solid fa-key"></i> </span>
                    <span class="title">Quản lí ca sĩ</span>
                </a>
            </li>
            <li>
                <a href="/admin/manage-author">
                    <span class="icon"> <i class="fa-solid fa-atom"></i> </span>
                    <span class="title">Quản lí tác giả </span>
                </a>
            </li>
            <li>
                <a href="/admin/manage-contact">
                    <span class="icon">   <i class="fa-solid fa-box"></i> </span>
                    <span class="title">Quản lí liên hệ </span>
                </a>
            </li>
            <li>
                <a href="/logout">
                    <span class="icon"> <i class="fa-solid fa-right-from-bracket"></i></span>
                    <span class="title">Đăng xuất</span>
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
                <img src="/img/avatar.jpg" alt="">
            </div>

        </div>
        <nav class="p-2" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Quản lí nhạc</a></li>
                <li class="breadcrumb-item active" aria-current="page">Thêm nhạc</li>
            </ol>
        </nav>
        <c:if test="${editSong==false}">
            <div class="d-flex justify-content-center align-items-center">
                <div class="alert alert-danger"  role="alert">
                    Chỉnh sửa bài hát không thành công
                </div>
            </div>
        </c:if>
        <div class="d-flex justify-content-center align-content-center my-2">
            <form:form modelAttribute="song" method="post" action="/admin/edit-song" class="form-upload shadow-sm rounded-3 novalidate">
                <form:hidden path="idSong"/>
                <div class="form-music">
                    <h1 class="display-6 text-center">Chỉnh sửa bài hát</h1>
                    <div class="alert alert-success d-none" role="alert">
                        Thêm bài hát thành công
                    </div>
                    <div class="alert alert-danger d-none" role="alert">
                        Thêm bài hát không thành công
                    </div>
                    <div class="mb-2">
                        <label for="validationServer01" class="form-label">Tên bài hát</label>
                        <form:input path="nameSong" cssClass="form-control form-control-sm form-music-input input-value"/>
                        <div class="invalid-feedback">

                        </div>

                    </div>
                    <div class="mb-2">
                        <label for="validationServer01" class="form-label">Tên ca sĩ</label>
                        <form:input  path="nameSinger" cssClass="form-control form-control-sm form-music-input nameSinger" />
                        <form:hidden path="idSinger" cssClass="hidden-singer" />
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
                        <form:input  path="nameAuthor" cssClass="form-control form-control-sm form-music-input nameAuthor" id="validationServer01" />
                        <form:hidden path="idAuthor" cssClass="hidden-author" />
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
                        <form:input path="nameAlbum"  cssClass="form-control  nameAlbum" placeholder="Nhập tên album hiện có"
                               aria-label="Recipient's username" aria-describedby="button-addon2"/>
                        <form:hidden path="idAlbum" class="hidden-album"/>
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
                        <label  class="form-label">Thể loại</label>
                        <form:select path="typeSong" cssClass="form-select form-select-sm select-type-song">
                            <form:option selected="selected" disabled="disabled" value="">Loại nhạc</form:option>
                            <form:options items="${listType}"></form:options>
                        </form:select>

                        <div id="validationServer04Feedback" class="invalid-feedback err-type-song">
                            Vui lòng chọn thể loại nhạc !
                        </div>
                    </div>
                    <div class="mt-5">
                        <button class="btn btn-success me-4 btn-upload" type="submit">Chỉnh sửa bài hát</button>
                        <a href="/admin/manage-song" class="btn btn-danger" tabindex="-1" role="button" >Hủy bỏ</a>

                    </div>

                </div>

                <div class="form-album d-none">
                    <div class="mb-2">
                        <h1 class="display-6">Thêm Album mới</h1>
                        <label  class="form-label">Tên album</label>
                        <form:input path="nameNewAlbum" class="form-control form-control-sm input-value inputNameOfAlbum form-of-album" name="nameNewAlbum" />
                        <div class="invalid-feedback">

                        </div>

                    </div>
                    <div class="mb-2 ">
                        <label class="form-label">Tên tác giả</label>
                        <form:input path="nameAuthorNewAlbm" cssClass="form-control form-control-sm nameAuthorOfAlbum form-of-album"/>
                        <form:hidden path="idAuthorOfNewAlbum" cssClass="hidden-of-album" />
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
                        <div class="mt-2">
                            <label  class="form-label">Ngày ra mắt</label>
                        </div>
                        <div class="row mb-5">
                            <div class="col-3 position-relative">
                                <form:select path="day" cssClass="form-select album"  >
                                    <form:option selected="selected" disabled="disabled" value="">Ngày</form:option>
                                    <form:options items="${listDay}"></form:options>

                                </form:select>


                            </div>
                            <div class="col-1 h4">/</div>

                            <div class="col-3 position-relative">
                                <form:select  path="month" cssClass="form-select album" >
                                    <form:option selected="selected" disabled ="disabled" value="">Tháng</form:option>
                                    <form:options items="${listMonth}" ></form:options>

                                </form:select>

                            </div>
                            <div class="col-1 h4">/</div>
                            <div class="col-3">
                                <form:select path="year" cssClass="form-select album" >
                                    <form:option selected="selected" disabled="disabled" value="">Năm</form:option>
                                    <form:options items="${listYear}"></form:options>
                                </form:select>
                            </div>
                        </div>
                        <div class="mt-5">
                            <button class="btn btn-success me-4 btn-add-new-album">Thêm Album mới</button>
                            <button class="btn btn-danger cancel-new-album" >Hủy bỏ</button>

                        </div>

                    </div>
                </div>


            </form:form>
        </div>







    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/js/admin/common.js"></script>
<script src="/js/admin/editMusic.js"></script>
<script>
    if($('.alert-danger')){
        setTimeout(()=>{
            $('.alert-danger').hide('fast')
        },5000)
    }
</script>
</body>

</html>
