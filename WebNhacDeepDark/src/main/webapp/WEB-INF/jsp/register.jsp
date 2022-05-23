<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/21/2022
  Time: 11:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/login_otp_register/style.css">
    <title>Đăng kí tài khoản</title>
</head>

<body>

<div class="container-form">
    <form:form modelAttribute="user" action="/register" novalidate="" method="post">
        <div class="form-login bg-body rounded shadow p-5 ">
            <h1 class="display-5 mb-5">Đăng kí tài khoản</h1>
            <c:if test="${internal==true}">
                <div class="alert alert-danger" role="alert">
                   Bạn hãy thử lại sau vài phút nữa !
                </div>
            </c:if>
<%--            <spring:bind path="email">--%>
<%--                <div class="mb-4">--%>
<%--                    <label for="Email" class="form-label">Email*</label>--%>
<%--                    <form:input type="email" path="email" cssClass="form-control input-email" id="Email"  placeholder="Email"/>--%>
<%--                    <form:errors path="email" cssClass="invalid-feedback err-from-email" />--%>
<%--                </div>--%>
<%--            </spring:bind>--%>
            <div class="mb-4">
                <label for="Email" class="form-label">Email*</label>
                <form:input type="email" path="email" cssClass="form-control input-email" id="Email"  placeholder="Email"/>
                <div class="invalid-feedback err-from-email">
                    Trường này phải là email !
                </div>
            </div>
            <div class="mb-4">
                <label for="password" class="form-label">Mật khẩu*</label>
                <form:password  path="pass" cssClass="form-control input-pass" id="password"  placeholder="Mật khẩu"/>
                <div class="invalid-feedback err-from-pass">
                    Trường này không được trống !
                </div>
            </div>
            <div class="mb-4">
                <label for="repeat" class="form-label">Nhập lại mật khẩu*</label>
                <input type="password" class="form-control repeat" id="repeat"  placeholder="Mật khẩu">
                <div class="invalid-feedback err-from-repeat">
                    Trường này không được trống !
                </div>
            </div>
            <div class="d-flex  mb-4">
                <div class="form-check me-4">
                    <form:radiobutton path="gender" cssClass="form-check-input" value="male" id="flexRadioDefault1" checked="checked"/>
                    <label class="form-check-label" for="flexRadioDefault1">
                        Nam
                    </label>
                </div>
                <div class="form-check">
                    <form:radiobutton path="gender" cssClass="form-check-input"  value="female" id="flexRadioDefault2"/>
                    <label class="form-check-label" for="flexRadioDefault2">
                        Nữ
                    </label>
                </div>

            </div>
            <div class="d-flex justify-content-between mb-4">




                <form:select path="day" style="width: 100px;" class="form-select form-select-sm date"
                        aria-describedby="validationServer04Feedback" required="">
                    <form:option  selected="selected" disabled="" value="">Ngày</form:option>
                    <form:options items="${listDay}"></form:options>

                </form:select>
                <div>/</div>
                <form:select path="month" style="width: 100px;" class="form-select form-select-sm date"
                        aria-describedby="validationServer04Feedback" required="">
                    <form:option  selected="selected" disabled ="" value=" ">Tháng</form:option>
                    <form:options items="${listMonth}"></form:options>

                </form:select>
                <div>/</div>
                <form:select path="year" style="width: 100px;" class="form-select  form-select-sm date" id="validationServer04"
                        aria-describedby="validationServer04Feedback" required="">
                    <form:option  selected="selected" disabled="" value=" ">Năm</form:option>
                    <form:options items="${listYear}"></form:options>

                </form:select>



            </div>


            <div class="col-12">
                <button class="btn btn-primary btn-register" type="submit">Đăng kí</button>
            </div>
        </div>

    </form:form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script src="/js/login_register_otp/registerform.js"></script>
</body>

</html>
