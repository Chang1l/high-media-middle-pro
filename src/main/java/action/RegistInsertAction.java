package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.BoardWriteProService;
import svc.RegistInsertProService;
import svc.RegistListService;
import vo.ActionForward;
import vo.PageInfo;
import vo.RegistBean;

public class RegistInsertAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
			
		 	ActionForward forward = null;
			RegistBean regist = new RegistBean();
	
			HttpSession session=request.getSession();
			String m_id=(String)session.getAttribute("id");
			 session.setAttribute("regist", regist);
			 regist.setM_ID(m_id);
			 regist.setC_NO(Integer.parseInt(request.getParameter("c_no")));
			
			 if(m_id.equals("")||m_id!=null) {
			RegistInsertProService registInsertProService = new RegistInsertProService();
			boolean isInsertSuccess = registInsertProService.InsertRegist(regist);
			 
			 
			if (!isInsertSuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('이미 신청한 강의입니다.')");
				out.println("history.back();");
				out.println("</script>");
			} else {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("registList.me");
			}
			}

			return forward;

		}
}
