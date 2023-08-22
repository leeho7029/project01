<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.adleedu.db.*" %>
<%@include file="../encoding.jsp"%>

<%

    Connection conn = null;
    PreparedStatement pstmt = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    int dno = Integer.parseInt(request.getParameter("dno"));
    int bno = Integer.parseInt(request.getParameter("par"));

    try {
        String sql = "delete from dat where dno=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, dno);
        int cnt = pstmt.executeUpdate();

        if(cnt > 0 ){
            System.out.println("삭제완료");
        } else {
            System.out.println("삭제실패");
        }
        response.sendRedirect("../board/getBoard.jsp?bno="+bno);
    } catch (SQLException e) {
        System.out.println("SQL 구문 오류");
    } finally {
        con.close(pstmt, conn);
    }

%>