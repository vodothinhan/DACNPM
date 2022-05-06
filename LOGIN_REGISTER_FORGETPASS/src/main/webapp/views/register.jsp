<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/6/2022
  Time: 3:17 PM
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="<c:url value="/resource/style/login.css" />" rel="stylesheet">
    <title>Đăng kí tài khoản</title>
</head>

<body>

<div class="container-form">
    <form class="needs-validation" action="/register/add" novalidate method="post">
        <div class="form-login bg-body rounded shadow p-5 ">
            <h1 class="display-5 mb-5">Đăng kí tài khoản</h1>
            <div class="mb-4">
                <label for="Email" class="form-label">Email*</label>
                <input type="email" name="email" class="form-control input1 ${not empty checkEmail?"is-invalid":""}" id="Email" value="${email==null?"":email}" required placeholder="Email">
                <c:if test="${checkEmail==null}">
                    <div class="invalid-feedback">
                        Trường này phải là email !
                    </div>
                </c:if>
                <c:if test="${checkEmail==true}">
                    <div class="invalid-feedback">
                        Email đã tồn tại !
                    </div>
                </c:if>
            </div>
            <div class="mb-4">
                <label for="password" class="form-label">Mật khẩu*</label>
                <input type="password" name="pass" class="form-control" id="password" required placeholder="Mật khẩu">
                <div class="invalid-feedback">
                    Trường này không được trống !
                </div>
            </div>
            <div class="mb-4">
                <label for="re-password" class="form-label">Nhập lại mật khẩu*</label>
                <input type="password" class="form-control" id="re-password" required placeholder="Mật khẩu">
                <div class="invalid-feedback">
                    Trường này không được trống !
                </div>
            </div>
            <div class="d-flex  mb-4">
                <div class="form-check me-4">
                    <input class="form-check-input"  value="male" type="radio" name="gender" id="flexRadioDefault1"
                           checked>
                    <label class="form-check-label" for="flexRadioDefault1">
                        Nam
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio"  name="gender" value="female" id="flexRadioDefault2">
                    <label class="form-check-label" for="flexRadioDefault2">
                        Nữ
                    </label>
                </div>

            </div>
            <div class="d-flex justify-content-between mb-4">




                <select  name="day" style="width: 100px;" class="form-select form-select-sm" id="validationServer04"
                        aria-describedby="validationServer04Feedback" required>
                    <option selected disabled  value="">Ngày</option>
                    <option  value="20">20</option>
                </select>
                <div>/</div>
                <select name="month" style="width: 100px;" class="form-select form-select-sm" id="validationServer05"
                        aria-describedby="validationServer04Feedback" required>
                    <option selected disabled  value="">Tháng</option>
                    <option  value="11">11</option>
                </select>
                <div>/</div>
                <select name="year" style="width: 100px;" class="form-select  form-select-sm" id="validationServer06"
                        aria-describedby="validationServer04Feedback" required>
                    <option selected disabled value="">Năm</option>
                    <option  value="2000">2000</option>
                </select>



            </div>


            <div class="col-12">
                <button class="btn btn-primary" type="submit">Đăng kí</button>
            </div>
        </div>

    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
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