<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<style>
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
<!DOCTYPE html>
<html lang="en">
<head>
    <title>애들교육::오시는길</title>
    <%@ include file="head.jsp" %>
    <link rel="stylesheet" href="<%=headPath%>/css/sub.css">
    <style>
        #map {width:1200px;height:600px;position:relative;margin:20px auto 200px !important;overflow:hidden;}
    </style>

    <script type="text/javascript" src="http://dmaps.daum.net/map_js_init/v3.js"></script>
    <script type="text/javascript" src="http://s1.daumcdn.net/svc/original/U03/cssjs/jquery/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="http://s1.daumcdn.net/svc/original/U0301/cssjs/JSON-js/fc535e9cc8/json2.min.js"></script>
</head>
<body>
<div class="wrap web guide" data-page_section="web" data-page_type="guide" data-title="Daum 지도 Web API 가이드">
    <header class="hd" id="hd">
        <%@ include file="header.jsp" %>
    </header>
    <div  class="contents" id="contents">
        <div class="sub">
            <h2>회사소개</h2>
        </div>
        <div class="breadcrumb">
            <p><a href="/"> HOME </a> &gt; <a href="<%=headerPath%>/company01.jsp"> 회사소개 </a> &gt; <span> 오시는길 </span></p>
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
                <h2 class="page_tit">오시는길</h2>
                <div class="maparea">
                    <div style="border: grey">
                        <h3>주소</h3>
                        <p>서울 금천구 디지털로9길 23 마리오아울렛2관<p>
                        <br> <h3>Tel</h3>
                        011-234-3515
                        <br><br><br> <h3>Fax</h3>
                        02-1111-111
                    </div>
                    <div id="map" style="margin-left:120px;	margin-top:50px; width:800px;height:600px; background:white; "></div>
                    <script>
                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                            mapOption = {
                                center: new daum.maps.LatLng(37.4786713,126.8864968), // 지도의 중심좌표
                                level: 2 // 지도의 확대 레벨
                            };
                        var map = new daum.maps.Map(mapContainer, mapOption);
                        // 마커가 표시될 위치입니다
                        var markerPosition  = new daum.maps.LatLng(37.4786713,126.8864968);
                        // 마커를 생성합니다
                        var marker = new daum.maps.Marker({
                            position: markerPosition
                        });
                        // 마커가 지도 위에 표시되도록 설정합니다
                        marker.setMap(map);
                        var iwContent = '<div style="padding:5px;">마리오아울렛2관<br><a href="" style="color:blue;" target="_blank"></a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                            iwPosition = new daum.maps.LatLng(37.4786713,126.8864968); //인포윈도우 표시 위치입니다
                        // 인포윈도우를 생성합니다
                        var infowindow = new daum.maps.InfoWindow({
                            position : iwPosition,
                            content : iwContent
                        });
                        // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
                        infowindow.open(map, marker);
                    </script>
                    <script type="text/javascript" src="http://m1.daumcdn.net/tiara/js/td.min.js"></script>
                    <script type="text/javascript">
                        var _tiq = 'undefined' !== typeof _tiq ? _tiq : [];
                        window._tiq = _tiq;
                        _tiq.push(['__trackPageview']);
                    </script>
                    <script type="text/javascript" src="http://s1.daumcdn.net/svc/attach/U03/cssjs/mapapidoc/1421136453605/service.min.js">
                    </script>
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
