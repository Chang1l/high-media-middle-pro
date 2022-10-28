package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ProfessorDeleteService;
import vo.ActionForward;
import vo.ProfessorVO;

public class ProfessorDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		ProfessorVO pvo = null;
		
		pvo = new ProfessorVO();
		
		int p_id = Integer.parseInt(request.getParameter("p_id"));
		
		pvo.setP_id(p_id);
		
		ProfessorDeleteService professorDeleteService = new ProfessorDeleteService();
		boolean isDeleteSuccess = professorDeleteService.deleteProfessor(pvo);
		
		if(!isDeleteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 실패했습니다\n 삭제하려는 교수님의 정보를 다시 한번 확인해주세요.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("ProfessorListManager.me");
		}
		
		return forward;
	}

}
