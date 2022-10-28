package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AllReviewSendService;
import vo.ActionForward;
import vo.ReviewBean;

public class AllReviewSendAction implements Action {

		public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
			ActionForward forward = null;
			forward = new ActionForward();
			ReviewBean reviewBean = null;
			reviewBean = new ReviewBean();
			
			int all_review_id=Integer.parseInt(request.getParameter("all_review_id"));		
			AllReviewSendService allReviewSendService = new AllReviewSendService();
			
			reviewBean = allReviewSendService.selectOneReview(all_review_id);
			
			request.setAttribute("reviewBean", reviewBean);
			
			forward.setRedirect(false);
			forward.setPath("reviewWrite.me");
			return forward;
		}
	
}
