<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>ID 중복체크</title>
</head>
<body>
<%
		String id = request.getParameter("id");
		SignupDAO dao = SignupDAO.getInstance();
		boolean result = dao.confirmId(id);
		
		if(result) { %>
			<center>
			<br>
			<h4>이미 사용중인 아이디 입니다.</h4>
			</center>
		<%} else { %>
			<center>
			<br>
			<h4><%=id%>는 사용할 수 있는 아이디입니다.</h4>
			</center>
			<%} %>
			

<hr>
<a href="#" onclick="self.close()">닫기</a>
</body>
</html>







