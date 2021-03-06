<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*,bean.*"%>
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


				<li><a href="GetQues" class="active-menu"> <i
						class="fa fa-dashboard fa-1x" class="active-menu"></i>Dashboard
				</a></li>
				<li><a href="Status"> <i class="fa fa-edit fa-1x"></i>Status
				</a></li>
				<li><a href="#"> <i class="fa fa-bolt fa-1x"></i>Questions<span
						class="fa arrow"></span>
				</a>

					<ul class="nav nav-second-level">
						<li><a href="AddQuestion.jsp"><i
								class="fa fa-user fa-1x"></i>Add Question</a></li>
						<li><a href="GetQuestions"><i
								class="fa fa-edit fa-1x"></i>Edit Question </a></li>
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
							&& "Failed".equals(session.getAttribute("msg"))) {
						session.removeAttribute("msg");
				%>
				<button id='btn' style='display: none;'
					class="trigger error-trigger">Error</button>
				<div class="alert alert-danger fade in">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<strong></strong>Please start with adding a question.
				</div>
				<%
					}
				%>

				<%
					if (session.getAttribute("empName") != null) {
				%>
				<button id='btn' style='display: none;'
					class="trigger error-trigger">Error</button>
				<div>
					<h5>
						Welcome back! <strong><%=session.getAttribute("empName")%><strong>
					</h5>
				</div>
				<%
					}
				%>
				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="fa fa-dashboard fa-1x"></i> &nbsp;Dashboard
					</div>
					<div class="panel-default">
						<%
							try {
								ArrayList<Question> quesList = (ArrayList<Question>) request
										.getAttribute("quesList");
								if (quesList.size() > 0) {
									for (Question q : quesList) {
						%>
						<form action='GetQuestions' method="post" name="deafultForm"
							id="defaultForm" class="form-horizontal">
							<div class="panel-body">
								<div class="form-group">
									<img src="assets/images/download.png"
											style="float: left; margin-left: 10px" height="50px"
											width="50px"> <label class="col-lg-3 control-label"
											style="margin-left: -58px"><span
											class="glyphicon glyphicon-tag"></span>Question</label>
										<div class="col-lg-8">
											<textarea class="form-control" name="question"
												readonly='readonly'><%=q.getQues()%></textarea>
											<input type="hidden" name="quesid" value='<%=q.getQuesid()%>'>
										</div>
									
								</div>

								<div class="form-group">
									<label class="col-lg-3 control-label">Option 1</label>
									<div class="col-lg-5">
										<input type="text" class="form-control" name="option1"
											value='<%=q.getOption1()%>'  readonly="readonly" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label">Option 2</label>
									<div class="col-lg-5">
										<input type="text" class="form-control" name="option2"
											value='<%=q.getOption2()%>'  readonly="readonly" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label">Option 3</label>
									<div class="col-lg-5">
										<input type="text" class="form-control" name="option3"
											value='<%=q.getOption3()%>'  readonly="readonly" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label">Option 4</label>
									<div class="col-lg-5">
										<input type="text" class="form-control" name="option4"
											value='<%=q.getOption4()%>'  readonly="readonly" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label">Correct Answer</label>
									<div class="col-lg-5">
										<input type="text" class="form-control" name="answer"
											value='<%=q.getCorrectAnswer()%>'  readonly="readonly" />
									</div>
								</div>
								<hr>
							</div>
						</form>
						<%
							}
									}
						
						%>
						<form action='GetQuestions' method="post" name="deafultForm"
							id="defaultForm" class="form-horizontal">
							<div class="form-group">
								<div class="panel-body">
									<div class="col-lg-4 text-right">
										<button class="btn btn-primary" type="submit">Edit</button>
									</div>
								</div>
							</div>
						</form>
						<%
							} catch (Exception e) {

							}
						%>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- /. PAGE INNER  -->
	</div>
	<!-- /. PAGE WRAPPER  -->
	</div>
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
													option3 : {
														validators : {
															notEmpty : {
																message : 'The option is required and can\'t be empty'
															}
														}
													},
													option4 : {
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
																message : 'The Correct answer can only consist of options 1,2,3,4'
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


	<!--  End of Scripts and CSS -->
	</body>

</html>