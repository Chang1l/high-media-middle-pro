package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberFindIdService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberFindIdAction implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 
		 	//HttpSession session=request.getSession();
	   		MemberBean member=new MemberBean();
	   		
	   		member.setM_NAME(request.getParameter("M_NAME"));
	   		member.setM_TEL(request.getParameter("M_TEL"));
	   		
	   		MemberFindIdService memberFindIdService = new MemberFindIdService();
	   		String id=(String)memberFindIdService.findId(member);
	   		Boolean check=(Boolean)memberFindIdService.findIdCheck(member);
	   		
//	   		member.setM_ID(id);
	   		
	   		ActionForward forward = null;
	   		
	   		
	   		if( "null".equals(id)||id==null){
	   			
	   			response.setContentType("text/html;charset=UTF-8");
	   			PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('정보를 다시 확인해주세요');");
		   		out.println("location.href='./memberFindId.me';");
		   		out.println("</script>");
	   			
	   		}
	   		else {
	   			
		   		
		   		forward = new ActionForward();	   		
		   		request.setAttribute("M_ID", id);
//		   		request.setAttribute("Mem_id", member);
//		   		forward.setRedirect(true);
		   		forward.setPath("./member/findIdForm2.jsp"); //결과 페이지	
	   		}
	   		return forward;	
	   		
	}
}