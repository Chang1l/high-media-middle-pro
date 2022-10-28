package action;

import java.io.PrintWriter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import svc.RegistDeleteService;
import vo.ActionForward;

import vo.RegistBean;

public class RegistDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		RegistBean rvo = null;
		
		rvo = new RegistBean();
		
		int g_no = Integer.parseInt(request.getParameter("g_no"));
		
		rvo.setG_NO(g_no);
		
		RegistDeleteService registDeleteService = new RegistDeleteService();
		boolean isDeleteSuccess = registDeleteService.deleteRegist(rvo);
		
		if(!isDeleteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 실패했습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("registList.me");
		}
		
		return forward;
	}

}
