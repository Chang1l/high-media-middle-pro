package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardDetailReplyService;
import svc.BoardDetailService;
import vo.ActionForward;
import vo.BoardBean;
import vo.ReplyBean;

 public class BoardDetailAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		 
		ArrayList<ReplyBean> replyList=new ArrayList<ReplyBean>();
		int b_no=Integer.parseInt(request.getParameter("b_no"));
		String M_ID= request.getParameter("M_ID");
		String page = request.getParameter("page");
		BoardDetailService boardDetailService = new BoardDetailService();
		BoardBean article = boardDetailService.getArticle(b_no, request);
		
		BoardDetailReplyService boardDetailreply= new BoardDetailReplyService();
		replyList= boardDetailreply.getArticleList(b_no); 
	
		request.setAttribute("articleList", replyList);
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
	   	request.setAttribute("article", article);
	   	request.setAttribute("reply", replyList);
   		forward.setPath("/board/qna_board_view.jsp");
   		return forward;

	 }
	 
}