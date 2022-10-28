package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.CourseDetailService;
import vo.ActionForward;
import vo.CourseBean;

public class CourseModifyFormAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		 	ActionForward forward = new ActionForward();
			int c_no=Integer.parseInt(request.getParameter("c_no"));
			CourseDetailService courseDetailService
			= new CourseDetailService();	
		   	CourseBean course =courseDetailService.getCourse(c_no);
		   	request.setAttribute("course", course);
		   	request.setAttribute("page", request.getParameter("page"));
	   		forward.setPath("/course/course_modify.jsp");
	   		return forward;
	   		
	 }
	 
}