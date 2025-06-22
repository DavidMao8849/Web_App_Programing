<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.UserDAO" %>
<%
	request.setCharacterEncoding("utf-8");
    String name = request.getParameter("name");
    String phonenum = request.getParameter("phonenum");    
    UserDAO dao = new UserDAO();
    String userId = dao.findId(name, phonenum);
    if(userId != null) {
    	out.println("입력된 이름: " + name + "<br>");
    	out.println("입력된 폰번호: " + phonenum + "<br>");
        out.print("당신의 아이디는: " + userId);
    } else {
    	out.println("입력된 이름: " + name + "<br>");
    	out.println("입력된 폰번호: " + phonenum + "<br>");
        out.print("일치하는 회원 정보가 없습니다.");
    }
%>
