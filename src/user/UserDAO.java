package user;

import java.sql.Connection;




import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UserDAO {

		private Connection conn;
		private PreparedStatement pstmt;
		private ResultSet rs;
		
		public UserDAO() {
			try {
				String url = "jdbc:mysql://localhost:3306/Travel?useSSL=false";
				String user = "root";
				String password = "1234";
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(url, user, password);		
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	

	public int login(String userID, String guestPassword) {
		String SQL = "SELECT guestPassword from guestuser where userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(guestPassword)) {
					return 1; //로그인 성공  값을 가져온것 
				}
				else{
					return 0; //비밀번호 불일치  값을 가져오지 못함
				}
			}
			return -1; //아이디 없음 아무것도 아님 
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return -2; //DB 오류  DB실행 안될경우 -2
	}
	public User getGuest(String userID) {   //유저ID 값에 대한 유저 정보를 가져옴 
		String SQL = "SELECT * from guestuser where userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				User user = new User();
				user.setUserID(rs.getString(1));
				user.setGuestPassword(rs.getString(2));
				user.setGuestName(rs.getString(3));
				user.setGuestGender(rs.getString(4));
				user.setGuestMail(rs.getString(5));
				user.setGuestPhone(rs.getInt(6));
				user.setGuestIntroduction(rs.getString(7));
				user.setGuestFilename(rs.getString(8));
				user.setUsertype(rs.getString(9));
				return user;
				}
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	
	public int GuestInsert(User user) {		 //게스트 등록 회원을 추가함
			String SQL =  "INSERT INTO USER VALUES(?,?,?,?,?,?,?,?,?)";
			try {
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, user.getUserID());
				pstmt.setString(2, user.getGuestPassword());
				pstmt.setString(3, user.getGuestName());
				pstmt.setString(4, user.getGuestGender());
				pstmt.setString(5, user.getGuestMail());
				pstmt.setInt(6, user.getGuestPhone());
				pstmt.setString(7, user.getGuestIntroduction());
				pstmt.setString(8, user.getGuestFilename());
				pstmt.setString(9, user.getUsertype());
				return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1;
		}
	
	//회원정보 수정 페이지
	public int Guestupdate( String userID,String guestPassword, String guestName,String guestGender, 
			String guestmail, int guestPhone,String guestIntroduction,String guestFilename, String usertype) {
		String SQL =  "UPDATE guestuser SET guestPassword=?, guestName=?,guestGender=?,guestmail=?,guestPhone=?,"
				+ "guestIntroduction=?,guestFilename=?,usertype=? WHERE userID=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, guestPassword);
			pstmt.setString(2, guestName);
			pstmt.setString(3, guestGender);
			pstmt.setString(4, guestmail);
			pstmt.setInt(5, guestPhone);
			pstmt.setString(6, guestIntroduction);
			pstmt.setString(7, guestFilename);
			pstmt.setString(8, usertype);
			pstmt.setString(9, userID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//회원 정보 삭제페이지
	public int Guestdelete(String UserID, String Guestpassword) {
		String SQL = "delete from guestuser where userID=? and guestpassword = ?";
				
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, UserID);
			pstmt.setString(2, Guestpassword);
			
			return pstmt.executeUpdate();
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //삭제 실패시 오류 등록  비밀번호가 틀렸습니다.
	}				//아이디는 고정 그대로 삭제 실패는 only 비밀번호 오류 
	
		
	
	public ArrayList<Host> getHostList(){
		
	String sql= "select * from guestuser as gu LEFT outer join hostuser as hu on hu.userID=gu.userID where hu.usertype=2";
	ArrayList<Host> list = new ArrayList<Host>();
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()){
			Host host = new Host();
			host.setUserID(rs.getString("userID"));
			host.setUserID(rs.getString("guestName"));
			host.setUserID(rs.getString("hostFilename"));
			host.setUserID(rs.getString("hostoneIntroduction"));
			list.add(host);
		}
		return list;}
		catch (Exception ex) {
			System.out.println("getBoardList() 에러 : " + ex);
		}
		return list;			
	
		
}
	
	
	
	
//	public boolean updateProduct(HttpServletRequest req) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		
//		String sql = null;
//		boolean flag = false;
//		try {
//			MultipartRequest multi = 
//					new MultipartRequest(req, "C:/Users/ADMIN/Desktop/JSPprojct/T2/WebContent/Image/", 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
//		
//			String [] work1 = multi.getParameterValues("work");
//			 
//			String a = Arrays.toString(work1);
//			//이미지 파일까지 수정
//			if(multi.getFilesystemName("filename")!=null) {
//				sql = "UPDATE HOSTUSER SET hostCountry=?, hostWork=?, hostoneIntroduction=?, hostIntroduction=?, hostFilename=? WHERE userID=?";
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setString(1, multi.getParameter("country"));
//				pstmt.setString(2, multi.getParameter("a"));
//				pstmt.setString(3, multi.getParameter("oneintroduction"));
//				pstmt.setString(4, multi.getParameter("introduction"));
//				pstmt.setString(5, multi.getFilesystemName("filename"));
//				pstmt.setString(6, multi.getParameter("id"));
//			}else {
//				//이미지 파일은 수정은 아님.
//				sql = "UPDATE HOSTUSER SET hostCountry=?, hostWork=?, hostoneIntroduction=?, hostIntroduction=?, hostFilename=? WHERE userID=?";
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setString(1, multi.getParameter("country"));
//				pstmt.setString(2, multi.getParameter("a"));
//				pstmt.setString(3, multi.getParameter("oneintroduction"));
//				pstmt.setString(4, multi.getParameter("introduction"));
//				pstmt.setString(5, multi.getParameter("id"));
//			}
//			if(pstmt.executeUpdate()==1) flag = true;
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			closeAll(rs, pstmt, conn);
//		}
//		return flag;
//	}
//	private void closeAll(ResultSet rs, PreparedStatement pstmt, Connection conn) {
//		try {
//			if (rs != null)
//				rs.close();
//			if (pstmt != null)
//				pstmt.close();
//			if (conn != null)
//				conn.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
	
}
	
	
	
	
	
	
	
	


	





	