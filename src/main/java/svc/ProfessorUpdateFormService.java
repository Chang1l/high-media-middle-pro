package svc;

import java.sql.Connection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProfessorDAO;
import vo.ProfessorVO;

import static db.JdbcUtil.*;

public class ProfessorUpdateFormService {

	public ProfessorVO getProfessorInfo(int p_id) throws Exception {
		ProfessorVO professorInfo = null;
		Connection con = getConnection();
		ProfessorDAO pao = ProfessorDAO.getInstance();
		pao.setConnection(con);
		
		professorInfo = pao.selectProfessorInfo(p_id);
		close(con);
		return professorInfo;
	}
}
