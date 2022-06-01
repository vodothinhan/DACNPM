<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/21/2022
  Time: 11:44 PM
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
    <title>Quên mật khẩu</title>
</head>
<body>
<div class="container-form">
    <form  method="post" novalidate action="/forgetpass">
        <div class="form-login bg-body rounded shadow p-5 ">
            <h1 class="display-5 mb-5">Quên mật khẩu</h1>
            <c:if test="${email==false}">
                <div class="alert alert-danger" role="alert">
                    Email không tồn tại !
                </div>
            </c:if>
            <c:if test="${sendMail==false}">
                <div class="alert alert-danger" role="alert">
                    Vui lòng thử lại trong vài phút !
                </div>
            </c:if>
            <div class="mb-4">
                <label for="Email" class="form-label">Email*</label>
                <input type="email" name="email" class="form-control input-email ${empty email?"":"is-invalid"}" id="Email"  placeholder="Email"
                value="${email==null?"":email}">
                <div class="invalid-feedback err-from-email">
                </div>
            </div>
            <div class="mb-4">
                <label for="password" class="form-label">Mật khẩu*</label>
                <input type="password" class="form-control input-pass" id="password"  placeholder="Mật khẩu">
                <div class="invalid-feedback err-from-pass">
                    Trường này không được trống !
                </div>
            </div>
            <div class="mb-4">
                <label for="repeat" class="form-label">Nhập lại mật khẩu*</label>
                <input name="pass" type="password" class="form-control repeat" id="repeat"  placeholder="Mật khẩu">
                <div class="invalid-feedback err-from-repeat">
                    Trường này không được trống !
                </div>
            </div>

            <div class="col-12">
                <button class="btn btn-primary btn-next" type="submit">Tiếp theo</button>
            </div>
        </div>

    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="/js/login_register_otp/forgetpass.js"></script>
</body>
</html>
