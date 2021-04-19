<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
  <!-- 부트스트랩 CSS -->
  <link rel="stylesheet" href="css/bootstrap.min.css">


  
</head>
<body>
	
<jsp:include page="main.jsp" />
	
 
<div class="container">

		<div class="row ">
			<div class="col-md-7" style="float: none; margin: 0 auto;">
		      <section>
		        <form name="newMember" class="text-center border border-light p-5" method="post" action="guestAction.jsp">
                 <div>
                 <div class="text-left">
                 <a class="btn btn-warning"  href="hostCart.jsp"> <i class="fas fa-shopping-bag fa-2x"></i> 나의 호스트 리스트<br></a>
                 </div>
                   <br>
                  <a  class="btn btn-secondary-sm" href="#" role="button"><i class="fas fa-user-edit" >프로필사진 수정</i></a>
                </div>
                <br>
                  <img class="rounded float-left"   src="images/Elmo.jpg" alt="Generic placeholder image" width="300" height="300">
                  
      					<br>
      					<br>
      					<br>
      					<br>
      					<br>
                         <h2>Dong kyun kim </h2>
    
                   <div class="form-floating">
                       <textarea class="form-control" placeholder="hello my name is kyun ! 
                             Thank u !" id="floatingTextarea2" style="height: 400px"></textarea>
                         <label for="floatingTextarea2"> </label>
                  </div>
                      <p><a class="btn btn-outline-primary" href="#" role="button">자기소개서 수정 </a>
                         <a class="btn btn-outline-danger" href="infoUpdate.jsp" role="button">개인정보 수정</a></p>
           
                 </form>
             </section>
             </div><!-- /.col-lg-4 -->
            </div>
  

  <!-- START THE FEATURETTES -->




  

 
  
  <!-- /END THE FEATURETTES -->

</div>
     

   


	<!-- 부트스트랩 JS (1.제이쿼리, 2.번들) -->
  <script src="js/jquery-3.5.1.min.js"></script>
  <script src="js/bootstrap.bundle.min.js"></script>
  <script src="https://kit.fontawesome.com/df3bed6747.js" crossorigin="anonymous"></script>
</body>
</html>