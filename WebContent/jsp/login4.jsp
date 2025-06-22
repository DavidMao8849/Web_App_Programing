<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<%
    request.setCharacterEncoding("utf-8");
    String uid = request.getParameter("id");
    String res = "<h3>UserID : " + uid + "</h3>";
    res += "<br>로그인 시간: " + (new Date()).toString();
    out.print(res);
%>
</html>