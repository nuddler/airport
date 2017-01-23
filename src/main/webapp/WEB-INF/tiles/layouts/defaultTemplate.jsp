<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
    <head>
        <title><tiles:insertAttribute name="title"/></title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%--<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">--%>
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/languages.min.css" rel="stylesheet">
        <%--<link href="${pageContext.request.contextPath}/font/css/fontello.css" rel="stylesheet">--%>
        <link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'>

        <%--<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>--%>
        <%--<script src="${pageContext.request.contextPath}/js/jquery.fancybox.js"></script>--%>
        <%--<script src="${pageContext.request.contextPath}/js/jquery-1.10.1.min.js"></script>--%>
        <script src="${pageContext.request.contextPath}/js/s.js"></script>

        <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css"/>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/prettify/r298/prettify.min.css"/>

        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/prettify/r298/prettify.min.js"></script>
    </head>


    <body>
    <style>
        body  {
            background-image: url("/img/back.png");
            background-color: #ccc3cc;
            background-repeat:no-repeat;
            /*-webkit-background-size:cover;*/
            /*-moz-background-size:cover;*/
            /*-o-background-size:cover;*/
            /*background-size:cover;*/
            /*background-position:center;*/
            background-size: 100%;
        }
        .back {
            margin: auto;
            width: 50%;
            border: 3px solid green;
            padding: 10px;
            background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAaCAYAAACpSkzOAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAALEgAACxIB0t1+/AAAABZ0RVh0Q3JlYXRpb24gVGltZQAxMC8yOS8xMiKqq3kAAAAcdEVYdFNvZnR3YXJlAEFkb2JlIEZpcmV3b3JrcyBDUzVxteM2AAABHklEQVRIib2Vyw6EIAxFW5idr///Qx9sfG3pLEyJ3tAwi5EmBqRo7vHawiEEERHS6x7MTMxMVv6+z3tPMUYSkfTM/R0fEaG2bbMv+Gc4nZzn+dN4HAcREa3r+hi3bcuu68jLskhVIlW073tWaYlQ9+F9IpqmSfq+fwskhdO/AwmUTJXrOuaRQNeRkOd5lq7rXmS5InmERKoER/QMvUAPlZDHcZRhGN4CSeGY+aHMqgcks5RrHv/eeh455x5KrMq2yHQdibDO6ncG/KZWL7M8xDyS1/MIO0NJqdULLS81X6/X6aR0nqBSJcPeZnlZrzN477NKURn2Nus8sjzmEII0TfMiyxUuxphVWjpJkbx0btUnshRihVv70Bv8ItXq6Asoi/ZiCbU6YgAAAABJRU5ErkJggg==);
        }
    </style>
            <tiles:insertAttribute name="header"/>
            <tiles:insertAttribute name="menu"/>
            <div class="cbody">
                <tiles:insertAttribute name="body"/>
            </div>
            <tiles:insertAttribute name="footer"/>
    </body>
</html>