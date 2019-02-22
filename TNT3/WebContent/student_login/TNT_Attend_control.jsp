<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,TNT_DAO.*, TNT_Bean.*" %>
 
<jsp:useBean id="adao" class="TNT_DAO.AttendDAO"></jsp:useBean>
<jsp:setProperty property="*" name="adao"></jsp:setProperty>

<jsp:useBean id="abean" class="TNT_Bean.AttendBean"></jsp:useBean>
<jsp:setProperty property="*" name="abean"></jsp:setProperty>

<jsp:useBean id="sdao" class="TNT_DAO.StudentDAO"></jsp:useBean>
<jsp:setProperty property="*" name="sdao"></jsp:setProperty>

<jsp:useBean id="stubean" class="TNT_Bean.StudentBean" scope="request"></jsp:useBean>
<jsp:setProperty name="stubean" property="*"></jsp:setProperty>
<%
	request.setCharacterEncoding("UTF-8");
	String action = request.getParameter("action");

	if(action.equals("attendance")){
		ArrayList<AttendBean> list = adao.getAttendList((String)session.getAttribute("sid"));
		ArrayList<Integer> list1 = adao.getAttendSelect((String)session.getAttribute("sid"));
		
		request.setAttribute("data", list);		//요청 페이지에 값을 setting. list에 있는 값을 "data"에 넣어서 addrbook_list.jsp에 값을 넘김
		request.setAttribute("count", list1);
		pageContext.forward("TNT_attend_list.jsp");		//리스트를 보여주는 페이지(TNT_attend_list.jsp)로 이동 ( data값을 넘겨줌.)
		
	} else if(action.equals("attend_out")){
		String etime, ltime, outtime, returntime;
		etime = adao.etimeSelect((String)session.getAttribute("sid"));
		outtime = adao.outtimeSelect((String)session.getAttribute("sid"));
		returntime = adao.returntimeSelect((String)session.getAttribute("sid"));
		ltime = adao.leaveSelect((String)session.getAttribute("sid"));
		
		if(etime == null){		//처음 입실할 때
			pageContext.forward("TNT_attend_mnt.jsp?state=init");	//입실
		} else{		//입실한 후
			if(outtime != null){	//외출 했을경우
				if(returntime==null){	//외출하고 복귀 안했을 때
					if(ltime != null){	//퇴실 후
						pageContext.forward("TNT_attend_mnt.jsp?state=end");
					}else 
						pageContext.forward("TNT_attend_mnt.jsp?state=out");	//복귀 퇴실
				} else{		//외출 후 복귀 눌렀을 경우
					if(ltime != null){	//퇴실 후
						pageContext.forward("TNT_attend_mnt.jsp?state=end");
					} else {	//퇴실 전
						pageContext.forward("TNT_attend_mnt.jsp?state=leave");	//퇴실
					}
				}
			} else {	//외출 안했을 경우
				if(ltime != null){
					pageContext.forward("TNT_attend_mnt.jsp?state=end");
				}else {
					pageContext.forward("TNT_attend_mnt.jsp?state=attendance");	//외출 퇴실
				}
			}
		}
		
		
	} else if(action.equals("mypage")){
		ArrayList<StudentBean> list = sdao.getInfoList((String)session.getAttribute("sid"));
		for(StudentBean stb : list){
			System.out.println(stb.toString());
		}
		request.setAttribute("stu", list);		//요청 페이지에 값을 setting. list에 있는 값을 "stu"에 넣어서 TNT_mypage.jsp에 값을 넘김
		pageContext.forward("TNT_mypage.jsp");
		
	} else if(action.equals("insert")){	//입실
		adao.attendInsert((String)session.getAttribute("sid"));
		pageContext.forward("TNT_Attend_control.jsp?action=attend_out");
		
	} else if(action.equals("out_update")){		//외출
		adao.attendOutUpdate((String)session.getAttribute("sid"));
		pageContext.forward("TNT_Attend_control.jsp?action=attend_out");
		
	}else if(action.equals("return_update")){		//복귀
		adao.attendReturnUpdate((String)session.getAttribute("sid"));
		pageContext.forward("TNT_Attend_control.jsp?action=attend_out");
		
	} else if(action.equals("leaving_update")){		//퇴실
		adao.attendLeavingUpdate((String)session.getAttribute("sid"));
		adao.attendDivision((String)session.getAttribute("sid"));
		pageContext.forward("TNT_Attend_control.jsp?action=attend_out");
		
	} else if(action.equals("update")){		//mypage 수정

		System.out.println("11111"+stubean);
		stubean.setStudent_id((String)session.getAttribute("sid"));
		System.out.println("22222"+stubean);
		String birth = (String)request.getParameter("student_birth1");
		sdao.studentUpdate(stubean, birth);
		response.sendRedirect("TNT_Attend_control.jsp?action=attendance");
	}
%>