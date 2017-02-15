<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<head>
    <title><spring:message code="users.title"/></title>
</head>


<script type="text/javascript">
    function validate(form) {
        return confirm('Czy chcesz usunąć ${user.surname} ${user.name}?');
    }
    ;
</script>
<div class="container">

    </br>
    <c:if test="${needsShowListButton eq true}">
        <a class="back" href="/users/list">
            <button class="btn btn-default"><spring:message code="users.list.full"/></button>
        </a>
        </br>
    </c:if>
    </br>
    <%--<p>Wyszukaj zawodnika:</p>--%>

    <%--<form action="/users/find" method="POST">--%>
        <%--<input type="text" name="parameter" placeholder="Imie lub Nazwisko"/>--%>
        <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
        <%--<button class="btn btn-primary" type="submit">Wyszukaj</button>--%>
    <%--</form>--%>

    <%--</br>--%>

    <c:choose>
        <c:when test="${users eq null or users.size() == 0}">
            <h1 class="back"><spring:message code="users.list.empty"/></h1>
            <c:if test="${wasFinding != true}">
                <!-- Jesli nie szukalismy (filtrowalismy), oznacza to ze w calej liscie nie ma participantow. Mozna dodac nowych -->
                <a href="/users/add">
                    <button class="btn btn-default"><spring:message code="users.add"/></button>
                </a>
            </c:if>
        </c:when>

        <c:otherwise>
            <p class="back"><spring:message code="users.list.title"/></p>
            <table class="table table-hover back" style="width: 100%">
                <tr>
                    <th><spring:message code="users.id"/></th>
                    <th><spring:message code="users.username"/></th>
                    <%--<th><spring:message code="users.password"/></th>--%>
                    <th><spring:message code="users.email"/></th>
                    <th><spring:message code="users.activated"/></th>
                    <th><spring:message code="users.reservations"/></th>
                    <th><spring:message code="users.roles"/></th>
                </tr>

                <c:forEach items="${users}" var="user">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <%--<td>${user.password}</td>--%>
                        <td>${user.email}</td>
                        <td> <input type="checkbox" disabled ${user.activated ? "checked" : ""} ></td>
                        <td>
                            <ul>
                                <c:forEach var="reservation" items="${user.reservationList}">
                                    <li>
                                        ${reservation.name}
                                    </li>
                                </c:forEach>
                            </ul>
                        </td>
                        <td>
                            <ul>
                                <c:forEach var="role" items="${user.roles}">
                                    <li>
                                        ${role.name}
                                    </li>
                                </c:forEach>
                            </ul>
                        </td>
                        <td>
                            <a href="/users/edit/${user.id}">
                                <button class="btn btn-info"><spring:message code="users.edit.submit"/></button>
                            </a>
                        </td>
                        <td>
                            <form action="/users/remove" method="POST" onsubmit="return validate(this);">
                                <input type="hidden" name="id" value="${user.id}">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button class="btn btn-danger" type="submit"><spring:message code="users.remove.submit"/></button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
</div>