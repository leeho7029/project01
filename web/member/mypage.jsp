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
    <title>그로우앤조이::마이페이지</title>
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
            <p><a href="/"> HOME </a> &gt; <span> 마이페이지 </span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">마이페이지</h2>
                <table class="table tb2">
                    <tbody>
                    <tr>
                        <th>아이디</th>
                        <td><%=mem.getId() %></td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td>비밀번호 변경은 관리자에게 문의 부탁드립니다.</td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td><%=mem.getName() %></td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td><%=mem.getTel() %></td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td><%=mem.getEmail() %></td>
                    </tr>
                    <tr>
                        <th>포인트</th>
                        <td><%=mem.getPoint() %></td>
                    </tr>
                    </tbody>
                </table>
                <div class="btn_group">
                    <a href="modifyMember.jsp?id=<%=myId %>" class="inBtn inBtn1">정보 수정</a>
                    <a href="javascript:return false" class="inBtn inBtn2">회원 탈퇴</a>
                </div>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>
