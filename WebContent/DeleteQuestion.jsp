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
<link rel="shortcut icon"
	href="assets/images/Tata_logo_356_1345_356.png">

<link href="assets/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

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
<link rel="icon" type="image/png" href="images/favicon.png">
<!--  Including Scripts and CSS -->

<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" href="assets/css/formValidation.css" />



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="assets/js/jquery-1.11.3.js"></script>
<script src="assets/js/bootstrap.js"></script>
<script type="text/javascript" src="assets/js/bootstrapValidator.js"></script>
<script src="assets/js/menu_jquery.js"></script>
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


				<li><a href="GetQues"> <i class="fa fa-dashboard fa-1x"></i>Dashboard
				</a></li>
				<li><a href="Status"> <i class="fa fa-edit fa-1x"></i>Status
				</a></li>
				<li><a href="#"> <i class="fa fa-bolt fa-1x"></i>Questions<span
						class="fa arrow"></span>
				</a>

					<ul class="nav nav-second-level">
						<li><a href="AddQuestion.jsp"><i class="fa fa-user fa-1x"></i>Add
								Question</a></li>
						<li><a href="GetQuestions"><i class="fa fa-edit fa-1x"></i>Edit
								Question </a></li>
						<li><a href="DeleteQuestion" class="active-menu"><i
								class="fa fa-edit fa-1x"></i>Delete Question </a></li>

					</ul></li>
				<li><a href="GetQuesId"> <i class="fa fa-line-chart fa-1x"></i>Analytics
				</a></li>
			</ul>

		</div>

		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<!-- /. ROW  -->
				<%
					if (session.getAttribute("delete") != null
							&& "Success".equals(session.getAttribute("delete"))) {
						session.removeAttribute("delete");
				%>
				<button id='btn' style='display: none;'
					class="trigger error-trigger">Error</button>
				<div class="alert alert-success fade in">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<strong>Success! </strong>Question deleted successfully.
				</div>
				<%
					}
				%>
				<%
					if (session.getAttribute("delete") != null
							&& "Failed".equals(session.getAttribute("delete"))) {
						session.removeAttribute("delete");
				%>
				<button id='btn' style='display: none;'
					class="trigger error-trigger">Error</button>
				<div class="alert alert-danger fade in">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<strong>Sorry!</strong> Question could not be deleted.
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
					<strong>Attention!</strong>There are no more Question to be deleted.
				</div>
				<%
					}
				%>
				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="fa fa-edit fa-1x"></i> &nbsp;<strong> Delete
							question</strong>
					</div>
					<%
					try{
						ArrayList<Question> quesList = (ArrayList<Question>) request
								.getAttribute("quesList");
					if(quesList.size()>0){
					
					for (Question q : quesList) {
					%>
						<br>			
					<form method="post" name="deafultForm"
						id="defaultForm" class="form-horizontal" action="DeleteQues">
						<div class="form-horizontal">
							<div class="form-group">
							
								<table width="95%" align="right">
									<tr>
										<td width="4%"><span class="glyphicon glyphicon-tag"></span></td>
										<td width="70%">
											<h5><%=q.getQues()%>
											</h5>
										</td>
										<td width="20%"><div class="col-sm-8">
												<input type="hidden" name="quesid"
													value='<%=q.getQuesid()%>'> <input type="hidden"
													name="quesList" value="<%=quesList%>">
												<button class="btn btn-primary" style="background-color: rgb(11,181,180)" type="submit">Delete</button>
											</div></td>
									</tr>
								</table>
							</div>
					</form>
					<%
					}
					}
					}catch(Exception e){
						
					}
					%>
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