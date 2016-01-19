<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	if (session.getAttribute("empName") != null) {
		request.getRequestDispatcher("GetQues").forward(request, response);
			}
%>

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Sergey Pozhilov (GetTemplate.com)">

<title>MyILP</title>

<link rel="shortcut icon" href="assets/images/Tata_logo_356_1345_356.png">

<link rel="stylesheet" media="screen"
	href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">

<!-- Custom styles for our template -->
<link rel="stylesheet" href="assets/css/bootstrap-theme.css"
	media="screen">
<link rel="stylesheet" href="assets/css/main.css">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	<script src="assets/js/html5shiv.js"></script>
	<script src="assets/js/respond.min.js"></script>
	<![endif]-->
</head>

<body class="home">
	<!-- Fixed navbar -->
	<div class="navbar navbar-inverse navbar-fixed-top headroom">
		<div class="container">
			<div class="navbar-header">
				<!-- Button for smallest screens -->
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp"><img
					src="assets/images/Tata_logo_356_1345_356.png" height="50px" width="50px" alt="MyILP"></a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right">
					<li class="active"><a href="index.jsp">Home</a></li>
				<li><a href="#" data-toggle="modal" data-target="#myModal">Contact</a></li>
					<li><a class="btn" href="signin.jsp">LOGIN</a></li>
					
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
	<!-- /.navbar -->

	<!-- Header -->
	<header id="head">
		<div class="container">
			<div class="row" height="300px">
				<h1 class="lead">MyILP</h1>
				<p class="tagline">AWESOME, CUSTOMIZABLE, FREE</p>
			</div>
		</div>
	</header>
	<!-- /Header -->

	<!-- Intro -->
	<div class="container text-center">
		<br> <br>
		<h2 class="thin">The best place to interact between associates and faculties</h2>
		<p class="text-muted">
			A platform to integrate...
		</p>
	</div>
	<!-- /Intro-->

	<!-- Highlights - jumbotron -->
	
	<!-- Social links. @TODO: replace by link/instructions in template -->
	<section id="social">
		<div class="container">
			<div class="wrapper clearfix">
				<!-- AddThis Button BEGIN -->
				<div class="addthis_toolbox addthis_default_style">
					<a class="addthis_button_facebook_like"
						fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a>
					<a class="addthis_button_linkedin_counter"></a> <a
						class="addthis_button_google_plusone" g:plusone:size="medium"></a>
				</div>
				<!-- AddThis Button END -->
			</div>
		</div>
	</section>
	<!-- /social links -->


	<footer id="footer" class="top-space">

		<div class="footer1">
			<div class="container">
				<div class="row">

					<div class="col-md-6 widget">
						<h3 class="widget-title">Contact</h3>
						<div class="widget-body">
							<p>
								<a href="mailto:#">Innovations.ILPSupport@tcs.com</a><br>
								<br>  Peepul Park, Trivandrum
							</p>
						</div>
					</div>
				</div>
				<!-- /row of widgets -->
			</div>
		</div>

		<div class="footer2">
			<div class="container">
				<div class="row">

					<div class="col-md-6 widget">
						<div class="widget-body">
							<p class="simplenav">
								<a href="index.jsp">Home</a> | <a href="#">About</a> | <a href="#" data-toggle="modal" data-target="#myModal">Contact</a>
								| <b><a href="signin.jsp">Sign up</a></b>
							</p>
						</div>
					</div>

					<div class="col-md-6 widget">
						<div class="widget-body">
							<p class="text-right">
								Copyright &copy; 2014, Tata Consultancy Services. 
							</p>
						</div>
					</div>

				</div>
				<!-- /row of widgets -->
			</div>
		</div>

	</footer>
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">
						<img align="center" src="assets/images/email.png" alt=""> Contact
						Us
					</h4>
				</div>
				<div class="modal-body">
					<h5 style="margin-left: 40%">
						<strong><u>Email us at</u></strong>
					</h5>
					<div style="margin-left: 32%">
						Innovations.ILPSupport@tcs.com
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
<script type="text/javascript">
	$(document).ready(function() {
		//$('#dialog').dialog(); 
		$('a#contact').click(function() {
			$('#dialog').dialog('open');
			return false;
		});
	});
</script>





	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="assets/js/headroom.min.js"></script>
	<script src="assets/js/jQuery.headroom.min.js"></script>
	<script src="assets/js/template.js"></script>
</body>
</html>