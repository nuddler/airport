<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<head>
    <title><spring:message code="flights.list.title"/></title>
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
        <a class="back" href="/airplanes/list">
            <button class="btn btn-default"><spring:message code="flights.list.full"/></button>
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
            <h1 class="back"><spring:message code="flights.list.empty"/></h1>
            <c:if test="${wasFinding != true}">
                <!-- Jesli nie szukalismy (filtrowalismy), oznacza to ze w calej liscie nie ma participantow. Mozna dodac nowych -->
                <a class="back" href="/flights/add">
                    <button class="btn btn-default"><spring:message code="flights.add.title"/></button>
                </a>
            </c:if>
        </c:when>

        <c:otherwise>
            <p class="back"><spring:message code="flights.list.title"/></p>
            <table class="table table-hover back" style="width: 100%">
                <tr>
                    <th><spring:message code="flights.id"/></th>
                    <th><spring:message code="flights.name"/></th>
                    <th><spring:message code="flights.airplane"/></th>

                </tr>

                <c:forEach items="${flights}" var="flight">
                    <tr>
                        <td>${flight.id}</td>
                        <td>${flight.name}</td>
                        <td>${flight.airplane.name}</td>
                        <td><a href="/flights/edit/${flight.id}">
                            <button class="btn btn-info"><spring:message code="flights.edit.submit"/></button>
                        </a></td>
                        <td>
                            <form action="/flights/remove" method="POST"
                                  onsubmit="return validate(this);">
                                <input type="hidden" name="id" value="${flight.id}">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button class="btn btn-danger" type="submit"><spring:message code="flights.remove.submit"/></button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
</div>