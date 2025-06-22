<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<%
    String uid = request.getParameter("id");
    String res = "<h3>User ID: " + uid + "</h3>";
    out.print(res);
%>
</html>