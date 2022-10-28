package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ProfessorUpdateFormService;
import vo.ActionForward;
import vo.ProfessorVO;

public class ProfessorUpdateFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		int p_id = Integer.parseInt(request.getParameter("p_id"));
		ProfessorUpdateFormService professorUpdateFormService = new ProfessorUpdateFormService();
		ProfessorVO professorInfo = professorUpdateFormService.getProfessorInfo(p_id);
		request.setAttribute("ProfessorInfo", professorInfo);
		forward.setPath("/professor/ProfessorUpdate_form.jsp");
		
		return forward;
	}

}
