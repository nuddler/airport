<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<head>
    <title><spring:message code="flights.title"/></title>
</head>
<div class="container">
    <h1 style="text-align: center;"><spring:message code="flights.edit.title"/></h1>

    <form:form method="POST" modelAttribute="flight" class="form-horizontal back">
    <fieldset>
        <h2 class="form-signin-heading"><spring:message code="flights.manage.title"/></h2>
        <spring:bind path="name">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <spring:message code="flights.name" var="name"/>
                <label class="col-md-4 control-label" for="name">${name}</label>
                <div class="col-md-4">
                    <form:input type="text" path="name" class="form-control input-md" placeholder="${name}"
                                required=""
                                autofocus="true"></form:input>
                    <br>
                    <form:errors path="name"></form:errors>
                </div>
            </div>
        </spring:bind>

        <spring:bind path="airplane">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <spring:message code="flights.airplane" var="airplane"/>
                <label class="col-md-4 control-label" for="airplane">${airplane}</label>

                <div class="col-md-4">
                    <form:select path="airplane" items="${airplanes}" class="form-control select"
                                 placeholder="${airplane}" itemLabel="name"/>
                    <br>
                    <form:errors path="airplane"></form:errors>
                </div>
            </div>
        </spring:bind>

        <!-- Button -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="singlebutton"></label>
            <div class="col-md-4">
                <button id="singlebutton" name="singlebutton" class="btn btn-lg btn-primary btn-block"><spring:message code="flights.submit"/></button>
            </div>
        </div>
    </fieldset>
    </form:form>
