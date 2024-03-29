<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 세션에서 로그인유저 -> gradeCode로 admin 계정 확인하기
	Member m = (Member)session.getAttribute("loginUser");
	String gradeCode = m.getGradeCode();	
%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>LOOK SO FINE</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- font -->
    <link href="https://fonts.googleapis.com/css?family=Fugaz+One|Paytone+One&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400" rel="stylesheet">
    <style>

        body {
          width : 100%;
          height : 1600px;
          background: url('<%= request.getContextPath() %>/resources/images/mainback.jpg');
        }

        #navbar {
            width:100%;
            height:60px;
            position:fixed;
            z-index: 1;
            color:white;
            font-family: 'Fugaz One', cursive;
        }

        #category {
          width: 100%;
          height:60px;
          position: fixed;
          z-index: 1;
          background: white;
          opacity:0.8;
          font-family: 'Paytone One', sans-serif;
          font-size: 25px; 
          font-style: italic;
        }

        .nav-link:hover {
          text-decoration:underline;
          font-weight:bold;
        }

        section {
            width: 100%;
            height: 1200px;
            margin: auto;
        }

        hr {
            border: 1px solid black;
        }

        .btn {
            background: black;
            border: 1px solid white;
            color: white;
            text-decoration: underline;
        }

        .copyRight {
          text-align: center;
          padding: 100px 0;
        }

        .menuLine {
            margin: auto;
            width: 80%;
            height: 100px;
            align-items: center;
        }

        .div {
            width: 33%;
            margin: auto;
            float: left;
            text-align: center;
        }

        .innermenu {
            width: 100px;
            height: 30px;
            text-align: center;
            border: 1px solid black;
            border-radius: 5px;
            margin: auto;
            font-weight: bold;
            font-size: 18px;
        }

        .eventArea {
          width: 80%;
          height: 1200px;
          margin: auto;
        }
        
        .eventArea1 {
          width: 40%;
          height: 500px;
          background: darkgray;
          float: left;
          margin: 30px 0 0 30px;
          box-shadow: 5px 5px 5px 5px gray;
          border-radius: 5px;
        }

        .eventArea2 {
          width: 40%;
          height: 500px;
          background: darkgray;
          float: right;
          margin: 30px 30px 0 0;
          box-shadow: 5px 5px 5px 5px gray;
          border-radius: 5px;
        }

        .eventArea3 {
          width: 40%;
          height: 500px;
          background: darkgray;
          float: left;
          margin: 100px 0 0 30px;
          box-shadow: 5px 5px 5px 5px gray;
          border-radius: 5px;
        }

        .eventArea4 {
          width: 40%;
          height: 500px;
          background: darkgray;
          float: right;
          margin: 100px 30px 0 0;
          box-shadow: 5px 5px 5px 5px gray;
          border-radius: 5px;
        }

        #caption {
          font-family: 'Do Hyeon', sans-serif;
          font-weight: bold;
          text-align: left;
          margin:0 0 0 20px;
          font-size:30px;
        }
        
        #caption1 {
          font-family: 'Do Hyeon', sans-serif;
          font-weight: bold;
          text-align: left;
          margin:0 0 0 20px;
          font-size:20px;
        }


    </style>
</head>
<body>
 <%@ include file="../common/menubar.jsp" %>
<nav>
  <br>
  <div class="menuLine">
  <div class="div div1"><hr></div>
  <div class="div div2">
      <div class="innermenu">
          EVENT
      </div>
  </div>
  <div class="div div3"><hr></div>
</div>
</nav>
<br>
<section>
    <div class="eventArea">
      <div class="eventArea1">
        <div class="card" style="width: 100%; height: 100%; border-radius: 5px;">
          <a href="https://www.styleshare.kr/catalogs/6914" target="_blank"><img src="<%= contextPath %>/resources/images/banner/styleshare.jpg" class="card-img-top" height="350" style="border-top-left-radius: 5px; border-top-right-radius: 5px;"></a>
          <div class="card-body">
            <p class="card-text"><h4 id="caption">Only LOOK SO FINE</h4><br><p id="caption1">LOOK SO FINE 단독행사</p></p>
          </div>
        </div>
      </div>
      <br><br>
      <div class="eventArea2">
        <div class="card" style="width: 100%; height: 100%; border-radius: 5px;">
          <a href="https://store.musinsa.com/app/plan/views/8069" target="_blank"><img src="<%= contextPath %>/resources/images/banner/musinsa.jpg" class="card-img-top" height="350" style="border-top-left-radius: 5px; border-top-right-radius: 5px;"></a>
          <div class="card-body">
            <p class="card-text"><h4 id="caption">베스트 베이직 아이템 기획전</h4><br><p id="caption1">베스트 베이직 아이템 기획전입니다.</p></p>
          </div>
        </div>
      </div>
      <br>
      <div class="eventArea3">
        <div class="card" style="width: 100%; height: 100%; border-radius: 5px;">
          <a href="https://www.styleshare.kr/catalogs/9199" target="_blank"><img src="<%= contextPath %>/resources/images/banner/styleshare1.jpg" class="card-img-top" height="350" style="border-top-left-radius: 5px; border-top-right-radius: 5px;"></a>
          <div class="card-body">
            <p class="card-text"><h4 id="caption">아우터 스타일 쇼 - 위클리 특가</h4><br><p id="caption1">애플앤딥, 엘리오티, 프레이 등</p></p>
          </div>
        </div>
      </div>
      <br><br>
      <div class="eventArea4">
        <div class="card" style="width: 100%; height: 100%; border-radius: 5px;">
          <a href="https://store.musinsa.com/app/plan/views/7997" target="_blank"><img src="<%= contextPath %>/resources/images/banner/musinsa1.jpg" class="card-img-top" height="350" style="border-top-left-radius: 5px; border-top-right-radius: 5px;"></a>
          <div class="card-body">
            <p class="card-text"><h4 id="caption">SPAO X HARRYPOTER</h4><br><p id="caption1">스파오 X 해리포터 19 F/W 컬렉션</p></p>
          </div>
        </div>
      </div>
    </div>
</section>
<footer class="copyRight">
  <p>Copyright 2019. LookSoFine.  All right reserved.</p>
</footer>
<script>
function goStyle() {
	location.href="<%= contextPath %>/boardlist.look";
}

function goFavorite() {
	location.href="<%= contextPath %>/wishlist.look";
}

function goEvent() {
	location.href="<%= contextPath %>/views/event/eventPage.jsp";
}

function goMypage() {
	// admin계정으로 로그인했을 때, admin페이지로 넘어갈 수 있도록 수정	
	if("<%= gradeCode %>" == 'S'){
		location.href="<%= contextPath %>/views/adm/adm_overview.jsp";
	} else {
		location.href="<%= contextPath %>/views/mypage/myPage.jsp";
	}
}
</script>
</body>
</html>