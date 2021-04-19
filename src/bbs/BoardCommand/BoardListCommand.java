package bbs.BoardCommand;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.Command;
import bbs.CommandAction;
import bbs.PageTO;
import bbs.Board.BoardDAO;
import bbs.Board.BoardDTO;



public class BoardListCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> adlist = dao.adlist();
		
		String sCurpage = request.getParameter("curPage");
		int curPage = 1;
		if (sCurpage != null) {
			curPage = Integer.parseInt(sCurpage);
		}
		request.setAttribute("adlist", adlist);
		PageTO to = dao.list(curPage);
		request.setAttribute("list", to.getList());
		request.setAttribute("to", to);
		
		return new CommandAction(false, "board_list.jsp");
		
		
	}

}
