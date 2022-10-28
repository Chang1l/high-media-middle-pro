package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberFindIdService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberFindIdAction2 implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 
		 	HttpSession session=request.getSession();
	   		MemberBean member=new MemberBean();
	   		
	   		member.setM_NAME(request.getParameter("M_NAME"));
	   		member.setM_TEL(request.getParameter("M_TEL"));
	   		
	   		MemberFindIdService memberFindIdService = new MemberFindIdService();
	   		String Id=memberFindIdService.findId(member);
	   		
	   		
	   		ActionForward forward = null;
	   		
	   		if(Id != null || !Id.equals("")){
	   			forward = new ActionForward();
//	   		session.setAttribute("id", member.getM_ID());
	   		
	   		String a = "+";
	   		
//	   		session.setAttribute("id", Id);
	   		
	   		response.setContentType("text/html;charset=euc-kr");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('아이디'"+a+"'"+Id+"');");
	   		out.println("location.href='./memberLogin.me';");
	   		out.println("</script>");
//	   		out.close();
//	   		alert("아이디가"+id);
	   	
//	   		forward.setRedirect(true);
//	   		forward.setPath("./memberLogin.me"); //결과 페이지	
//	   		System.out.println("getPath()2222"+forward.getPath());
//	   			   		return forward;
	   		}
	   		else{
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('아이디가 없습니다');");
		   		out.println("location.href='./memberFindId.me';");
		   		out.println("</script>");
//		   		out.close();
		   		
	   		}
	   		return forward;	
	   		
	}
}