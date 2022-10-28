package svc;

import java.sql.Connection;

import dao.ProfessorDAO;
import vo.ProfessorVO;
import static db.JdbcUtil.*;

public class ProfessorInsertService {
	public boolean registerProfessor(ProfessorVO pvo) throws Exception {
		boolean isRegisterSuccess = false;
		Connection con = getConnection();
		ProfessorDAO pao = ProfessorDAO.getInstance();
		pao.setConnection(con);
		int insertCount = pao.insertProfessor(pvo);
		
		if(insertCount > 0) {
			commit(con);
			isRegisterSuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		return isRegisterSuccess;
	}
}
