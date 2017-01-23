<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<head>
    <title><spring:message code="airplanes.title"/></title>
</head>
<div class="container">
    <h1 style="text-align: center;"><spring:message code="airplanes.edit.title"/></h1>

    <form:form method="POST" modelAttribute="airplane" class="form-horizontal back">
    <fieldset>
        <spring:bind path="numberOfSeats">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <spring:message code="airplanes.number.of.seats" var="numberOfSeats"/>
                <label class="col-md-4 control-label" for="numberOfSeats">${numberOfSeats}</label>

                <div class="col-md-4">
                    <form:input type="text" path="numberOfSeats" class="form-control input-md"
                                placeholder="${numberOfSeats}"
                                required=""
                                autofocus="true"></form:input>
                    <br>
                    <form:errors path="numberOfSeats"></form:errors>
                </div>
            </div>
        </spring:bind>

        <spring:bind path="name">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <spring:message code="airplanes.number.of.seats" var="numberOfSeats"/>
                <label class="col-md-4 control-label" for="name">${numberOfSeats}</label>

                <div class="col-md-4">
                    <form:input type="text" path="name" class="form-control input-md" placeholder="${numberOfSeats}"
                                required=""
                                autofocus="true"></form:input>
                    <br>
                    <form:errors path="name"></form:errors>
                </div>
            </div>
        </spring:bind>

        <!-- Button -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="singlebutton"></label>

            <div class="col-md-4">
                <button id="singlebutton" name="singlebutton" class="btn btn-lg btn-primary btn-block"><spring:message
                        code="airplanes.edit.submit"/></button>
            </div>
        </div>
    </fieldset>
    </form:form>
