package bbs.BoardCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.Command;
import bbs.CommandAction;
import bbs.Board.BoardDAO;
import bbs.Board.BoardDTO;


public class BoardInsertCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String c_board_category = request.getParameter("c_board_category");
		String c_board_author = request.getParameter("c_board_author");
		String c_board_title = request.getParameter("c_board_title");
		String c_board_content = request.getParameter("c_board_content");
			
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO(-1, c_board_category, c_board_author, c_board_title, c_board_content, null, 0, -1, 0, 0, 0, 0);
		dao.board_insert(dto);
			
		return new CommandAction(true, "board_list.do");
	}

}
