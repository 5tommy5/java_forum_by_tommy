<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Log in with your account</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

</head>

<body>
<jsp:include page="header.jsp"/>
<sec:authorize access="isAuthenticated()">
    <% response.sendRedirect("/"); %>
</sec:authorize>
<div class="text-center container " style="width: 30%; margin-left: 35%; margin-top:5%; margin-bottom:8%;">
    <form method="POST" action="/login">
        <h2>Login</h2>
        <div>
            <div class="mb-3">
                <input class="form-control" name="username" type="text" placeholder="Username"
                       autofocus="true"/>
            </div>
            <div class="mb-3">
                <input class="form-control" name="password" type="password" placeholder="Password"/>
            </div>


            <button type="submit" class="btn btn-primary w-100">Log In</button>
            <a href="/registration" class="btn btn-success w-100 mt-1">Sign up</a>
        </div>
    </form>
</div>
<div class="m-4">
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>