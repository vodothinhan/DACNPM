


<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/21/2022
  Time: 11:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <title>Đăng nhập</title>
</head>
<body>

<div class="form-login">

    <form class="form" method="post" action="">
        <h2 class="title-login">Đăng nhập</h2>
        <div class="content-form">
            <div class="label-input">
                <span>Tên đăng nhập</span>
                <span>Mật khẩu</span>
            </div>
            <div class="input-form">
                <input type="text" name="user"/>
                <input type="password" name="pass"/>
                <button class="btn-login">Đănh nhập</button>
            </div>
        </div>
    </form>
</div>

</body>
</html>
