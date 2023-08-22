<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- /web/member/login.jsp -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보수정</title>
    <%@ include file="../head.jsp" %>
    <link rel="stylesheet" href="<%=headPath%>/css/sub.css">
    <style>
        .join > table {width:800px;margin:0 auto}
        .join > table tr {height:24px;}
        .join > table th, .join > table td {font-size:16px;padding:12px 0;text-align:left;height:76px;box-sizing:border-box;vertical-align:top;}
        .join > table th {padding-top:28px;font-size:18px;}
        .join > table td {padding-left:14px;}
        .join > table td > input {display:inline-block;width:calc(100% - 4px);height:48px;line-height:48px;text-indent:16px;font-size:18px;}

        .join .btn_area {text-align:right;}
        .term .important, .join .important {color:red;font-weight:900;}
        .join .use_btn > button {width:100%;height:100%;border:none;display:inline-block;border-radius:10px;text-align:center;color:white;font-weight:500;font-size:18px;}
        .join .use_btn > button:hover, .join .use_btn > button:active {box-shadow:2px 2px 5px #333;}

        .term input[type="checkbox"]{border: 0; clip: rect(0 0 0 0); height: 1px; margin: -1px; overflow: hidden; padding: 0; position: absolute; width: 1px;}
        .term input[type="checkbox"] + label{display:inline-block; position:relative; vertical-align:middle; padding-left:40px; line-height:28px; font-size:18px;}
        .term input[type="checkbox"] + label:after{content:""; display:block; position:absolute; top:0; left:0; width:31px; height:31px; background:url(../image/join/chk_ico.png) 0 0 no-repeat;}
        .term input[type="checkbox"]:checked + label:after{background-position:0 -31px;}

        .term {width:800px;margin:0 auto}
        .term ul li{display:flex; align-items:center; justify-content:space-between; padding:14px 0;}
        .term ul li p .essential{color:#ed3535;}
        .term ul li a{position:relative; font-size:14px; color:#97999b;}
        .term ul li a:before{content:""; display:inline-block; position:absolute; bottom:-1px; left:0; width:100%; border-bottom:1px solid #97999b;}

        .inBtn.center{display:block;margin:10px auto 0;width:80%;background-color:var(--third-color);}
    </style>
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="sub">
            <h2>회원가입</h2>
        </div>
        <div class="breadcrumb">
            <p><a href="">HOME</a> &gt; <span>회원가입</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">회원가입</h2>
                <br><br><br>
                <form name="frm1" class="frm" action="joinpro.jsp" method="post" onsubmit="return inform(this)">
                    <div class="join">
                        <table>
                            <colgroup>
                                <col style="width:15%">
                                <col style="width:auto">
                                <col style="width:20%">
                            </colgroup>
                            <tbody>
                            <tr>
                                <th><label for="name">이름<span class="important">*</span></label></th>
                                <td colspan="2"><input type="text" id="name" name="name" required ></td>
                            </tr>
                            <tr>
                                <th><label for="id">아이디<span class="important">*</span></label></th>
                                <td colspan="2"><input type="button" id="id" name="id" required placeholder="12글자 이내로만 입력가능합니다." onclick="idcheck1()">
                                    <div id="checkResult" class="check_result"></div></td>
                                <input type="hidden" name="ck_item" id="ck_item" value="no">
                            </tr>
                            <tr>
                                <th><label for="pw">비밀번호<span class="important">*</span></label></th>
                                <td><input type="password" id="pw" name="pw" required></td>
                                <td class="use_btn" rowspan="2"><button type="button"  class="inBtn1" onclick="pwcheck()">비밀번호 확인</button></td>
                            </tr>
                            <tr>
                                <th><label for="pwChk">비밀번호 확인<span class="important">*</span></label></th>
                                <td><input type="password" id="pwChk" name="pwChk" required>
                                    <button type="button"  class="inBtn inBtn1 center" onclick="togglePasswordVisibility('pw')">입력값 확인</button>
                                    <div id="checkResult1" class="check_result"></div></td>
                            </tr>
                            <tr>
                                <th><label for="email">이메일<span class="important">*</span></label></th>
                                <td colspan="2"><input type="email" id="email" name="email" required></td>
                            </tr>
                            <tr>
                                <th><label for="tel">전화번호<span class="important">*</span></label></th>
                                <td colspan="2"><input type="tel" id="tel" name="tel" required></td>
                            </tr>
                            </tbody>
                        </table>

                        <div class="btn_area" style="text-align:center;">
                            <a href="/" class="inBtn inBtn1">취소하기</a>
                            <input type="submit" value="제출하기" class="inBtn inBtn2">
                        </div>
                    </div>
                </form>
                <script>
                    function inform(frm){
                        var ck_item = frm.ck_item;
                        //var ck_item = document.getElementById("ck_item");
                        if(ck_item.value!="yes"){
                            alert("아이디 중복 검사를 진행하시기 바랍니다.");
                            frm.id.focus();
                            return false;
                            console.log();
                        }
                        var pw = frm.pw.value;
                        var pw2 = frm.pw2.value;
                        if(pw!=pw2){
                            alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
                            frm.pw.focus();
                            return false;
                        }
                    }

                    function idcheck(){
                        var child;
                        var id = document.getElementById("id");
                        if(id.value=="") {
                            child = window.open("idcheck.jsp?id="+id.value, "child", "width=400, height=300");
                        }else {
                            child = window.open("idcheck.jsp?id="+id.value, "child", "width=400, height=300");
                        }
                    }
                    function idcheck1() {
                        var child;
                        var id = document.getElementById("id");

                        if (id.value == "") {
                            child = window.open("idcheck.jsp?id=" + id.value, "child", "width=400, height=300");
                            id.type = "text"
                            document.getElementById('id').readOnly = true;
                        } else {
                            child = window.open("idcheck.jsp?id=" + id.value, "child", "width=400, height=300");
                        }
                        window.handleIdCheckCompletion = function(id) {
                            var checkResult = document.getElementById("checkResult");
                            checkResult.innerHTML = "&nbsp;<span style='color: blue;'> 중복확인 완료</span>";


                            document.getElementById("id").value = id;
                            document.getElementById("ck_item").value = "yes";

                        };
                    }
                    function pwcheck() {
                        var pw = document.getElementById("pw");
                        var pw2 = document.getElementById("pwChk");
                        var checkResult = document.getElementById("checkResult1");

                        if (pw.value !== pw2.value) {
                            checkResult.innerHTML = "&nbsp;<span style='color: red;'>비밀번호가 서로 다릅니다.</span>";
                        } else {
                            checkResult.innerHTML = "&nbsp;<span style='color: blue;'>비밀번호가 서로 일치합니다.</span>";
                        }
                    }
                    function togglePasswordVisibility(inputId) {
                        var pw= document.getElementById("pw")
                        var pw2=document.getElementById("pwChk")

                        if(pw.type==="password"){
                            pw.type="text";
                        }else{
                            pw.type="password";
                        }
                        if(pw2.type==="password"){
                            pw2.type="text";
                        }else {
                            pw2.type="password";
                        }
                    }


                </script>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>