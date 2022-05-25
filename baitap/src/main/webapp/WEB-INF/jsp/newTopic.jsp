


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

    <link rel="stylesheet" type="text/css" href="/css/login/style.css">
    <title>Đăng nhập</title>
</head>
<body>

<form>
    <div class="login-form">
        <div class="login">
            <h1 class="title"> Đăng nhập</h1>
            <hr/>
            <div>
                <span>Tên đăng nhập</span>
                <input type="text" name="name" />

            </div>
            <div>
                <span>Mật khẩu</span>
                <input type="text" name="pass" />
            </div>
        </div>
        <div>
            <button type="submit" class="btn-login">Đăng nhập</button>
        </div>
    </div>

</form>
</body>
</html>
