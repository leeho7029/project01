<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>그로우앤조이::서비스</title>
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
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            height: 2400px; /* 각 칸의 높이 600px * 3 = 1800px */
        }
        .section {
            position: relative;
            overflow: hidden; /* 내용이 넘치지 않도록 */
            height: 1000px;
            width: 1200px;
            align-items: flex-end;
            justify-content: center;
            transition: transform 0.3s, box-shadow 0.3s;
            display: block;
            margin: 0 auto;
        }
        .section img {
            width: 1000px;
            object-fit: cover;
            margin-left: 100px;
            overflow: hidden;
        }
        .section .content {
            font-family: HakgyoansimWoojuR;
            font-size: 50px;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            text-align: center;
            width: 100%;
            box-sizing: border-box;
        }
        .section .content .tit {
            font-family: SBAggroB;
            font-size: 50px;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            text-align: center;
            width: 100%;
            box-sizing: border-box;
        }
        .section:hover {
            transform: translateY(-10px) scale(1.02); /* 약간 들쭉날쭉한 느낌으로 */
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
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
            <h2>조이서비스</h2>
        </div>
        <div class="breadcrumb">
            <p><a href="/"> HOME </a> &gt; <a href="<%=headerPath%>/sample.jsp"> 조이서비스 </a> &gt; <span> 서비스 </span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">서비스</h2>
            </div>

            <div class="section">
                <img src="./image/sub/test%20(1).jpg" alt="이미지 1">
                <div class="content">
                    <h1 class="tit">성장과 발전</h1>
                    <p>그로우앤조이(Grow&Joy)는 학생들의 미래를 준비하는 학습 환경을 제공하는 교육브랜드입니다.</p>
                    <p>저희는 학생들이 지식과 능력을 키워나가며 더 나은 미래를 향해 발전할 수 있도록 돕는 것을 사명으로 삼고 있습니다.</p>
                </div>
            </div>
            <div class="section">
                <img src="./image/sub/test%20(2).jpg" alt="이미지 2">
                <div class="content">
                    <h1 class="tit">즐거움과 기쁨</h1>
                    <p>"앤조이"는 학습과 교육 과정에서 즐거움과 기쁨을 경험하는 중요성을 강조합니다.</p>
                </div>
            </div>
            <div class="section">
                <img src="./image/sub/test%20(3).jpg" alt="이미지 3">
                <div class="content">
                    <h1 class="tit">학습의 경험</h1>
                    <p>"그로우앤조이"는 학습을 단순한 지식 습득 이상의 경험으로 여기는 시각을 전달합니다.</p>
                </div>
            </div>


        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="footer.jsp" %>
    </footer>
</div>
</body>
</html>