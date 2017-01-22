<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<head>
    <title>Lista Reservation</title>
</head>


<script type="text/javascript">
    function validate(form) {
        return confirm('Czy chcesz usunąć ${reservation.id}. ${reservation.name}?');
    }
    ;
</script>
<div class="container">

    </br>
    <c:if test="${needsShowListButton eq true}">
        <a href="/reservations/list">
            <button class="btn btn-default">Pełna lista Reservation</button>
        </a>
        </br>
    </c:if>
    </br>
    <%--<p>Wyszukaj zawodnika:</p>--%>

    <%--<form action="/airplanes/find" method="POST">--%>
        <%--<input type="text" name="parameter" placeholder="Imie lub Nazwisko"/>--%>
        <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
        <%--<button class="btn btn-primary" type="submit">Wyszukaj</button>--%>
    <%--</form>--%>

    <%--</br>--%>

    <c:choose>
        <c:when test="${reservations eq null or reservations.size() == 0}">
            <h1>Brak Reservation.</h1>
            <c:if test="${wasFinding != true}">
                <!-- Jesli nie szukalismy (filtrowalismy), oznacza to ze w calej liscie nie ma participantow. Mozna dodac nowych -->
                <a href="/reservations/add">
                    <button class="btn btn-default">Dodaj reservations</button>
                </a>
            </c:if>
        </c:when>

        <c:otherwise>
            <p>Lista flights: </p>
            <table class="table table-hover" style="width: 100%">
                <tr>
                    <th>ID</th>
                    <th>Nazwa</th>
                    <th>flight</th>

                </tr>

                <c:forEach items="${reservations}" var="reservation">
                    <tr>
                        <td>${reservation.id}</td>
                        <td>${reservation.name}</td>
                        <td>${reservation.flight.name}</td>
                        <td><a href="/reservations/edit/${reservation.id}">
                            <button class="btn btn-info">Edytuj</button>
                        </a></td>
                        <td>
                            <form action="/reservations/remove" method="POST"
                                  onsubmit="return validate(this);">
                                <input type="hidden" name="id" value="${reservation.id}">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button class="btn btn-danger" type="submit">Usuń</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
</div>