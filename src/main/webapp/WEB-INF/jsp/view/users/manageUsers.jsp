<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<head>
    <title><spring:message code="users.manage.title"/></title>
</head>
<div class="container">
    <div class="back">
        <h1><spring:message code="users.manage.title"/></h1>
        <ul>
            <li><a href="/users/list"><spring:message code="users.manage.list"/></a></li>
            <li><a href="/users/add"><spring:message code="users.manage.add"/></a></li>
            <li><a href="/users/report"><spring:message code="users.manage.report"/></a></li>
        </ul>
    </div>
</div>