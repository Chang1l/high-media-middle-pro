package svc;

import java.sql.Connection;
import dao.CourseDAO;
import vo.CourseBean;
import static db.JdbcUtil.*;
public class CourseWriteProService {

	public boolean registCourse(CourseBean courseBean) throws Exception{
		// TODO Auto-generated method stub
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		CourseDAO courseDAO = CourseDAO.getInstance();
		courseDAO.setConnection(con);
		int insertCount = courseDAO.insertCourse(courseBean);
		
		if(insertCount > 0){
			commit(con);
			isWriteSuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isWriteSuccess;
		
	}

}
