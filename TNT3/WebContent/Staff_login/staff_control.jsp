<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList, TNT_Bean.*, TNT_DAO.*"%>

<jsp:useBean id="bean" class="TNT_Bean.StudentLicenseVuBean"></jsp:useBean>
<jsp:useBean id="TNT" class="TNT_DAO.StudentDAO"></jsp:useBean>
<jsp:setProperty property="*" name="bean" />
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
      
      response.sendRedirect(request.getContextPath()+"/Staff_login/Staff_mypage.jsp");
   }
   else if (action.equals("chart")) {
	      
	      response.sendRedirect(request.getContextPath()+"/Staff_login/Staff_chart.jsp");
	   }
   //    if (action.equals("insert")) {
   //       //   bean.insertDB(TNT);
   //       response.sendRedirect("membership_messageform.jsp");
   //    }
   //    /* else if (action.equals("main")) {
   //    //   bean.insertDB(TNT);
   //          response.sendRedirect("����ȭ�� ����.jsp");
   //           */
   //    /* } */
   //    else if (action.equals("login")) {
   //       //   bean.insertDB(TNT);
   //       response.sendRedirect("login_control.jsp");
   //    }
   //    else if (action.equals("check2")) {
   //       if (bean.funcstaff_check(TNT.getStaff_id()) == 0) {
   //          out.println("<script>alert('ok');history.back();</script>");
   //       } else
   //          out.println("<script>alert('no');history.back();</script>");
   //   }
%>