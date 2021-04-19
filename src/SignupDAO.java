import java.sql.Connection;
import java.sql.DriverManager;


public class SignupDAO {
		public boolean confirmId(String id) {
			boolean result = false;
			Connection conn;
			
			try {
				String url = "jdbc:mysql://localhost:3306/Travel?useSSL=false";
				String sql = "SELECT * from guestuser where userID = ?";
				String user = "root";
				String password = "1234";
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(url, user, password);		
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}
}
