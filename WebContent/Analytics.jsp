<%@page import="java.awt.PageAttributes"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.io.*,java.sql.*,java.net.*,bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	if (session.getAttribute("empid") == null) {
		response.sendRedirect("index.jsp");
	}
%>

<html>
<head>
<meta http-equiv="refresh" content="15" >
<title>MyILP</title>
<link rel="shortcut icon" href="assets/images/Tata_logo_356_1345_356.png">

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>

<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link href="assets/css/custom.css" rel="stylesheet" />
<link href="assets/css/bootstrap-datetimepicker.css" rel="stylesheet" />
<link href="assets/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<link rel="stylesheet" href="assets/css/formValidation.css" />

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="assets/js/jquery-1.11.3.js"></script>
<script src="assets/js/bootstrap.js"></script>
<script type="text/javascript" src="assets/js/bootstrapValidator.js"></script>
<script src="assets/js/menu_jquery.js"></script>
<!--  End of Scripts and CSS -->



<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" href="assets/css/formValidation.css" />

<script type="text/javascript" src="canvasjs.min.js"></script>
</head>
<body onload="jsonParse2();jsonParse3()">
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
						<li><a href="AddQuestion.jsp"><i class="fa fa-user fa-1x"></i>Add
								Question</a></li>
						<li><a href="GetQuestions"><i class="fa fa-edit fa-1x"></i>Edit
								Question </a></li>
						<li><a href="DeleteQuestion"><i class="fa fa-edit fa-1x"></i>Delete
								Question </a></li>

					</ul></li>
				<li><a href="GetQuesId" class="active-menu"> <i
						class="fa fa-line-chart fa-1x"></i>Analytics
				</a></li>
			</ul>

		</div>

		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
			<%
					if (session.getAttribute("msg") != null
							&& "Failed".equals(session.getAttribute("msg"))) {
						session.removeAttribute("msg");
				%>
				<button id='btn' style='display: none;'
					class="trigger error-trigger">Error</button>
				<div class="alert alert-danger fade in">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<strong>Sorry!</strong>There are no Questions to be selected.
				</div>
				<%
					}
				%>

				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="fa fa-edit fa-1x"></i> &nbsp; Analytics
					</div>
					<div class="panel-body">
						<%
						try{
							ArrayList<Question> quesList = (ArrayList<Question>) request
									.getAttribute("quesList");
							if (quesList.size() > 0) {
							
						%>
						<form action="GetBarChart">
						<div class="col-lg-10">
							<i class="fa fa-bullhorn"></i> &nbsp;<label>Question</label> <select
								class="form-control" name="sel">
								<%
										for (Question q : quesList) {
									String quesId = q.getQuesid();
											String ques = q.getQues();
								%>
								<option value=<%=quesId%>><%=ques%></option>
								<%
									}
									}
								%>
								</select>
								</div>
								<div class="col-lg-2 text-right" style="margin-top:25px">
										<button class="btn btn-primary" type="submit">Go</button>
									</div>
						</form>
						<%
						}
						catch(Exception e){
							
						}
						%>
					</div>
						<div class="panel-body">
					<div id="chart2" style="height: 350px;"></div>
					</div><br><br><hr><br><br>
						<div class="panel-body">
					<div id="chart3" style="height: 350px;"></div>
					</div>
					
				</div>
			</div>
		</div>

		<!-- /. PAGE INNER  -->
		<!-- /. PAGE WRAPPER  -->
	</div>
<%if(session.getAttribute("json2")!=null){%>
<script>
	
	var points2 = [];
	function jsonParse2() {
		var centre=["Trivandrum","Hyderabad","Chennai","Ahemdabad","Guwahati"];
		
		var json2 =
<%=session.getAttribute("json2")%>
	;
	<%session.removeAttribute("json2");%>
		var i = 0;
		for (i = 0; i < Object.keys(json2.data).length; i) {
			points2.push({
				y : parseInt(json2.data[i].count),
				label : centre[i]
			});
			++i;
		}
		CanvasJS.addColorSet("greenShades",
                [//colorSet Array

                "#2F4F4F",
                "#008080",
                "#2E8B57",
                "#3CB371",
                "#90EE90"                
                ]);

		var chart2 = new CanvasJS.Chart("chart2", {
			creditText : "  ",
			colorSet: "greenShades",
			
			animationEnabled : true,
			theme : "theme3",
			title : {
				text : "Answer for a question centre wise"
			},
			axisY : {
				title:"Individual Question Answered",
				labelFontSize : 25,
				labelFontColor : "dimGrey"
			},
			axisX : {
				title:"ILP Centre",
				labelAngle : -30
			},
			data : [ {
				type : "column",
				dataPoints : points2
			} ]
		});
		chart2.render();
	}
	
</script>
<%}%>
<%if(session.getAttribute("json3")!=null){%>
<script>
var option=["Option1","Option2","Option3","Option4"];

	var points3 = [];
	function jsonParse3() {
		var json3 =
<%=session.getAttribute("json3")%>
	;
	<%session.removeAttribute("json3");%>
		var i = 0;
		for (i = 0; i < Object.keys(json3.data).length; i) {
			points3.push({
				y : parseInt(json3.data[i].count),
				label : option[i]
			});
			++i;
		}
		CanvasJS.addColorSet("greenShades",
                [//colorSet Array

                "#2F4F4F",
                "#008080",
                "#2E8B57",
                "#3CB371",
                "#90EE90"                
                ]);

		var chart3 = new CanvasJS.Chart("chart3", {
			creditText : "  ",
			colorSet: "greenShades",
			
			animationEnabled : true,
			theme : "theme3",
			title : {
				text : "Option choice from all centres"
			},
			axisY : {
				title:"Individual answers",
				labelFontSize : 25,
				labelFontColor : "dimGrey"
			},
			axisX : {
				title:"Options",
				labelAngle : -30
			},
			data : [ {
				type : "column",
				dataPoints : points3
			}]
		});
		chart3.render();
	}
	
</script>
<%}%>


</body>

</html>