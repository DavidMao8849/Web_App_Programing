<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@ page import="java.util.Date" %>    
<!DOCTYPE html>
<html>
<!-- HTML comment: print a given user ID -->
<%-- JSP comment: print a given user ID --%>
<%
	request.setCharacterEncoding("utf-8");
    String res1 = "<br>로그인 시간: " + (new Date()).toString();
    out.print(res1);
%>
</html>