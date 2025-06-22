<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%
    String uid = (String) session.getAttribute("id");
    if (uid == null) {
        out.print("로그인 정보가 없습니다.");
        String str = "<br><br><a href='../login.html'><button>로그인하기</button></a></p>";
        out.print(str);
        return;
    } else {
        session.setAttribute("id", uid);
    }

    ArrayList<FeedObj> feeds = null;
    try {
        feeds = (new FeedDAO()).getList2();
    } catch (Exception e) {
        out.print("피드 데이터를 불러오는 중 오류가 발생했습니다.<br>");
        out.println("오류 발생: " + e.getMessage()); // 또는 e.getMessage()로 출력
        return; // 이후 코드 실행 방지
    }

    String str = "<table align=center>";
    str += "<tr height=40><td><b>작성글 리스트</b></td>";
    str += "<td align=right>";
    str += "<a href='../feedAdd.html'><button>글쓰기</button></a>"; 
    str += "<td align=right>";
    str += "<a href='logout.jsp'><button>로그아웃</button></a>"; 
    str += "</td></tr>";
    str += "<tr><td colspan='2' align='right'><b>로그인한 사용자: " + uid + "</b></td></tr>";

    for (FeedObj feed : feeds) {
        String img = feed.getImages(), imgstr = "";
        String video = feed.getVideo();
        String videostr = "";

        if (img != null && !img.trim().isEmpty()) {
            imgstr = "<img src='../images/" + img + "' width=240>";
        }

        if (video != null && !video.trim().isEmpty()) {
            videostr = "<video width='240' controls><source src='../images/" + video + "'></video>";
        }

        str += "<tr><td colspan=2><hr></td></tr>";
        str += "<tr>";
        str += "<td><small>" + feed.getId() + "</small></td>";
        str += "<td><small>&nbsp;(" + feed.getTs() + ")</small></td>";
        str += "</tr>";
        str += "<tr><td colspan=2>" + imgstr + videostr + "</td></tr>";
        str += "<tr><td colspan=2>" + feed.getContent() + "</td></tr>";
    }

    str += "</table>";
    out.print(str);
%>
