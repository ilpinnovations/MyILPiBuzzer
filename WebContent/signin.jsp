<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Sergey Pozhilov (GetTemplate.com)">

<title>MyILP</title>
<link rel="shortcut icon" href="assets/images/Tata_logo_356_1345_356.png">

<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link href="css/custom.css" rel="stylesheet" />
<link rel="icon" type="image/png"
	href="images/Tata_logo_356_1345_356.png">
<!-- Custom Theme files -->

<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" href="assets/css/formValidation.css" />

<style>
.no-js #loader { display: none;  }
.js #loader { display: block; position: absolute; left: 100px; top: 0; }
.se-pre-con {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: url(assets/images/ajax-loader.gif) center no-repeat #fff;
}
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
<script>
	$(window).load(function() {
		$(".se-pre-con").fadeOut("slow");;
	});
	</script>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="assets/js/jquery-1.11.3.js"></script>
<script src="assets/js/bootstrap.js"></script>
<script type="text/javascript" src="assets/js/bootstrapValidator.js"></script>
<script src="assets/js/menu_jquery.js"></script>
<!--  End of Scripts and CSS -->

<link rel="shortcut icon"
	href="assets/images/Tata_logo_356_1345_356.png">
<link rel="stylesheet" href="css/formValidation.css" />
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<script src="assets/js/jquery-1.11.3.js"></script>
<script src="assets/js/bootstrap.js"></script>
<script type="text/javascript" src="assets/js/bootstrapValidator.js"></script>
<script src="assets/js/menu_jquery.js"></script>
<!-- Custom CSS -->
<link href="assets/css/sb-admin.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="assets/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

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
<link rel="stylesheet" href="css/formValidation.css" />
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<script src="assets/js/jquery-1.11.3.js"></script>
<script src="assets/js/bootstrap.js"></script>
<script type="text/javascript" src="assets/js/bootstrapValidator.js"></script>
<script src="assets/js/menu_jquery.js"></script>
<!-- Custom CSS -->
<link href="assets/css/sb-admin.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="assets/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">


</head>

<body>
	<!-- Fixed navbar -->
	<div class="navbar navbar-inverse navbar-fixed-top headroom" style="background: black">
		<div class="container" style="background: black">
			<div class="navbar-header">
				<!-- Button for smallest screens -->
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp"><img
					src="assets/images/Tata_logo_356_1345_356.png" height="50px"
					width="50px"></a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right">
					<li><a href="index.jsp">Home</a></li>
					<li><a href="#" data-toggle="modal" data-target="#myModal">Contact</a></li>
					<li class="active"><a class="btn" href="signin.jsp">LOGIN</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
	<!-- /.navbar -->
	<!-- container -->
	<div class="container">

		<ol class="breadcrumb">
			<li><a href="index.jsp">Home</a></li>
			<li class="active">User access</li>
		</ol>

		<div class="row">
<div class="se-pre-con"></div>
			
			<!-- Article main content -->
			<article class="col-xs-12 maincontent">
				<header class="page-header">
					<h1 class="page-title">Sign in</h1>
				</header>
				<%
					if (session.getAttribute("msg") != null
							&& "Failed".equals(session.getAttribute("msg"))) {
						session.removeAttribute("msg");
				%>
				<button id='btn' style='display: none;'
					class="trigger error-trigger">Error</button>
				<div class="alert alert-danger fade in">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<strong>Login Failed!</strong> Invalid username or password.
				</div>
				<%
					}
				%>

				<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
					<div class="panel panel-default">
						<div class="panel-body">
							<h3 class="thin text-center">Sign in to your account</h3>
							<hr>
							<div class="panel panel-default">
								<div class="panel-body">
								<form action="LoginUser">
									<div class="form-group">
										<div class="top-margin">
											<label class="col-lg-4 control-label">Employee ID <span
												class="text-danger">*</span></label>
											<div class="col-lg-8">
												<input type="text" class="form-control" name="empid"
													id="empid" required title="Employee ID required">
											</div>
											<div class="col-lg-12"><br></div>
											<label class="col-lg-4 control-label">Email ID <span
												class="text-danger">*</span></label>
											<div class="col-lg-8">
												<input type="text" class="form-control" name="emailid"
													id="emailid" required title="Email ID required">
											</div>
										</div>
									</div>
									<hr>
									<div class="row">
									<br>
									<div class="col-lg-12 text-right" style="margin-left:-14px">
									<br>
											<button class="btn btn-primary" type="submit" id="submit">Sign in</button>

										</div>
										</div>
									
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>

			</article>
			<!-- /Article -->

		</div>
	</div>
	<!-- /container -->


	<footer id="footer" class="top-space">

		<div class="footer1">
			<div class="container">
				<div class="row">

					<div class="col-md-6 widget">
						<h3 class="widget-title">Contact</h3>
						<div class="widget-body">
							<p>
								<a href="mailto:#">Innovations.ILPSupport@tcs.com</a><br>
								<br> Peepul Park, Trivandrum
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
								<a href="index.jsp">Home</a> | <a href="#">Contact</a>
								| <b><a href="signin.jsp">Sign up</a></b>
							</p>
						</div>
					</div>

					<div class="col-md-6 widget">
						<div class="widget-body">
							<p class="text-right">Copyright &copy; 2015, Tata Consultancy services.</p>
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



		<script src="assets/js/headroom.min.js"></script>
	<script src="assets/js/jQuery.headroom.min.js"></script>
	<script src="assets/js/template.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							// Generate a simple captcha
							function randomNumber(min, max) {
								return Math.floor(Math.random()
										* (max - min + 1) + min);
							}
							;
							$('#captchaOperation').html(
									[ randomNumber(1, 100), '+',
											randomNumber(1, 200), '=' ]
											.join(' '));

							$('#defaultForm')
									.bootstrapValidator(
											{
												message : 'This value is not valid',
												feedbackIcons : {
													valid : 'glyphicon glyphicon-ok',
													invalid : 'glyphicon glyphicon-remove',
													validating : 'glyphicon glyphicon-refresh'
												},
												fields : {
													empid : {
														message : 'The Employee ID is not valid',
														validators : {
															notEmpty : {
																message : 'The Employee ID is required and can\'t be empty'
															},
															stringLength : {
																min : 6,
																max : 30,
																message : 'The Employee ID must be more than 6 and less than 30 characters long'
															},
															regexp : {
																regexp : /^[a-zA-Z0-9_\.]+$/,
																message : 'The Employee ID can only consist of alphabetical, number, dot and underscore'
															}
														}
													},
													password : {
														validators : {
															notEmpty : {
																message : 'The password is required and can\'t be empty'
															}
														}
													},
													captcha : {
														validators : {
															callback : {
																message : 'Wrong answer',
																callback : function(
																		value,
																		validator) {
																	var items = $(
																			'#captchaOperation')
																			.html()
																			.split(
																					' '), sum = parseInt(items[0])
																			+ parseInt(items[2]);
																	return value == sum;
																}
															}
														}
													},
													acceptTerms : {
														validators : {
															notEmpty : {
																message : 'You must accept the terms and agreements'
															}
														}
													}
												}
											});
						});
	</script>

</body>
</html>