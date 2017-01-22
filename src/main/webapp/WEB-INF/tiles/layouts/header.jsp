<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%--<div id="header" class="text-center">--%>
	<%--<div class="span10">--%>
		<%--<h3><spring:message code="home.welcome" /> <sec:authentication property="principal.username" /></h3>--%>
		<%----%>
	<%--</div>--%>
	<%----%>
	<%--<div class="span2">--%>
		<%--<a href="?lang=es" class="btn btn-primary">es</a> --%>
		<%--<a href="?lang=en"class="btn btn-success">en</a>--%>
							 <%----%>
		<%--<form action="logout" method="post"--%>
				<%--id="logoutForm">--%>
				<%--<input type="hidden" name="${_csrf.parameterName}"--%>
					<%--value="${_csrf.token}" />--%>
				<%--<div>--%>
					<%--<input type="submit" value="Logout" />--%>
				<%--</div>--%>
		<%--</form>--%>

	<%--</div>--%>
<%--</div>--%>

<div class="container-fluid">
	<!-- Second navbar for categories -->
	<nav class="navbar navbar-default">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Brand</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Home</a></li>
					<li><a href="#">About</a></li>
					<li><a href="#">Services</a></li>
					<li><a href="#">Works</a></li>
					<li><a href="#">News</a></li>
					<li><a href="#">Contact</a></li>
					<li>
						<a class="btn btn-default btn-outline btn-circle collapsed"  data-toggle="collapse" href="#nav-collapse1" aria-expanded="false" aria-controls="nav-collapse1">Categories</a>
					</li>
				</ul>
				<ul class="collapse nav navbar-nav nav-collapse" id="nav-collapse1">
					<li><a href="#">Web design</a></li>
					<li><a href="#">Development</a></li>
					<li><a href="#">Graphic design</a></li>
					<li><a href="#">Print</a></li>
					<li><a href="#">Motion</a></li>
					<li><a href="#">Mobile apps</a></li>
				</ul>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container -->
	</nav><!-- /.navbar -->

	<!-- Second navbar for sign in -->
	<nav class="navbar navbar-default">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-2">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Brand</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="navbar-collapse-2">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Home</a></li>
					<li><a href="#">About</a></li>
					<li><a href="#">Services</a></li>
					<li><a href="#">Works</a></li>
					<li><a href="#">News</a></li>
					<li><a href="#">Contact</a></li>
					<li>
						<a class="btn btn-default btn-outline btn-circle collapsed"  data-toggle="collapse" href="#nav-collapse2" aria-expanded="false" aria-controls="nav-collapse2">Sign in</a>
					</li>
				</ul>
				<div class="collapse nav navbar-nav nav-collapse slide-down" id="nav-collapse2">
					<form class="navbar-form navbar-right form-inline" role="form">
						<div class="form-group">
							<label class="sr-only" for="Email">Email</label>
							<input type="email" class="form-control" id="Email" placeholder="Email" autofocus required />
						</div>
						<div class="form-group">
							<label class="sr-only" for="Password">Password</label>
							<input type="password" class="form-control" id="Password" placeholder="Password" required />
						</div>
						<button type="submit" class="btn btn-success">Sign in</button>
					</form>
				</div>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container -->
	</nav><!-- /.navbar -->


	<!-- Second navbar for profile settings -->
	<nav class="navbar navbar-inverse">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-4">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Brand</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="navbar-collapse-4">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Home</a></li>
					<li><a href="#">About</a></li>
					<li><a href="#">Services</a></li>
					<li><a href="#">Works</a></li>
					<li><a href="#">News</a></li>
					<li><a href="#">Contact</a></li>
					<li>
						<a class="btn btn-default btn-outline btn-circle collapsed"  data-toggle="collapse" href="#nav-collapse4" aria-expanded="false" aria-controls="nav-collapse4">Profile <i class=""></i> </a>
					</li>
				</ul>
				<ul class="collapse nav navbar-nav nav-collapse slide-down" role="search" id="nav-collapse4">
					<li><a href="#">Support</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><img class="img-circle" src="https://pbs.twimg.com/profile_images/588909533428322304/Gxuyp46N.jpg" alt="maridlcrmn" width="20" /> Maridlcrmn <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">My profile</a></li>
							<li><a href="#">Favorited</a></li>
							<li><a href="#">Settings</a></li>
							<li class="divider"></li>
							<li><a href="#">Logout</a></li>
						</ul>
					</li>
				</ul>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container -->
	</nav><!-- /.navbar -->
</div><!-- /.container-fluid -->

<div class="[ container ]">
	<div class="[ row ]">
		<div class="[ col-xs-12 col-md-offset-1 col-md-10 text-center ]">
			<p>I created this because I loved the design done by <a href="http://bootsnipp.com/maridlcrmn" target="_blank">maridlcrmn</a> on her <a href="http://bootsnipp.com/snippets/ZkpRl" target="_blank">Toggle navbar</a> but wanted a fancier slide down naviation when you click on the toggle button. However my code does come with a limitation, you will not be able to use dropdowns within your navigation if using this method because <code>overflow</code> is set to <strong>hidden</strong>. You can see this in action by trying to use the very last navigation on this snippet.</p>
		</div>
	</div>
</div>