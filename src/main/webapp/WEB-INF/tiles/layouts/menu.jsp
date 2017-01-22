<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<div id="menu">--%>
<%--<ul class="nav nav-list well">--%>
<%--<li class="nav-header">--%>
<%--<spring:url value="/info" var="infoUrl" htmlEscape="true" />--%>
<%--<a href="${infoUrl}"><spring:message code="menu.home"/></a>--%>
<%--</li>--%>
<%--<li class="divider"></li>--%>
<%----%>
<%--<li class="nav-header">--%>
<%--<spring:url value="/pizzas" var="pizzas" htmlEscape="true" />--%>
<%--<a href="${pizzas}"><spring:message code="menu.pizzas"/></a>--%>
<%--</li>--%>
<%----%>
<%--<li class="nav-header">--%>
<%--<spring:url value="/addPizza" var="addPizza" htmlEscape="true" />--%>
<%--<a href="${addPizza}"><spring:message code="menu.addPizza"/></a>--%>
<%--</li>--%>
<%----%>
<%--<sec:authorize access="hasRole('ROLE_ADMIN')">--%>
<%--<li class="nav-header">--%>
<%--<spring:url value="/users" var="users" htmlEscape="true" />--%>
<%--<a href="${users}"><spring:message code="menu.users"/></a>--%>
<%--</li>--%>
<%----%>
<%--<li class="nav-header">--%>
<%--<spring:url value="/addUser" var="addUser" htmlEscape="true" />--%>
<%--<a href="${addUser}"><spring:message code="menu.addUser"/></a>--%>
<%--</li>--%>
<%--</sec:authorize>--%>
<%----%>
<%--</ul>--%>
<%--</div>--%>

<%--<div class="span10">--%>
<%--<h3><spring:message code="home.welcome"/> <sec:authentication property="principal.username"/></h3>--%>

<%--</div>--%>
<c:if test="${pageContext.request.userPrincipal.name != null}">
    <c:set value="true" var="login"/>
</c:if>
<!-- Second navbar for profile settings -->
<nav class="navbar navbar-inverse">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/welcome">Airport</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbar-collapse-4">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/airplanes/managemnent">Airplanes</a></li>
                <li><a href="/flights/managemnent">Flights</a></li>
                <li><a href="/reservations/managemnent">Reservations</a></li>
                <li><a href="#">About</a></li>
                <li>
                    <c:if test="${login}">
                        <form action="/logout" method="post" id="logoutForm">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                            <div>
                                <input type="submit" value="Logout" class="btn btn-danger"/>
                            </div>
                        </form>
                    </c:if>
                    <c:if test="${empty login}"><a class="btn btn-info" href="/login">Login</a></c:if>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>
<!-- /.navbar -->
</div><!-- /.container-fluid -->