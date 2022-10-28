package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReviewDeleteService;
import vo.ActionForward;
import vo.ReviewBean;

public class ReviewDeleteAction implements Action {
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("euc-kr");
		
		ActionForward forward = null;
		
		ReviewBean reviewBean = null;
		reviewBean = new ReviewBean();

		int review_id = Integer.parseInt(request.getParameter("review_id"));
//		System.out.println(review_id);
		ReviewDeleteService reviewDeleteService = new ReviewDeleteService();
		
		boolean isDeleteSuccess = reviewDeleteService.removeArticle(review_id);
		
		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("review_list.me");
		
		return forward;
	}

}
