<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<head>
    <title>Zarządzanie samolotami</title>
</head>
<div class="container">
    <h1>Zarządzanie samolotami</h1>
    <ul>
        <li><a href="/airplanes/list">Lista samolotów</a></li>
        <li><a href="/airplanes/add">Dodaj samolot</a></li>
    </ul>
</div>