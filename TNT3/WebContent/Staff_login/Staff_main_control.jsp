<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,TNT_DAO.*, TNT_Bean.*"%>

<jsp:useBean id="adao" class="TNT_DAO.AttendDAO"></jsp:useBean>
<jsp:useBean id="abean" class="TNT_Bean.AttendBean"></jsp:useBean>
<jsp:setProperty property="*" name="abean"></jsp:setProperty>
<jsp:setProperty property="*" name="adao"></jsp:setProperty>

<jsp:useBean id="sdao" class="TNT_DAO.StaffDAO"></jsp:useBean>
<jsp:useBean id="sbean" class="TNT_Bean.StaffBean"></jsp:useBean>
<jsp:setProperty property="*" name="sdao"></jsp:setProperty>
<jsp:setProperty property="*" name="sbean"></jsp:setProperty>


<%
	request.setCharacterEncoding("UTF-8");
	String action = request.getParameter("action");

	if (action.equals("mypage")) {
		ArrayList<StaffBean> list = sdao.getInfoList((String)session.getAttribute("sid"));
		request.setAttribute("staff", list);
		pageContext.forward(request.getContextPath()+"Staff_mypage.jsp");

	} else if(action.equals("update")){		//mypage 수정
		sbean.setStaff_id((String)session.getAttribute("sid"));
		String birth = (String)request.getParameter("staff_birth1");
		sdao.staffUpdate(sbean, birth);
		response.sendRedirect("/TNT3/staff/staff_main.jsp");
	}
%>