<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.adleedu.db.*" %>
<%@ page import="com.adleedu.dto.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../encoding.jsp" %>
<%
    String id = request.getParameter("id");
    String tel = request.getParameter("tel");
    String email = request.getParameter("email");

    int cnt = 0;
    Connection conn = null;
    PreparedStatement pstmt = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    try {
        String sql = "update member set email=?, tel=? where id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, email);
        pstmt.setString(2, tel);
        pstmt.setString(3, id);
        cnt = pstmt.executeUpdate();
        if(cnt>0){
            response.sendRedirect("/");
        } else {
            response.sendRedirect("/member/mypage.jsp");
        }
    } catch(SQLException e) {
        System.out.println("SQL 구문이 처리되지 못했습니다.");
    } finally {
        con.close(pstmt, conn);
    }
%>