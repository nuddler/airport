<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<head>
    <title>Zarządzanie Reservation</title>
</head>
<div class="container">
    <h1>Zarządzanie Reservation</h1>
    <ul>
        <li><a href="/reservations/list">Lista Reservation</a></li>
        <li><a href="/reservations/add">Dodaj Reservation</a></li>
    </ul>
</div>