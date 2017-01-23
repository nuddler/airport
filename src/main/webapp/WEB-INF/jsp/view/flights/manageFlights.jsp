<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<head>
    <title><spring:message code="flights.manage.title"/></title>
</head>
<div class="container">
    <div class="back">
        <h1><spring:message code="flights.manage.title"/></h1>
        <ul>
            <li><a href="/flights/list"><spring:message code="flights.manage.list"/></a></li>
            <li><a href="/flights/add"><spring:message code="flights.manage.add"/></a></li>
        </ul>
    </div>
</div>