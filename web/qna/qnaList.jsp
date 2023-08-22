<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 라이브러리 임포트 --%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>
<%@ page import="com.adleedu.db.*" %>
<%@ page import="com.adleedu.dto.*" %>
<%@ include file="../encoding.jsp" %>
<%
    //2. DB 연결
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    //3. SQL을 실행하여 결과셋(ResultSet) 받아오기
    String sql = "select a.qno as qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.cnt as cnt, a.lev AS lev, a.par AS par, secret AS secret, b.name as name from qna a, member b where a.author = b.id ORDER BY par DESC, lev ASC, qno ASC ;";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    //4. 받아온 결과셋(ResultSet) 을 질문및답변 목록(qnaList)에 불러와 하나의 레코드씩 담기
    List<Qna> qnaList = new ArrayList<>();
    while(rs.next()){
        Qna qna = new Qna();
        qna.setQno(rs.getInt("qno"));
        qna.setTitle(rs.getString("title"));
        qna.setContent(rs.getString("content"));
        qna.setAuthor(rs.getString("author"));
        qna.setResdate(rs.getString("resdate"));
        qna.setCnt(rs.getInt("cnt"));
        qna.setLev(rs.getInt("lev"));
        qna.setPar(rs.getInt("par"));
        qna.setSecret(rs.getBoolean("secret"));
        qnaList.add(qna);
    }
    con.close(rs, pstmt, conn);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>애들교육::묻고 답하기</title>
    <%@ include file="../head.jsp" %>
    <link rel="stylesheet" href="<%=headPath%>/css/sub.css">
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <div  class="contents" id="contents">
        <div class="sub">
            <h2>QnA</h2>
        </div>
        <div class="breadcrumb">
            <p><a href="/">HOME</a> &gt; <a href="qnaList.jsp">질문 및 답변</a> &gt; <span>질문 및 답변 목록</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">질문 및 답변 목록</h2>
                <table class="table tb1" id="myTable">
                    <thead>
                    <tr>
                        <th class="item1">글번호</th><th class="item2">제목</th>
                        <th class="item3">작성자</th><th class="item4">작성일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        if(qnaList.size() > 0) {
                        SimpleDateFormat ymd = new SimpleDateFormat("yy-MM-dd");
                        int tot = qnaList.size();
                        for(Qna q:qnaList) {
                            Date d = ymd.parse(q.getResdate());
                            String date = ymd.format(d);
                    %>
                    <tr>
                        <td class="item1"><%=tot %></td>
                        <td class="item2 txtLeft">
                            <% if(q.getLev()==0) { %>
                            <a href="getQna.jsp?qno=<%=q.getQno()%>"><%=q.getTitle() %></a>
                            <% } else { %>
                            <a style="padding-left:30px;" href="getQna.jsp?qno=<%=q.getQno()%>">[답변]<%=q.getTitle() %></a>
                            <% } %>
                        </td>
                        <td class="item3"><%=q.getAuthor()%></td>
                        <td class="item4"><%=date %></td>
                    </tr>
                    <%
                            tot--;
                        }
                        } else {
                    %>
                    <tr><td colspan="4">등록된 문의가 없습니다.</td></tr>
                    <% } %>
                    </tbody>
                </table>
                <% if(sid != null) { %>
                <div class="btn_group">
                    <a href="addQuestion.jsp" class="inBtn inBtn1">문의하기</a>
                </div>
                <% } %>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</div>
</body>
</html>
