package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AllReviewListService;
import vo.ActionForward;
import vo.PageInfo;
import vo.ReviewBean;

public class AllReviewListAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ArrayList<ReviewBean> articleList = new ArrayList<ReviewBean>();
		int pageNumber = 1;
		int limit = 10;
		
		
		if(request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		
		AllReviewListService allReviewListService = new AllReviewListService();
		
		
		int listCount = allReviewListService.getListCount();
		
		articleList = allReviewListService.getReviewList(pageNumber);
		int maxPage = (int)((double)listCount/limit+0.95);
		int startPage = (((int) ((double)pageNumber / 10 + 0.9)) - 1) * 10 + 1;
		int endPage = startPage + 10 - 1;
		
		if (endPage > maxPage) endPage = maxPage;
	
		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(pageNumber);
		pageInfo.setStartPage(startPage);
		request.setAttribute("pageInfo", pageInfo);
		
		request.setAttribute("reviewList", articleList);
		ActionForward forward = new ActionForward();
		forward.setPath("review/all_review_list.jsp");
		
		
		return forward;
		
	}

}
