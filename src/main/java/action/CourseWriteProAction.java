package action;

import java.io.File;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.CourseWriteProService;
import vo.ActionForward;
import vo.CourseBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CourseWriteProAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		CourseBean courseBean = null;
		String realFolder = "";
		String saveFolder = "/courseUpload";
		int fileSize = 5 * 1024 * 1024;
		realFolder = "C:\\jspwork\\1project\\src\\main\\webapp" + saveFolder;
	
		File file = new File(realFolder);
		
			if(!file.exists()) {
				file.mkdirs();
			}
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8",
				new DefaultFileRenamePolicy());
		courseBean = new CourseBean();
		courseBean.setC_TITLE(multi.getParameter("C_TITLE"));
		courseBean.setP_NAME(multi.getParameter("P_NAME"));
		courseBean.setC_DATE(multi.getParameter("C_DATE"));
		courseBean.setC_VOL(Integer.parseInt((multi.getParameter("C_VOL"))));		
		courseBean.setC_CONTENT(multi.getParameter("C_CONTENT"));
		courseBean.setC_IMG(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
		CourseWriteProService courseWriteProService = new CourseWriteProService();
		boolean isWriteSuccess = courseWriteProService.registCourse(courseBean);

		if (!isWriteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("courseList.me");
		}

		return forward;

	}

}