<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.UserDAO" %>
<%
	request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String phonenum = request.getParameter("phonenum");
    UserDAO dao = new UserDAO();
    boolean valid = dao.checkUser(id, name, phonenum);
    if(valid) {
%>
<form action="resetPW.jsp" method="post">
    새 비밀번호: <input type="password" name="newPw"><br>
    <input type="hidden" name="id" value="<%= id %>">
    <button type="submit">비밀번호 변경</button>
</form>
<%
    } else {
    	out.println("입력된 이메일: " + phonenum + "<br>");
    	out.println("입력된 이름: " + name + "<br>");
    	out.println("입력된 폰번호: " + phonenum + "<br>");
        out.print("일치하는 회원 정보가 없습니다.");
    }
%>
