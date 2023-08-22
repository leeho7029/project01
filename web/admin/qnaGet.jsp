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
    <title>그로우앤조이::관리자페이지-문의 답변</title>
    <%@ include file="../head.jsp" %>
    <link rel="stylesheet" href="<%=headPath%>/css/admin.css">
</head>
<body>
<div class="admin_wrap">
    <header class="admin_hd" id="adminHd">
        <%@ include file="/admin/adminHeader.jsp" %>
    </header>
    <div class="admin_contents" id="adminContents">
        <h2>문질문 및 답변 상세보기</h2>
        <div class="container">
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
                        <span><%=qna.getAuthor() %></span>
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
                <a href="qnaAddQuestion.jsp?lev=1&par=<%=qna.getQno() %>" class="inBtn inBtn2">답변하기</a>
                <% } else { %>
                <a href="qnaUpdate.jsp?qno=<%=qna.getQno() %>" class="inBtn inBtn2">답변 수정하기</a>
                <a href="qnaDel.jsp?qno=<%=qna.getQno() %>&lev=1" class="inBtn inBtn1">답변 삭제하기</a>
                <% } %>
            </div>
        </div>
    </div>
</div>
</body>
</html>