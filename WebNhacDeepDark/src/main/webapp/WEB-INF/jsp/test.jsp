<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 5/16/2022
  Time: 8:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    </style>
    <link rel="stylesheet" href="/css/style.css" type="text/css">
</head>
<body>
<p id="testUser">fuck you</p>

<script>
    fetch('http://localhost:8080/getUser?id=69')
        .then(response => response.json())
        .then(data => render(data));

    function render(data){
        var p = document.getElementById('testUser');

        p.innerHTML = data.name;
    }
</script>
</body>
</html>
