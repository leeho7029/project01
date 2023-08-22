<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String headPath = request.getContextPath();
%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=dege"> <!-- 인터넷익스프로러로 접근시 엣지로 연결되게 함 -->
<meta http-equiv="Author" content="애들교육 콘텐츠 제작팀">
<meta http-equiv="Publisher" content="애들교육 콘텐츠 제작팀">
<meta http-equiv="Copyright" content="Copyright@adleedu.co.kr">

<!-- 검색엔진 최적화(SEO) -->
<meta name="Subject" content="애들교육, 애들교육IT">
<meta name="Keyword" content="애들교육, 애들교육 IT, 교재, 이벤트">
<meta name="Description" content="애들교육 교육 교재 정보, 커뮤니티, 게시판">
<meta name="Robots" content="index, follow">

<!-- 오픈 그래프(Open graph)-->
<meta property="og:type" content="website">
<meta property="og:title" content="애들교육">
<meta property="og:description" content="모두와 함께하며 소통으로 함께하는 기업">
<meta property="og:image" content="https://github.com/chunjae-luigi/project1/image/logo.png">
<meta property="og:url" content="https://github.com/chunjae-luigi/project1">

<!-- 트위터 -->
<meta name="twitter:card" content="picture">
<meta name="twitter:title" content="애들교육">
<meta name="twitter:description" content="앞선 생각으로 더 큰 미래의 교육을 준비하는 기업">
<meta name="twitter:image" content="https://github.com/chunjae-luigi/project1/image/logo.png">

<!-- 파비콘 설정 -->
<!-- 16x16, 24x24, 32x32, 48x48, 64x64, 96x96, 114x114, 128x128, 256x256 등을 활용-->
<!-- 표준 파비콘 -->
<link rel="shortcut icon" href="<%=headPath %>/image/common/icon32.png">
<!-- 애플 계열 모바일 -->
<link rel="apple-touch-icon-precomposed" href="<%=headPath %>/image/common/icon1111.png">
<!-- IE 계열 브라우저 -->
<meta name="msapplication-TileColor" content="#FFFFFF">
<meta name="msapplication-TileImage" content="<%=headPath %>/image/common/icon48.png">
<!-- 파이어폭스, 오페라, 또는 구형 크롬/사파리 -->
<link rel="icon" href="<%=headPath %>/image/common/icon16.png" sizes="16x17">
<link rel="icon" href="<%=headPath %>/image/common/icon32.png" sizes="32x34">
<link rel="icon" href="<%=headPath %>/image/common/icon48.png" sizes="48x50">
<link rel="icon" href="<%=headPath %>/image/common/icon1111.png" sizes="64x67">

<!-- 스타일 초기화 : reset.css 또는 normalize.css -->
<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

<!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
<link rel="stylesheet" href="<%=headPath%>/css/google.css">
<link rel="stylesheet" href="<%=headPath%>/css/fonts.css">
<link rel="stylesheet" href="<%=headPath%>/css/common.css">
<link rel="stylesheet" href="<%=headPath%>/css/hd.css">
<link rel="stylesheet" href="<%=headPath%>/css/ft.css">

<!-- 필요한 플러그인 연결 -->
<script src="https://code.jquery.com/jquery-latest.js"></script>

<link rel="stylesheet" href="<%=headPath%>/css/jquery.dataTables.css">
<script src="<%=headPath%>/js/jquery.dataTables.js"></script>

<!-- 불펌 방지 -->
<script>
    document.oncontextmenu = function() { return false; }
    document.ondragstart = function() { return false; }
    document.onselectstart = function() { return false; }
</script>