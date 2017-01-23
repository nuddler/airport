<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<head>
    <title><spring:message code="app.welcome.title"/></title>
</head>
<div class="container">
    <div class="back">
        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <form id="logoutForm" method="POST" action="${contextPath}/logout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>

            <h2>Welcome ${pageContext.request.userPrincipal.name}</h2>
            <h3>Roles - ${pageContext.request.userPrincipal.principal.authorities}</h3>
        </c:if>
    </div>
</div>