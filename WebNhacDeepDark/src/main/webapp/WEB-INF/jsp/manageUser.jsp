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
        <div class="d-flex justify-content-center align-content-center my-2">
            <table id="table_id" class="display">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Code recovery</th>
                        <th>Date of birth</th>
                        <th>Email</th>
                        <th>Gender</th>
                        <th>Password</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th>Time recovery</th>
                        <th>Block</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${listUser}">
                        <tr>
                            <th>${user.id==null?"" :user.id}</th>
                            <th>${user.codeRecovery==null?"" :user.codeRecovery}</th>
                            <th><fmt:formatDate pattern = "dd-MM-yyyy" value = "${user.dateOfBirth}" /></th>
                            <th>${user.email==null?"" :user.email}</th>
                            <th>${user.gender==null?"" :user.gender}</th>
                            <th>${user.password==null?"" :user.password}</th>
                            <th>${user.role==null?"" :user.role}</th>
                            <th>${user.status==null?"" :user.status}</th>
                            <th>${user.timeRecovery==null?"" :user.timeRecovery}</th>
                            <th>
                                <button style="border: none; background: none">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" style="height: 30px">
                                        <path d="M512 256C512 397.4 397.4 512 256 512C114.6 512 0 397.4 0 256C0 114.6 114.6 0 256 0C397.4 0 512 114.6 512 256zM99.5 144.8C77.15 176.1 64 214.5 64 256C64 362 149.1 448 256 448C297.5 448 335.9 434.9 367.2 412.5L99.5 144.8zM448 256C448 149.1 362 64 256 64C214.5 64 176.1 77.15 144.8 99.5L412.5 367.2C434.9 335.9 448 297.5 448 256V256z"/>
                                    </svg>
                                </button>
                            </th>
                            <th>
                                <button style="border: none; background: none">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" style="height: 30px">
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/js/admin/common.js"></script>
<script src="/js/admin/addMusic.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
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
            }
        });
    });
</script>
</body>

</html>
