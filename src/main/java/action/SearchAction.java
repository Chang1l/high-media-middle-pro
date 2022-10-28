package action;

import java.util.*;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import svc.BoardListService;
import vo.ActionForward;
import vo.BoardBean;
import vo.PageInfo;

 public class SearchAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		ArrayList<BoardBean> articleList=new ArrayList<BoardBean>();
	  	int pageNumber=1;
		String B_COL =null;
		String searchText=null;
		
		if(request.getParameter("pageNumber")!=null){
			pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
			
		}
		if(request.getParameter("B_COL")!=null){
			B_COL=request.getParameter("B_COL");
			
		}
		
		if(request.getParameter("searchText")!=null){
			searchText=request.getParameter("searchText");
		
		}
		BoardDAO boardDAO= BoardDAO.getInstance();
		BoardListService boardListService = new BoardListService();
		int listCount=boardListService.getSearchListCount(B_COL,searchText,pageNumber); //총 리스트 수를 받아옴.
		articleList = boardListService.getSearchArticleList(B_COL,searchText,pageNumber); //리스트를 받아옴.
		//총 페이지 수.
		int maxPage=(int)((double)listCount/10+0.95);
   		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
   		int startPage = (pageNumber/10)*10+1;
   		if(pageNumber%10==0) startPage-=10;
   
   		
   	     int endPage = (startPage+10);
   		if (endPage> maxPage) endPage= maxPage;
   		
   		PageInfo pageInfo = new PageInfo();
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(pageNumber);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("listCount", listCount);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("articleList", articleList);
		ActionForward forward= new ActionForward();
   		forward.setPath("/board/qna_board_search.jsp");
   		return forward;
   		
	 }
	 
 }