package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardDeleteProService;
import svc.BoardReplyDeleteProService;
import vo.ActionForward;
import vo.ReplyBean;

public class BoardReplyDeleteProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{	 

		ActionForward forward = null;
		int b_no=Integer.parseInt(request.getParameter("b_no"));
		int r_no=Integer.parseInt(request.getParameter("r_no"));
		String id= request.getParameter("M_ID");
		String nowPage = request.getParameter("page");
		ReplyBean replyBean = null;
		replyBean = new ReplyBean();
		
		BoardReplyDeleteProService boardReplyDeleteProService = new BoardReplyDeleteProService();
		boolean isRightUser=boardReplyDeleteProService.isArticleWriter(r_no, id);
		
		

			if(!isRightUser){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('삭제할 권한이 없습니다.');");
				out.println("history.back();");
				out.println("</script>");
			}
			else{
				replyBean.setM_ID(id);
				replyBean.setR_NO(r_no);
				replyBean.setB_NO(b_no);
				boolean isDeleteSuccess = boardReplyDeleteProService.replyDeleteArticle(replyBean);
				
				if(isDeleteSuccess=true){
					forward = new ActionForward();
					forward.setRedirect(true);
					forward.setPath("boardDetail.me?b_no=" + b_no);
				}
				else{
				
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out=response.getWriter();
					out.println("<script>");
					out.println("alert('삭제실패');");
					out.println("history.back();");
					out.println("</script>");
					out.close();
				}
			}
		return forward;
	}

}