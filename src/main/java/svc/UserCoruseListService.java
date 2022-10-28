package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.CourseDAO;
import vo.CourseBean;

public class UserCoruseListService {

	public int getUserListCount() throws Exception{
		// TODO Auto-generated method stub
		
		int listCount = 0;
		Connection con = getConnection();
		CourseDAO courseDAO = CourseDAO.getInstance();
		courseDAO.setConnection(con);
		listCount = courseDAO.selectListCount();
		close(con);
		return listCount;
		
	}

	public ArrayList<CourseBean> getUserCourseList(int page, int limit) throws Exception{
		
		ArrayList<CourseBean> courseList = null;
		Connection con = getConnection();
		CourseDAO courseDAO = CourseDAO.getInstance();
		courseDAO.setConnection(con);
		courseList = courseDAO.selectUSerCourseList(page,limit);
		close(con);
		return courseList;
		
	}

}
