package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import vo.CourseBean;
import dao.CourseDAO;

public class CourseModifyProService {


	public boolean modifyCourse(CourseBean course) throws Exception {
		// TODO Auto-generated method stub
		
		boolean isModifySuccess = false;
		Connection con = getConnection();
		CourseDAO courseDAO = CourseDAO.getInstance();
		courseDAO.setConnection(con);
		int updateCount = courseDAO.updateCourse(course);
		
		if(updateCount > 0){
			commit(con);
			isModifySuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isModifySuccess;
		
	}

}
