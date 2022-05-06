<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/6/2022
  Time: 5:13 PM
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
    <link href="<c:url value="/resource/style/login.css" />" rel="stylesheet">
    <title>Quên mật khẩu</title>
</head>
<body>
<div class="container-form">
    <form class="needs-validation" action="/forgetpass/reset" method="post" novalidate>
        <div class="form-login bg-body rounded shadow p-5 ">
            <h1 class="display-5 mb-5">Quên mật khẩu</h1>
            <div class="mb-4">
                <label for="Email" class="form-label">Email*</label>
                <input type="email" name="email" class="form-control input1 ${not empty email?"is-invalid":""}" id="Email" required placeholder="Email" value="${email==null?"":email}"/>
               <c:if test="${checkEmail==null}">
                   <div class="invalid-feedback">
                       Trường này phải là email !
                   </div>
               </c:if>
                <c:if test="${checkEmail==true}">
                    <div class="invalid-feedback">
                        Email này không tồn tại !
                    </div>
                </c:if>
            </div>

            <div class="col-12">
                <button class="btn btn-primary" type="submit">Tiếp theo</button>
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
