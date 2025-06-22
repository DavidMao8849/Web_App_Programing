<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@ page import="java.util.Date" %>    
<!DOCTYPE html>
<html>
<%
    String uid = request.getParameter("id");
    String res = "<h3>사용자 아이디: " + uid + "</h3>";
    out.print(res);
    String date = (new Date()).toString();
%>
로그인 시간:<%= date %>
</html>
