<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@ page import="java.util.Enumeration" %>    
<!DOCTYPE html>
<html>
<%
	request.setCharacterEncoding("utf-8");
    Enumeration<String> en = request.getHeaderNames();
    while (en.hasMoreElements()) {
	    String name = (String) en.nextElement();
	    String value = request.getHeader(name);
	    out.print(name + ": " + value + "<br>");
    }
%>
</html>