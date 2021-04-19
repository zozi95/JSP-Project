<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>


<title>회원 가입</title>
 <link rel="stylesheet" href="css/bootstrap.min.css"> 

</head>
<body>
<script type="text/javascript">
	function checkForm() {
		
		
		if (!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
			if(!document.newMember.id.value)
			return false; 
	    	}

		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			
			return false;
		}
	      		

		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
	function confirmId() {
		if(document.newMember.id.value ==""){
			alert("아이디를 입력하세요.");
			return;
		}
		url="idCheck.jsp?id="+ document.newMember.id.value;
		window.open(url,"IDCheck","width=300,height=150");
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
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<jsp:include page="/header.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 가입</h1>
		</div>
	</div>

	<div class="container">
		<form name="newMember" class="form-horizontal"  action="guestAction.jsp" method="post" enctype ="multipart/form-data">
			<div class="form-group  row">
				<label class="col-sm-2 ">아이디</label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control" placeholder="id" required>
				</div>
				<input type="button" class="btn btn-primary " value="ID중복확인" onClick="confirmId(this.form.id.value)">
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input name="password" type="password" class="form-control" placeholder="password" required>
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호확인</label>
				<div class="col-sm-3">
					<input name="password_confirm" type="password" class="form-control" placeholder="password confirm" required>
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" placeholder="name" required>
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
					<input type="text" name="email1" value="" maxlength="50" style="weigh=200px;"required>@ 
					<input type="text" name="email2" value="" maxlength="50" required>
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
					<input name="phone" type="text" class="form-control" placeholder="phone"required>

				</div>
			</div>
			<div class="form-group  row">
			<label class="col-sm-2">생년월일</label>
			<div class="col-sm-3">
				<input required type="date" class="form-control" id="birth" name="birth">
			</div>
		</div>

			<div class="form-group  row">
				<label class="col-sm-2 ">자기 소개</label>
				<div class="col-sm-5">
					<textarea class="form-control" id="introduction" name="introduction"> </textarea> 
		
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2 ">사진 등록</label>
				<div class="col-sm-3">
					<input type="file" name="filename" id="file" accept="image/*" onchange="setThumbnail(event);" class="form-control" multiple/>
			  		<div id="image_container"></div>
			    </div>
			</div>
		 		
			
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input onclick="return checkForm()" type="submit" class="btn btn-primary " value="등록 " > 
					<input type="reset" class="btn btn-primary " value="취소 " onclick="reset()" >
				</div>
			</div>
		</form>
	</div><!-- 
	 <script src="js/bootstrap.bundle.min.js"></script> -->
</body>
</html>