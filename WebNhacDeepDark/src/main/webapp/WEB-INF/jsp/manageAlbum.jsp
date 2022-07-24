<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/25/2022
  Time: 3:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
    <link  rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
    <title>Quản lí Album</title>
</head>
<style>
    .container-table{
        display: flex;
        justify-content: center;
        align-content: center;
    }
    .header-manage{
        display: grid;
        grid-template-columns: repeat(1 , 1fr);
        grid-gap: 20px;
        padding: 20px;
        border-top: solid 1px #eee;
    }
    .header-manage h3{

        color: #ddd;
    }

    .header-manage div{
        position: relative;
    }

</style>

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
        <div class="header-manage">
            <a href="/admin/add-album" class="d-none direct-page-add-album"></a>
            <h3>Quản lí Album</h3>
        </div>
       <c:if test="${add==true}">
           <div class="d-flex justify-content-center align-items-center">
               <div class="alert alert-success" style="width: 90% ; font-size: 20px" role="alert">
                   Thêm album thành công
               </div>
           </div>
       </c:if>
        <c:if test="${edit==true}">
            <div class="d-flex justify-content-center align-items-center">
                <div class="alert alert-success" style="width: 90% ; font-size: 20px" role="alert">
                    Chỉnh sửa album thành công
                </div>
            </div>
        </c:if>
        <div class="container-table">
            <div style="width: 90% ; padding: 10px ; background: #FFFFFF" >
                <table id="table-album" class="table table-striped" style="width:100%">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Tên album</th>
                        <th>Ngày ra mắt</th>
                        <th>Tên tác giả</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="album" items="${listAlbum}">
                        <tr >
                            <td>
                                <div class="form-check no-switch-parent">
                                    <input class="form-check-input no-switch" type="checkbox" value="${album.id}">
                                    <label class="form-check-label" >
                                            ${album.id}
                                    </label>
                                </div>
                            </td>
                            <td>${album.name}</td>
                            <td>
                                <fmt:formatDate pattern = "dd-MM-yyyy"
                                                value = "${album.dateReleased}" />
                            </td>
                            <td>${album.author.name}</td>
                            <td><a href="/admin/edit-album?id=${album.id}"><i class="fa-solid fa-pen-to-square"></i></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>

                </table>

            </div>
        </div>



    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
</script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="/js/admin/common.js"></script>
<script src="/js/admin/album.js"></script>


</body>

</html>

