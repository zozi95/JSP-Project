<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript">
function getCategory(select){
	var text = select.options[select.selectedIndex].text;
	console.log(text);
}
</script>
<title>글쓰기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="page-header">
    	<h1>글 작성하기</h1>  
	</div>
  <form role="form" action="board_insert.do" method="post"> 
    <div class="row">
    	
      <label class="col-xs-1" for="category">카테고리</label>
      <select name="c_board_category" onchange="getCategory(this)">
      	<option value="잡담" selected>잡담</option>
      	<option value="동행자 구하기">동행자구하기</option>
      	<option value="후기">후기</option>
      	<option value="기타">기타</option>
      	<c:choose>
				<c:when test="${userID=='admin'}">
				<option value="공지사항">공지사항</option>
				</c:when>
		</c:choose>
      </select>
      <br><br>
      <label class="col-xs-1" for="title">제목</label>
      <div class="col-xs-6">
        <input required type="text" class="form-control" id="title" name="c_board_title" placeholder="제목">
      </div>
    </div>
    <div class="row">
      <label class="col-xs-1" for="author">작성자</label>
      <div class="col-xs-6">
        <input readonly type="text" class="form-control" id="author" name="c_board_author" value="${userID}">
      </div>
    </div>
    
    <div class="row">
      <label class="col-xs-12" for="content">내용</label>
    </div>
    <div class="row">
      <div class="col-xs-8">
        <textarea required rows="5" class="form-control" id="content" name="c_board_content"></textarea>
      </div>
    </div>
	<hr>
    <div class="row">
      <div class="col-xs-6">
        <button type="submit" class="btn btn-info btn-lg" >작성완료</button>
      </div>
      <div class="col-xs-6">
      	<a href="board_list.do" class="btn btn-info btn-lg">
			<span class="glyphicon glyphicon-repeat"></span> 돌아가기
		</a>
      </div>
    </div>  
  </form>
</div>


</body>
</html>