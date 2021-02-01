<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Регистрация</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

</head>

<body>
<jsp:include page="header.jsp"/>

<div class="container text-center" style="width: 30%; margin-left:35%; margin-top:5%; margin-bottom:8%">
    <form:form method="POST" modelAttribute="userForm">


        <h2>Registration</h2>

        <div class="mb-3 w-100" >
            <form:input type="text" cssClass="form-control" path="username" placeholder="Username"
                        autofocus="true"></form:input>
            <form:errors path="username"></form:errors>
                ${usernameError}
        </div>
        <div class="mb-3">
            <form:input type="password" cssClass="form-control" path="password" placeholder="Password"></form:input>
        </div>
        <div class="mb-3">
            <form:input type="password" cssClass="form-control" path="passwordConfirm"
                        placeholder="Confirm your password"></form:input>
            <form:errors path="password"></form:errors>
                ${passwordError}
        </div>
        <button type="submit" class="btn btn-success w-100">Sign up</button>
    </form:form>
    <a href="/" style="margin-top:10px;">Main page</a>
</div>
<div class="m-4">
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>