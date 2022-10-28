package action;

import java.util.ArrayList;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReviewDetailService;
import vo.ActionForward;
import vo.ReviewBean;

public class ReviewDetailAction implements Action {
	
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ArrayList<ReviewBean> reviewList = new ArrayList<ReviewBean>();
		int review_id = Integer.parseInt(request.getParameter("review_id"));
		String M_ID = request.getParameter("M_ID");
		String page = request.getParameter("page");
		ReviewDetailService reviewDetailService = new ReviewDetailService();
		ReviewBean article = reviewDetailService.getArticle(review_id, request);
		
		ActionForward forward = new ActionForward();
		forward.setPath("/review/review_modify.jsp");
		
		return forward;
	}

}
