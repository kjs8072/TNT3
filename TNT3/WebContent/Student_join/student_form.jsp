<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script>
	function stud_check() {
		var msg = document.getElementById("student_id").value;
		console.log(msg);
		if (msg == "") {
			alert("���̵� �Է��ϼ���.")
			return;
		} else {
			document.form1.action.value = "check1";
			document.form1.submit();
		}
	}
	function pass_check() {
		var password = document.getElementById("student_pw").value;
		var passCheck = document.getElementById("student_pw1").value;

		if (passCheck == "") {
			document.document.getElementById("passCheckText").innerHTML = ""
		} else if (student_pw != student_pw1) {
			document.document.getElementById("passCheckText").innerHTML = "<b><font color=blue size=5pt"> not ok pw. </font></b>"
		} else {
			document.document.getElementById("passCheckText").innerHTML = "<b><font color=red size=5pt> OK pw. </font></b>"
		}
	}
</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>�л�ȸ������</title>
<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css" 
			rel="stylesheet">
<!-- Custom fonts for this template -->
<link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" 
			rel="stylesheet">
<link href="<%=request.getContextPath()%>/vendor/simple-line-icons/css/simple-line-icons.css" 
			rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
			rel="stylesheet" type="text/css">
<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/css/landing-page.min.css" rel="stylesheet">
<title>�л� ȸ������</title>
</head>
<body align="center">
<!-- Navigation -->
	<nav class="navbar navbar-light bg-light static-top">
		<div class="container">
			<a class="navbar-brand"
				href="<%=request.getContextPath()%>/index.jsp" style="color: blue">TUTER & TUTEE</a>
				<%
					if (session.getAttribute("sid") == null) {
				%>
				<a class="btn btn-primary"
					href="<%=request.getContextPath()%>/Login_form/Login_form.jsp">Sign In</a>
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
<!-- Masthead -->
	<header class="masthead text-white text-center">
		<div class="overlay"></div>
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-lg-8 col-xl-7 mx-auto"></div>
			</div>
		</div>
	</header>
	<br>
	<div class="container">
		<div align="center">
			<form name="form1" method="get" action="student_control.jsp">
				<input type="hidden" name="action" value="insert">
					<table class="table" border="2" style="width: 70%">
					<h1>ȸ������</h1><tr>
						<th>���̵�</th>
							<td><input type="text" id="student_id" name="student_id"
							required>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							<input class="btn btn-info" type="button" value="�ߺ�Ȯ��" onclick="stud_check()"></td>
						</tr>
						<tr>
							<th>��й�ȣ</th>
						<td colspan="2"><input type="password" name="student_pw"
							required></td>
					</tr>
					<tr>
						<th>��й�ȣ Ȯ��</th>
						<td colapan="2"><input type="password" name="student_pw1"
							required></td>
					<td id="passCheckText" width=100>
					</td>
					</tr>
						<tr>
						<th>�̸�</th>
						<td colspan="2"><input type="text" name="student_name"
							required></td>
					</tr>
						<tr>
						<th>����</th>
						<td colspan="2"><input type="radio" name="gender" value="����"
							checked>���� <input type="radio" name="gender" value="����">����</td>
					</tr>
					<tr>
						<th>�ڵ�����ȣ</th>
						<td colspan="2"><input type="text" name="student_phone"
							required></td>
					</tr>
					<tr>
						<th>�ּ�</th>
						<td colspan="2"><input type="text" name="student_adress"
							required></td>
					</tr>
					<tr>
						<th>�б�</th>
						<td colspan="2"><input type="text" name="student_univ_coll"
							required></td>
					</tr>
					<tr>
						<th>�а�</th>
						<td colspan="2"><input type="text" name="student_major"
							required></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
						<input class="btn btn-primary type="submit" value="ȸ������" action="student_control.jsp %>">
						<input class="btn btn-danger type="reset" value="���" onclick="����"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>