<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>여행의 일락</title>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/message.css">


<% 
 	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	String toID = null;
	if (request.getParameter("toID") != null){
		toID = (String) request.getParameter("toID");
	}
	if (userID == null){
		session.setAttribute("messageType", "오류메세지");
		session.setAttribute("messageContent", "현재 로그인이 되어있지 않습니다.");
		response.sendRedirect("index.jsp");
		return;
	}
	if (toID == null){
		session.setAttribute("messageType", "오류메세지");
		session.setAttribute("messageContent", "대화 상대가 지정되지 않았습니다.");
		response.sendRedirect("index.jsp");
		return;
	}
%>

<script type="text/javascript">
	function autoClosingAlert(selector, delay){
		var alert = $(selector).alert();
		alert.show();
		window.setTimeout(function() { alert.hide()}, delay);
	}
	function submitFunction() {
		var fromID = '<%= userID %>';
		var toID = '<%= toID %>';
		var chatContent = $('#chatContent').val();
		$.ajax({
			type:"POST",
			url: "./chatSubmitServlet",
			data : {
				fromID : encodeURIComponent(fromID),
				toID : encodeURIComponent(toID),
				chatContent : encodeURIComponent(chatContent),
				
			},
			success : function(result){
				if(result == 1){
					autoClosingAlert('#successMessage', 2000);
				} else if (result == 0){
					autoClosingAlert('#dangerMessage', 2000);
				}else {
					autoClosingAlert('#warningMessage', 2000);
				}
			}
		});
		$('#chatContent').val('');
	}
	var lastID = 0;
	function chatListFunction(Type){
		var fromID = '<%= userID %>';
		var toID = '<%= toID %>';
		$.ajax({
			type : "POST",
			url : "./chatListServlet",
			date : {
				fromID : encodeURIComponent(fromID),
				toID : encodeURIComponent(toID),
				listType : type
			},
			success : function(data){
				if(data == "") return;
				var parsed = JSON.parse(data);
				var result = parsed.result;
				for(var i = 0; i < result.length; i++){
					addChat(result[i][0].value, result[i][2].value, result[i][3].value);
				}
				lastID = Number(parsed.last);
			}
		});
	}
	function addChat(chatName, chatContent, chatTime){
		$('#chatList').append('<div class="row">' +
				'<div class="col-lg-12">' +
				'<div class="media">' +
				'<a class="pull-left" href="#">' +
				'<img class="media-object img-circle" style="width:30px; height:30px;" src="Image/icon-default.png" alt="">' +
				'</a>' +
				'<div class="media-body">' +
				'<h4 class="media-heading">' +
				chatName +
				'<span class="small pull-right">' +
				chatTime +
				'</span>' +
				'</h4>' +
				'<p>' +
				chatContent +
				'</p>' +
				'</div>' +
				'</div>' +
				'</div>' +
				'</div>' +
				'<hr>');
		$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
	}
	function getInfiniteChat(){
		setInterval(function(){
			chatListFuntion(lastID);
		}, 3000);
	}
</script>
</head>
<body>
<script src="//code.jquery.com/jquery.min.js"></script>
  
  <main class="content">
    <div class="container p-0">

		<h1 class="h3 mb-3">일락 메시지함</h1>

		<div class="card">
			<div class="row g-0">
				<div class="col-12 col-lg-5 col-xl-3 border-right">

					<div class="px-4 d-none d-md-block">
						<div class="d-flex align-items-center">
							<div class="flex-grow-1">
								<input type="text" class="form-control my-3" placeholder="Search...">
							</div>
						</div>
					</div>
					<a href="#" class="list-group-item list-group-item-action border-0">
						<div class="badge bg-success float-right">2</div>
						<div class="d-flex align-items-start">
							<img src="https://bootdey.com/img/Content/avatar/avatar3.png" class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
							<div class="flex-grow-1 ml-3">
								향숙이
								<div class="small"><span class="fas fa-circle chat-online"></span> Online</div>
							</div>
						</div>
					</a>
					<hr class="d-block d-lg-none mt-1 mb-0">
				</div>
				<div class="col-12 col-lg-7 col-xl-9">
					<div class="py-2 px-4 border-bottom d-none d-lg-block">
						<div class="d-flex align-items-center py-1">
							<div class="position-relative">
								<img src="https://bootdey.com/img/Content/avatar/avatar3.png" class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
							</div>
							<div class="flex-grow-1 pl-3">
								<strong>향숙이</strong>
								<a href=#>
								<img style="text-align:right; margin-right:20px" src="Image/message-home.png" width="40px" height="40px">
								</a>
								<div class="text-muted small"><em>입력중...</em></div>
							</div>
						</div>
					</div>

					<div class="position-relative" id="chat">
						<div class="chat-messages p-4" id="chatList">

							<div class="chat-message-right pb-4">
								
							</div>

							<div class="chat-message-left pb-4">
								
							</div>
						</div>
					</div>

					<div class="flex-grow-0 py-3 px-4 border-top">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="메시지를 입력하세요.">
							<button class="btn btn-primary" onclick="submitFunction();">전송</button>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</main>
  
	<div class="alert-success" id="successMessage" style="display: none;">
	<strong>메시지 전송에 성공했습니다.</strong>
</div>
<div class="alert-danger" id="dangerMessage" style="display: none;">
	<strong>이름과 내용 모두 입력하세요.</strong>
</div>
<div class="alert-warning" id="warningMessage" style="display: none;">
	<strong>데이터베이스 오류가 발생했습니다.</strong>
</div>
<script>
	$('#messageModal').modal("show");
</script>
<script type="text/javascript">
	$(document).ready(function(){
		chatListFunction('ten');
		getInfiniteChat();
	});
</script>

<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>