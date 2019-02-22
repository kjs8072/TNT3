<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>출결</title>
<!-- Bootstrap core CSS -->
<link href="<%= request.getContextPath() %>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="<%= request.getContextPath() %>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->
<link href="<%= request.getContextPath() %>/css/landing-page.min.css" rel="stylesheet">
 
</head>
<body>

<!-- Navigation -->
	<nav class="navbar navbar-light bg-light static-top">
		<div class="container">
			<a class="navbar-brand" href="<%= request.getContextPath() %>/student_login/student_main.jsp" style="color:blue">TUTER & TUTEE</a>
			<%
           		if(session.getAttribute("sid") ==null){
      		%>
       		<a class="btn btn-primary" href="<%= request.getContextPath() %>/index.jsp">Sign In</a>
       		<%
             	} else {
       		%>
            	<a class="btn btn-primary" href="<%= request.getContextPath() %>/Login_form/logout.jsp">logout</a>
       		<%} %>
    	</div>
	</nav>

<!-- Masthead -->
	<header class="masthead text-white text-center">
		<div class="overlay"></div>

  </header>

<section class="features-icons bg-light text-center">
	<div class="container">
		<%  String state = request.getParameter("state"); 
			if (state.equals("init")) {
		%>
		<div class="features-icons-item mx-auto mb-0 mb-lg-3">
			<div class="features-icons-icon d-flex">
				<i class="icon-check m-auto text-primary"></i>
			</div>
			<h3><a href="<%= request.getContextPath() %>/student_login/TNT_Attend_control.jsp?action=insert">입실</a></h3>
			<p class="lead mb-0"></p>
		</div>
		<% } else if(state.equals("attendance")) { %>
		<div class="container">
			<div class="row">
				<div class="features-icons-item mx-auto mb-0 mb-lg-3">
					<div class="features-icons-icon d-flex">
						<i class="icon-check m-auto text-primary"></i>
					</div>
					<h3><a href="<%= request.getContextPath() %>/student_login/TNT_Attend_control.jsp?action=out_update">외출</a></h3>
					<p class="lead mb-0"></p>
				</div>
					
				<div class="features-icons-item mx-auto mb-0 mb-lg-3">
					<div class="features-icons-icon d-flex">
						<i class="icon-check m-auto text-primary"></i>
					</div>
					<h3><a href="<%= request.getContextPath() %>/student_login/TNT_Attend_control.jsp?action=leaving_update">퇴실</a></h3>
					<p class="lead mb-0"></p>
				</div>
			</div>
		</div>
		<% }else if(state.equals("out")) { %>
		<div class="container">
			<div class="row">
				<div class="features-icons-item mx-auto mb-0 mb-lg-3">
					<div class="features-icons-icon d-flex">
						<i class="icon-check m-auto text-primary"></i>
					</div>
					<h3><a href="<%= request.getContextPath() %>/student_login/TNT_Attend_control.jsp?action=return_update">복귀</a></h3>
            		<p class="lead mb-0"></p>
            	</div>
            	
            	<div class="features-icons-item mx-auto mb-0 mb-lg-3">
            		<div class="features-icons-icon d-flex">
              			<i class="icon-check m-auto text-primary"></i>
            		</div>
            		<h3><a href="<%= request.getContextPath() %>/student_login/TNT_Attend_control.jsp?action=leaving_update">퇴실</a></h3>
            		<p class="lead mb-0"></p>
            	</div>
            </div>
           </div>
		<% }else if(state.equals("end")) {
			}else {
		%>
		<div class="container">
			<div class="row">
				<div class="features-icons-item mx-auto mb-0 mb-lg-3">
					<div class="features-icons-icon d-flex">
						<i class="icon-check m-auto text-primary"></i>
            		</div>
            		<h3><a href="<%= request.getContextPath() %>/student_login/TNT_Attend_control.jsp?action=leaving_update">퇴실</a></h3>
            		<p class="lead mb-0"></p>
            	</div>
            </div>
		</div>
		<% } %>
	</div>
  </section>
</body>
</html>