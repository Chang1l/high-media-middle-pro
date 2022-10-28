package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AllReviewWriteService;
import vo.ActionForward;
import vo.ReviewBean;

public class AllReviewWriteAction implements Action {

		public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
			ActionForward forward = null;
			ReviewBean reviewBean = null;
			reviewBean = new ReviewBean();
			
			
			reviewBean.setReview_name(request.getParameter("REVIEW_NAME"));
			reviewBean.setReview_job(request.getParameter("REVIEW_JOB"));
			reviewBean.setReview_contents(request.getParameter("REVIEW_CONTENTS"));
			reviewBean.setM_id(request.getParameter("M_ID"));
			
			AllReviewWriteService allReviewWriteService = new AllReviewWriteService();
			boolean isReviewWriteSuccess = allReviewWriteService.allReviewArticle(reviewBean);
			
			if (!isReviewWriteSuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('수강후기 등록실패')");
				out.println("history.back()");
				out.println("</script>");
			} else {
				
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("all_review_write_success.me");
				
			}
			
			return forward;
		}
	
}
