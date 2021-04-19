<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<script src="//code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script type="text/javascript">
   function checkForm() {

      if (!document.newMember.password.value) {
         alert("비밀번호를 입력하세요.");
         return false;
      }

      if (document.newMember.password.value != document.newMember.password_confirm.value) {
         alert("비밀번호를 동일하게 입력하세요.");
         return false;
      }
   }

   
   function SetEmailTail(emailValue) {
        var email = document.all("email")    // 사용자 입력
        var emailTail = document.all("email2") // Select box
        
        if ( emailValue == "notSelected" )
         return;
        else if ( emailValue == "etc" ) {
         emailTail.readOnly = false;
         emailTail.value = "";
         emailTail.focus();
        } else {
         emailTail.readOnly = true;
         emailTail.value = emailValue;
         
        }
       }
    function setThumbnail(event) {
        var reader = new FileReader();

        reader.onload = function(event) {
          var img = document.createElement("img");
          img.setAttribute("src", event.target.result);
          document.querySelector("div#image_container").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0] );
      }
   
   
  
   
   
</script>
<title>회원수정</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
   <%@ include file="header.jsp"%>
   <%@ include file="hostdbconn.jsp"%>
   <%
      
       

      String sql1= "SELECT * FROM guestuser WHERE userID = ? ";
      pstmt = conn.prepareStatement(sql1);
      pstmt.setString(1,userID);
      rs = pstmt.executeQuery();
      if (rs.next()) {
              String email= rs.getString("guestMail");  
                String email2="[@]";
                String[] sArray2 = email.split(email2);
  

   %>
   
       
      
      <div class="jumbotron">
      <div class="container">
         <h1 class="display-3">게스트회원 가입수정</h1>
         <div class="col-md-7" style="float: none; margin: 0 auto;">  
            </div>
   </div> </div> 
   <div class="container">
      <form name="newMember" class="form-horizontal"  action="guestUpdateProc.jsp" method="post" enctype ="multipart/form-data">
         <div class="form-group  row">
            <label class="col-sm-2 ">아이디</label>
            <div class="col-sm-3">
               <input name="id" type="text" class="form-control" placeholder="id" value="<%=rs.getString("userID")%>">
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">비밀번호</label>
            <div class="col-sm-3">
               <input name="password" type="password" class="form-control" placeholder="password" value="<%=rs.getString("guestPassword")%>" >
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">비밀번호확인</label>
            <div class="col-sm-3">
               <input name="password_confirm" type="password" class="form-control" placeholder="password confirm" value="<%=rs.getString("guestPassword")%>" >
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">성명</label>
            <div class="col-sm-3">
               <input name="name" type="text" class="form-control" placeholder="name" value="<%=rs.getString("guestName")%>" >
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">성별</label>
            <div class="col-sm-10">
               <input name="gender" type="radio" value="남자" checked/> 남자 
               <input name="gender" type="radio" value="여자" /> 여자
            </div>
         </div>
         <div class="form-group  row ">
            <label class="col-sm-2">이메일</label>
            <div class="col-sm-10" >
               
            
               <input type="text" name="email1" value="<%=sArray2[0]%>" maxlength="50" style="weigh=200px;">@ 
               <input type="text" name="email2" value="<%=sArray2[1]%>" maxlength="50" >
               <select name="emailCheck" onchange="SetEmailTail(emailCheck.options[this.selectedIndex].value)">
                  <option value ="notSelected">선택하세요</option>
                  <option value ="etc">직접입력</option>
                  <option value ="naver.com">naver.com</option>
                  <option value ="daum.net">daum.net</option>
                  <option value ="gmail.com">gmail.com</option>
                  <option value ="nate.com">nate.com</option>
               </select>
            </div>            
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">전화번호</label>
            <div class="col-sm-3">
               <input name="phone" type="text" class="form-control" placeholder="phone" value= "<%=rs.getString("guestPhone")%>" >

            </div>
         </div>
         

         <div class="form-group  row">
            <label class="col-sm-2 ">자기 소개</label>
            <div class="col-sm-5">
               <textarea class="form-control" id="introduction" name="introduction"><%=rs.getString("guestIntroduction")%></textarea> 
      
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2 ">사진 등록</label>
            <div class="col-sm-3">
               <input value="<%=rs.getString("guestFilename")%>" type="file" name="filename" id="file" accept="image/*" onchange="setThumbnail(event);" class="form-control" multiple/>
                 <div id="image_container"></div>
             </div>
         </div>
      
      
         <div class="form-group  row">
            <div class="col-sm-offset-2 col-sm-10 ">
               <input onclick="return checkForm()" type="submit" class="btn btn-primary " value="수정 " > 
               <input type="reset" class="btn btn-primary " value="취소 " onclick="reset()" >
            </div>
         </div>
      </form>
   </div>
         
         
         
         
         <%
         
      }
      
      if (rs != null)
         rs.close();
      if (pstmt != null)
         pstmt.close();
      if (conn != null)
         conn.close();
   %>
   
   
    
    <script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>