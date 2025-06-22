<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.UserDAO" %>
<%
    String id = request.getParameter("id");
    String newPw = request.getParameter("newPw");
    UserDAO dao = new UserDAO();
    boolean result = dao.updatePassword(id, newPw);
%>
<%
    if(result) {
%>
    <div>비밀번호가 성공적으로 변경되었습니다.</div>
    <form action="../login.html" method="get">
        <button type="submit">로그인 화면으로</button>
    </form>
<%
    } else {
%>
    <div>비밀번호 변경에 실패했습니다.</div>
<%
    }
%>
