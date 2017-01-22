<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<head>
    <title>Edytuj samolot</title>
</head>
<div class="container">
    <h1 style="text-align: center;">Edytuj samolot: </h1>

    <form:form method="POST" modelAttribute="airplane" class="form-horizontal">
    <fieldset>
        <h2 class="form-signin-heading">title</h2>
        <spring:bind path="numberOfSeats">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <label class="col-md-4 control-label" for="numberOfSeats">numberOfSeats</label>

                <div class="col-md-4">
                    <form:input type="text" path="numberOfSeats" class="form-control input-md"
                                placeholder="numberOfSeats"
                                required=""
                                autofocus="true"></form:input>
                    <br>
                    <form:errors path="numberOfSeats"></form:errors>
                </div>
            </div>
        </spring:bind>

        <spring:bind path="name">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <label class="col-md-4 control-label" for="name">name</label>

                <div class="col-md-4">
                    <form:input type="text" path="name" class="form-control input-md" placeholder="name"
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
                <button id="singlebutton" name="singlebutton" class="btn btn-lg btn-primary btn-block">Submit</button>
            </div>
        </div>
    </fieldset>
    </form:form>
