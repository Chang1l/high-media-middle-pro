package svc;

import java.sql.Connection;

import dao.ProfessorDAO;
import vo.ProfessorVO;
import static db.JdbcUtil.*;

public class ProfessorUpdateService {
	public boolean updateProfessor(ProfessorVO pvo_original, ProfessorVO pvo) throws Exception {
		boolean isUpdateSuccess = false;
		Connection con = getConnection();
		ProfessorDAO pao = ProfessorDAO.getInstance();
		pao.setConnection(con);
		int updateCount = pao.updateProfessor(pvo_original, pvo);
		
		if(updateCount > 0) {
			commit(con);
			isUpdateSuccess = true;
		} else {
			rollback(con);
		}
		close(con);
		return isUpdateSuccess;
	}
}
