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
    <title>그로우앤조이::관리자페이지-<%=sel %> 등록</title>
    <%@ include file="../head.jsp" %>
    <link rel="stylesheet" href="<%=headPath%>/css/admin.css">
</head>
<body>
<div class="admin_wrap">
    <header class="admin_hd" id="adminHd">
        <%@ include file="/admin/adminHeader.jsp" %>
    </header>
    <div class="admin_contents" id="adminContents">
        <h2>문의 답변 글쓰기</h2>
        <div class="container">
            <form action="qnaAddQuestionPro.jsp" method="post">
                <table class="table tb2">
                    <tbody>
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td>
                            <input type="text" name="title" id="title" class="inData" maxlength="98" required>
                            <input type="hidden" name="lev" id="lev" value="<%=lev %>">
                            <input type="hidden" name="par" id="par" value="<%=par %>">
                            <input type="hidden" name="author" id="author" value="admin">
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
    </div>
</div>
</body>
</html>