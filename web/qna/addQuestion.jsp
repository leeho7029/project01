<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    int lev = request.getParameter("lev") != null ? Integer.parseInt(request.getParameter("lev")) : 0;
    int par = request.getParameter("lev") != null ? Integer.parseInt(request.getParameter("par")) : 0;

    String sel = "";
    if(lev==0){
        sel = "질문";
    } else {
        sel = "답변";
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>애들교육::<%=sel %> 등록</title>
    <%@ include file="../head.jsp" %>
    <link rel="stylesheet" href="<%=headPath%>/css/sub.css">
    <style>
        .btn_group { clear:both; width:800px; margin:20px auto; }
        .btn_group:after { content:""; display:block; width:100%; clear: both; }
        .btn_group p {text-align: center;   line-height:3.6; }
    </style>
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
            <p><a href="/">HOME</a> &gt; <a href="qnaList.jsp">질문 및 답변</a> &gt; <span>질문 및 답변 글쓰기</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">질문 및 답변 상세보기</h2>
                <form action="addQuestionPro.jsp" method="post">
                    <table class="table tb2">
                        <tbody>
                        <tr>
                            <th><label for="title">제목</label></th>
                            <td>
                                <input type="text" name="title" id="title" class="inData" maxlength="98" required>
                                <input type="hidden" name="lev" id="lev" value="<%=lev %>">
                                <input type="hidden" name="par" id="par" value="<%=par %>">
                                <input type="hidden" name="author" id="author" value="<%=sid %>">
                            </td>
                        </tr>
                        <tr>
                            <th><label for="content">내용</label></th>
                            <td>
                                <textarea name="content" id="content" cols="80" rows="10" maxlength="990" class="indata2"></textarea>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="btn_group">
                        <input type="submit" value="<%=sel %> 등록" class="inBtn inBtn1">
                        <a href="qnaList.jsp" class="inBtn inBtn2">글 목록</a>
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