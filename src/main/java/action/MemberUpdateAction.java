package action;

import java.io.PrintWriter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberUpdateService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberUpdateAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{
		MemberBean member = new MemberBean();
		HttpSession session=request.getSession();
		String m_id=(String)session.getAttribute("id");
		session.setAttribute("member", member);
		member.setM_ID(m_id);
   		member.setM_PW(request.getParameter("m_pw"));
   		member.setM_NAME(request.getParameter("m_name"));
   		member.setM_ZIP(request.getParameter("m_zip"));
   		member.setM_ADDR(request.getParameter("m_addr")+"/"+request.getParameter("m_addr_sub")+"/"+request.getParameter("m_addr_sub2"));
   		member.setM_TEL(request.getParameter("m_tel"));
   		member.setM_BIRTH(request.getParameter("m_birth"));
   		member.setM_EMAIL(request.getParameter("m_email")+"@"+request.getParameter("textEmail"));
		ActionForward forward = null;
		if(m_id==null){
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./memberlogin.me");
		}else{
			
			MemberUpdateService memberUpdateService = new MemberUpdateService();
			boolean updateResult = memberUpdateService.updateMember(member);

			if(updateResult){
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./index.jsp");
			}
			else{
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('회원정보수정 실패.');");
				out.println("location.href='./memberLogin.me';");
				out.println("</script>");
			}
		}
		return forward;
	}
}