package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.MemberJoinService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberJoinAction implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 	
		 	MemberBean member=new MemberBean();
	   		boolean joinResult=false;
	   		
	   		member.setM_ID(request.getParameter("m_id"));
	   		member.setM_PW(request.getParameter("m_pw"));
	   		member.setM_NAME(request.getParameter("m_name"));
	   		member.setM_ZIP(request.getParameter("m_zip"));
	   		member.setM_ADDR(request.getParameter("m_addr")+"/"+request.getParameter("m_addr_sub")+"/"+request.getParameter("m_addr_sub2"));
	   		member.setM_TEL(request.getParameter("m_tel"));
	   		member.setM_BIRTH(request.getParameter("m_birth"));
	   		member.setM_EMAIL(request.getParameter("m_email")+"@"+request.getParameter("textEmail"));
	   		String sum = request.getParameter("text1")+request.getParameter("text2");
	   		
	   		MemberJoinService memberJoinService = new MemberJoinService();
	   		joinResult=memberJoinService.joinMember(member);
	   		
	   		ActionForward forward = null;
	   		if(joinResult==false){
	   			response.setContentType("text/html;charset=UTF-8");
	   			PrintWriter out = response.getWriter();
	   			out.println("<script>");
	   			out.println("alert('회원등록실패')");
	   			out.println("history.back()");
	   			out.println("</script>");
		   	}
	   		else{
	   	    forward = new ActionForward();
	   		forward.setRedirect(true);
	   		forward.setPath("./memberLogin.me");
	   		}
	   		return forward;
	}
}