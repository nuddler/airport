<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<div class="container">

    <form method="POST" action="${contextPath}/login" class="form-signin">
        <h2 class="form-heading">Log in</h2>


        <div class="form-group ${error != null ? 'has-error' : ''}">
            <div class="percentage text-center">
                <span>${message}</span>
                <input name="username" type="text" class="form-control " placeholder="Username"
                       autofocus="true"/>
                <input name="password" type="password" class="form-control" placeholder="Password"/>
                <span>${error}</span>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <p></p>
                <button class="percentage btn-success btn-large" type="submit">Log In</button>
                <h4 class="text-center"><a href="${contextPath}/registration" class="btn btn-info btn-large">Create an account</a></h4>
            </div>
        </div>

    </form>

</div>
