<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/25/2022
  Time: 3:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/admin/fontawesome-free-6.0.0-web/css/all.css">
    <link rel="stylesheet" href="/css/admin/styleCommon.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Chỉnh sửa Album</title>
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
                <li class="breadcrumb-item"><a href="/admin/manage-album">Quản lí album</a></li>
                <li class="breadcrumb-item active" aria-current="page">Chỉnh sửa album</li>
            </ol>
        </nav>
        <div class="d-flex justify-content-center align-items-center">
            <div style="width: 600px" class="bg-white p-4 rounded shadow-sm">
                <form:form modelAttribute="album" cssClass="row  needs-validation" action="/admin/edit-album" novalidate="novalidate" method="post">
                    <form:hidden path="idAlbum"/>
                    <h1 class="display-6 text-center">Thêm Album</h1>
                    <c:if test="${edit==false}">
                        <div class="alert alert-danger" role="alert">
                            Chỉnh sửa album không thành công !
                        </div>
                    </c:if>
                    <div class="mb-2">
                        <label for="validationCustom03" class="form-label">Tên Album</label>
                        <form:input path="nameAlbum" type="text" cssClass="form-control" id="validationCustom03"  required="required"/>
                        <div class="invalid-feedback">
                            Trường này không được trống !
                        </div>
                    </div>
                    <div class="mb-2">
                        <label  for="validationCustom04" class="form-label">Tên tác giả</label>
                        <form:input path="nameAuthor" type="text" cssClass="form-control validationCustom04"  id="validationCustom04"  required="required"/>
                        <form:input path="idAuthor" cssClass="idAuthor" type="hidden"/>
                        <ul class="dropdown-menu " style="max-height:300px ; overflow-y: auto" aria-labelledby="dropdownMenuButton1">
                            <div class="text-center">
                                <div class="spinner-border spinner-border-sm " role="status">
                                    <span class="visually-hidden">Loading...</span>
                                </div>
                            </div>
                        </ul>
                        <div class="invalid-feedback">
                            Trường này không được trống !
                        </div>
                    </div>
                    <div>
                        <label  class="form-label">Ngày ra mắt</label>
                    </div>
                    <div class="row mb-5">
                        <div class="col-3 position-relative">
                            <form:select path="day" cssClass="form-select" required="required">
                                <form:option selected="selected" disabled="" value="">Ngày</form:option>
                                <form:options items="${listDay}" ></form:options>
                            </form:select>


                        </div>
                        <div class="col-1 h4">/</div>

                        <div class="col-3 position-relative">
                            <form:select  path="month" cssClass="form-select" required="required">
                                <form:option selected="selected" disabled="" value="">Tháng</form:option>
                                <form:options items="${listMonth}" ></form:options>
                            </form:select>

                        </div>
                        <div class="col-1 h4">/</div>
                        <div class="col-3">
                            <form:select path="year" cssClass="form-select" required="required">
                                <form:option selected="selected" disabled="disabled" value="">Năm</form:option>
                                <form:options items="${listYear}"></form:options>
                            </form:select>
                        </div>
                    </div>
                    <div class="col-12">
                        <button class="btn btn-success me-2" type="submit">Chỉnh sửa album</button>
                        <a href="/admin/manage-album" class="btn btn-danger  " tabindex="-1" role="button" >Hủy bỏ</a>
                    </div>
                </form:form>
            </div>
        </div>


    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
</script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/js/admin/common.js"></script>
<script src="/js/admin/editAlbum.js"></script>


</body>

</html>

