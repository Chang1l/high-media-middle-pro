package action;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.ProfessorUpdateService;
import vo.ActionForward;
import vo.ProfessorVO;

public class ProfessorUpdateAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		ProfessorVO pvo = null;
		ProfessorVO pvo_original = null;
		String realDir = "";
		String saveDir = "/ProfessorImg";
		int fileSize = 20 * 1024 * 1024;
		realDir = "C:\\jspwork\\1project\\src\\main\\webapp\\professor" + saveDir;
		
		File file = new File(realDir);
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		MultipartRequest multi = new MultipartRequest(request, realDir, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		pvo = new ProfessorVO();
		pvo_original = new ProfessorVO();
		pvo_original.setP_id(Integer.parseInt(multi.getParameter("P_ID_ORIGINAL")));
		pvo.setP_id(Integer.parseInt(multi.getParameter("P_ID")));
		pvo.setP_name(multi.getParameter("P_NAME"));
		pvo.setP_record1(multi.getParameter("P_RECORD1"));
		pvo.setP_record2(multi.getParameter("P_RECORD2"));
		pvo.setP_record3(multi.getParameter("P_RECORD3"));
		pvo.setP_word(multi.getParameter("P_WORD"));
		
		if(multi.getFilesystemName("P_IMG") != null) {
			pvo.setP_img(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));	
		}
		
		ProfessorUpdateService professorUpdateService = new ProfessorUpdateService();
		boolean isUpdateSuccess = professorUpdateService.updateProfessor(pvo_original, pvo);
		
		if(!isUpdateSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('교수 아이디가 중복입니다 다시 한번 확인해주세요.')");
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("ProfessorListManager.me");
		}
		return forward;
	}
}
