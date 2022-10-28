package action;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReviewListService;
import vo.ActionForward;
import vo.PageInfo;
import vo.ReviewBean;

public class ReviewListAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ArrayList<ReviewBean> articleList = new ArrayList<ReviewBean>();
		int pageNumber = 1;
		int limit = 10;
		
		
		if(request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		
		ReviewListService reviewListService = new ReviewListService();
		
		
		int listCount = reviewListService.getListCount();
		articleList = reviewListService.getReviewList(pageNumber);
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
		
		//articleList에 배열이 담겨 있는데,  "reviewList" 이름으로, 겟파라미터로 쓸 수 있도록 세팅
		request.setAttribute("reviewList", articleList);
		ActionForward forward = new ActionForward();
		forward.setPath("review/review_list.jsp");
		
		
		return forward;
		
	}

}
