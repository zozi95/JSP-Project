<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<%
	request.setCharacterEncoding("utf-8");

	MultipartRequest multi = new MultipartRequest(request, "C:/Users/82107/Desktop/WEB2/BootStrap/T2/WebContent/Image/", 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());

	String id = multi.getParameter("id");
	
	String country = multi.getParameter("country");
	
	String [] work1 = multi.getParameterValues("work");
	 
	String a = Arrays.toString(work1);
	
	String oneintroduction = multi.getParameter("oneintroduction");
	String introduction = multi.getParameter("introduction");
	
	String filename = multi.getFilesystemName("filename");
	
			
	
 %>



<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/Travel?useSSL=false"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />		


	
<sql:update dataSource="${dataSource}" var="resultSet">
   INSERT INTO hostUSER VALUES (?, ?, ?, ?, ?, ?, "2")
   <sql:param value="<%=id%>" />
	<sql:param value="<%=country%>" />
	<sql:param value="<%=a%>" />
	<sql:param value="<%=oneintroduction%>" />
	<sql:param value="<%=introduction%>" />
	<sql:param value="<%=filename%>" />

</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="resultMember.jsp?msg=1" />
</c:if>

<c:if test="${resultSet==0} ">
<c:redirect url ="resultMember.jsp?msg=3"/>
</c:if>