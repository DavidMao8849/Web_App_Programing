<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<!-- HTML comment: print a given user ID -->
<%-- JSP comment: print a given user ID --%>
<%
    String uid = request.getParameter("id");
    out.print(uid);
%>
</html>