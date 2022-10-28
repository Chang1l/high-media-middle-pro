package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.CourseDetailService;
import svc.RegistListService;
import vo.ActionForward;
import vo.CourseBean;

 public class CourseDetailAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		
			
		int c_no=Integer.parseInt(request.getParameter("c_no"));
		String page = request.getParameter("page");
		CourseDetailService courseDetailService = new CourseDetailService();
		CourseBean course = courseDetailService.getCourse(c_no);
		
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
	   	request.setAttribute("course", course);
	  
   		forward.setPath("/course/course_view.jsp");
   		return forward;

	 }
	 
}