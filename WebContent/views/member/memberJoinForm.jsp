<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
   background:
      url('<%=request.getContextPath()%>/resources/images/background2.jpg')
      no-repeat;
   background-size: cover;
}

section {
   width: 100%;
   height: 1200px;
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

.inner {
   position: relative;
}

.inner-container {
   width: 800px;
   height: 65%;
   position: absolute;
   top: calc(50vh - 200px);
   left: calc(40vw - 200px);
   overflow: hidden;
   background: rgba(223, 217, 230, 0.8);
   padding: 30px;
   border-radius: 10%;
}

.box {
   position: absolute;
   height: 100%;
   width: 100%;
   font-family: Helvetica;
   color: white;
   padding: 30px 0px;
   border-radius: 10%;
   font-family: 'Do Hyeon', sans-serif;
   font-style: italic;
}

.left {
   border: 1px;
   background: rgba(128, 128, 128, 0.8);
   padding: 5px;
   margin: 5px;
   margin-right: 10px;
   margin-left: 20%;
   width: 14%;
   text-align: center;
}

#btn {
   background: rgb(38, 156, 202);
   color: white;
   border: 1px;
   border-radius: 5px;
   padding-left: 2%;
   padding-right: 2%;
   padding-top: 5px;
   padding-bottom: 5px;
}

#btn2 {
   background: rgba(59, 182, 11, 0.5);
   color: white;
   border: 1px;
   border-radius: 15px;
   position: absolute;
   margin-left: 40%;
   margin-top: 10%;
   padding-left: 15px;
   padding-right: 15px;
   padding-top: 5px;
   padding-bottom: 5px;
}

.input {
   padding: 5px;
   margin-left: 2%;
}

span {
   color: skyblue;
}

#checkbox {
   margin-left: 13px;
}

.name {
   margin-right: 3%;
}

#gender1 {
   color: white;
   padding-left: 5px;
}

#gedner2 {
   margin-left: 20px;
}

#spangender {
   margin-left: 20px;
}

#eamil-check {
   padding: 5px;
   margin-left: 3%;
   background: rgba(59, 182, 11, 0.5);
   color: white;
   border: 1px;
   border-radius: 5px;
}

#check-overlap {
   padding: 5px;
   background: rgba(59, 182, 11, 0.5);
   color: white;
   border: 1px;
   border-radius: 5px;
}
#nav {
   background: rgba(59, 182, 11, 0.5);
   width:15%;
}

/* #pwdResult {
   color:red;
   background: red;
   border:5px;
} */
.div {
   color: black;
   /* background: white; */
}
</style>

</head>
<body>
   <%@ include file="../common/menubar.jsp"%>

   <br>
   <section>
      <!-- <h1 align="center">LOOK SO FINE</h1> -->
      <div>
         <form id="joinForm" name="joinForm"
            action="<%=request.getContextPath()%>/insert.me" method="post"
            onsubmit="return joinValidate();">

            <div class="inner-container">
               <div class="box">
            <div align="center"><p id="nav">회원가입</p></div>
            <br>

                  <label class="left">닉네임</label>&nbsp;<input type="text" size="22"
                     class="input name" placeholder="닉네임을 입력하세요"  name="userNick"
                     id="userNick">
                  <button id="check-overlap" type="button">중복확인</button>
                  <label id="checkmsg"></label> <br> <br> <label
                     class="left">성별</label> <span id="spangender"><input
                     type="radio" name="gender" value="M"><label id="gender1">남
                  </label><input type="radio" id="gedner2" name="gender" value="F"><label
                     id="gender1">여</label> </span><br>

                  
    <label id="checkbox"></label><br>
                  <label class="left">이메일</label>&nbsp;<input type="email" size="22"
                     class="input" placeholder="이메일을 입력하세요" name="userId" id="userId"
                     required>
                  <button id="eamil-check" type="button">인증하기</button>
    <label class="left">코드번호</label> <input type="text" size="22" class="input" placeholder="인증코드를 입력하세요." name="emailcode" id="emailcode">
   &nbsp;&nbsp;&nbsp;<button id="btn" onclick="send_emailcheck();" type="button">인증하기</button> 
<!--     <button type="button" id="email-code" class="btn btn-primary btn-lg btn-block" onclick="send_emailcheck();">인증하기</button><br>    -->
                  <label id="emailmsg"></label><br> <label class="left">비밀번호</label>
                  <input type="password" class="input" size="22" placeholder="비밀번호를 입력하세요"
                     name="userPwd" required> <br> <label class="left">비밀번호확인</label>
                  <input type="password" class="input" size="22"
                     placeholder="4~12자리 영문 숫자로 입력" name="userPwd2" required>
                  <label id="pwdResult"></label> <br>
                  <button type="submit" id="btn2" disabled>가입하기</button>
               </div>
            </div>
         </form>
      </div>
   </section>
   <script>
    var userNick = $("#userNick").val();
    $.ajax({
      url: "/checkoverlap.look",
      data: {memberNick : $("#userNick").val()},
      type: "post",
      dataType: "int",
      success: function(result){

      },
      error: function() {
        console.log("통신실패");
      }

    });


   // 2. 유효성 검사
      
   function joinValidate() {
      if(!(/^[가-힣0-9]{2,}$/.test($(".name").val()))){
         alert('닉네임은 한글로 2글자 이상 입력');
         return false;
      }
      
      if(!(/^[a-zA-Z0-9]{4,12}$/.test($("#joinForm input[name=userPwd]").val()))){
         alert('영문자숫자4자이상입력하세요!');
         return false;
      }
      
      if($("#joinForm input[name=userPwd]").val() != $("#joinForm input[name=userPwd2]").val()){
         $("#pwdResult").text("비밀번호 불일치");
         return false;
      }    
      return true;
   }
   
   $(function(){
      //패스워드일치여부
      $("#joinForm input[name=userPwd2]").blur(function(){
         console.log($(this).val());
         if($("#joinForm input[name=userPwd]").val() != $(this).val()){
            $("#pwdResult").text("비밀번호 불일치").css("color", "red");
         }else {
         $("#pwdResult").text("");
         }
      });
      //닉네임유효성검사
      $("#userNick").change(function(){
      if(!(/^[가-힣0-9]{2,}$/.test($(".name").val()))){
         alert('닉네임은 한글로 2글자 이상 입력');
      }
      });
      
      $("#joinForm input[name=userPwd]").change(function(){
         if(!(/^[a-zA-Z0-9]{4,12}$/.test($("#joinForm input[name=userPwd]").val()))){
            alert('영문자숫자4자이상입력하세요!');
         }
      });
      
      
   });

   //닉네임 중복확인 aJax
   
   $("#check-overlap").click(function(){
      var userNick = $("#userNick").val();
      $.ajax({
         url:"<%=request.getContextPath()%>/membernickcheck.look" ,
         type : "post",
         data : {userNick:userNick},
         success : function(result) {
            console.log(result);
            if(result == "fail" ) {
               $("#checkmsg").text("닉네임이 중복되었습니다 다시 입력해주세요")
               alert('닉네임이 중복되었습니다 다시 입력해주세요.');
                $("#userNick").val("");
               $("#userNick").focus(); 
                  
            }else {
               $("#checkmsg").text("");
               if(confirm("사용 가능한 닉네임입니다. 사용하시겠습니까?")) {
                  $("#userNick").prop("readonly" , true);
                  isUsable = true;
               }else {
                  userNick.focus();
               }
            /* if(isUsable) {
               $("#btn2").removeAttr("disabled");
               
            }  */
            }
         },
         error : function(e) {
            console.log("ajax 통신실패");
            console.log(e);
            
         }
      })
   });
   
   //이메일(아이디) 중복확인 aJax
   $("#eamil-check").click(function(){
   var userId = $("#userId").val();
   /* console.log(userId); */
      $.ajax({
         url : "<%=request.getContextPath()%>/memberemailcheck.look",
            type : "post",
            data : {
               userId : userId
            },
            success : function(result) {
               if (result == "fail") {
                  $("#emailmsg").text("이메일이 중복되었습니다 다시 입력해주세요");
                  $("userId").val("");
                  $("#userId").focus();

               } else {
                  if (confirm("사용 가능한 이메일입니다. 사용하시겠습니까?")) {
                     $("#emailmsg").text("");
                     $("#userId").prop("readonly", true);
                     isUsable = true;
                  } else {
                     userId.focus();
                  }
                  if (isUsable) {
                     send_mail();
                     
                     /* $("#btn2").removeAttr("disabled"); */
                  }
               }
            },
            error : function(e) {
               console.log("ajax 통신실패");
               console.log(e);
            }

         })
      });
   code;
   //회원가입에 이메일인증 aJax
   function send_mail() {
      var email = $("#userId").val();
      $.ajax({
         url : "<%=request.getContextPath()%>/sendEmail.look",
         type : "post",
         data : {email : email },
         success : function(result) {
            alert('이메일 인증코드가 발급되었습니다. 인증코드를 입력해주세요.');
            console.log(result);
            code=result;
            },
         error : function(e) {
            console.log('통실실패');
            console.log(e);
         }
      });
   }
   
   function send_emailcheck(){
      var email = $("#userId").val();
      var emailcode = $("#emailcode").val();
      //인증번호 맞을경우
      
      //인증번호확인
      if(code == emailcode) {
         alert('이메일인증 코드가 일치합니다.');
            $("#btn2").removeAttr("disabled");
         //틀릴경우다시입력
      }else {
         alert('코드가 일치하지않습니다.');
      }
      
   }

   </script>
</body>
</html>