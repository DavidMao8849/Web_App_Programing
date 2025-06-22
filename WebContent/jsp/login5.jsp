<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<!-- HTML comment: print a given user ID -->
<%-- JSP comment: print a given user ID --%>
<%
	request.setCharacterEncoding("utf-8");
    String uid = request.getParameter("id");
    String res = "<h3>사용자 아이디: " + uid + "</h3>";
    out.print(res);
%>
<%@ include file="loginTime.jsp" %>
</html>