package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.CourseDAO;
import vo.CourseBean;

public class CourseListService {

	public int getListCount() throws Exception{
		
		int listCount = 0;
		Connection con = getConnection();
		CourseDAO courseDAO = CourseDAO.getInstance();
		courseDAO.setConnection(con);
		listCount = courseDAO.selectListCount();
		close(con);
		return listCount;
		
	}

	public ArrayList<CourseBean> getCourseList(int page, int limit) throws Exception{
		
		ArrayList<CourseBean> courseList = null;
		Connection con = getConnection();
		CourseDAO courseDAO = CourseDAO.getInstance();
		courseDAO.setConnection(con);
		courseList = courseDAO.selectCourseList(page,limit);
		close(con);
		return courseList;
		
	}
	//사용자 글 검색
	public ArrayList<CourseBean> getUserCourseList(int page, int limit) throws Exception{
		
		ArrayList<CourseBean> courseList = null;
		Connection con = getConnection();
		CourseDAO courseDAO = CourseDAO.getInstance();
		courseDAO.setConnection(con);
		courseList = courseDAO.selectUserCourseList(page,limit);
		close(con);
		return courseList;
		
	}
	//검색 글수 카운트
		public int getCourseSearchListCount(String C_COL,String searchText,int pageNumber) throws Exception{
			
			int listCount = 0;
			Connection con = getConnection();
			CourseDAO courseDAO = CourseDAO.getInstance();
			courseDAO.setConnection(con);
			listCount = courseDAO.selectSearchListCount(C_COL,searchText,pageNumber);
		
			close(con);
			return listCount;
			
		}
		
		//검색
		public ArrayList<CourseBean> getSearchCourseList(String C_COL,String searchText,int pageNumber) throws Exception{
			
			ArrayList<CourseBean> articleList = null;
			Connection con = getConnection();
			CourseDAO courseDAO = CourseDAO.getInstance();
			courseDAO.setConnection(con);
			articleList = courseDAO.selectSearchCourseList(C_COL,searchText,pageNumber);
			close(con);
			return articleList;
			
		}
		
		//사용자 검색
		public ArrayList<CourseBean> getUserSearchCourseList(String C_COL,String searchText,int pageNumber) throws Exception{
			
			ArrayList<CourseBean> articleList = null;
			Connection con = getConnection();
			CourseDAO courseDAO = CourseDAO.getInstance();
			courseDAO.setConnection(con);
			articleList = courseDAO.selectUserSearchCourseList(C_COL,searchText,pageNumber);
			close(con);
			return articleList;
			
		}
}
