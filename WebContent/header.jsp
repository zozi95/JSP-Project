<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter" %>


<link rel="stylesheet" href="css/bootstrap.min.css">

<body>
<script type="text/javascript">

function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}


window.onclick = function(event) {
	  if (!event.target.matches('.btn')) {

	    var dropdowns = document.getElementsByClassName("dropdown-menu");
	    var i;
	    for (i = 0; i < dropdowns.length; i++) {
	      var openDropdown = dropdowns[i];
	      if (openDropdown.classList.contains('show')) {
	        openDropdown.classList.remove('show');
	      }
	    }
	  }
	}
</script>
<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
%>
<a class="navbar-brand" href="main.jsp" style="font-family:'Gugi', cursive; font-size:40px; margin-left:20px">여행의 일락</a>

<div class="form-row float-right" style="margin-right:80px; margin-top:15px">
	<%
		if(userID != null){
			
		
	%>
	<a href=hostCart.jsp>
	<img style="margin-right:10px" src="Image/icon-heart.png" width="40px" height="40px">
	</a>
	<a href=#>
	<img style="margin-right:20px" src="Image/icon-message.png" width="40px" height="40px">
	</a>

		<%@ include file="hostdbconn.jsp"%>
		<%
		String sql= "select guestFilename from guestuser where userID=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userID);
		rs = pstmt.executeQuery();

		if (rs.next()){ %> 

	<img style="border-radius:20px; margin-right:10px" onError="this.src='./Image/default.jpg'" alt=""  src="Image/<%=rs.getString("guestFilename")%>" width="40px" height="40px"/>
	
	<%  
		}%>
	
	<a class="navbar-brand" style="color:blue"><label id=<%=userID%>> <%=userID%></label>회원님
	</a>
	<div class="dropdown">
		<button class="btn btn-join dropdown-toggle" onclick="myFunction()" type="button" id="dropdown-signup-btn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" >
			<strong>내정보</strong>
		</button>
		<div class="dropdown-menu"  id="myDropdown" aria-labelledby="dropdownMenuLink">
			<a class="dropdown-item" type="button" href="guestUpdate.jsp">회원 수정</a> 
			<a class="dropdown-item" type="button" href="addMember.jsp">호스트 등록</a> 
			<a class="dropdown-item" type="button" href="addMemberUpdate.jsp">호스트 수정</a>
			<a class="dropdown-item" type="button" href="hostsubscription.jsp">게스트신청관리</a> 
			<a class="dropdown-item" type="button" href="subscription.jsp">나의 신청관리</a> 
			<a class="dropdown-item" type="button" href="logoutAction.jsp">로그아웃</a>
		</div>
	</div>
	
	<%
		}
		else{
	%>
	<button type="button" onclick = "location.href = 'login.jsp' " class="btn btn-outline-warning btn-sm" data-toggle="modal" data-target="#ModalLoginForm">로그인
	</button>
	<div class="dropdown">
		<button class="btn btn-join dropdown-toggle" onclick="myFunction()" type="button" id="dropdown-signup-btn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
			<strong>회원가입</strong>
		</button>
		<div class="dropdown-menu" aria-labelledby="dropdownMenuLink" id="myDropdown">
		
			<a class="dropdown-item" type="button" href="guest2.jsp">게스트
			</a>
		</div>
	</div>
	<%
		}
			
	%>
</div>

<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #4174d9;">
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <!-- collapse 안에 있는 내용은 햄버거 버튼이 나오면 사라진다. -->
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="main.jsp">Home<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">호스트 리스트</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="homelist.do">게시판</a>
      </li>
    </ul>
    </div>
   
</nav>
