<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>로그인</title>
    <%@ include file="../head.jsp" %>
    <link rel="stylesheet" href="<%=headPath%>/css/sub.css">
    <style>
        .tb1 { width:500px; margin:0 auto; }
        .tb1 td { width:500px; line-height: 48px; padding-top:24px; }

        .indata { display:inline-block; width: 500px; height: 48px; line-height: 48px;
            text-indent:14px; font-size:18px; }

        .login_area {width:500px; border-color: red;border-radius:10px;margin:0 auto;padding:20px;}

        .btn_group {text-align:center;}

    </style>
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="">HOME</a> &gt; <span>로그인</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">로그인</h2>
                <div class="login_area">
                    <form action="loginpro.jsp" id="login_frm" class="frm">
                        <table class="tb1">
                            <tbody>
                            <tr>
                                <td><input type="text" name="id" id="id" class="indata" placeholder="아이디 입력" autofocus required></td>
                            </tr>
                            <tr>
                                <td><input type="password" name="pw" id="pw" class="indata" placeholder="패스워드 입력" required></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="btn_group">
                                        <input type="submit" value="로그인" class="inBtn inBtn1">
                                        <input type="reset" value="취소" class="inBtn inBtn2">
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
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