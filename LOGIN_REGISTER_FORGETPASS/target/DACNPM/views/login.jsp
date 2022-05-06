<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/6/2022
  Time: 12:41 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="<c:url value="/resource/style/login.css" />" rel="stylesheet">
    <title>Đăng nhập</title>
</head>
<body>

<div class="container-form">
    <form class="needs-validation" action="/login"  method="post" novalidate>
        <div class="form-login bg-body rounded shadow p-5 ">
            <h1 class="display-5 mb-5">Đăng nhập</h1>
            <div class="mb-4">
                <label for="Email" class="form-label">Email*</label>
                <input type="email" name="email" class="form-control ${not empty email?"is-invalid":""} input1" id="Email" required placeholder="Email" value="${value==null?"":value}">
                <c:if test="${email==true}">
                    <div class="invalid-feedback">
                        Tài khoản không đúng !
                    </div>
                </c:if>

               <c:if test="${email==null}">
                   <div class="invalid-feedback">
                       Trường này phải là email !
                   </div>
               </c:if>
            </div>
            <div class="mb-4">
                <label for="password" class="form-label">Mật khẩu*</label>
                <input type="password" name="pass" class="form-control ${not empty pass?"is-invalid":""}" id="password" required placeholder="Mật khẩu">
                <c:if test="${pass==true}">
                    <div class="invalid-feedback">
                        Mật khẩu không đúng !
                    </div>
                </c:if>

                <c:if test="${pass==null}">
                    <div class="invalid-feedback">
                        Trường này không được trống !
                    </div>
                </c:if>

            </div>
            <div class="d-flex justify-content-between mb-4">
                <a href="<c:url value = "/forgetpass"/>" class="link-success">Quên mật khẩu</a>
                <a href="<c:url value = "/register"/>" class="link-success">Bạn chưa có tài khoản ?</a>
            </div>
            <div class="col-12">
                <button class="btn btn-primary" type="submit">Đăng nhập</button>
            </div>
        </div>

    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script>
    var forms = document.querySelectorAll('.needs-validation')
    Array.prototype.slice.call(forms)
        .forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }
                form.classList.add('was-validated')
            }, true)
        })
</script>
</body>
</html>