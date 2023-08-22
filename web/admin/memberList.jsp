<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.adleedu.db.*" %>
<%@ page import="com.adleedu.dto.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    List<Member> memList = new ArrayList<>();
    try {
        String sql = "SELECT * FROM member WHERE id NOT IN ('admin')";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        while (rs.next()) {
            Member mem = new Member();
            mem.setName(rs.getString("name"));
            mem.setId(rs.getString("id"));
            mem.setTel(rs.getString("tel"));
            mem.setRegdate(rs.getString("regdate"));
            memList.add(mem);
        }
    } catch (SQLException e) {
        System.out.println("sql 구문 오류");
    } finally {
        con.close(rs, pstmt, conn);
    }

    SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>그로우앤조이::관리자페이지-회원관리</title>
    <%@ include file="../head.jsp" %>
    <link rel="stylesheet" href="<%=headPath%>/css/admin.css">
</head>
<body>
<div class="admin_wrap">
    <header class="admin_hd" id="adminHd">
        <%@ include file="/admin/adminHeader.jsp" %>
    </header>
    <div class="admin_contents" id="adminContents">
        <h2>회원 관리</h2>
        <div class="container">
            <table class="table tb1">
                <colgroup>
                    <col style="width:5%">
                </colgroup>
                <thead>
                    <tr>
                        <th></th>
                        <th>이름</th>
                        <th>아이디</th>
                        <th>전화번호</th>
                        <th>가입일</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    if(memList.size() > 0){
                        int num = 1;
                        for(Member mem : memList) {
                            Date date = ymd.parse(mem.getRegdate());
                            String dateStr = ymd.format(date);

                %>
                <tr>
                    <td class="num"><%=num %></td>
                    <td class="title txtLeft"><%=mem.getName() %></td>
                    <td class="date"><%=mem.getId() %></td>
                    <td class="date"><%=mem.getTel() %></td>
                    <td class="num"><%=mem.getRegdate() %></td>
                </tr>
                <%  num++; } } else { %>
                <tr><td colspan="5">가입한 회원이 없습니다.</td></tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
