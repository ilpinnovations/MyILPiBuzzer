<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	if (session.getAttribute("empid") == null) {
		response.sendRedirect("index.jsp");
	}
%>

<html>
<head>
<title>MyILP</title>
<link rel="shortcut icon" href="assets/images/Tata_logo_356_1345_356.png">

<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link href="assets/css/custom.css" rel="stylesheet" />
<link href="assets/css/bootstrap-datetimepicker.css" rel="stylesheet" />
<link href="assets/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

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



<!-- BOOTSTRAP STYLES-->
<link href="css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link href="css/custom.css" rel="stylesheet" />
<link rel="icon" type="image/png" href="images/favicon.png">
<!--  Including Scripts and CSS -->

<link rel="icon" type="image/png" href="images/favicon.png">

<!-- Custom Theme files -->

<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" href="css/formValidation.css" />



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script src="js/menu_jquery.js"></script>
<!--  End of Scripts and CSS -->

</head>
<body>
	<div id="wrapper">
	
		<nav class="navbar navbar-default navbar-cls-top " role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".sidebar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">MyILP</a>
		</div>
		<div
			style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;">
			&nbsp; <a href="LogOutUser" class="btn btn-danger square-btn-adjust">Logout</a>
		</div>
		</nav>
		<!-- /. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav" id="main-menu">
				<li class="text-center"><img src="assets/images/images.png"
					class="user-image img-responsive" /></li>


				<li><a href="GetQues"> <i
						class="fa fa-dashboard fa-1x"></i>Dashboard
				</a></li>
				<li><a href="Status"> <i class="fa fa-edit fa-1x"></i>Status
				</a></li>
				<li><a href="#"> <i class="fa fa-bolt fa-1x"></i>Questions<span
						class="fa arrow"></span>
				</a>

					<ul class="nav nav-second-level">
						<li><a href="AddQuestion.jsp" class="active-menu"><i
								class="fa fa-user fa-1x"></i>Add Question</a></li>
						<li><a href="GetQuestions"><i class="fa fa-edit fa-1x"></i>Edit
								Question </a></li>
						<li><a href="DeleteQuestion"><i class="fa fa-edit fa-1x"></i>Delete
								Question </a></li>

					</ul></li>
				<li><a href="GetQuesId"> <i
						class="fa fa-line-chart fa-1x"></i>Analytics
				</a></li>
			</ul>

		</div>

		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
<div class="se-pre-con"></div>
			
				<%
					if (session.getAttribute("msg") != null
							&& "Success".equals(session.getAttribute("msg"))) {
						session.removeAttribute("msg");
				%>
				<button id='btn' style='display: none;'
					class="trigger error-trigger">Error</button>
				<div class="alert alert-success fade in">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<strong>Success! </strong>Question addedd successfully.
				</div>
				<%
					}
				%>
				<%
					if (session.getAttribute("msg") != null
							&& "Failed".equals(session.getAttribute("msg"))) {
						session.removeAttribute("msg");
				%>
				<button id='btn' style='display: none;'
					class="trigger error-trigger">Error</button>
				<div class="alert alert-danger fade in">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<strong>Limit exceeded! </strong>Question could not be added. You already have 5 active questions
				</div>
				<%
					}
				%>
				<%
					if (session.getAttribute("msg") != null
							&& "Error".equals(session.getAttribute("msg"))) {
						session.removeAttribute("msg");
				%>
				<button id='btn' style='display: none;'
					class="trigger error-trigger">Error</button>
				<div class="alert alert-danger fade in">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<strong>Sorry! </strong>Question could not be added.
				</div>
				<%
					}
				%>
				<%
					if (session.getAttribute("msg") != null
							&& "Excess".equals(session.getAttribute("msg"))) {
						session.removeAttribute("msg");
				%>
				<button id='btn' style='display: none;'
					class="trigger error-trigger">Error</button>
				<div class="alert alert-danger fade in">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<strong>Limit Exceeded! </strong>Question could not be added. You have already added 20 questions. Please delete a few questions to continue adding questions.
				</div>
				<%
					}
				%>
				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="fa fa-edit fa-1x"></i> &nbsp; Add Questions
					</div>
					<form action='AddQuestion' method="post" name="deafultForm"
						id="defaultForm" class="form-horizontal">
							<div class="panel-body">
								<div class="form-group">
									<label class="col-lg-3 control-label"><span
										class="glyphicon glyphicon-tag"></span>Question</label>
									<div class="col-lg-8">
										<textarea class="form-control" name='question'></textarea>
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-3 control-label">Option 1<span style="color:red">*</span></label>
									<div class="col-lg-5">
										<input type="text" class="form-control" name='option1' />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label">Option 2<span style="color:red">*</span></label>
									<div class="col-lg-5">
										<input type="text" class="form-control" name="option2" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label">Option 3</label>
									<div class="col-lg-5">
										<input type="text" class="form-control" name="option3" value=""/>
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label">Option 4</label>
									<div class="col-lg-5">
										<input type="text" class="form-control" name="option4" value=""/>
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label">Correct answer</label>
									<div class="col-lg-5">
									<select name="option" class="form-control">
									<option name="1" value="1">option 1</option>
									<option name="2" value="2">option 2</option>
									<option name="3" value="3">option 3</option>
									<option name="4" value="4">option 4</option>
									</select>
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-4 text-right">
										<button class="btn btn-primary" type="submit">Submit</button>
									</div>

								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- /. PAGE INNER  -->
	</div>
	<!-- /. PAGE WRAPPER  -->
	</div>


	<!--  End of Scripts and CSS -->
	<script type="text/javascript">
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
													question : {
														message : 'The question is not valid',
														validators : {
															notEmpty : {
																message : 'The question is required and can\'t be empty'
															},
															stringLength : {
																min : 6,
																max : 100,
																message : 'The question must be more than 6 and less than 100 characters long'
															}
														}
													},
													option1 : {
														validators : {
															notEmpty : {
																message : 'The option is required and can\'t be empty'
															}
														}
													},
													option2 : {
														validators : {
															notEmpty : {
																message : 'The option is required and can\'t be empty'
															}
														}
													},
													answer : {
														validators : {
															notEmpty : {
																message : 'Correct Answer is required and can\'t be empty'
															},
															regexp : {
																regexp : /^[1234]+$/,
																message : 'The Correct answer can only consist of number'
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
													}
												}
											});
						});
	</script>
</body>

</html>