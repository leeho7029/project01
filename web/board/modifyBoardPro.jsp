<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.adleedu.db.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../encoding.jsp" %>
<%
    int bno = Integer.parseInt(request.getParameter("bno"));
    int type = Integer.parseInt(request.getParameter("type"));
    String loginId = (String) session.getAttribute("id");
    String author = request.getParameter("author");
    String title = request.getParameter("title");
    String content =  request.getParameter("content");

    int cnt = 0;
    String scriptStr = "";
    Connection conn = null;
    PreparedStatement pstmt = null;

    if(loginId != null && (loginId.equals("admin") || loginId.equals(author))) {

        DBC con = new MariaDBCon();
        conn = con.connect();

        try {
            String sql = "update board set title = ?, content = ? where bno = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setInt(3, bno);
            cnt = pstmt.executeUpdate();

            scriptStr = "<script>";
            scriptStr += "history.go(-1);";
            scriptStr += "</script>";
            if(cnt > 0){
                if(type == 1) {
                    response.sendRedirect("getNotice.jsp?bno="+bno);
                } else if(type == 2) {
                    response.sendRedirect("getBoard.jsp?bno="+bno);
                } else {
                    out.println("<script>location.href='/';</script>");
                }
            } else {
                out.println(scriptStr);
            }

        } catch (SQLException e) {
            System.out.println("SQL 구문 오류");
        } finally {
            con.close(pstmt, conn);
        }
    } else {
        scriptStr = "<script>";
        scriptStr += "alert('잘못된 접근입니다.');";

        if(type == 1) {
            scriptStr += "location.href='getNotice.jsp?bno=" + bno + "';";
        } else if (type == 2) {
            scriptStr += "location.href='getBoard.jsp?bno=" + bno + "';";
        } else {
            scriptStr += "location.href='/';";
        }

        scriptStr += "</script>";
        out.println(scriptStr);
    }

%>