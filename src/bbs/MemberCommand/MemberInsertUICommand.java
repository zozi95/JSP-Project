package bbs.MemberCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.Command;
import bbs.CommandAction;

public class MemberInsertUICommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		return new CommandAction(false, "member_insert.jsp");
	}

}
