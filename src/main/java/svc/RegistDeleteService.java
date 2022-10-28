package svc;

import static db.JdbcUtil.close;

import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.RegistDAO;
import vo.RegistBean;

public class RegistDeleteService {
	public boolean deleteRegist(RegistBean rvo) throws Exception {
		boolean isDeleteSuccess = false;
		
		Connection con = getConnection();
		RegistDAO rao = RegistDAO.getInstance();
		rao.setConnection(con);
		int rno=rvo.getG_NO();
		
		int deleteCount = rao.deleteRegist(rno);
		
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
