
<%@ page import="java.sql.*"%>
<%


	Connection conn = null;	
	Connection conn1 = null;	
	PreparedStatement pstmt = null;
	PreparedStatement pstmt1 = null;
	PreparedStatement pstmt2 = null;
	PreparedStatement pstmt3 = null;
	
	
	
	ResultSet rs1 = null;
	ResultSet rs = null;
	
	try {
		String url = "jdbc:mysql://localhost:3306/travel?useSSL=false";
		String user = "root";
		String password = "1234";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
		
	
		
		
	} catch (SQLException ex) {
		out.println("DB에서 문제가 발생하였습니다..<br>");
		out.println("SQLException: " + ex.getMessage());
	}
		
%>