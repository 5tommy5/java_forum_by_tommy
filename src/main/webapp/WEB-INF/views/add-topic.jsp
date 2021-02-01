<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Add topic</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

</head>

<body>
<jsp:include page="header.jsp"/>

<div class="container text-center" style="width: 30%; margin-left:35%; margin-top:5%; margin-bottom:8%">
    <form:form method="POST" modelAttribute="topic">


        <h2>New topic</h2>

        <div class="mb-3 w-100" >
            <form:input type="text" cssClass="form-control" path="title" placeholder="Title"
                        autofocus="true"></form:input>
        </div>
        <div class="mb-3">
            <form:textarea  cssClass="form-control" path="description" placeholder="Description"></form:textarea>
        </div>
        <button type="submit" class="btn btn-success w-100">Add topic</button>
    </form:form>
</div>
<div class="m-4">
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>