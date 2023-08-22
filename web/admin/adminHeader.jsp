<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String adminPath = request.getContextPath() + "/admin";
    String admin_login = (String) session.getAttribute("id");
    String scriptStr = "";

    boolean check_admin = admin_login != null && admin_login.equals("admin");

    if(!check_admin) {
        scriptStr = "<script>";
        scriptStr += "alert('잘못된 접근입니다.');";
        scriptStr += "location.href='/index.jsp';";
        scriptStr += "</script>";
        out.println(scriptStr);
    }
%>
<div class="admin_hd_wrap" id="adminHdWrap">
    <a href="../index.jsp" class="logo">
        <img src="../image/sub/icon11.png" alt="그로우앤조이 로고타입">
    </a>
    <nav id="adminHdGnb">
        <h2>관리자페이지</h2>
        <ul class="menu">
            <li class="item1">
                <a href="<%=adminPath %>/memberList.jsp" class="dp1">회원 관리</a>
            </li>
            <li class="item2">
                <a href="<%=adminPath %>/qnaList.jsp" class="dp1">문의 관리</a>
            </li>
        </ul>
    </nav>
</div>

<script>
</script>