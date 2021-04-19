package bbs.Board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import bbs.PageTO;

public class BoardDAO {

	private static BoardDAO boardDAO = new BoardDAO();
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	Timestamp c_board_birth=new Timestamp(System.currentTimeMillis());
	
	public BoardDAO() {
		super();
	}

	public static BoardDAO getInstance() {
		return boardDAO;
	}
	
	public String getDate() {
		String SQL = "SELECT now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1); //현재 날짜와 시간을 리턴
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; //DB오류
	}

	public Connection getConnect() {
		String url = "jdbc:mysql://localhost:3306/travel?useSSL=false";
		String user = "root";
		String password = "1234";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	private void closeAll(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<BoardDTO> recomlist() {
		List<BoardDTO> recomlist = new ArrayList<BoardDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "SELECT @ROWNUM := @ROWNUM + 1 AS ROWNUM, T.*"
				+ "FROM ( SELECT c_board_num, c_board_category, c_board_author,"
				+ "	c_board_title, c_board_writeday,"
				+ "	c_board_readcnt, c_board_recom"
				+ " FROM tbl_board ORDER BY c_board_recom DESC ) AS T,"
				+ " ( SELECT @ROWNUM := 0 ) as B LIMIT 0, 5";
		ResultSet rs = null;
		try {
			conn = getConnect();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int c_board_num = rs.getInt("c_board_num");
				String c_board_category = rs.getString("c_board_category");
				String c_board_author = rs.getString("c_board_author");
				String c_board_title = rs.getString("c_board_title");
				Timestamp c_board_writeday = rs.getTimestamp("c_board_writeday");
				int c_board_readcnt = rs.getInt("c_board_readcnt");
				int c_board_recom = rs.getInt("c_board_recom");
				recomlist.add(new BoardDTO(c_board_num, c_board_category, c_board_author, c_board_title, null, c_board_writeday,
						c_board_readcnt, 0, 0, 0, c_board_recom, 0));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return recomlist;
	}
	
	public List<BoardDTO> cntlist() {
		List<BoardDTO> cntlist = new ArrayList<BoardDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "SELECT @ROWNUM := @ROWNUM + 1 AS ROWNUM, T.*"
				+ "FROM ( SELECT c_board_num, c_board_category, c_board_author,"
				+ " c_board_title, c_board_writeday,"
				+ "	c_board_readcnt, c_board_recom"
				+ " FROM tbl_board ORDER BY c_board_readcnt DESC ) AS T,"
				+ " ( SELECT @ROWNUM := 0 ) as B LIMIT 0, 5";
		ResultSet rs = null;
		try {
			conn = getConnect();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int c_board_num = rs.getInt("c_board_num");
				String c_board_category = rs.getString("c_board_category");
				String c_board_author = rs.getString("c_board_author");
				String c_board_title = rs.getString("c_board_title");
				Timestamp c_board_writeday = rs.getTimestamp("c_board_writeday");
				int c_board_readcnt = rs.getInt("c_board_readcnt");
				int c_board_recom = rs.getInt("c_board_recom");
				cntlist.add(new BoardDTO(c_board_num, c_board_category, c_board_author, c_board_title, null, c_board_writeday,
						c_board_readcnt, 0, 0, 0, c_board_recom, 0));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return cntlist;
	}
	
	public List<BoardDTO> adlist() {
		List<BoardDTO> adlist = new ArrayList<BoardDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "SELECT @ROWNUM := @ROWNUM + 1 AS ROWNUM, T.*"
				+ "FROM ( SELECT c_board_num, c_board_category, c_board_author,"
				+ " c_board_title, c_board_writeday,"
				+ "	c_board_readcnt, c_board_recom"
				+ " FROM tbl_board where c_board_category = '공지사항' ORDER BY c_board_num DESC ) AS T,"
				+ " ( SELECT @ROWNUM := 0 ) as B LIMIT 0, 5";
		ResultSet rs = null;
		try {
			conn = getConnect();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int c_board_num = rs.getInt("c_board_num");
				String c_board_category = rs.getString("c_board_category");
				String c_board_author = rs.getString("c_board_author");
				String c_board_title = rs.getString("c_board_title");
				Timestamp c_board_writeday = rs.getTimestamp("c_board_writeday");
				int c_board_readcnt = rs.getInt("c_board_readcnt");
				int c_board_recom = rs.getInt("c_board_recom");
				adlist.add(new BoardDTO(c_board_num, c_board_category, c_board_author, c_board_title, null, c_board_writeday,
						c_board_readcnt, 0, 0, 0, c_board_recom, 0));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return adlist;
	}
	
	public BoardDTO read(int c_board_num) {
		BoardDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select * from tbl_board where c_board_num = ?";
		ResultSet rs = null;
		boolean isOk = false;

		try {
			// readcnt 증가 작업 트랜젝션으로
			conn = getConnect();
			conn.setAutoCommit(false);
			increaseReadcnt(c_board_num, conn);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c_board_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String c_board_category = rs.getString("c_board_category");
				String c_board_author = rs.getString("c_board_author");
				String c_board_title = rs.getString("c_board_title");
				String c_board_content = rs.getString("c_board_content");
				Timestamp c_board_writeday = rs.getTimestamp("c_board_writeday");
				int c_board_readcnt = rs.getInt("c_board_readcnt") + 1;
				int c_board_recom = rs.getInt("c_board_recom");
				int c_board_decom = rs.getInt("c_board_decom");
				dto = new BoardDTO(c_board_num, c_board_category, c_board_author, c_board_title, c_board_content, c_board_writeday,
						c_board_readcnt, 0, 0, 0, c_board_recom, c_board_decom);
			}

			isOk = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (isOk) {
					conn.commit();
				} else {
					conn.rollback();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			closeAll(rs, pstmt, conn);
		}
		return dto;
	}

	private void increaseReadcnt(int c_board_num, Connection conn) {
		PreparedStatement pstmt = null;
		String sql = "update tbl_board set c_board_readcnt = c_board_readcnt + 1 where c_board_num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c_board_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(null, pstmt, null);
		}
	}

	public PageTO list(int curPage) {
		PageTO to = new PageTO(curPage);
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select b.* from ( select @rownum := @rownum + 1 as rnum, a.* from"
				+ "		 ( select c_board_num, c_board_category,"
				+ "	          c_board_author, c_board_title,"
				+ "	          c_board_writeday, c_board_readcnt,"
				+ "	          c_board_repIndent, c_board_recom, c_board_decom"
				+ "	   FROM (select * from tbl_board where c_board_category != '공지사항' or c_board_category is null order by c_board_repRoot desc,"
				+ "											c_board_repStep asc)as c)as a, ( select @rownum := 0)as r)as b"
				+ "       where rnum >= ? and rnum <= ? ";
		ResultSet rs = null;
		try {
			conn = getConnect();
			int amount = getAmount(conn);
			to.setAmount(amount);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, to.getStarNum());
			pstmt.setInt(2, to.getEndNum());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int c_board_num = rs.getInt("c_board_num");
				String c_board_category = rs.getString("c_board_category");
				String c_board_author = rs.getString("c_board_author");
				String c_board_title = rs.getString("c_board_title");
				Timestamp c_board_writeday = rs.getTimestamp("c_board_writeday");
				int c_board_readcnt = rs.getInt("c_board_readcnt");
				int c_board_repIndent = rs.getInt("c_board_repIndent");
				int c_board_recom = rs.getInt("c_board_recom");
				int c_board_decom = rs.getInt("c_board_decom");
				
				list.add(new BoardDTO(c_board_num, c_board_category, c_board_author, c_board_title, null, c_board_writeday,
						c_board_readcnt, 0, 0, c_board_repIndent,c_board_recom, c_board_decom));
			}
			to.setList(list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return to;
	}
	
	private int getAmount(Connection conn) {
		int amount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(c_board_num) from tbl_board";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				amount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, null);
		}
		return amount;
	}

	public void board_insert(BoardDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into tbl_board(c_board_num, c_board_category, c_board_author, c_board_title, c_board_content, c_board_repRoot, c_board_repStep, c_board_repIndent, c_board_recom, c_board_decom) values(?,?,?,?,?,?,0,0,0,0)";
		try {
			conn = getConnect();
			int c_board_num = createNum(conn);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c_board_num);
			pstmt.setString(2, dto.getC_board_category());
			pstmt.setString(3, dto.getC_board_author());
			pstmt.setString(4, dto.getC_board_title());
			pstmt.setString(5, dto.getC_board_content());
			pstmt.setInt(6, c_board_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(null, pstmt, conn);
		}
	}

	private int createNum(Connection conn) {
		int c_board_num = 1;
		PreparedStatement pstmt = null;
		String sql = "select max(c_board_num) from tbl_board";
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				c_board_num = rs.getInt(1) + 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, null);
		}
		return c_board_num;
	}

	public void reply(int orinum, String c_board_author, String c_board_title, String c_board_content) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into tbl_board(c_board_num, c_board_author,"
				+ "							c_board_title, c_board_content,"
				+ "							c_board_repRoot, c_board_repStep,"
				+ "							c_board_repIndent, c_board_recom, c_board_decom) values(?,?,?,?,?,?,?,0,0)";
		boolean isok = false;

		try {
			conn = getConnect();
			conn.setAutoCommit(false);

			BoardDTO dto = updateui(orinum);
			increaseRepStep(conn, dto);

			int c_board_num = createNum(conn);
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, c_board_num);
			pstmt.setString(2, c_board_author);
			pstmt.setString(3, c_board_title);
			pstmt.setString(4, c_board_content);

			pstmt.setInt(5, dto.getC_board_repRoot());
			pstmt.setInt(6, dto.getC_board_repStep() + 1);
			pstmt.setInt(7, dto.getC_board_repIndent() + 1);

			pstmt.executeUpdate();
			isok = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (isok) {
					conn.commit();
				} else {
					conn.rollback();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			closeAll(null, pstmt, conn);
		}
	}

	private void increaseRepStep(Connection conn, BoardDTO dto) {
		PreparedStatement pstmt = null;
		String sql = "update tbl_board set c_board_repStep = c_board_repStep + 1 where c_board_repRoot = ? and c_board_repStep > ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getC_board_repRoot());
			pstmt.setInt(2, dto.getC_board_repStep());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(null, pstmt, null);
		}
	}

	public List<BoardDTO> search(String search, String bool) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		BoardDTO dto = null;
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			conn = getConnect();

			switch (bool) {
			case "contentbool":
				sql = "select * from tbl_board where c_board_content like '%" + search + "%'";
				break;
			case "titlebool":
				sql = "select * from tbl_board where c_board_title like '%" + search + "%'";
				break;
			case "authorbool":
				sql = "select * from tbl_board where c_board_author like '%" + search + "%'";
				break;
			case "authorcontenbool":
				sql = "select * from tbl_board where c_board_title like '%" + search + "%' or c_board_content like '%" + search + "%'";
				break;
			case "categorybool" :
				sql ="select * from tbl_board where c_board_category like '%" + search + "%'";
				break;
			default:
				break;
			}
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int num = rs.getInt("c_board_num");
				String category = rs.getString("c_board_category");
				String author = rs.getString("c_board_author");
				String title = rs.getString("c_board_title");
				String content = rs.getString("c_board_content");
				Timestamp writeday = rs.getTimestamp("c_board_writeday");
				int readcnt = rs.getInt("c_board_readcnt");
				int reproot = rs.getInt("c_board_repRoot");
				int repstep = rs.getInt("c_board_repStep");
				int repindent = rs.getInt("c_board_repIndent");
				int recom = rs.getInt("c_board_recom");
				int decom = rs.getInt("c_board_decom");
				dto = new BoardDTO(num, category, author, title, content, writeday, readcnt, reproot, repstep, repindent, recom,
						decom);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return list;
	}

	public void delete(int c_board_num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from tbl_board where c_board_num = ?";
		
		try {
			conn = getConnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c_board_num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(null, pstmt, conn);
		}
	}

	public BoardDTO updateui(int c_board_num) {
		BoardDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select * from tbl_board where c_board_num=?";
		ResultSet rs = null;

		try {
			conn = getConnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c_board_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String c_board_category = rs.getString("c_board_category");
				String c_board_author = rs.getString("c_board_author");
				String c_board_title = rs.getString("c_board_title");
				String c_board_content = rs.getString("c_board_content");
				Timestamp c_board_writeday = rs.getTimestamp("c_board_writeday");

				int c_board_readcnt = rs.getInt("c_board_readcnt");
				int c_board_repRoot = rs.getInt("c_board_repRoot");
				int c_board_repStep = rs.getInt("c_board_repStep");
				int c_board_repIndent = rs.getInt("c_board_repIndent");
				dto = new BoardDTO(c_board_num, c_board_category, c_board_author, c_board_title, c_board_content, c_board_writeday,
						c_board_readcnt, c_board_repRoot, c_board_repStep, c_board_repIndent, 0, 0);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return dto;
	}
	
	public void update(BoardDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update tbl_board set c_board_category=?, c_board_title=?, c_board_content=? where c_board_num = ?";
		
		try {
			conn = getConnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getC_board_category());
			pstmt.setString(2, dto.getC_board_title());
			pstmt.setString(3, dto.getC_board_content());
			pstmt.setInt(4, dto.getC_board_num());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(null, pstmt, conn);
		}
	}
	
	public void recommend(String c_recom_memberid, int c_recom_boardnum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean isok = false;
		try {
			conn = getConnect();
			conn.setAutoCommit(false);
			boolean recomcheck = recomcheck(c_recom_memberid, c_recom_boardnum, conn);
			if (!recomcheck)
				sql = "insert into tbl_recom values(?, ?)";
			else
				sql = "delete from tbl_recom where c_recom_memberid = ? and c_recom_boardnum = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c_recom_memberid);
			pstmt.setInt(2, c_recom_boardnum);

			pstmt.executeUpdate();
			countRecom(c_recom_boardnum, conn);

			isok = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (isok) {
					conn.commit();
				} else {
					conn.rollback();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			closeAll(null, pstmt, conn);
		}
	}
	
	public boolean recomcheck(String c_recom_memberid, int c_recom_boardnum, Connection conn) {
		boolean result = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from tbl_recom where c_recom_memberid = ? and c_recom_boardnum = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c_recom_memberid);
			pstmt.setInt(2, c_recom_boardnum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = true; // 추천한 아이디 있음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, null);
		}
		return result;
	}
	
	public void countRecom(int c_recom_boardnum, Connection conn) { 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(c_recom_boardnum) from tbl_recom where c_recom_boardnum = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c_recom_boardnum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int recomcount = rs.getInt(1);
				updateRecom(recomcount, c_recom_boardnum, conn);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, null);
		}
	}

	public void updateRecom(int recomcount, int c_recom_boardnum, Connection conn) { 
		PreparedStatement pstmt = null;
		String sql = "update tbl_board set c_board_recom = ? where c_board_num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recomcount);
			pstmt.setInt(2, c_recom_boardnum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(null, pstmt, null);
		}
	}


	
	
}
