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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/login_otp_register/style.css">
    <title>Đăng nhập</title>
</head>
<body>

<div class="container-form">
    <form  novalidate action="/login" method="post">
        <div class="form-login bg-body rounded shadow p-5 ">
            <h1 class="display-5 mb-5">Đăng nhập</h1>

            <c:if test="${register==true}">
                <div class="alert alert-success" role="alert">
                    Bạn đã đăng kí tài khoản thành công
                </div>
            </c:if>
            <c:if test="${resetPass==true}">
                <div class="alert alert-success" role="alert">
                    Bạn đã  thay đổi mật khẩu thành công
                </div>
            </c:if>
            <c:if test="${login==false}">
                <div class="alert alert-danger" role="alert">
                    Thông tin đăng nhập không đúng !
                </div>
            </c:if>

            <div class="mb-4">
                <label for="Email" class="form-label">Email*</label>
                <input type="email" name="email" class="form-control  input-email" id="Email"  required placeholder="Email">
                <div class="invalid-feedback err-from-server">

                </div>
            </div>
            <div class="mb-4">
                <label for="password" class="form-label">Mật khẩu*</label>
                <input name="pass" type="password" class="form-control  input-pass" id="password" required placeholder="Mật khẩu">
                <div class="invalid-feedback">
                    Trường này không được trống !
                </div>
            </div>
            <div class="d-flex justify-content-between mb-4">
                <a href="/forgetpass" class="link-success">Quên mật khẩu</a>
                <a href="/register" class="link-success">Bạn chưa có tài khoản ?</a>
            </div>
            <div class="col-12">
                <button class="btn btn-primary btn-login" type="submit">Đăng nhập</button>
            </div>
        </div>

    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="/js/login_register_otp/login.js"></script>
</body>
</html>
