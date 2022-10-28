package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.BoardDAO;
import dao.RegistDAO;
import vo.BoardBean;
import vo.RegistBean;

public class RegistInsertProService {
	
	public boolean InsertRegist(RegistBean regist) throws Exception{
		// TODO Auto-generated method stub
		
		boolean isInsertSuccess = false;
		Connection con = getConnection();
		RegistDAO registDAO = RegistDAO.getInstance();
		registDAO.setConnection(con);
		int selectCount =registDAO.selectInsertCount(regist);
		
		int insertCount = registDAO.insertArticle(regist);
		if(selectCount==0) {
			if(insertCount > 0){
				commit(con);
				isInsertSuccess = true;
			}
			else{
				rollback(con);
			}
		
		}else {
			
			rollback(con);
		}
		
		
		close(con);
		return isInsertSuccess;
		
	}


}
