package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.CourseModifyProService;
import vo.ActionForward;
import vo.CourseBean;
import vo.PageInfo;

public class CourseModifyProAction implements Action {

   
   public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
         throws Exception{

      ActionForward forward = null;
      boolean isModifySuccess = false;
      String realFolder = "";
      String saveFolder = "/courseUpload";
      int fileSize = 5 * 1024 * 1024;
    
         ServletContext context = request.getServletContext();
         realFolder = context.getRealPath(saveFolder);
         MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8",
               new DefaultFileRenamePolicy());
         CourseBean course=new CourseBean();
         String nowPage = multi.getParameter("page");
         course.setC_NO(Integer.parseInt((multi.getParameter("C_NO"))));
         course.setC_TITLE(multi.getParameter("C_TITLE"));
         course.setP_NAME(multi.getParameter("P_NAME"));
         course.setC_DATE(multi.getParameter("C_DATE"));
         course.setC_VOL(Integer.parseInt((multi.getParameter("C_VOL"))));      
         course.setC_CONTENT(multi.getParameter("C_CONTENT"));
         course.setC_IMG(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
                 
         CourseModifyProService courseModifyProService = new CourseModifyProService();
         isModifySuccess = courseModifyProService.modifyCourse(course);

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
            forward.setPath("courseDetail.me?c_no="+course.getC_NO()+"&page="+nowPage);
         }
      return forward;
   }

}