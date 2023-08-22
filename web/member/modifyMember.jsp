<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.adleedu.db.*" %>
<%@ page import="com.adleedu.dto.*" %>
<%@ page import="java.sql.*" %>
<%
    String myId = (String) session.getAttribute("id");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    Member mem = new Member();
    try {
        String sql = "SELECT * FROM member WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, myId);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            mem.setName(rs.getString("name"));
            mem.setId(rs.getString("id"));
            mem.setTel(rs.getString("tel"));
            mem.setEmail(rs.getString("email"));
            mem.setRegdate(rs.getString("regdate"));
            mem.setPoint(rs.getInt("point"));
            mem.setPw(rs.getString("pw"));
        }
    } catch (SQLException e) {
        System.out.println("sql 구문 오류");
    } finally {
        con.close(rs, pstmt, conn);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>그로우앤조이::마이페이지-수정</title>
    <%@ include file="../head.jsp" %>
    <link rel="stylesheet" href="<%=headPath%>/css/sub.css">
    <style>
        .tb2 th {padding-top:10px;}
        .tb2 td {padding-top:15px;}
    </style>
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <div  class="contents" id="contents">
        <div class="sub">
            <h2>마이페이지</h2>
        </div>
        <div class="breadcrumb">
            <p><a href="/"> HOME </a> &gt; <a href="/member/mypage.jsp"> 마이페이지 </a> &gt; <span> 회원 정보 수정 </span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">회원 정보 수정</h2>
                <form action="modifyMemberPro.jsp" method="post">
                    <table class="table tb2">
                        <tbody>
                        <tr>
                            <th><label for="id">아이디</label></th>
                            <td><input type="text" value="<%=mem.getId() %>" name="id" id="id" class="inData" readonly></td>
                        </tr>
                        <tr>
                            <th><label for="name">이름</label></th>
                            <td><input type="text" value="<%=mem.getName() %>" name="name" id="name" class="inData" readonly></td>
                        </tr>
                        <tr>
                            <th><label for="tel">전화번호</label></th>
                            <td><input type="text" value="<%=mem.getTel() %>" name="tel" id="tel" class="inData"></td>
                        </tr>
                        <tr>
                            <th><label for="email">이메일</label></th>
                            <td><input type="text" value="<%=mem.getEmail() %>" name="email" id="email" class="inData"></td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="btn_group">
                        <input type="submit" value="정보 수정" class="inBtn inBtn1">
                        <a href="/member/mypage.jsp" class="inBtn inBtn2">취소</a>
                    </div>
                </form>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>
