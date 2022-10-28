package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberFindPwService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberFindPwAction2 implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 
		 	HttpSession session=request.getSession();
	   		MemberBean member=new MemberBean();
	   		
	   		member.setM_ID(request.getParameter("M_ID"));
	   		member.setM_TEL(request.getParameter("M_TEL"));
	   		
	   		MemberFindPwService memberFindPwService = new MemberFindPwService();
	   		String Pw=memberFindPwService.findPw(member);
	   		
	   		
	   		ActionForward forward = null;
	   		
	   		if(Pw != null || !Pw.equals("")){
	   			forward = new ActionForward();
	   		
	   		String a = "+";
	   		
	   		response.setContentType("text/html;charset=euc-kr");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('비밀번호'"+a+"'"+Pw+"');");
	   		out.println("location.href='./memberLogin.me';");
	   		out.println("</script>");

	   		}
	   		else{
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('비밀번호가 없습니다');");
		   		out.println("location.href='./memberFindPw.me';");
		   		out.println("</script>");
		   		
	   		}
	   		return forward;	
	   		
	}
}