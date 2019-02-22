<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="TNT_Bean.*, TNT_DAO.*, java.util.ArrayList, java.sql.Date"%>
<jsp:useBean id="list" class="java.util.ArrayList" scope="request"></jsp:useBean>
<jsp:setProperty property="*" name="list"></jsp:setProperty>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>교과목 정보</title>

<!-- Bootstrap core JavaScript-->
<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
<script
	src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script
	src="<%=request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="<%=request.getContextPath()%>/js/sb-admin-2.min.js"></script>


<!-- Bootstrap core CSS -->
<link
	href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link
	href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/css/landing-page.min.css"
	rel="stylesheet">

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 90%;
	border: 1px solid #ddd;
}

th, td {
	text-align: left;
	padding: 3px;
}

tr:nth-child(even) {
	background-color: #f2f2f2
}
</style>
</head>

<body>
	<%
		request.setCharacterEncoding("UTF-8");
		CourseListVuBean vu = new CourseListVuBean();
		StudentDAO tnt = new StudentDAO();
		list = tnt.getSubjectInfo();
	%>

	<!-- Navigation -->
	<nav class="navbar navbar-light bg-light static-top">
		<div class="container">
			<a class="navbar-brand"
				href="<%=request.getContextPath()%>/staff/staff_main.jsp"
				style="color: blue">TUTER & TUTEE</a>
			<%
				if (session.getAttribute("sid") == null) {
			%>
			<a class="btn btn-primary"
				href="<%=request.getContextPath()%>/index.jsp">Sign In</a>
			<%
				} else {
			%>
			<a class="btn btn-primary"
				href="<%=request.getContextPath()%>/Login_form/logout.jsp">logout</a>
			<%
				}
			%>
		</div>
	</nav>

	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

		<!-- Main Content -->
		<div id="content">

			<!-- Masthead -->
			<header class="masthead text-white text-center">
				<div class="overlay"></div>
				<div class="container">
					<div class="row">
						<div class="col-xl-9 mx-auto">
							<h1 class="mb-5">
								<!-- 중앙img / STAFF MAIN으로 이동하기 -->
								<a>학생 성적 정보</a>
							</h1>
						</div>
						<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
							<form>
								<div class="form-row">
									<%--	<div class="col-12 col-md-9 mb-2 mb-md-0">
								<input type="text" class="form-control form-control-lg"
									placeholder="Enter your email...">
							</div>
							<div class="col-12 col-md-3">
								<button type="submit" class="btn btn-block btn-lg btn-primary"
									href="TNT_control.jsp?action=attendance">Sign up!</button>
							</div> --%>
								</div>
							</form>
						</div>
					</div>
				</div>
			</header>

			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary"></h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">

						<table id="dataTable" border="1" align="center">
							<thead>
								<tr>
									<th>과정명</th>
									<th>과정내용</th>
									<th>교과목명</th>
									<th>교과구분</th>
									<th>교과목내용</th>
									<th>평가방법</th>
									<th>평가일시</th>
									<th>과정개강일</th>
									<th>과정수료일</th>
									<th>최대인원</th>
									<th>신청인원</th>
								</tr>
							</thead>
							<tbody>
								<%
									for (CourseListVuBean courseVu : (ArrayList<CourseListVuBean>) list) {
								%>
								<tr>
									<td><%=courseVu.getCourse_name()%></td>
									<td><%=courseVu.getCourse_contents()%></td>
									<td><a
										href="<%=request.getContextPath()%>/Staff/attendance_list.jsp"></td>
									<td><%=courseVu.getSubject_division()%></td>
									<td><%=courseVu.getSubject_contents()%></td>
									<td><%=courseVu.getDetail_method()%></td>
									<td><%=courseVu.getDetail_date()%></td>
									<td><%=courseVu.getCourse_open()%></td>
									<td><%=courseVu.getCourse_finish()%></td>
									<td><%=courseVu.getCourse_persons()%></td>
									<td><%=courseVu.getCourse_max()%></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Page level plugins -->
	<script
		src="<%=request.getContextPath()%>/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="<%=request.getContextPath()%>/js/demo/datatables-demo.js"></script>

</body>
</html>