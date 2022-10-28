package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;
import java.sql.Connection;
import dao.CourseDAO;

public class CourseDeleteProService {

	public boolean removeCourse(int c_no) throws Exception{
		// TODO Auto-generated method stub
		
		boolean isRemoveSuccess = false;
		Connection con = getConnection();
		CourseDAO courseDAO = CourseDAO.getInstance();
		courseDAO.setConnection(con);
		int deleteCount = courseDAO.deleteCourse(c_no);
		
		if(deleteCount > 0){
			commit(con);
			isRemoveSuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isRemoveSuccess;
	}

}
