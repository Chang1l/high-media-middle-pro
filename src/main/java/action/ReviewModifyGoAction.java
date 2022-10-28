package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReviewDetailService;
import vo.ActionForward;
import vo.ReviewBean;

public class ReviewModifyGoAction implements Action {

	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		 	ActionForward forward = new ActionForward();
			int review_id = Integer.parseInt(request.getParameter("review_id"));
			ReviewBean reviewBean = new ReviewBean();
			
			ReviewDetailService reviewDetailService
			= new ReviewDetailService();
			
		   	ReviewBean article = reviewDetailService.getArticle(review_id, request);
		   	request.setAttribute("article", article);
	   		forward.setPath("/review/review_modify.jsp");
	   		return forward;
	   		
	 }
	
	
}
