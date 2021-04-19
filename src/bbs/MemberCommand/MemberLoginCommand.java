package bbs.MemberCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.Command;
import bbs.CommandAction;
import bbs.Member.MemberDAO;
import bbs.Member.MemberDTO;

public class MemberLoginCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		String c_member_id = request.getParameter("c_member_id");
		String c_member_password = request.getParameter("c_member_password");

		MemberDTO login = new MemberDAO().login(c_member_id, c_member_password);
		request.getSession().setAttribute("login", login);
		return new CommandAction(false, "homelist.do");

	}

}
