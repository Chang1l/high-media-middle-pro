package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardReplyProService;
import vo.ActionForward;
import vo.ReplyBean;

public class BoardReplyProAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{
		 	
		 	int b_no=Integer.parseInt(request.getParameter("b_no"));
			String page = request.getParameter("page");
		 	request.setAttribute("page", page);
		 	ActionForward forward = null;
			ReplyBean replyBean = null;
			replyBean = new ReplyBean();

			replyBean.setM_ID(request.getParameter("M_ID"));
			replyBean.setR_comment(request.getParameter("R_COMMENT"));
			
			replyBean.setB_NO(b_no);
			BoardReplyProService boardReplyProService = new BoardReplyProService();
			boolean isReplySuccess = boardReplyProService.replyArticle(replyBean);

			if (!isReplySuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
	   			out.println("alert('답글실패')");
	   			out.println("history.back()");
	   			out.println("</script>");
			} else {
			
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("boardDetail.me?b_no="+b_no);
				
			}

			return forward;
		 
		

	   		
	   		
	}  	
	 
}