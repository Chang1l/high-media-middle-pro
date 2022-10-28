package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import svc.MemberLoginService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberLoginAction implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 
		 	HttpSession session=request.getSession();
	   		MemberBean member=new MemberBean();
	   		
	   		member.setM_ID(request.getParameter("M_ID"));
	   		member.setM_PW(request.getParameter("M_PW"));
	   		
	   		MemberLoginService memberLoginService = new MemberLoginService();
	   		member = memberLoginService.login(member);
	   		String loginResult=member.getM_ID();
	   		ActionForward forward = null;
	   		if(loginResult!=null){
	   	    forward = new ActionForward();
	   		session.setAttribute("id", member.getM_ID());
	   		session.setAttribute("member", member);
	   		forward.setRedirect(true);
	   		forward.setPath("index.jsp");
	   		
	   		}
	   		else{
	   			response.setContentType("text/html;charset=euc-kr");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('아이디와 비밀번호를 확인해주세요');");
		   		out.println("location.href='./memberLogin.me';");
		   		out.println("</script>");
	   		}
	   		return forward;
	}
}