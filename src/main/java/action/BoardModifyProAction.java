package action;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.BoardModifyProService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardModifyProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{

		ActionForward forward = null;
		BoardBean boardBean = null;
		String realFolder = "";
		String saveFolder = "/boardUpload";
		int fileSize = 5 * 1024 * 1024;
//		ServletContext context = request.getServletContext();
		realFolder = "C:\\jspwork\\1project\\src\\main\\webapp" + saveFolder;
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		int b_no=Integer.parseInt(multi.getParameter("B_NO"));
		boolean isModifySuccess = false;

		BoardBean article=new BoardBean();
		article.setB_NO(b_no);
		article.setB_SUBJECT(multi.getParameter("B_SUBJECT"));
		article.setB_CONTENT(multi.getParameter("B_CONTENT")); 
		article.setB_FILE(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
		BoardModifyProService boardModifyProService = new BoardModifyProService();
		boolean isRightUser=boardModifyProService.isArticleWriter(b_no, multi.getParameter("m_id"));
		
		if(!isRightUser){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('수정할 권한이 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			
			
			
			
			isModifySuccess = boardModifyProService.modifyArticle(article);

			if(!isModifySuccess){
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
				forward.setPath("boardDetail.me?b_no="+article.getB_NO()+"&check=1"); 
			}

		}

		return forward;
	}

}







