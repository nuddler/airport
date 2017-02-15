<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${pageContext.request.userPrincipal.name != null}">
    <c:set value="true" var="login"/>
</c:if>
<sec:authorize access="hasAuthority('ADMIN')">
    <c:set value="true" var="admin"/>
</sec:authorize>

<nav class="navbar navbar-inverse">
    <div class="container">
        <span class="navbar-header">
            <a class="navbar-brand" href="/welcome"><spring:message code="app.title"/></a>
            <c:if test="${login}">
                <span class="navbar-text"><spring:message
                        code="menu.user.title"/> ${pageContext.request.userPrincipal.name}</span>
                <span class="navbar-text"><spring:message
                        code="menu.roles.title"/> ${pageContext.request.userPrincipal.principal.authorities}</span>
            </c:if>
        </span>
        <ul class="nav navbar-nav">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                   aria-expanded="false"><spring:message code="app.menu.lang"/> <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="?lang=pl"><span class="lang-xs" lang="pl"></span></a></li>
                    <li><a href="?lang=es"><span class="lang-xs" lang="es"></span></a></li>
                </ul>
            </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <c:if test="${admin}">
                <li><a href="/users/managemnent"><spring:message code="app.menu.users"/></a></li>
                <li><a href="/flights/managemnent"><spring:message code="app.menu.flights"/></a></li>
                <li><a href="/airplanes/managemnent"><spring:message code="app.menu.airplanes"/></a></li>
            </c:if>
            <li><a href="/reservations/managemnent"><spring:message code="app.menu.reservation"/></a></li>
            <li>
                <c:if test="${login}">
                    <form action="/logout" method="post" id="logoutForm">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                        <div>
                            <spring:message code="app.menu.logout" var="logout"/>
                            <a class="btn btn-danger" >
                                <input type="submit" value="${logout}" class="btn btn-danger"/>
                            </a>
                        </div>
                    </form>
                </c:if>
                <c:if test="${empty login}">
                    <a class="btn btn-info" href="/login">
                        <spring:message code="app.menu.login"/>
                    </a>
                </c:if>
            </li>
        </ul>
    </div>
</nav>
</div>