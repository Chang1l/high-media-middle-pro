package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vo.ActionForward;
import vo.ProfessorVO;
import svc.ProfessorListService;

public class ProfessorListManagerAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		
		ArrayList<ProfessorVO>professorList = new ArrayList<ProfessorVO>();
		ProfessorListService professorListService = new ProfessorListService();
		professorList = professorListService.getProfessorList();

		request.setAttribute("professorList", professorList);
		forward = new ActionForward();
		forward.setPath("/professor/Professor_List_manager.jsp");
		return forward;
	}

}
