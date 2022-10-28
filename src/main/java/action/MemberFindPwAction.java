package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberFindPwService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberFindPwAction implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 
		 	//HttpSession session=request.getSession();
	   		MemberBean member=new MemberBean();
	   		
	   		member.setM_ID(request.getParameter("M_ID"));
	   		member.setM_TEL(request.getParameter("M_TEL"));
	   		
	   		MemberFindPwService memberFindPwService = new MemberFindPwService();
	   		String pw=(String)memberFindPwService.findPw(member);
	   		Boolean check=(Boolean)memberFindPwService.findPwCheck(member);
	   		
	   		
	   		ActionForward forward = null;
	   		
	   		if( "null".equals(pw)||pw==null){
	   			
	   			response.setContentType("text/html;charset=UTF-8");
	   			PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('정보를 다시 확인해주세요');");
		   		out.println("location.href='./memberFindPw.me';");
		   		out.println("</script>");
	   			
	   		}else {
	   			
		   		forward = new ActionForward();	   		
		   		request.setAttribute("M_PW", pw);
//		   		request.setAttribute("Mem_pw", member);
//		   		forward.setRedirect(true);
		   		forward.setPath("./member/findPwForm2.jsp"); //결과 페이지	
	   		}
	   		return forward;	
	   		
	}
}