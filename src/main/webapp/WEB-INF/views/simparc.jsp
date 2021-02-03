<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Log in with your account</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

</head>

<body>
<jsp:include page="header.jsp"/>

<div class="container ml-6 w-90" style="height: 70%;">
    <a href="/topics/${arcticl.get(0).topic.getId()}" style="margin-left: 16%;">Back to ${arcticl.get(0).topic.getTitle()} topic</a>
    <div class="border" style=" margin-bottom: 30px; margin-top: 20px;"></div>
    <div class="container" style="width: 70%;">
        <c:forEach items="${arcticl}" var="arct">
        <img src="/resources/img/bullseye.svg" width="30" height="30"/>
        <span class="h3" style="margin-left:10px;">${arct.title}</span>
            <a class="btn btn-primary text-white" href="/arcticle/save/${pageContext.request.userPrincipal.principal.id}/${arct.getId()}" style="float:right;">Save <img src="/resources/img/bookmark.svg" style="margin-left: 8px;" width="25" height="25"/></a>
            </br>
            <span style="margin-left: 55px;">By user: </span>
            <a href="/profile/${arct.user.id}" class="text-monospace text-muted" style="width: 8rem;">${arct.user.username}</a></br></br>
        <p style="margin-left:35px;">${arct.text}</p>
            <br>
            <br>
            <span class="text-muted" style="font-size: small; margin-left: 55px;"><javatime:format value="${arct.time}" pattern="yyyy-MM-dd HH:mm" /></span>
            <c:forEach items="${comments}" var="comment">
            <div class="container" style="width: 90%">
                <div class="border" style="margin-bottom: 15px;"></div>

                <p style="margin-left:15px; width: 90%; display: inline-block;">${comment.text}</p>
                <div class="text-center text-muted" style="float:left; display: inline;">
                <a href="/arcticle/like/${pageContext.request.userPrincipal.principal.id}/${comment.id}"  class="btn btn-success"><img src="/resources/img/thumb.svg"/></a>

                    <br><span>${comment.users.size()}</span>
                </div>
                </br>
                <span class="text-muted" style="font-size: small;"><javatime:format value="${comment.time}" pattern="yyyy-MM-dd HH:mm" /></span>
                <span class="text-muted" style="margin-left:10px; font-size: smaller; float:right;">By user - <a class="text-muted" href="/profile/${comment.user.id}">${comment.user.username}</a></span>


            </div>

            </c:forEach>
            </c:forEach>
    </div>
    <div class="border"></div>
    <div class="container" style="width: 70%; margin-left:15%; margin-top:2%; margin-bottom:7%">
        <form:form method="POST" modelAttribute="newcom">

            <form:input type="hidden" cssClass="form-control" path="arcticle.id"
                        autofocus="true"></form:input>
            <span class="text-muted" style="font-size: larger;">Leave your answer</span>


            <div class="mb-3" style="margin-top: 20px;">
                <form:textarea cssClass="form-control" path="text" placeholder="Text" rows="10"></form:textarea>
            </div>
            <button type="submit" class="btn btn-success w-30" style="float: right;">Leave answer</button>
        </form:form>
    </div>

</div>

<div class="m-4">
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>