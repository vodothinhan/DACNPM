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

<%--<form action="/dulieu" method="post">--%>
<%--    <input class="user" name = "id"/>--%>
<%--    <input class="user" name = "name"/>--%>
<%--    <input class="user" name = "job"/>--%>
<%--    <button type="submit"></button>--%>
<%--</form>--%>
    <form>
        <input id="id" name = "id"/>
        <input id="name" name = "name"/>
        <input id="job" name = "job"/>

    </form>
    <button onclick="fuck()">CLICK ME BTCH</button>

    <button onclick="fuck2()">CLICK ME Boy</button>

<p class="sucked" id="test">fuck you leatherman</p>

<script src="/js/javascript.js"></script>
</body>

<script>


    function fuck(){
        // var id = document.getElementById('id').value;
        var name = document.getElementById('name').value;
        var job = document.getElementById('job').value;

        var user = {
            name: name,
            job: job
        }
        console.log(user)

        postData('http://localhost:8080/insertUser', user)
    }
    function fuck2(){
        var id = document.getElementById('id').value;

        postData2('http://localhost:8080/deleteUser/' + id)
    }


    function postData(url = '', data = {}) {
        // Default options are marked with *
         fetch(url, {
            method: 'POST', // *GET, POST, PUT, DELETE, etc.
            mode: 'cors', // no-cors, *cors, same-origin
            cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
            credentials: 'same-origin', // include, *same-origin, omit
            headers: {
                'Content-Type': 'application/json'
                // 'Content-Type': 'application/x-www-form-urlencoded',
            },
            redirect: 'follow', // manual, *follow, error
            referrerPolicy: 'no-referrer', // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
            body: JSON.stringify(data) // body data type must match "Content-Type" header
        }).then(data => data.text())
         .then( d => console.log(d));
        // parses JSON response into native JavaScript objects
    }

    function postData2(url = '', data = {}) {
        // Default options are marked with *
        fetch(url, {
            method: 'DELETE', // *GET, POST, PUT, DELETE, etc.
            mode: 'cors', // no-cors, *cors, same-origin
            cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
            credentials: 'same-origin', // include, *same-origin, omit
            headers: {
                'Content-Type': 'application/json'
                // 'Content-Type': 'application/x-www-form-urlencoded',
            },
            redirect: 'follow', // manual, *follow, error
            referrerPolicy: 'no-referrer', // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
            body: JSON.stringify(data) // body data type must match "Content-Type" header
        }).then(data => data.text())
            .then( d => console.log(d));
        // parses JSON response into native JavaScript objects
    }
</script>
</html>
