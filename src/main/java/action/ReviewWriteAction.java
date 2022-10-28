package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReviewWriteService;
import vo.ActionForward;
import vo.ReviewBean;

public class ReviewWriteAction implements Action {

		public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			ActionForward forward = null;
			ReviewBean reviewBean = null;
			reviewBean = new ReviewBean();
			forward = new ActionForward();
			
			if(request.getAttribute("reviewBean") != null) {
				reviewBean = (ReviewBean) request.getAttribute("reviewBean");
			} else {
			reviewBean.setReview_name(request.getParameter("REVIEW_NAME"));
			reviewBean.setReview_job(request.getParameter("REVIEW_JOB"));
			reviewBean.setReview_contents(request.getParameter("REVIEW_CONTENTS"));
			}
			
			ReviewWriteService reviewWriteService = new ReviewWriteService();
			boolean isReviewWriteSuccess = reviewWriteService.reviewArticle(reviewBean);
			
			if (!isReviewWriteSuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('후기 등록실패')");
				out.println("history.back()");
				out.println("</script>");
			} else {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("review_list.me?str=1");
			}
			
			return forward;
		}
	
}
