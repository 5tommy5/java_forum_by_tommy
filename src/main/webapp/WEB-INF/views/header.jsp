<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<header class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
    <p class="h5 my-0 me-md-auto fw-normal">Forum by Tommy</p>
    <nav class="my-2 my-md-0 me-md-3">

        <c:if test="${not empty pageContext.request.userPrincipal}">

            <c:if test="${pageContext.request.isUserInRole('ADMIN')}">

                <a class="p-2 text-dark" href="/admin">All users</a>
                <a class="p-2 text-dark" href="/admin/add-topic">Add Topic</a>

            </c:if>

        </c:if>
        <a class="p-2 text-dark" href="/topics">Topics</a>
        <sec:authorize access="isAuthenticated()">
            <a class="p-2 text-dark" href="/profile/${pageContext.request.userPrincipal.principal.id}">Profile</a>
        </sec:authorize>
    </nav>
    <sec:authorize access="!isAuthenticated()">
        <a class="btn btn-outline-primary" href="/login">Sign up</a>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
        <a class="btn btn-outline-primary" href="/logout">Log out</a>
    </sec:authorize>

</header>