<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<head>
    <title>Dodaj zawodnika</title>
</head>
<div class="container">
	<h1 style="text-align: center;">Dodaj zawodnika: </h1>
	<form action="/participant/add" method="post">
		<c:if test="${participant.id != null}">
			<input type="hidden" name="id" value="${participant.id}">
		</c:if>
		<div class="form-group">
		   <label for="name">Imię:</label>
		   <input type="name" class="form-control" name="name" id="name" value="${participant.name}">
		</div>
		<div class="form-group">
		   <label for="surname">Nazwisko:</label>
		   <input type="surname" class="form-control" name="surname" id="surname" value="${participant.surname}">
		</div>
		<div class="form-group">
		   <label for="email">Email:</label>
		   <input type="email" class="form-control" name="email" id="email" value="${participant.email}">
		</div>
		<div class="form-group">
		   <label for="phone">Telefon:</label>
		   <input type="phone" class="form-control" name="phone" id="phone" value="${participant.phone}">
		</div>
		<div class="form-group">
		   <label for="pesel">Pesel:</label>
		   <input type="pesel" class="form-control" name="pesel" id="pesel" value="${participant.pesel}">
		</div><br>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="submit" class="btn btn-success" value="Submit">
	</form>
</div>