package svc;

import java.sql.Connection;
import dao.CourseDAO;
import vo.CourseBean;
import static db.JdbcUtil.*;

public class CourseDetailService {

	public CourseBean getCourse(int c_no) throws Exception{
		// TODO Auto-generated method stub
		
		CourseBean course = null;
		Connection con = getConnection();
		CourseDAO courseDAO = CourseDAO.getInstance();
		courseDAO.setConnection(con);
		course = courseDAO.selectCourse(c_no);
		close(con);
		return course;
		
	}

}
