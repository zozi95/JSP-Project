package bbs.BoardCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.Command;
import bbs.CommandAction;
import bbs.Board.BoardDAO;
import bbs.Board.BoardDTO;

public class BoardUpdateCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String sNum = request.getParameter("c_board_num");
		int c_board_num = -1;
		if (sNum != null) {
			c_board_num = Integer.valueOf(sNum);
		}
		
		String c_board_category = request.getParameter("c_board_category");
		String c_board_title = request.getParameter("c_board_title");
		String c_board_content = request.getParameter("c_board_content");
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO(c_board_num, c_board_category, null, c_board_title, c_board_content, null, 0, 0, 0, 0, 0, 0);
		dao.update(dto);
		
		return new CommandAction(true, "board_list.do");
	}

}
