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
<link href="assets/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="assets/css/toggle.css" />

<link rel="stylesheet" href="assets/css/formValidation.css" />
<link href="assets/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/toggle.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="assets/css/sb-admin.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="assets/css/plugins/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="assets/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- BOOTSTRAP STYLES-->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link href="assets/css/custom.css" rel="stylesheet" />

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
	z-index: 9999;
	background: url(assets/images/ajax-loader.gif) center no-repeat #fff;
}
</style>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="assets/js/jquery-1.11.3.js"></script>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<script src="assets/js/bootstrap.js"></script>
<script type="text/javascript" src="assets/js/bootstrapValidator.js"></script>
<script src="assets/js/menu_jquery.js"></script>
<!--  End of Scripts and CSS -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
<script>
	$(window).load(function() {
		$(".se-pre-con").fadeOut("slow");
	});
	</script>
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
				<li><a href="Status" class="active-menu"> <i
						class="fa fa-edit fa-1x"></i>Status
				</a></li>
				<li><a href="#"> <i class="fa fa-bolt fa-1x"></i>Questions<span
						class="fa arrow"></span>
				</a>

					<ul class="nav nav-second-level">
						<li><a href="AddQuestion.jsp"><i class="fa fa-user fa-1x"></i>Add
								Question</a></li>
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
				<!-- /. ROW  -->
				<%
					if (session.getAttribute("deactivate") != null
							&& "Success".equals(session.getAttribute("deactivate"))) {
						session.removeAttribute("deactivate");
				%>
				<button id='btn' style='display: none;'
					class="trigger error-trigger">Error</button>
				<div class="alert alert-success fade in">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<strong>Success! </strong>Question deactivated successfully.
				</div>
				<%
					}
				%>
				<%
					if (session.getAttribute("activate") != null
							&& "Success".equals(session.getAttribute("activate"))) {
						session.removeAttribute("activate");
				%>
				<button id='btn' style='display: none;'
					class="trigger error-trigger">Error</button>
				<div class="alert alert-success fade in">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<strong>Success! </strong>Question activated successfully.
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
					<strong>Sorry! </strong>There are no questions to be activated/deactivated.
				</div>
				<%
					}
				%>
				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="fa fa-edit fa-1x"></i> &nbsp;<strong> Activate
							| Deactivate</strong>
					</div>
					<div class="form-horizontal">
						<div class="form-group">
							<br>
							<table width="95%" align="right">
								<%
								try{
									ArrayList<Question> quesList = (ArrayList<Question>) request
											.getAttribute("quesList");
									request.setAttribute("quesList", quesList);
									int i = 1;
									if (quesList.size() > 0) {
										for (Question q : quesList) {
								%>
								<tr>
									<td width="4%"><span class="glyphicon glyphicon-tag"></span></td>
									<td width="70%">
										<h5><%=q.getQues()%>
										</h5>
									</td>
									<td><div class="col-md-24">
											<form action="index.jsp">
												<%
													if (q.getStatus().equals("Active")) {
												%>

												<div class="switch-field<%=i%>">
													<input type="radio" id="switch_left<%=i%>" name="status<%=i %>"
														value="active" checked
														onclick="window.location='<%=request.getContextPath()%>/StatusChange?status=active&quesid=<%=q.getQuesid()%>'" />
													<label for="switch_left<%=i%>">Activate</label> <input
														type="radio" id="switch_right<%=i%>" name="status<%=i %>"
														value="inactive"
														onclick="window.location='<%=request.getContextPath()%>/StatusChange?status=inactive&quesid=<%=q.getQuesid()%>'" />
													<label for="switch_right<%=i%>">Deactivate</label>
												</div>
											</form>
											<%
														} else if (q.getStatus().equals("Inactive")) {
											%>
											<div class="switch-field<%=i%>">
												<input type="radio" id="switch_left<%=i%>" name="status<%=i %>"
													value="active"
													onclick="window.location='<%=request.getContextPath()%>/StatusChange?status=active&quesid=<%=q.getQuesid()%>'" />
												<label for="switch_left<%=i%>">Activate</label> <input
													type="radio" id="switch_right<%=i%>" name="status<%=i %>"
													value="inactive"
													onclick="window.location='<%=request.getContextPath()%>/StatusChange?status=inactive&quesid=<%=q.getQuesid()%>'"
													checked /> <label for="switch_right<%=i%>">Deactivate</label>
											</div>
											<%
														}
												i++;
											%>

										</div></td>
								</tr>
								<%
									}
									}
								}catch(Exception e){
									
								}
								%>
							</table>
						</div>
						</form>
						<br> <br>
					</div>
				</div>
			</div>

			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
</body>

</html>