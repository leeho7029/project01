<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>그로우앤조이::디자인가이드</title>
    <%@ include file="head.jsp" %>
    <link rel="stylesheet" href="<%=headPath%>/css/sub.css">
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="header.jsp" %>
    </header>
    <div  class="contents" id="contents">
        <div class="sub">
            <h2>디자인 가이드</h2>
        </div>
        <div class="breadcrumb">
            <p><a href="/"> HOME </a> &gt; <span> 디자인 가이드 </span></p>
        </div>
        <section class="page">
            <div class="page_wrap">
                <h2 class="page_tit">디자인 가이드 페이지</h2>
                <section>
                    <h3>대표색 설정</h3>
                    <div class="pointColor pointColor1"></div>
                    <div class="pointColor pointColor2"></div>
                    <div class="pointColor pointColor3"></div>
                </section>
                <section>
                    <h3>테이블 스타일</h3>
                    <table class="table tb1">
                        <thead>
                        <tr>
                            <th>컬럼1</th>
                            <th>컬럼2</th>
                            <th>컬럼3</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>값1</td>
                            <td>값2</td>
                            <td>값3</td>
                        </tr>
                        </tbody>
                    </table>
                    <hr class="sampleHr">
                    <table class="table tb2">
                        <tbody>
                        <tr>
                            <th>칼럼1</th>
                            <td>값1</td>
                        </tr>
                        <tr>
                            <th>칼럼2</th>
                            <td>값2</td>
                        </tr>
                        <tr>
                            <th>칼럼3</th>
                            <td>값3</td>
                        </tr>
                        </tbody>
                    </table>
                </section>
                <section>
                    <h3>버튼</h3>
                    <div class="btn_group">
                        <button class="inBtn inBtn1">첫번째 버튼</button>
                        <button class="inBtn inBtn2">두번째 버튼</button>
                        <button class="inBtn inBtn1">세번째 버튼</button>
                    </div>
                </section>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="footer.jsp" %>
    </footer>
</div>
</body>
</html>
