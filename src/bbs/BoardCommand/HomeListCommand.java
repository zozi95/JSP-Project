package bbs.BoardCommand;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.Command;
import bbs.CommandAction;
import bbs.Board.BoardDAO;
import bbs.Board.BoardDTO;


public class HomeListCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> recomlist = dao.recomlist();
		List<BoardDTO> cntlist = dao.cntlist();
		request.setAttribute("recomlist", recomlist);
		request.setAttribute("cntlist", cntlist);
		return new CommandAction(false, "homelist.jsp");
	}

}
