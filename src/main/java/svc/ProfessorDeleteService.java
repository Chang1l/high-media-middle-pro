package svc;

import java.sql.Connection;

import static db.JdbcUtil.*;

import dao.ProfessorDAO;
import vo.ProfessorVO;

public class ProfessorDeleteService {
	public boolean deleteProfessor(ProfessorVO pvo) throws Exception {
		boolean isDeleteSuccess = false;
		
		Connection con = getConnection();
		ProfessorDAO pao = ProfessorDAO.getInstance();
		pao.setConnection(con);
		
		int deleteCount = pao.deleteProfessor(pvo);
		
		if(deleteCount > 0) {
			commit(con);
			isDeleteSuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		return isDeleteSuccess;
		
	}
}
