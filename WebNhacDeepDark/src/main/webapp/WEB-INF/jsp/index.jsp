<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 5/14/2022
  Time: 8:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
    <h1>FUCK YOU</h1>
<%--    <c:forEach var="u" items="${user}">--%>
        <p>${user.id}</p>
        <p>${user.name}</p>
        <p>${user.job}</p>
<%--    </c:forEach>--%>

<form action="/dulieu" method="post">
    <input name = "email"/>
    <button type="submit"></button>
</form>

<p class="sucked" id="test">fuck you leatherman</p>

<script src="/js/javascript.js"></script>
</body>
</html>
