package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.CourseDeleteProService;
import vo.ActionForward;

public class CourseDeleteProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{	 

		ActionForward forward = null;
		int c_no=Integer.parseInt(request.getParameter("c_no"));
		String nowPage = request.getParameter("page");
		
		
		CourseDeleteProService courseDeleteProService = new CourseDeleteProService();
		
			
			boolean isDeleteSuccess = courseDeleteProService.removeCourse(c_no);

			if(!isDeleteSuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('삭제실패');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}
			else{
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("courseList.me?page=" + nowPage);

			}
			return forward;
			
	}

}



	

