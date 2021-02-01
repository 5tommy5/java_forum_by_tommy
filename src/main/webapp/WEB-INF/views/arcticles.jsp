<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

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
<a href="/add-arcticle/${topicId}" class="btn btn-primary text-dark" style="margin-left: 22%;"><img src="/resources/img/plus-circle.svg" width="30" height="30" style="margin-right:5px;"/> Ask a question</a>

<div class="ml-6 w-90" style="height: 70%; margin: 30px;">
        <c:forEach items="${arcticles}" var="arct">
            <div class="card" style="width: 60%; margin-left:20%; margin-bottom: 10px;">
                <div class="card-body" >
                    <div class="card text-center" style="width: 6rem; float: left; margin-right: 10px;">
                        <div class="card-body">
                            <h6 class="card-title">Views</h6>
                            <h6 class="card-subtitle mb-2 text-muted">${arct.views}</h6>
                        </div>
                    </div>
                    <div class="card text-center" style="width: 6rem; float: left; margin-right: 10px;">
                        <div class="card-body">
                            <h6 class="card-title">Answers</h6>
                            <h6 class="card-subtitle mb-2 text-muted">${arct.countComments}</h6>
                        </div>
                    </div>
                    <a href="/arcticles/${arct.id}" class="h5 text-dark">
                                <c:if test="${arct.title.length() > 50}">
                                    ${arct.title.substring(0,49)}...
                                </c:if>
                                <c:if test="${arct.title.length() <= 50}">
                                    ${arct.title}
                                </c:if>
                    </a>

                    <p class="card-text">
                        <c:if test="${arct.text.length() > 50}">
                            ${arct.text.substring(0, 49)}...
                        </c:if>
                        <c:if test="${arct.text.length() <= 50}">
                            ${arct.text}
                        </c:if>
                    </p>
                    <a class="card-subtitle mb-2 text-muted" style="float:right;" href="/profile/${arct.user.id}"> ${arct.user.username} <img src="/resources/img/male.svg"height="28" width="28"/></a>
                </div>
            </div>


        </c:forEach>

</div>
<div class="m-4">
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>