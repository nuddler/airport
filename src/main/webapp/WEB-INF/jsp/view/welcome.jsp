<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<head>
    <title>Create an account</title>
</head>
<div class="container">

    |<spring:message code="app.welcome"/>|
    |<spring:message code="NotEmpty"/>|

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a>
        </h2>
        <h3>Roles - ${pageContext.request.userPrincipal.principal.authorities}</h3>
        <ul class="nav navbar-nav navbar-left">
            <li><a href="/airplanes/managemnent">Zarządzanie samolotami</a></li>
        </ul>
    </c:if>

</div>