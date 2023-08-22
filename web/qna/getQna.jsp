<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 라이브러리 불러오기 --%>
<%@ page import="java.sql.*" %>
<%@ page import="com.adleedu.db.*" %>
<%@ page import="com.adleedu.dto.*" %>
<%-- 2. 인코딩 및 보내온 데이터 받기 --%>
<%@ include file="/encoding.jsp" %>
<%
    int qno = Integer.parseInt(request.getParameter("qno"));

    //3. DB연결
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    //4. sql 실행 및 실행결과 받기
    String sql = "SELECT * FROM qna WHERE qno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, qno);

    //5. 실행결과(ResultSet) 인 해당 Qna 1건 qna(질문및답변) 객체에 넣기
    rs = pstmt.executeQuery();
    Qna qna = new Qna();
    if(rs.next()){
        qna.setQno(rs.getInt("qno"));
        qna.setTitle(rs.getString("title"));
        qna.setContent(rs.getString("content"));
        qna.setAuthor(rs.getString("author"));
        qna.setResdate(rs.getString("resdate"));
        qna.setCnt(rs.getInt("cnt"));
        qna.setLev(rs.getInt("lev"));
        qna.setPar(rs.getInt("par"));
        qna.setSecret(rs.getBoolean("secret"));
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>애들교육::묻고 답하기-상세</title>
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
            <p><a href="/">HOME</a> &gt; <a href="qnaList.jsp">질문 및 답변</a> &gt; <span>질문 및 답변 상세보기</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">질문 및 답변 상세보기</h2>
                <table class="table tb2" id="myTable">
                    <tbody>
                    <!-- 6. 해당 글번호에 대한 글 상세내용 출력 -->
                    <tr>
                        <th>유형</th>
                        <td>
                            <% if(qna.getLev()==0) { %>
                            <span>질문</span>
                            <% } else { %>
                            <span>답변</span>
                            <% } %>
                        </td>
                    </tr>
                    <tr>
                        <th>글 제목</th>
                        <td><%=qna.getTitle() %></td>
                    </tr>
                    <tr>
                        <th>글 내용</th>
                        <td><%=qna.getContent() %></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>
                            <% if(sid!=null && sid.equals("admin")) { %>
                            <span title="<%=qna.getAuthor()%>"><%=qna.getAuthor() %></span>
                            <% } else { %>
                            <span><%=qna.getAuthor() %></span>
                            <% } %>
                        </td>
                    </tr>
                    <tr>
                        <th>작성일시</th>
                        <td><%=qna.getResdate() %></td>
                    </tr>
                    <tr>
                        <th>조회수</th>
                        <td><%=qna.getCnt() %></td>
                    </tr>
                    </tbody>
                </table>

                <div class="btn_group">
                    <!-- 7. 용도별 링크 버튼 추가 -->
                    <!-- 현재 글이 질문 글이면,
                        로그인한 사람만 답변하기,
                        질문을 등록한 사람(관리자포함)만 질문글 수정,
                        질문글 삭제 버튼 추가
                     아니면(답변 글이면),
                        답변을 등록한 사람(관리자포함)만 답변글 삭제,
                        답변글 버튼 수정 -->
                    <!-- 모든 사용자 목록 버튼 추가 -->

                    <a href="qnaList.jsp" class="inBtn inBtn1">목록</a>
                    <% if(qna.getLev()==0) { %>
                    <% if(sid!=null && (sid.equals("admin") || sid.equals(qna.getAuthor()))) { %>
                    <a href="updateQna.jsp?qno=<%=qna.getQno() %>" class="inBtn inBtn2">질문 수정하기</a>
                    <a href="delQna.jsp?qno=<%=qna.getQno() %>&lev=0" class="inBtn inBtn1">질문 삭제하기</a>
                    <% } %>
                    <% } %>
                </div>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp"%>
    </footer>
</div>
</body>
</html>