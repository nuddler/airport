<div class="footer" href="css/bootstrap-responsive.css" rel="stylesheet" type="text/css">
    <div class="container">
        <a href="?lang=es" class="btn btn-primary">es</a>
        <a href="?lang=en" class="btn btn-success">en</a>
        <form action="/logout" method="post" id="logoutForm">
            <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}"/>
            <div>
                <input type="submit" value="Logout" class="btn-danger btn-large"/>
            </div>
        </form>
        <a href="#myModal" role="button" data-toggle="modal">
            <i class="icon-mail"></i>
            CONTACT
        </a>
    </div>
</div>
