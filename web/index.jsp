<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.adleedu.db.*" %>
<%@ page import="com.adleedu.vo.*" %>
<%@ page import="com.adleedu.dto.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "";

    DBC con = new MariaDBCon();
    conn = con.connect();

    // 공지사항 불러오기
    List<Board> noticeList = new ArrayList<>();
    try {
        sql = "select * from boardList where boardType = ? limit 4";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, 1);
        rs = pstmt.executeQuery();
        while (rs.next()) {
            Board bd = new Board();
            bd.setBno(rs.getInt("bno"));
            bd.setTitle(rs.getString("title"));
            bd.setResdate(rs.getString("resdate"));
            bd.setCnt(rs.getInt("cnt"));
            noticeList.add(bd);
        }
    } catch (SQLException e) {
        System.out.println("공지사항 글 불러오기 SQL 문 오류");
    }

    // 자유게시판 불러오기
    List<Board> boardList = new ArrayList<>();
    try {
        sql = "select * from boardList where boardType = ? limit 4";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, 2);
        rs = pstmt.executeQuery();
        while (rs.next()) {
            Board bd = new Board();
            bd.setBno(rs.getInt("bno"));
            bd.setTitle(rs.getString("title"));
            bd.setResdate(rs.getString("resdate"));
            bd.setCnt(rs.getInt("cnt"));
            boardList.add(bd);
        }
    } catch (SQLException e) {
        System.out.println("자유게시판 글 불러오기 SQL 문 오류");
    }


%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>애들교육</title>
    <%@ include file="head.jsp" %>
    <link rel="stylesheet" href="<%=headPath%>/css/main.css">
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <figure class="vs">
            <ul class="img_box">
                <li class="item1 active">
                    <input type="radio" name="vs_ra" id="vs_ra1" class="vs_ra" checked>
                    <div class="bg_box"></div>
                    <h2 class="vs_tit">애들은 애들답게<br>
                        <strong>아이는 아이다워야 합니다</strong></h2>
                </li>
                <li class="item2">
                    <input type="radio" name="vs_ra" id="vs_ra2" class="vs_ra">
                    <div class="bg_box"></div>
                    <h2 class="vs_tit">적절한 시기에 적절한 교육<br>
                        <strong>모든 것은 적합한 시기가 있습니다.</strong>
                    </h2>
                </li>
            </ul>
            <ul class="btn_box">
                <li class="item1 active"><label for="vs_ra1" class="vs_btn"></label></li>
                <li class="item2"><label for="vs_ra2" class="vs_btn"></label></li>
            </ul>
            <button type="button" class="play_btn"></button>
        </figure>
        <script>
            $(function(){
                $(".btn_box li .vs_btn").click(function(){
                    var par = $(this).parents("li").index();
                    $(".img_box li").removeClass("active");
                    $(".img_box li").eq(par).addClass("active");
                    $(".btn_box li").removeClass("active");
                    $(".btn_box li").eq(par).addClass("active");
                });
                var sw = 1;
                var int1 = setInterval(function(){
                    if(sw==1){
                        autoplay(1);
                        sw = 0;
                    } else {
                        autoplay(0);
                        sw = 1;
                    }
                }, 3500);

                function autoplay(n){
                    $(".img_box li").removeClass("active");
                    $(".img_box li").eq(n).addClass("active");
                    $(".btn_box li").removeClass("active");
                    $(".btn_box li").eq(n).addClass("active");
                }

                $(".play_btn").click(function(){
                    if($(this).hasClass("active")){
                        $(this).removeClass("active");
                        sw = 1;
                        int1 = setInterval(function(){
                            if(sw==1){
                                autoplay(1);
                                sw = 0;
                            } else {
                                autoplay(0);
                                sw = 1;
                            }
                        }, 3500);
                    } else {
                        $(this).addClass("active");
                        sw = 0;
                        clearInterval(int1);
                    }
                });
            });
        </script>
        <section class="page" id="page1">
            <div class="page_wrap">
                <ul class="board_lst">
                    <li class="item1">
                        <div class="board_tit">
                            <h3>공지사항</h3>
                            <a href="<%=headerPath%>/board/listNotice.jsp" class="btn_more">+</a>
                        </div>
                        <ul class="board_con">
                            <%
                                if(noticeList.size() > 0){
                                    for(Board bd : noticeList) {
                                        String dateStr = bd.getResdate().substring(0, 10);
                                        String title = "";
                                        if(bd.getTitle().length() > 70) {
                                            title = bd.getTitle().substring(69) + "...";
                                        } else {
                                            title = bd.getTitle();
                                        }

                            %>
                            <li><a href="<%=headerPath %>/board/getNotice.jsp?bno=<%=bd.getBno() %>"><%=title %><span class="date"><%=dateStr %></span></a></li>
                            <% } } else { %>
                            <li class="no_date">
                                등록된 공지사항이 없습니다.
                            </li>
                            <% } %>
                        </ul>
                    </li>
                    <li class="item2">
                        <div class="board_tit">
                            <h3>자유게시판</h3>
                            <a href="<%=headerPath%>/board/listBoard.jsp" class="btn_more">+</a>
                        </div>
                        <ul class="board_con">
                            <%
                                if(boardList.size() > 0){
                                    for(Board bd : boardList) {
                                        String dateStr = bd.getResdate().substring(0, 10);
                                        String title = "";
                                        if(bd.getTitle().length() > 70) {
                                            title = bd.getTitle().substring(69) + "...";
                                        } else {
                                            title = bd.getTitle();
                                        }

                            %>
                            <li><a href="<%=headerPath %>/board/getBoard.jsp?bno=<%=bd.getBno() %>"><%=title %><span class="date"><%=dateStr %></span></a></li>
                            <% } } else { %>
                            <li class="no_date">
                                등록된 자유게시판이 없습니다.
                            </li>
                            <% } %>
                        </ul>
                    </li>
                </ul>
            </div>
        </section>

        <script>
            $(function(){
                $(".sl-btn-box .btn.next").click(function(){
                    var ln = parseInt($(".card_lst").css("margin-left"));
                    if(ln>-1110) {
                        var mv = ln - 370;
                        $(".card_lst").not(":animated").animate({"margin-left":mv+"px"});
                    }
                });
                $(".sl-btn-box .btn.prev").click(function(){
                    var ln = parseInt($(".card_lst").css("margin-left"));
                    if(ln<0){
                        var mv = ln + 370;
                        $(".card_lst").not(":animated").animate({"margin-left":mv+"px"});
                    }
                });
            });
        </script>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="footer.jsp" %>
    </footer>
</div>
</body>
</html>
