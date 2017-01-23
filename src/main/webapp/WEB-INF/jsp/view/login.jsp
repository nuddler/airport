<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="container">
    <div class="row" style="margin-top:20px">
        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
            <form method="POST" action="${contextPath}/login" class="form-signin">
                <fieldset>
                    <h2><spring:message code="login.title"/></h2>
                    <hr class="colorgraph">
                    <div class="form-group">
                        <spring:message code="user.username" var="username"/>
                        <input name="username" type="text" class="form-control input-lg" placeholder="${username}"
                               autofocus="true"/>
                    </div>
                    <div class="form-group">
                        <spring:message code="user.password" var="password"/>
                        <input type="password" name="password" id="${password}" class="form-control input-lg"
                               placeholder="Password">
                    </div>
                    <span>${error}</span>
                    <br>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <span class="button-checkbox">
					    <button type="button" class="btn" data-color="info"><spring:message
                                code="login.remember.me"/></button>
                        <input type="checkbox" name="remember_me" id="remember_me" checked="checked" class="hidden">
				    </span>
                    <hr class="colorgraph">
                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <spring:message code="login.sing.in" var="singIn"/>
                            <input type="submit" class="btn btn-lg btn-success btn-block" value="${singIn}">
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <a href="${contextPath}/registration"
                               class="btn btn-lg btn-primary btn-block"><spring:message code="registration.submit"/></a>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</div>
