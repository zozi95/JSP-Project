package bbs.MemberCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.Command;
import bbs.CommandAction;
import bbs.Member.MemberDAO;
import bbs.Member.MemberDTO;

public class MemberDeleteCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String c_member_id = request.getParameter("c_member_id");
		String c_member_password = request.getParameter("c_member_password");

		MemberDAO dao = new MemberDAO();
		Object obj = request.getSession().getAttribute("login");
		MemberDTO login;
		if(obj != null) {
			login = (MemberDTO) obj;
			if(login.getC_member_admin() == 0) {
				dao.delete(c_member_id, c_member_password);
				request.getSession(false).invalidate();
				return new CommandAction(false, "homelist.do");
			}
		}		
		dao.delete(c_member_id, c_member_password);		
		return new CommandAction(false, "member_list.do");
	}

}
