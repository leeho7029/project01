<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>애들교육::인사말</title>
    <%@ include file="head.jsp" %>
    <link rel="stylesheet" href="<%=headPath%>/css/sub.css">
    <style>

        @font-face {
            font-family: 'HakgyoansimWoojuR';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/HakgyoansimWoojuR.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }


        @font-face {
            font-family: 'SBAggroB';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }


        .page .intro .intro_tit { font-family: SBAggroB; font-size: 50px; display: block; width: 800px; margin: 50px auto; letter-spacing:-0.048em; }
        .page .intro .intro_con { font-family: HakgyoansimWoojuR; font-size: 20px; display: block; width: 800px; height: 300px; margin: 50px auto;  }
        .lnb_wrap {
            position: relative;
            width: 100%;
            height: 70px;
            margin-bottom: 100px;
        }

        .lnb {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 70px;
            background-color: #fff;
            text-align: center;
            border-bottom: 1px solid #dadada;
        }

        .lnb.on {
            position: fixed;
            z-index: 1000;
        }

        .lnb > ul {
            width: 1140px;
            margin: 0 auto;
            font-size: 0px;
        }

        .lnb > ul:after {
            display: block;
            clear: both;
            content: '';
        }

        .lnb > ul > li {
            display: inline-block;
            position: relative;
        }

        .lnb > ul > li > a {
            display: block;
            position: relative;
            font-size: 17px;
            font-weight: 400;
            text-align: center;
            line-height: 70px;
            color: #000;
        }

        .lnb > ul > li.on > a {
            border-bottom: 2px solid #6b9ecc;
            line-height: 69px;
            color: #6b9ecc;
        }

        .lnb > ul > li > a:after {
            position: absolute;
            right: 0;
            top: 50%;
            width: 1px;
            height: 20px;
            margin-top: -10px;
            background: #dcdcdc;
            content: "";
        }

        .lnb > ul > li:first-child > a:before {
            position: absolute;
            left: 0;
            top: 50%;
            width: 1px;
            height: 20px;
            margin-top: -10px;
            background: #dcdcdc;
            content: "";
        }

        .lnb > ul > li > a .lnb_arrow {
            display: inline-block;
            width: 11px;
            height: 6px;
            margin-left: 10px;
            background: url("/Resources/Kor/images/common/ico_common.png") -468px -154px no-repeat;
            vertical-align: middle;
        }

        .lnb > ul > li.on > a .lnb_arrow {
            background-position: -432px -154px;
        }

        .lnb.col3 li {
            width: 33.3%;
        }

        .lnb.col4 li {
            width: 25%;
        }

        .lnb.col5 li {
            width: 20%;
        }

        .lnb.col5 li.long {
            width: 380px;
        }

        .lnb.col6 li {
            width: 16.66666%;
        }

        .lnb.col7 li {
            width: 14.2857%;
        }

        .lnb .sub_lnb {
            display: none;
            position: absolute;
            left: 0;
            top: 71px;
            z-index: 100;
            width: 100%;
            border: 1px solid #dcdcdc;
            border-top: none;
        }

        .lnb li.active .sub_lnb {
            display: block;
        }

        .lnb .sub_lnb li {
            width: 100%;
            border-top: 1px solid #dcdcdc;
        }

        .lnb .sub_lnb li:first-child {
            border-top: none;
        }

        .lnb .sub_lnb li a {
            display: block;
            position: relative;
            padding: 0 20px;
            background-color: #fff;
            font-size: 16px;
            line-height: 48px;
            color: #666;
        }

        .lnb .sub_lnb li a:hover {
            color: #6b9ecc;
        }

    </style>

</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="header.jsp" %>
    </header>
    <div  class="contents" id="contents">
        <div class="sub">
            <h2>회사소개</h2>
        </div>
        <div class="breadcrumb">
            <p><a href="/"> HOME </a> &gt; <a href="<%=headerPath%>/company01.jsp"> 회사소개 </a> &gt; <span> 인사말 </span></p>
        </div>
        <section class="page" id="page1">
            <div class="lnb_wrap">
                <div id="lnb" class="lnb col4">
                    <ul>
                        <li>
                            <a href="company01.jsp">인사말<i class="lnb_arrow"></i></a>
                        </li>
                        <li>
                        </li>
                        <li>
                            <a href="company02.jsp">오시는길<i class="lnb_arrow"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="page_wrap">
                <h2 class="page_tit">인사말</h2>
            </div>
            <div class="intro">
                <h3 class="intro_tit"><img src="/image/sub/icon11.png" alt="별">애들 교육</h3>
                <p class="intro_con">교육브랜드 애들교육
                    애들교육과 함께라면, 아이들은 새로운 지식과 경험을 만들며 미래의 리더로 성장할 수 있습니다. <br><br>

                    애들교육은 아이들의 풍부한 잠재력을 개발하고 성장할 수 있는 최상의 환경을 제공하기 위해 설립된 교육 플랫폼입니다.<br>
                    우리는 현대 아이들의 다양한 학습 요구와 관심사를 반영하여 혁신적이고 맞춤화된 교육 콘텐츠를 제공하며, 아이들이 더 나은 미래를 위해 필요한 기술과 지식을 습득할 수 있도록 돕습니다.<br>
            </div>

        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="footer.jsp" %>
    </footer>
</div>
</body>
</html>
