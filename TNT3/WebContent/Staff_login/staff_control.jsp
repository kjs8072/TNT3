<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList, TNT_Bean.*, TNT_DAO.*"%>

<jsp:useBean id="sdao" class="TNT_DAO.StaffDAO"></jsp:useBean>
<jsp:setProperty property="*" name="sdao"></jsp:setProperty>

<jsp:useBean id="bean" class="TNT_Bean.StudentLicenseVuBean"></jsp:useBean>
<jsp:setProperty property="*" name="bean" />

<jsp:useBean id="TNT" class="TNT_DAO.StudentDAO"></jsp:useBean>
<jsp:setProperty property="*" name="TNT" />

<%
   request.setCharacterEncoding("UTF-8");
   String action = request.getParameter("action");

   if (action.equals("list")) {
      response.sendRedirect(request.getContextPath()+"/Students/Student_Info.jsp");
   }

   else if (action.equals("ranking")) {
      response.sendRedirect(request.getContextPath()+"/course/subjectList.jsp");
   }
   
   else if (action.equals("license")) {
      
      response.sendRedirect(request.getContextPath()+"/Students/studentLicense.jsp");
   }
   else if (action.equals("my")) {
	   ArrayList<StaffBean> list = sdao.getInfoList((String)session.getAttribute("sid"));
	   for(StaffBean stb : list){
			System.out.println(stb.toString());
		}
	   request.setAttribute("staff", list);
	   pageContext.forward("Staff_mypage.jsp");
   }
   else if (action.equals("chart")) {
	      response.sendRedirect(request.getContextPath()+"/Staff_login/Staff_chart.jsp");

   }

%>