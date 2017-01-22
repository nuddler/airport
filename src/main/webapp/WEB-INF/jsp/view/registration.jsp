<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<script src='https://www.google.com/recaptcha/api.js'></script>


<div class="container">

    <form:form method="POST" modelAttribute="userForm" class="form-horizontal">
        <fieldset>
            <h2 class="form-signin-heading">Create your account</h2>
            <spring:bind path="username">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <label class="col-md-4 control-label" for="username">Username</label>

                    <div class="col-md-4">
                        <form:input type="text" path="username" class="form-control input-md" placeholder="Username"
                                    required=""
                                    autofocus="true"></form:input>
                        <br>
                        <form:errors path="username"></form:errors>
                    </div>
                </div>
            </spring:bind>

            <spring:bind path="password">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <label class="col-md-4 control-label" for="password">Password</label>

                    <div class="col-md-4">
                        <form:input type="password" path="password" class="form-control input-md" placeholder="Password"
                                    required=""
                                    autofocus="true"></form:input>
                        <br>
                        <form:errors path="password"></form:errors>
                    </div>
                </div>
            </spring:bind>

            <spring:bind path="passwordConfirm">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <label class="col-md-4 control-label" for="passwordConfirm">passwordConfirm</label>

                    <div class="col-md-4">
                        <form:input type="password" path="passwordConfirm" class="form-control input-md"
                                    placeholder="passwordConfirm"
                                    required=""
                                    autofocus="true"></form:input>
                        <br>
                        <form:errors path="passwordConfirm"></form:errors>
                    </div>
                </div>
            </spring:bind>

            <spring:bind path="email">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <label class="col-md-4 control-label" for="passwordConfirm">email</label>

                    <div class="col-md-4">
                        <form:input type="email" path="email" class="form-control input-md" placeholder="email"
                                    required=""
                                    autofocus="true"></form:input>
                        <br>
                        <form:errors path="email"></form:errors>
                    </div>
                </div>
            </spring:bind>

            <!-- Button -->
            <div class="form-group">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <div class="g-recaptcha" data-sitekey="${site}"></div>
                    <c:if test="${not empty captchaError}">
                        <div class="alert alert-danger">
                                <%--TODO: zienic na messae--%>
                            <strong>Danger!</strong> ${captchaError}
                        </div>
                    </c:if>
                </div>
            </div>

            <!-- Button -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="singlebutton"></label>

                <div class="col-md-4">
                    <button id="singlebutton" name="singlebutton" class="btn btn-lg btn-primary btn-block">Submit
                    </button>
                </div>
            </div>
        </fieldset>
    </form:form>
</div>
