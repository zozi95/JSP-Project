<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta charset="UTF-8">
<html>
<head>

<title>여행의 일락</title>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/hostpage.css">

</head>

<style>
    .pb-cmnt-container {
        font-family: Lato;
        margin-top: 100px;
    }

    .pb-cmnt-textarea {
        resize: none;
        padding: 20px;
        height: 130px;
        width: 100%;
        border: 1px solid #F2F2F2;
    }
</style>
	
<script type="text/javascript">
function addToCart() {
	if(confirm("호스트에게 신청하시겠습니까?")) {
		
		if (userID=null) {
			alert("로그인이 필요합니다.");
			return false;
		}
		
		return; //추가한다.

	}
	else 
		return false; //리셋
	
	
}

function addreview() {
	if(confirm("리뷰를 등록 하시겠습니까?")) {
		
		if (userID=null) {
			alert("로그인이 필요합니다.");
			return false;
		}
		

		return; //추가한다.
	}else 
		return false; //리셋
	
	
}
</script>


<body>


	<script src="//code.jquery.com/jquery.min.js"></script>

	<%@ include file="header.jsp"%>
	
	
	<%@ include file="hostdbconn.jsp"%>
	
	
	<%	
		//넘어온 주소의 id값을 얻고 아이디로 제품을 가져온다.
		String id = request.getParameter("id");
		//아이디로 제품의 정보를 불러오는것 
		String sql= "select * from guestuser as gu LEFT outer join hostuser as hu on hu.userID=gu.userID where hu.userID=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
	
		if (rs.next()){
		
	%>
	
	<div class="container">
		<div class="row">
			<div class=col-md-9>
			<h2> <%=rs.getString("hostoneIntroduction") %> </h2>
			</div>
			<div class="col-md-5">

				<p><%=rs.getString("hostCountry")%>
				<p><b>호스트 이름: </b> <%=rs.getString("guestName")%>
				<p><b>호스트 이메일</b> : <%=rs.getString("guestMail")%>
				<p><b>호스트 성별</b> : <%=rs.getString("guestGender")%>
				<p><b>업무 사항</b> : <%=rs.getString("hostWork")%>
				<br>
				<textarea readonly style="width:500px; height:200px; margin-top:10px"><%=rs.getString("hostIntroduction") %></textarea>
				<p>
					<a onclick="return addToCart();" href="addsubscription.jsp?id=<%=rs.getString("hu.userID")%>" class="btn btn-info"> 신청 하기 &raquo;</a> 
				   	<a href="addHost.jsp?id=<%=rs.getString("hu.userID")%>" class="btn btn-warning"> 관심등록 &raquo;</a> 

			</div>
			<div class ="col-md-3">
				<img src="./Image/<%=rs.getString("hostFilename")%>" width=250px  />
			</div>
		</div>
		<hr>

	<h3>review</h3>
				
		<%	

		String sql1= "select * from review where hostID=?";
		pstmt1 = conn.prepareStatement(sql1);
	
		pstmt1.setString(1, id);
		rs1 = pstmt1.executeQuery();
		while (rs1.next()){
	
	
	%>
			
		<div class="container">
<div class="row">
    <div class="col-md-8">
        <div class="media g-mb-30 media-comment">
            <img class="d-flex g-width-50 g-height-50 rounded-circle g-mt-3 g-mr-15" src="./Image/<%=rs1.getString("guestFilename")%>" alt="Image Description">
            <div class="media-body u-shadow-v18 g-bg-secondary g-pa-30">
              <div class="g-mb-15">
                <h5 class="h5 g-color-gray-dark-v1 mb-0">게스트 ID :<%=rs1.getString("guestID")%></h5>
              </div>
        
              <p><%=rs1.getString("review")%></p>
    
              <ul class="list-inline d-sm-flex my-0">
                <li class="list-inline-item ml-auto">
                  <a class="u-link-v5 g-color-gray-dark-v4 g-color-primary--hover" href="deletereview.jsp?id=<%=rs.getString("userID")%>&user=<%=rs1.getString("guestID")%>">
           
                    <i class="fa fa-reply g-pos-rel g-top-1 g-mr-3"></i>
                   	 리뷰삭제
                  </a>
                </li>
              </ul>
            </div>
        </div>
    </div>

    
    </div>
</div>
		<%	}%>
	
<%-- 		<div class="container pb-cmnt-container">
    <div class="row">
        <div class="col-md-8 col-md-offset-3">
            <div class="panel panel-info">
                <div class="panel-body " >
                       <form  action="review.jsp" method="post" enctype = "multipart/form-data">
                       <div class="form-group">
                    	<textarea  class="form-control" placeholder="Write your comment here!" name="review" id="review"></textarea>
     							
                          <input class="form-control" type="hidden" name="id" id="id" value="<%=rs.getString("hu.userID")%>">
                 		   <input class="btn btn-primary " type="submit" value="작성하기" >
                 		   	
                        </div>
                    </form>
                </div> 
                
            </div>--%>
                
                <br>
                <br>
                <br>
                <br>
  
    
               <form class="col-sm-12 col-md-10 col-lg-8"action="review.jsp" method="post" >
              
                     <div align="center">
                
                        <textarea class="form-control col-10 " style="height:150px" name="content" rows="5" cols="500" placeholder="내용을 입력하세요." required></textarea>
                        <input class="form-control" name="id" type="hidden" value="<%=rs.getString("hu.userID")%>" />
                        <input class="btn btn-primary mt-4 mb-4 col-2" type="submit" value="등록">
                    
                     </div>
       
               </form>
         
         
         
                  
<!--         </div>
    </div>
</div> -->

	</div>
	<%
		}
		
		

		
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	%>
	
	
	<!--  include file=  여기에 사진8장 들어가는 페이지 */.jsp"%>-->
	<!--  include file=  리뷰 페이지 .jsp"%> -->
	 
	
	
	
	
	
	
	
	<%@ include file="footer.jsp"%>
	
	


	<!-- 부트스트랩 JS (1.제이쿼리, 2.번들) -->

	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>