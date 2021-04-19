<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<%
	request.setCharacterEncoding("utf-8");

	MultipartRequest multi = new MultipartRequest(request, "C:\\upload", 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());

	String id = multi.getParameter("id");
	String password = multi.getParameter("password");
	String name = multi.getParameter("name");
	String gender = multi.getParameter("gender");
	
	String mail1 = multi.getParameter("email1");
	String mail2 = multi.getParameterValues("email2")[0];
	String mail = mail1 + "@" + mail2;
	String phone = multi.getParameter("phone");
	String introduction = multi.getParameter("introduction");
	String filename = multi.getFilesystemName("filename");
	
			
	
 %>



<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/travel?useSSL=false"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />
	
<sql:update dataSource="${dataSource}" var="resultSet">
   UPDATE GUESTUSER SET guestPassword=?, guestName=?, guestGender=?, guestMail=?, guestPhone=?, guestIntroduction=?, guestFilename=? WHERE userID=?;
	<sql:param value="<%=password%>" />
	<sql:param value="<%=name%>" />
	<sql:param value="<%=gender%>" />
	<sql:param value="<%=mail%>" />
	<sql:param value="<%=phone%>" />
	<sql:param value="<%=introduction%>" />
	<sql:param value="<%=filename%>" />
	 <sql:param value="<%=id%>" />
</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="resultMember.jsp?msg=1" />
</c:if>

