
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
    <title>OTP</title>
</head>
<body>

<div class="container-form">
    <form class="needs-validation" action="" novalidate>
        <div class="form-login bg-body rounded shadow p-5 ">
            <h1 class="display-5 mb-5">Nhập mã OTP</h1>
           <c:if test="${sucess==true}">
               <div class="alert alert-success " role="alert">
                   Mã OTP gửi lại thành công
               </div>
           </c:if>
            <p class="lead text-center">
                Mã OTP đã được gửi về email <br/>
               ${email}
            </p>
            <div class="mb-4">
                <label for="Email" class="form-label">Mã OTP*</label>
                <input type="text" class="form-control input1" id="Email" required placeholder="Mã OTP" name="otp">
                <input name ="email" value="${email}" type="hidden"/>
                <div class="invalid-feedback">
                    Trường này không được trống !
                </div>
            </div>
            <div class="col-12">
                <button class="btn btn-primary" type="submit">Hoàn tất</button>
                <a href="<c:url value="/forgetpass/resetOTP?email=${email}"/>" class="link-dark d-inline-block ms-4">Gửi lại mã</a>
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