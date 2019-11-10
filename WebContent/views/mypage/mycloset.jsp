<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, closet.model.vo.*"%>
<% 
	ArrayList<Closet> list = (ArrayList<Closet>) request.getAttribute("list");
	int topCount = (int) request.getAttribute("topCount");
	int bottomCount = (int) request.getAttribute("bottomCount");
	int accCount = (int) request.getAttribute("accCount");
	int num = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOOKSOFINE - 나의옷장</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous" />
<link href="<%= request.getContextPath() %>/css/ui-choose.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Fugaz+One|Paytone+One&display=swap"
	rel="stylesheet" />
<!-- Owl StyleSheet -->
<link href="<%= request.getContextPath() %>/css/owl.carousel.min.css" rel="stylesheet">
<!-- Colorpicker StyleSheet-->
<link href="<%= request.getContextPath() %>/css/bcp.min.css" rel="stylesheet">
<style>
#navbar {
	width: 100%;
	height: 60px;
	position: fixed;
	z-index: 1;
	text-align: center;
}

#category {
	width: 100%;
	height: 60px;
	position: fixed;
	z-index: 1;
	background: white;
	opacity: 0.8;
}

.nav-link:hover {
	text-decoration: underline;
	font-weight: bold;
}

section {
	width: 100%;
	height: 1200px;
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

.content {
	width: 77%;
	height: 1100px;
	float: left;
	padding: 10px;
}

.menu {
	width: 20%;
	list-style-type: disc;
	float: left;
	font-size: 20px;
}

.line {
	width: 3%;
	float: left;
	border-left: 2px solid black;
	height: 1200px;
}

.list {
	padding: 10px;
}

.sublist {
	padding: 10px;
}

ul.category li a {
	margin: auto;
	color: black;
}

ul.category li a:hover {
	font-weight: bold;
	font-style: italic;
}

ul.category ul>li {
	list-style-type: square;
	margin: 5px 5px;
	text-decoration: none;
}

.left {
	width: 500px;
	height: 75%;
	/* border: 1px solid black; */
	box-sizing: border-box;
	display: block;
	margin: auto;
}

.right {
	width: 40%;
	height: 1000px;
	/* border: 1px solid black; */
	box-sizing: border-box;
	display: block;
	visibility: hidden;
}

.mycloset {
	border-radius: 10px;
	width: 100%;
	height: 90%;
	background-color: rgb(184, 184, 184);
}

.left .button {
	text-align: center;
	width: 100%;
	height: 8%;
}

.right .first {
	width: 30%;
	height: 200px;
	display: inline-block;
	margin-right: 30px;
}

.right .thumbnail {
	background-color: lightgray;
	border-radius: 10px;
	width: 40%;
	height: 200px;
	position: relative;
	display: block;
}

#thumbnail-pic {
	width: 90%;
	height: 80%;
	margin: auto;
	z-index: 1;
	-webkit-mask-box-image: url(<%= request.getContextPath() %>/resources/images/closet/question.png);
}

#add-btn {
	margin: auto;
	width: 100%;
}
/* 
#thumbnail-add {
	height: 20%;
	margin: auto;
	position: absolute;
	bottom: 0;
	left: 35%;
} */

.right .cloth {
	width: 99%;
	height: auto;
}

.select-form {
	width: 99%;
	height: 80%;
	border-collapse: separate;
	border-spacing: 5 5px;
}

#select-top {
	visibility: collapse;
}

#select-bottom {
	visibility: collapse;
}

#select-acc {
	visibility: collapse;
}

/* 나의 옷장 carousel 스타일 */
.cloth-vec {
        height: 120px;
		width: 120px;
      }
      .clothlist {
        width: 100%;
        overflow: hidden;
      }
      .owl-nav,
      .owl-dots {
        display: block;
        text-align: center;
      }
      .owl-nav .owl-prev,
      .owl-nav .owl-next {
        display: inline-block;
        margin: 5px;
      }
      .owl-dots .owl-dot {
        display: inline-block;
        width: 12px;
        height: 12px;
        border-radius: 50%;
        margin: 5px;
      }
      .owl-dots .active {
        background-color: #666;
      }

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<nav>
		<br />
		<div class="menuLine">
			<div class="div div1">
				<hr />
			</div>
			<div class="div div2">
				<div class="innermenu">My Page</div>
			</div>
			<div class="div div3">
				<hr />
			</div>
		</div>
	</nav>
	<br />
	<section>
		<div class="menu">
			<ul class="category">
				<li class="list" onclick="goMyCloset();">나의 옷장</li>
				<li class="list" onclick="goMyList();">내 게시물 관리</li>
				<li class="list" onclick="goQna();">FAQ / Q&A</li>
				<li class="list-readonly">개인정보관리
					<ul>
						<li class="sublist"
							onclick="location.href='<%= contextPath %>/views/mypage/modifyinfo.jsp'">개인
							정보 수정</a>
						</li>
						<li class="sublist" onclick="goWishStyle();">선호 스타일</li>
						<li class="sublist"
							onclick="location.href='<%= contextPath %>/views/mypage/withdraw.jsp'">회원
							탈퇴</li>
					</ul>
				</li>
			</ul>
		</div>
		<script>
        function goMyCloset(){
            location.href="<%= contextPath %>/closet.look";
        }
        function goMyList(){
            location.href="<%= contextPath %>/mylist.look";
        }
        function goQna(){
            location.href="<%= contextPath %>/qna.look";
        }
        function goWishStyle(){
            location.href="<%= contextPath %>/withstyle.look";
        }
    	</script>
		<div class="line"></div>
		<div class="content">
			<div class="content left">
				<div class="content left button">
					<button onclick="addCloth();">옷 추가</button>
					<button>옷 삭제</button>
				</div>
				<div class="content left mycloset">
						<script type="text/javascript"
						src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
						<script src="<%= request.getContextPath() %>/js/owl.carousel.js"></script>
						<h5>상의(총 <%= topCount %>벌)</h5>
						<div class="clothlist mytop">
								<% for(Closet c : list) {
									if(c.getTypeOption() == 1) { %>
									<div class="cloth-vec" style="-webkit-mask-box-image: url(<%= contextPath %>/resources/images/closet/<%= list.get(num).getTypeCode() %>.png); background-color: rgb(<%= list.get(num).getColourCode() %>)"></div>
									<% num++;
									}
								} %>
							  </div>		

							  <script>
									var carousel = $(".clothlist.mytop");
									carousel.owlCarousel({
									  loop: true,
									  margin: 10,
									  nav: true,
									  responsive: {
										0: {
										  items: 1
										},
										600: {
										  items: 2
										},
										1000: {
										  items: 3
										}
									  }
									});
									/* Mousewheel에 따른 이벤트 구현 */
									// carousel.on("mousewheel", ".owl-stage", function(e) {
									//   if (e.deltaY > 0) {
									// 	carousel.trigger("next.carousel");
									//   } else{
									// 	carousel.trigger("prev.carousel");
									//   }
									//   e.preventDefault();
									// });
								  </script>
<hr>
<h5>하의(총 <%= bottomCount %>벌)</h5>
<div class="clothlist mybottom">
		<% for(Closet c : list) {
			if(c.getTypeOption() == 2) { %>
			<div class="cloth-vec" style="-webkit-mask-box-image: url(<%= contextPath %>/resources/images/closet/<%= list.get(num).getTypeCode() %>.png); background-color: rgb(<%= list.get(num).getColourCode() %>)"></div>
			<% num++;
			}
		} %>
	  </div>		
	 
	  <script>
			var carousel = $(".clothlist.mybottom");
			carousel.owlCarousel({
			  loop: true,
			  margin: 10,
			  nav: true,
			  responsive: {
				0: {
				  items: 1
				},
				600: {
				  items: 2
				},
				1000: {
				  items: 3
				}
			  }
			});
			/* Mousewheel에 따른 이벤트 구현 */
			// carousel.on("mousewheel", ".owl-stage", function(e) {
			//   if (e.deltaY > 0) {
			// 	carousel.trigger("next.carousel");
			//   } else{
			// 	carousel.trigger("prev.carousel");
			//   }
			//   e.preventDefault();
			// });
		  </script>
				<hr>
<h5>악세사리(총 <%= accCount %>벌)</h5>
<div class="clothlist myacc">
		<% for(Closet c : list) {
			if(c.getTypeOption() == 3) { %>
			<div class="cloth-vec" style="-webkit-mask-box-image: url(<%= contextPath %>/resources/images/closet/<%= list.get(num).getTypeCode() %>.png); background-color: rgb(<%= list.get(num).getColourCode() %>)"></div>
			<% num++;
			}
		} %>
	  </div>		

	  <script>
			var carousel = $(".clothlist.myacc");
			carousel.owlCarousel({
			  loop: true,
			  margin: 10,
			  nav: true,
			  responsive: {
				0: {
				  items: 1
				},
				600: {
				  items: 2
				},
				1000: {
				  items: 3
				}
			  }
			});
			/* Mousewheel에 따른 이벤트 구현 */
			// carousel.on("mousewheel", ".owl-stage", function(e) {
			//   if (e.deltaY > 0) {
			// 	carousel.trigger("next.carousel");
			//   } else{
			// 	carousel.trigger("prev.carousel");
			//   }
			//   e.preventDefault();
			// });
		  </script>

			
		</div>
			</div>

			<!-- content right -->
			<form>
				<div class="content right">
					<div class="content right first">
						<h5>분류 선택</h5>
						<select class="ui-choose" id="options">
							<option value="top">상의</option>
							<option value="bottom">하의</option>
							<option value="acc">악세사리</option>
						</select>
					</div>
					<div class="content right thumbnail">
						<div id="thumbnail-pic" align="center"
							style="background-color: rgb(224, 20, 34);"></div>
						<div id="thumbnail-add">
							<button type="button" id="add-btn">내 옷장에 추가!</button>
						</div>
					</div>
					<div class="content right cloth style">
						<table class="select-form">
							<tr>
								<td style="width: 100px">선호하는 옷?</td>
								<td><input type="checkbox" name="likestatus" id="likestatus" value="Y"></td>
							</tr>
							<tr id="select-top">
								<td>선택</td>
								<td><select class="ui-choose" id="cloth-top"
									name="clothtype">
										<option value="TSHIRTS">반팔티</option>
										<option value="MANTOMAN">맨투맨</option>
										<option value="HOOD">후드티</option>
										<option value="KNIT">니트</option>
										<option value="CARDIGAN">가디건</option>
										<option value="PADDING">패딩</option>
										<option value="JACKET">자켓</option>
										<option value="BLOUSE">원피스</option>
								</select></td>
							</tr>
							<tr id="select-bottom">
								<td>선택</td>
								<td><select class="ui-choose" id="cloth-bottom"
									name="clothtype">
										<option value="COTTON">면바지</option>
										<option value="JEAN">청바지</option>
										<option value="SHORT">반바지</option>
										<option value="SSKIRT">짧은치마</option>
										<option value="LSKIRT">긴치마</option>
								</select></td>
							</tr>
							<tr id="select-acc">
								<td>선택</td>
								<td><select class="ui-choose" id="cloth-acc"
									name="clothtype">
										<option value="CAP">모자</option>
										<option value="SCARF">목도리</option>
										<option value="SNEAKERS">스니커즈</option>
										<option value="DRESSSHOES">구두</option>
										<option value="SANDAL">샌들</option>
								</select></td>
							</tr>
							<tr>
								<td>스타일(2개까지 선택)</td>
								<td><select class="ui-choose" multiple="multiple"
									id="style">
										<option value="1">#깔끔한</option>
										<option value="2">#빈티지</option>
										<option value="3">#힙스터</option>
										<option value="4">#스트릿</option>
										<option value="5">#시크한</option>
										<option value="6">#클래식</option>
										<option value="7">#러블리</option>
										<option value="8">#핑크룩</option>
										<option value="9">#섹시한</option>
										<option value="10">#럭셔리</option>
										<option value="11">#모던시크</option>
										<option value="12">#스쿨룩</option>
										<option value="13">#귀여운</option>
										<option value="14">#캐주얼</option>
										<option value="15">#유니크</option>
										<option value="16">#댄디룩</option>
								</select></td>
							</tr>
							<tr>
								<td>색감</td>
								<td><select class="ui-choose" id="colour">
										<option value="245,245,245">화이트</option>
										<option value="255,255,0">옐로우</option>
										<option value="211,33,45">레드</option>
										<option value="150,75,0">브라운</option>
										<option value="0,0,50">네이비</option>
										<option value="10,10,10">블랙</option>
										<option value="30,30,30">나도몰라</option>
										<option value="100,100,100">기타</option>
								</select></td>
								<!-- color picker 작업중-->
								<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" crossorigin="anonymous"></script>
								<script src="<%= contextPath %>/js/bcp.min.js"></script>
								<script src="<%= contextPath %>/js/bcp.en.min.js"></script>
								<script>
								
								$('.ui-choose').attr("selected").bcp();
								$('#colour').on('pcb.refresh', function (e) {
									if ($('#colour').val() == "기타") {
										console.log("성공!");
										let color = $(this).bcp('color');
										if (color.value) {
											$("#thumbnail-pic").attr(
												"style",
												"background-color: rgb(" + value + ");"
												);
											}
									}
								});
								</script>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>핏</td>
								<td><select class="ui-choose" id="fit" name="fit">
										<option value="slim">슬림핏</option>
										<option value="basic">베이직</option>
										<option value="overfit">오버핏</option>
								</select></td>
							</tr>
							<tr>
								<td>계절감</td>
								<td><select class="ui-choose" id="season" name="season">
										<option value="sf">봄가을</option>
										<option value="su">여름</option>
										<option value="wi">겨울</option>
								</select></td>
							</tr>
							<tr>
								<td>브랜드</td>
								<td><input type="text" name="brand" id="brand" /></td>
							</tr>
							<tr>
								<td>구입시기</td>
								<td><input type="month" name="buydate" id="buydate" /></td>
							</tr>
							<tr>
								<td>관련메모</td>
								<td><textarea name="memo" id="memo" cols="30" rows="4" placeholder="이 옷에 대한 메모를 입력하세요."></textarea></td>
							</tr>
						</table>
					</div>
					<!-- 옷장 기능 관련 Script -->
					<script src="<%= contextPath %>/js/ui-choose.js"></script>
					<script>
              function addCloth() {
                $(".content left").css({ width: "30%" });
                $(".right").css({ visibility: "visible" });
              }

              // https://www.jqueryscript.net/form/jQuery-Plugin-For-Easy-Select-Button-Group-ui-choose.html
              var options = $("#options").ui_choose();
              options.click = function(value, item) {
                console.log("click", value);

                $("tr[id *= select]").css({ visibility: "collapse" });
                switch (value) {
                  case "top":
                    $("#select-top").css({ visibility: "visible" });
                    break;
                  case "bottom":
                    $("#select-bottom").css({ visibility: "visible" });
                    break;
                  case "acc":
                    $("#select-acc").css({ visibility: "visible" });
                    break;
                }
              };

              var topcloth = $("#cloth-top").ui_choose();
              topcloth.click = function(value, item) {
                console.log("click", value);
                $("#thumbnail-pic").css({"-webkit-mask-box-image":'url(<%= contextPath %>/resources/images/closet/' + value + '.png)'});
              };
              var bottom = $("#cloth-bottom").ui_choose();
              bottom.click = function(value, item) {
                console.log("click", value);
                $("#thumbnail-pic").css({"-webkit-mask-box-image":'url(<%= contextPath %>/resources/images/closet/' + value + '.png)'});

              };
              var acc = $("#cloth-acc").ui_choose();
              acc.click = function(value, item) {
                console.log("click", value);
                $("#thumbnail-pic").css({"-webkit-mask-box-image":'url(<%= contextPath %>/resources/images/closet/' + value + '.png)'});

              };

              var style = $("#style").ui_choose();
              style.click = function(value, item) {
                console.log("click", value);
                style = value;
                console.log(style);
              };
              console.log("style" + style);
              // style.change = function(value, item) {
              //     console.log('change', value);
              // };
              var colour = $("#colour").ui_choose();
              colour.click = function(value, item) {
            	var clothtype = "";
                console.log("click", value);
                $("#thumbnail-pic").attr(
                  "style",
                  "background-color: rgb(" + value + ");"
                );
                if(options.val() == 'top') {
                	$("#thumbnail-pic").css({"-webkit-mask-box-image":'url(<%= contextPath %>/resources/images/closet/' + $("#cloth-top").val() + '.png)'});
                  } else if(options.val() == 'bottom') {
               	  	$("#thumbnail-pic").css({"-webkit-mask-box-image":'url(<%= contextPath %>/resources/images/closet/' + $("#cloth-bottom").val() + '.png)'});
                  } else {
               	  	$("#thumbnail-pic").css({"-webkit-mask-box-image":'url(<%= contextPath %>/resources/images/closet/' + $("#cloth-acc").val() + '.png)'});
                  };
              };
              colour.change = function(value, item) {
                console.log("change", value);
              };

              var fit = $("#fit").ui_choose();
              fit.click = function(value, item) {
                console.log("click", value);
              };
              fit.change = function(value, item) {
                console.log("change", value);
              };
              var season = $("#season").ui_choose();
              season.click = function(value, item) {
                console.log("click", value);
              };
              season.change = function(value, item) {
                console.log("change", value);
              };

              $(document).ready(function(){


                $("#add-btn").click(function(){
                  var obj = new Object();
                  if(options.val() == 'top') {
					obj.typeoption = 1;
                    obj.clothtype = $("#cloth-top").val();
                  } else if(options.val() == 'bottom') {
					obj.typeoption = 2;
                    obj.clothtype = $("#cloth-bottom").val();
                  } else {
					obj.typeoption = 3;
                    obj.clothtype = $("cloth-acc").val();
				  };
				  obj.likestatus = $("#likestatus:checked").val();
                  obj.style = $("#style").val();
                  obj.colour = colour.val();
                  obj.fit = fit.val();
				  obj.season = season.val();
                  obj.brand = $("#brand").val();
                  obj.buydate = $("#buydate").val();
                  obj.memo = $('#memo').val();
                  console.log(obj);

                  var JSONData = JSON.stringify(obj);
                  $.ajax({
                    url: "<%= contextPath %>/addmycloth.look",
                    data: JSONData,
                    type: "POST",
                    dataType: "json",
                    success: function(data) {

                    },
                    error: function(e) {
					  alert("에러 발생");
					  console.log(e)
                    }
                  });

                });
              });  

            </script>
				</div>
			</form>
		</div>
	</section>

	<footer class="copyRight">
		<p>Copyright 2019. LookSoFine. All right reserved.</p>
	</footer>
</body>
</html>