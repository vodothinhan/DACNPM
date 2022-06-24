<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/12/2022
  Time: 6:20 PM
  To change this template use File | Settings | File Templates.
--%>
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
    <link rel="stylesheet" href="/css/admin/addMusic.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        .dataTables_wrapper{
            width: 70%;
        }
    </style>
    <title>Manage User</title>
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
                <li class="breadcrumb-item"><a href="#">Quản lí tài khoản</a></li>
                <li class="breadcrumb-item active" aria-current="page">Thông tin tài khoản</li>
            </ol>
        </nav>
        <div class="container">
            <div class="row align-items-start">
                <div class="d-flex justify-content-center align-content-center my-2" >
                        <table id="table_id" class="display" >
                            <thead>
                            <tr>
                                <th>Id</th>
                                <th>Name</th>
                                <th>Update</th>
                                <th>Delete</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="singer" items="${listSinger}">
                                <tr>
                                    <th>${singer.id==null?"" :singer.id}</th>
                                    <th>${singer.name==null?"" :singer.name}</th>
                                    <th>
                                        <button style="border: none; background: none">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" style="height: 20px">
                                                <path d="M368.4 18.34C390.3-3.526 425.7-3.526 447.6 18.34L493.7 64.4C515.5 86.27 515.5 121.7 493.7 143.6L437.9 199.3L312.7 74.06L368.4 18.34zM417.4 224L371.4 377.3C365.4 397.2 350.2 413 330.5 419.6L66.17 508.2C54.83 512 42.32 509.2 33.74 500.9L187.3 347.3C193.6 350.3 200.6 352 207.1 352C234.5 352 255.1 330.5 255.1 304C255.1 277.5 234.5 256 207.1 256C181.5 256 159.1 277.5 159.1 304C159.1 311.4 161.7 318.4 164.7 324.7L11.11 478.3C2.809 469.7-.04 457.2 3.765 445.8L92.39 181.5C98.1 161.8 114.8 146.6 134.7 140.6L287.1 94.6L417.4 224z"/>
                                            </svg>
                                        </button>
                                    </th>
                                    <th>
                                        <button style="border: none; background: none">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" style="height: 20px">
                                                <path d="M135.2 17.69C140.6 6.848 151.7 0 163.8 0H284.2C296.3 0 307.4 6.848 312.8 17.69L320 32H416C433.7 32 448 46.33 448 64C448 81.67 433.7 96 416 96H32C14.33 96 0 81.67 0 64C0 46.33 14.33 32 32 32H128L135.2 17.69zM394.8 466.1C393.2 492.3 372.3 512 346.9 512H101.1C75.75 512 54.77 492.3 53.19 466.1L31.1 128H416L394.8 466.1z"/>
                                            </svg>
                                        </button>
                                    </th>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/js/admin/common.js"></script>
<script src="/js/admin/addMusic.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
<script>
    $(document).ready(function () {
       $('#table_id').DataTable({
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
           dom: '<<"overflow-auto"fl><"overflow-auto"><"float-none"B>rtip>',
           buttons: [
               {
                   text: "Add",
                   "className": 'btn btn-primary',
                   action: function ( e, dt, node, config ) {
                       dt.button().add( 1, {
                           text: 'Button '+(counter++),
                           action: function () {
                               this.remove();
                           }
                       } );
                   }
               },
               {
                   text: "Update",
                   action: function ( e, dt, node, config ) {
                       dt.button().add( 1, {
                           text: 'Button '+(counter++),
                           action: function () {
                               this.remove();
                           }
                       } );
                   }
               }
           ]
        });
    });


</script>
</body>

</html>
