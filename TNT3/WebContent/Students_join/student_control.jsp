<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>

<jsp:useBean id="bean" class="TNT_Bean.StudentBean"></jsp:useBean>
<jsp:setProperty property="*" name="bean" />

<jsp:useBean id="tnt" class="TNT_DAO.StudentDAO"></jsp:useBean>

<%
   request.setCharacterEncoding("UTF-8");
   String action = request.getParameter("action");

   if (action.equals("insert")) {
	   tnt.insertDB(bean);
	   out.println("<script>alert('회원가입이 되었습니다!!'); location.href='/TNT3/index.jsp';</script>");
	
   }
   else if (action.equals("login")) {
      response.sendRedirect("login_control.jsp");

   }
   
   else if (action.equals("check1")) {
         if (tnt.funcStudent_check(bean.getStudent_id())==0){
            out.println("<script>alert('ok');history.back();</script>");   
            
         }   else
            out.println("<script>alert('no');history.back();</script>");
   }   
%>