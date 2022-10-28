package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.CourseDetailService;
import svc.RegistListService;
import vo.ActionForward;
import vo.CourseBean;

 public class UserCourseDetailAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		 	HttpSession session=request.getSession();
			String m_id= (String)session.getAttribute("id");

			RegistListService registListService= new RegistListService();
		 
		int c_no=Integer.parseInt(request.getParameter("c_no"));
		int registc_no=registListService.getRegistCno(m_id,c_no);

		String page = request.getParameter("page");
		CourseDetailService courseDetailService = new CourseDetailService();
		CourseBean course = courseDetailService.getCourse(c_no);
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
	   	request.setAttribute("course", course);
		request.setAttribute("registc_no", registc_no);
   		forward.setPath("/user/user_course_view.jsp");
   		return forward;

	 }
	 
}