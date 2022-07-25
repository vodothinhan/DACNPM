<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/22/2022
  Time: 12:17 AM
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
    <title>OTP</title>
</head>
<style>
    .spinner-reset-otp{
        display: none !important;
    }
    .spinner-reset-otp.active{
        display: inline-block !important;
    }
    .btn-reset-otp.active{
        display: none !important ;
    }
    .toast-success{
        display: none !important;
    }
    .toast-success.active{
        display: block !important;
    }
    .toast-danger{
        display: none !important;
    }

    .toast-danger.active{
        display: block !important;
    }

</style>
<body>

<div class="container-form">
    <form  method="post" novalidate action="/sendOTP">
        <div class="form-login bg-body rounded shadow p-5 ">
            <h1 class="display-5 mb-5">Nhập mã OTP</h1>
            <div class="alert alert-success toast-success" role="alert">
                Mã OTP gửi lại thành công
            </div>
            <div class="alert  alert-warning toast-danger" role="alert">
                Vui lòng đợi hết 1 phút để gửi lại mã
            </div>
            <c:if test="${timeCode==false}">
                <div class="alert alert-danger" role="alert">
                    Mã OTP đã quá hạn
                </div>
            </c:if>
            <c:if test="${code==false}">
                <div class="alert alert-danger" role="alert">
                    Mã OTP không chính xác
                </div>
            </c:if>
            <p class="lead text-center">
                Mã OTP đã được gửi về email <br/>
                ${email}
            </p>
            <div class="mb-4">
                <label for="otp" class="form-label">Mã OTP*</label>
                <input type="text" class="form-control input-otp" id="otp" required placeholder="Mã OTP" name="otp">
                <input name ="email" value="${email}" type="hidden"/>
                <input name ="pass" value="${pass}" type="hidden"/>
                <div class="invalid-feedback err-otp">
                    Trường này không được trống !
                </div>
            </div>
            <div class="col-12  spiner-reset">
                <button class="btn btn-primary btn-complete" type="submit">Hoàn tất</button>
                <div class="spinner-border spinner-border-sm ms-4 spinner-reset-otp" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
                <a href="/resetOTP?email=${email}" class="link-dark d-inline-block ms-4 btn-reset-otp">Gửi lại mã</a>
            </div>
        </div>

    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="/js/login_register_otp/otp.js"></script>
</body>
</html>