package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import svc.MemberDeleteService;
import vo.ActionForward;

public class MemberDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String s_id = (String) session.getAttribute("id");
		String m_id = request.getParameter("m_id");
		ActionForward forward = null;
		if (m_id == null) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./memberLogin.me");
		} else {
			String deleteId = request.getParameter("m_id");
			MemberDeleteService memberDeleteService = new MemberDeleteService();
			boolean deleteResult = memberDeleteService.deleteMember(deleteId);

			if (deleteResult) {
				if (s_id.equals("admin")) {
					forward = new ActionForward();
					forward.setRedirect(true);
					forward.setPath("./memberListAction.me");

				} else {
					forward = new ActionForward();
					forward.setRedirect(true);
					forward.setPath("./memberlogout.me");
				}
			} else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('회원정보삭제 실패.');");
				out.println("location.href='./member_info.me';");
				out.println("</script>");
			}
		}
		return forward;
	}
}