<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
    <head>
        <title><tiles:insertAttribute name="title"/></title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/font/css/fontello.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'>
    </head>
    <body>
            <tiles:insertAttribute name="header"/>
            <tiles:insertAttribute name="menu"/>
            <tiles:insertAttribute name="body"/>
            <tiles:insertAttribute name="footer"/>
    </body>
</html>