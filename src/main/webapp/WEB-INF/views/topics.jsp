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

<div class="container ml-6 w-90" style="height: 70%;">

        <c:forEach items="${topics}" var="topic">
                <div class="card" style="width: 60%; margin-left:20%; margin-bottom: 10px; margin-top:25px;">
                    <div class="card-body" style="float: left;">
                        <div class="card text-center" style="width: 6rem; float: left; margin-right: 10px;">
                            <div class="card-body">
                                <h6 class="card-title" style="font-size: small;">Questions</h6>
                                <h6 class="card-subtitle mb-2 text-muted">${topic.getCountAnswers()}</h6>
                            </div>
                        </div>

                    <div style="">
                    <a href="/topics/${topic.id}" class="h5 text-dark">
                        ${topic.title}
                    </a>

                    <p class="card-text" >
                        <c:if test="${topic.description.length() > 100}">
                            ${topic.description.substring(0, 99)}...
                        </c:if>
                        <c:if test="${topic.description.length() <= 100}">
                            ${topic.description}
                        </c:if>
                    </p>
                    </div>
                    </div>
                </div>
    </c:forEach>
<div class="m-4">
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>