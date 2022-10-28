package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardReplyUpdateProService;
import vo.ActionForward;
import vo.ReplyBean;

public class BoardReplyUpdateProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{

		ActionForward forward = null;
		boolean isreplyUpdateSuccess = false;
		int r_no=Integer.parseInt(request.getParameter("r_no"));
		int b_no=Integer.parseInt(request.getParameter("b_no"));
		String m_id= request.getParameter("M_ID");
		ReplyBean article= new ReplyBean();
		BoardReplyUpdateProService boardReplyUpdateProService = new BoardReplyUpdateProService();
		boolean isRightUser=boardReplyUpdateProService.isArticleWriter(r_no, m_id);
		
		if(!isRightUser){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('수정할 권한이 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			article.setR_NO(r_no);
			article.setM_ID(m_id);
			article.setB_NO(b_no);
			article.setR_comment(request.getParameter("R_COMMENT")); 
			
			
			isreplyUpdateSuccess = boardReplyUpdateProService.replyUpdaterticle(article);

			if(!isreplyUpdateSuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('수정실패');");
				out.println("history.back()");
				out.println("</script>");
			}
			else{
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("boardDetail.me?b_no="+article.getB_NO()); 
			}

		}

		return forward;
	}

}







