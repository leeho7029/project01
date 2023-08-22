<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.adleedu.dto.Dat" %>
<%@include file="../encoding.jsp"%>
<%
    String checkSid = (String) session.getAttribute("id");

    List<Dat> datList = new ArrayList<>();
    try {
        sql = "select * from dat where par = ? order by dno desc";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, bno);
        rs = pstmt.executeQuery();

        while(rs.next()){
            Dat d = new Dat();
            d.setDno(rs.getInt("dno"));
            d.setPar(rs.getInt("par"));
            d.setId(rs.getString("id"));
            d.setContent(rs.getString("content"));
            d.setResdate(rs.getString("resdate"));
            datList.add(d);

        }
    } catch (SQLException e) {
        System.out.println("SQL 구문 오류");
    } finally {
        con.close(rs, pstmt, conn);
    }

%>
<div class="dat_area">
    <% if(datList.size() > 0) { %>
    <ul class="dat_list">
    <%
        int num = 1;
        for(Dat d : datList) {
    %>
        <li>
            <div class="dat_top">
                <p class="dat_writer"><%=num %>. <%=d.getId() %><span class="dat_date"><%=d.getResdate() %></span></p>
                <% if(checkSid!=null && (checkSid.equals("admin") || checkSid.equals(d.getId()))) {%>
                <a href="../dat/deldat.jsp?dno=<%=d.getDno() %>&par=<%=d.getPar() %>" class="dat_btn">삭제하기</a>
                <% } %>
            </div>
            <div class="dat_con">
                <%=d.getContent()%>
            </div>
        </li>
    <%
        num++;
        }
    %>
    </ul>
    <% } else { %>
    <div class="no_dat">
        등록된 댓글이 없습니다.
    </div>
    <% } %>
    <% if(checkSid!=null) { %>
    <div class="dat_add">
        <form action="../dat/datListPro.jsp" method="post">
            <input type="hidden" name="id" id="id" class="inData" value="<%=checkSid %>" readonly>
            <input type="hidden" name="bno" id="bno" class="inData" value="<%=bno %>" readonly>
            <textarea rows="1" cols="50" name="content" id="content" class="tet" maxlength="50" required placeholder="댓글내용" autofocus></textarea>
            <input type="submit" class="dat_btn" value="댓글 등록">
        </form>
    </div>
    <% } %>
</div>

<%--<% if(datList.size() > 0) { %>--%>
<%--    <% for(Dat d : datList) { %>--%>
<%--    <tr>--%>
<%--        <td class="item1" name="ddf"><%=d.getName()%></td>--%>
<%--        <td class="item2" name="ddf"><%=d.getContent()%></td>--%>
<%--        <td class="item3" name="ddf"><%=d.getResdate()%></td>--%>
<%--        <% if(checkSid!=null && (checkSid.equals("admin") || checkSid.equals(d.getId()))) {%>--%>
<%--        <td>--%>
<%--            <a href="../dat/deldat.jsp?dno=<%=d.getDno()%>&par=<%=d.getPar() %>">삭제하기</a>--%>
<%--        </td>--%>
<%--        <% } %>--%>
<%--    </tr>--%>
<%--    <% } %>--%>
<%--<% } else { %>--%>
<%--<tr>--%>
<%--    <td colspan="4">등록된 댓글이 없습니다.</td>--%>
<%--</tr>--%>
<%--<% } %>--%>

