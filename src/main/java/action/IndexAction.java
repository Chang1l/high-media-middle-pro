package action;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReviewListService;
import vo.ActionForward;
import vo.ReviewBean;
import vo.PageInfo;

public class IndexAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ArrayList<ReviewBean> articleList = new ArrayList<ReviewBean>();
		
		ActionForward forward = new ActionForward();
		ReviewBean rbean = null;
		
		ArrayList<ReviewBean> reviewList = new ArrayList<ReviewBean>();
		ReviewListService reviewListService = new ReviewListService();
		reviewList = reviewListService.getMainReviewList();
		
		request.setAttribute("reviewList", reviewList);
//		JSONObject jObject = new JSONObject();
//		jObject.put("reviewList", reviewList);
//
//		response.setContentType("application/x-json; charset=utf-8");
//		response.getWriter().print(jObject); 
		
		for(ReviewBean b : reviewList) {
		}
		
		forward.setPath("index.jsp?check=1");
		
		return forward;
		
	}

}
