<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="util.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.nio.file.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%
String uid = null, ucon = null, ufname = null, vfname = null;
byte[] ufile = null, vfile = null;
request.setCharacterEncoding("utf-8");

ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
List items = sfu.parseRequest(request);
Iterator iter = items.iterator();
while(iter.hasNext()) {
    FileItem item = (FileItem) iter.next();
    String name = item.getFieldName();
    if(item.isFormField()) {
        String value = item.getString("utf-8");
        if (name.equals("id")) uid = value;
        else if (name.equals("content")) ucon = value;
    }
    else {
        // 이미지 파일 처리
        if (name.equals("image")) {
            ufname = item.getName();
            if (ufname != null && !ufname.equals("")) {
                Path p = Paths.get(ufname);
                String file = p.getFileName().toString();
                ufile = item.get();
                String root = application.getRealPath(java.io.File.separator);
                FileUtil.saveImage(root, file, ufile);
            }
        }
        // ★ 비디오 파일 처리 추가
        else if (name.equals("video")) {
            vfname = item.getName();
            if (vfname != null && !vfname.equals("")) {
                Path pv = Paths.get(vfname);
                String vfileName = pv.getFileName().toString();
                vfile = item.get();
                String root = application.getRealPath(java.io.File.separator);
                FileUtil.saveImage(root, vfileName, vfile); // 영상도 저장!
            }
        }
    }
}

// 파일명 안전 추출
Path p = Paths.get(ufname == null ? "" : ufname);
String file = p.getFileName() == null ? "" : p.getFileName().toString();
String videofile = "";
if (vfname != null && !vfname.trim().isEmpty()) {
    Path pv = Paths.get(vfname);
    videofile = pv.getFileName() != null ? pv.getFileName().toString() : "";
}

FeedDAO dao = new FeedDAO();
boolean result;
try {
    result = dao.insert(uid, ucon, file, videofile); // 이미지/비디오 모두 DB 저장
} catch(Exception e) {
    result = false;
    out.print("DB 오류: " + e.getMessage());
}

if (result) {
    response.sendRedirect("main.jsp");
} else {
    out.print("작성 글의 업로드 중 오류가 발생하였습니다.");
}
%>
