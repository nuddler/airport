<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<head>
<title>Lista zawodników</title>
</head>


	<script type="text/javascript">
		function validate(form) {
			return confirm('Czy chcesz usunąć ${participant.surname} ${participant.name}?');
		};
	</script>
<div class="container">

	</br>
	<c:if test="${needsShowListButton eq true}">
		<a href="/participant/list"><button class="btn btn-default">Pełna lista zawodników</button></a>
		</br>
	</c:if>
	</br>
	<p>Wyszukaj zawodnika:</p>
	<form action="/participant/find" method="POST">
		<input type="text" name="parameter" placeholder="Imie lub Nazwisko" />
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<button class="btn btn-primary" type="submit">Wyszukaj</button>
	</form>
	
	</br>
	
	<c:choose>
		<c:when test="${participants eq null or participants.size() == 0}">
			<h1>Brak zawodników.</h1>
			<c:if test="${wasFinding != true}">
			<!-- Jesli nie szukalismy (filtrowalismy), oznacza to ze w calej liscie nie ma participantow. Mozna dodac nowych -->
				<a href="/participant/add"><button class="btn btn-default">Dodaj zawodnika</button></a>
			</c:if>
		</c:when>
		
		<c:otherwise>
		<p>Lista zawodników: </p>
		<table class="table table-hover" style="width: 100%" >
				<tr>
					<th>ID</th>
					<th>Imie</th>
					<th>Nazwisko</th>
					<th>Telefon</th>
					<th>Email</th>
					<th>Pesel</th>
					<th>Edytuj</th>
					<th>Usuń</th>
				</tr>

				<c:forEach items="${participants}" var="participant">
					<tr>
						<td>${participant.id}</td>
						<td>${participant.name}</td>
						<td>${participant.surname}</td>
						<td>${participant.phone}</td>
						<td>${participant.email}</td>
						<td>${participant.pesel}</td>
						<td><a href="/participant/edit/${participant.id}">
								<button class="btn btn-info">Edytuj</button>
						</a></td>
						<td>
							<form action="/participant/remove" method="POST"
								onsubmit="return validate(this);">
								<input type="hidden" name="id" value="${participant.id}">
								<button class="btn btn-danger" type="submit">Usuń</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
		</c:choose>
</div>