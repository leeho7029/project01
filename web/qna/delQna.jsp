<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 라이브러리 로딩 --%>
<%@ page import="java.sql.*" %>
<%@ page import="com.adleedu.db.*" %>
<%@ include file="../encoding.jsp" %>
<%
    //2. 보내온 데이터 받기
    int qno = Integer.parseInt(request.getParameter("qno"));
    int lev = Integer.parseInt(request.getParameter("lev"));

    //3. DB 연결
    Connection conn = null;
    PreparedStatement pstmt = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    //4. sql 실행 및 실행결과 리턴
    String sql = "";
    if(lev==0) {
        sql = "delete from qna where par=?";    //삭제 대상이 질문글 일때
    } else {
        sql = "delete from qna where qno=?";    //삭제 대상이 답변글 일때
    }

    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, qno);
    int cnt = pstmt.executeUpdate();
    if(cnt>0){
        System.out.println("글이 삭제되었습니다.");
        response.sendRedirect("/qna/qnaList.jsp");
    } else {
        System.out.println("글 삭제가 실패되었습니다.");
        //response.sendRedirect("/qna/updateQna.jsp?qno="+qno);
        out.println("<script>alert('글 삭제 실패');</script>");
        out.println("<script>history.go(-1);</script>");
    }

    con.close(pstmt, conn);
%>