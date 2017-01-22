<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<head>
    <title>Lista flights</title>
</head>


<script type="text/javascript">
    function validate(form) {
        return confirm('Czy chcesz usunąć ${participant.surname} ${participant.name}?');
    }
    ;
</script>
<div class="container">

    </br>
    <c:if test="${needsShowListButton eq true}">
        <a href="/airplanes/list">
            <button class="btn btn-default">Pełna lista flights</button>
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
        <c:when test="${flights eq null or flights.size() == 0}">
            <h1>Brak flights.</h1>
            <c:if test="${wasFinding != true}">
                <!-- Jesli nie szukalismy (filtrowalismy), oznacza to ze w calej liscie nie ma participantow. Mozna dodac nowych -->
                <a href="/flights/add">
                    <button class="btn btn-default">Dodaj flights</button>
                </a>
            </c:if>
        </c:when>

        <c:otherwise>
            <p>Lista flights: </p>
            <table class="table table-hover" style="width: 100%">
                <tr>
                    <th>ID</th>
                    <th>Nazwa</th>
                    <th>Airplane</th>

                </tr>

                <c:forEach items="${flights}" var="flight">
                    <tr>
                        <td>${flight.id}</td>
                        <td>${flight.name}</td>
                        <td>${flight.airplane.name}</td>
                        <td><a href="/flights/edit/${flight.id}">
                            <button class="btn btn-info">Edytuj</button>
                        </a></td>
                        <td>
                            <form action="/flights/remove" method="POST"
                                  onsubmit="return validate(this);">
                                <input type="hidden" name="id" value="${flight.id}">
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