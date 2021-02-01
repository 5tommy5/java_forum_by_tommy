<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html>
<head>
    <title>Главная</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>
<jsp:include page="header.jsp"/>
<div style="margin-left:5%; margin-top:5%; margin-bottom:20%;">
    <c:if test="${not empty pageContext.request.userPrincipal}">
        <h3 class="text-">Hi ${pageContext.request.userPrincipal.name}! We are glad to see you again!</h3>
    </c:if>
    <c:if test="${empty pageContext.request.userPrincipal}">
        <h3 class="text-">Hello anonim, wellcome to our forum!</h3>
    </c:if>

</div>
<div class="m-4">
    <jsp:include page="footer.jsp"/>
</div>

</body>
</html>