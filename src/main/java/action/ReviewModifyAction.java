package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReviewDetailService;
import svc.ReviewModifyService;
import vo.ActionForward;
import vo.PageInfo;
import vo.ReviewBean;

public class ReviewModifyAction implements Action {

	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		 	ActionForward forward = new ActionForward();
			int review_id = Integer.parseInt(request.getParameter("review_id"));
			ReviewBean reviewBean = new ReviewBean();
			reviewBean.setReview_id(review_id);
			reviewBean.setReview_name(request.getParameter("review_name"));
			reviewBean.setReview_job(request.getParameter("review_job"));
			reviewBean.setReview_contents(request.getParameter("review_contents"));
			
			ReviewModifyService reviewModifyService
			= new ReviewModifyService();
			
		   	boolean a1 = reviewModifyService.modifyArticle(reviewBean);
		   
	
		   	PageInfo pageInfo = new PageInfo();
			request.setAttribute("pageInfo", pageInfo);
		   	forward.setRedirect(true);
	   		forward.setPath("review_list.me");
	   		return forward;
	   		
	 }
	
	
}
