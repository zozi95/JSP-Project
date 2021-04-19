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
	String password1 = multi.getParameter("password");
	String name = multi.getParameter("name");
	String gender = multi.getParameter("gender");
	
	String mail1 = multi.getParameter("email1");
	String mail2 = multi.getParameterValues("email2")[0];
	String mail = mail1 + "@" + mail2;
	String phone = multi.getParameter("phone");
	//String country = multi.getParameter("country");
	
	//String [] work1 = multi.getParameterValues("work");
	 
	//String a = Arrays.toString(work1);
	
	//String oneintroduction = multi.getParameter("oneintroduction");
	String introduction = multi.getParameter("introduction");
	
	String filename = multi.getFilesystemName("filename");
	String birth = multi.getParameter("birth");
	
			
	
 %>





<%@ include file="hostdbconn.jsp"%>

 
<%	
	//넘어온 주소의 id값을 얻고 아이디로 제품을 가져온다.
	
	String sql1 = "INSERT INTO GUESTUSER VALUES (?, ?, ?, ?, ?, ?, ?, ?,'1',?)";
	pstmt1 = conn.prepareStatement(sql1);
	pstmt1.setString(1,id);
	pstmt1.setString(2,password1);
	pstmt1.setString(3,name);
	pstmt1.setString(4,gender);
	pstmt1.setString(5,mail);
	pstmt1.setString(6,phone);
	pstmt1.setString(7,introduction);
	pstmt1.setString(8,filename);
	pstmt1.setString(9,birth);
	pstmt1.executeUpdate();
	
	
	//아이디로 제품의 정보를 불러오는것 
	String sql= " INSERT INTO  tbl_member VALUES (?, ?, ?, ?, ?,'0')";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,id);
	pstmt.setString(2, password1);
	pstmt.setString(3, name);
	pstmt.setString(4, birth);
	pstmt.setString(5, gender);
	pstmt.executeUpdate();


		%>	
		
		
		<jsp:forward page="resultMember.jsp?msg=1"/>;	
		
	<%
	
	
%>






<c:if test="${resultSet>=1}">
	<c:redirect url="resultMember.jsp?msg=1" />
</c:if>

