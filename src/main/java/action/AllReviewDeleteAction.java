package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AllReviewDeleteService;
import vo.ActionForward;
import vo.ReviewBean;

public class AllReviewDeleteAction implements Action {
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("euc-kr");
		
		ActionForward forward = null;
		
		ReviewBean reviewBean = null;
		reviewBean = new ReviewBean();

		int all_review_id = Integer.parseInt(request.getParameter("all_review_id"));
		AllReviewDeleteService allReviewDeleteService = new AllReviewDeleteService();
		
		boolean isDeleteSuccess = allReviewDeleteService.removeArticle2(all_review_id);
		
		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("all_review_list.me");
		
		return forward;
	}

}
