<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 라이브러리 로딩 --%>
<%@ page import="java.sql.*" %>
<%@ page import="com.adleedu.db.*" %>
<%@ include file="../encoding.jsp" %>
<%
    //2. 보내온 데이터 받기
    int qno = Integer.parseInt(request.getParameter("qno"));
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String author = request.getParameter("author");

    //3. DB 연결
    Connection conn = null;
    PreparedStatement pstmt = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    //4. sql 실행 및 실행결과 리턴
    String sql = "update qna set title=?, content=?, author=? where qno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, content);
    pstmt.setString(3, author);
    pstmt.setInt(4, qno);

    int cnt = pstmt.executeUpdate();

    if(cnt>0){
        System.out.println("글이 수정되었습니다.");
        response.sendRedirect("/admin/qnaList.jsp");
    } else {
        System.out.println("글 수정이 실패되었습니다.");
        //response.sendRedirect("/qna/updateQna.jsp?qno="+qno);
        out.println("<script>alert('글 수정 실패');</script>");
        out.println("<script>history.go(-1);</script>");
    }

    con.close(pstmt, conn);
%>