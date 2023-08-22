<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<div class="ft_wrap">
    <nav class="ft_link">
        <ul class="fnb">
            <li class="ft_logo"></li>
            <li><a href="/aboutEmail.jsp">이메일 무단 수집 거부</a></li>
        </ul>
        <ul class="snb">
            <li class="item1"><a href="javascript:return false">페이스북</a></li>
            <li class="item2"><a href="javascript:return false">카페</a></li>
            <li class="item3"><a href="javascript:return false">블로그</a></li>
            <li class="item4"><a href="javascript:return false">유투브</a></li>
            <li class="item5"><a href="javascript:return false">인스타그램</a></li>
        </ul>
    </nav>
    <script>
        function loc(){
            var url = document.getElementById("sel").value;
            //location.href = url;  //현재 창에
            if(url!="") {
                var win = window.open(url); //새창에
            }
        }
    </script>
</div>
<div class="ft_wrap2">
    <p class="copyright">
        <span>그로우앤조이</span>
        <span>서울시 금천구 가산로9길 54</span>
        <span>대표자 최상민</span>
        <span>사업자등록번호 XXX-XX-XXXXX</span>
        <span>통신판매신고번호 제XX-XXX호</span>
        <span class="end">부가통신사업신고 XXXXXX</span>
    </p>
    <p class="cp">COPYRIGHT 1981-2023 GROW&JOY INC. ALL RIGHTS RESERVED.</p>
</div>