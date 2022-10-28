package dao;

import static db.JdbcUtil.close;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import vo.CourseBean;

public class CourseDAO {

	DataSource ds;
	Connection con;
	private static CourseDAO courseDAO;

	private CourseDAO() {
		// TODO Auto-generated constructor stub
	}

	public static CourseDAO getInstance(){
		if(courseDAO == null){
			courseDAO = new CourseDAO();
		}
		return courseDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}

	//글의 개수 구하기.
	public int selectListCount() {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{


			System.out.println("getConnection");
			pstmt=con.prepareStatement("select count(*) from course");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){
			System.out.println("getListCount 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}

		return listCount;

	}

	
	//강의 목록 보기.	
		public ArrayList<CourseBean> selectUSerCourseList(int page,int limit){

			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String course_list_sql="select C_NO, C_TITLE, P_NAME, to_char(c_date, 'YYYY-MM-DD') as C_DATE, C_VOL, C_CONTENT, C_IMG from (select rownum rnum, c.* from (select * from course order by c_date desc) c ) where rnum between ? and ?";
			ArrayList<CourseBean> courseList = new ArrayList<CourseBean>();
			CourseBean course = null;
			int startrow=(page-1)*8+1; //읽기 시작할 row 번호..
			int endrow=(page-1)*8+8;

			try{
				pstmt = con.prepareStatement(course_list_sql);
				pstmt.setInt(1, startrow);
				pstmt.setInt(2, endrow);
				rs = pstmt.executeQuery();

				while(rs.next()){
				course = new CourseBean();
				course.setC_NO(rs.getInt("C_NO"));
	            course.setC_TITLE(rs.getString("C_TITLE"));
	            course.setP_NAME(rs.getString("P_NAME"));
	            course.setC_DATE(rs.getString("C_DATE"));
	            course.setC_VOL(rs.getInt("C_VOL"));
	            course.setC_CONTENT(rs.getString("C_CONTENT"));
	            course.setC_IMG(rs.getString("C_IMG"));
					courseList.add(course);
				}

			}catch(Exception ex){
				System.out.println("getUserCourseList 에러 : " + ex);
			}finally{
				close(rs);
				close(pstmt);
			}

			return courseList;

		}
	
	
	//글 목록 보기.	
	public ArrayList<CourseBean> selectCourseList(int page,int limit){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String course_list_sql="select C_NO, C_TITLE, P_NAME, to_char(c_date, 'YYYY-MM-DD') as C_DATE, C_VOL, C_CONTENT, C_IMG, C_RESDATE, C_RESALTDATE from (select rownum rnum, c.* from (select * from course order by c_date desc) c ) where rnum between ? and ?";
		ArrayList<CourseBean> courseList = new ArrayList<CourseBean>();
		CourseBean course = null;
		int startrow=(page-1)*10+1; //읽기 시작할 row 번호..	
		int endrow=(page-1)*10+10;

		try{
			pstmt = con.prepareStatement(course_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
			course = new CourseBean();
			course.setC_NO(rs.getInt("C_NO"));
            course.setC_TITLE(rs.getString("C_TITLE"));
            course.setP_NAME(rs.getString("P_NAME"));
            course.setC_DATE(rs.getString("C_DATE"));
            course.setC_RESDATE(rs.getString("C_RESDATE"));
            course.setC_RESALTDATE(rs.getString("C_RESALTDATE"));
				courseList.add(course);
			}

		}catch(Exception ex){
			System.out.println("getCourseList 에러 : " + ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return courseList;

	}

	//글 내용 보기.
	public CourseBean selectCourse(int c_no){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CourseBean courseBean = null;

		try{
			pstmt = con.prepareStatement( "select C_NO,C_TITLE,P_NAME,TO_CHAR(C_DATE, 'YYYY-MM-DD')AS C_DATE , C_VOL,C_CONTENT,C_IMG,C_RESDATE  ,C_RESALTDATE  from course where C_NO = ?");
			pstmt.setInt(1, c_no);
			rs= pstmt.executeQuery();

			if(rs.next()){
				courseBean = new CourseBean();
				courseBean.setC_NO(rs.getInt("C_NO"));
				courseBean.setC_TITLE(rs.getString("C_TITLE"));
				courseBean.setP_NAME(rs.getString("P_NAME"));
				courseBean.setC_DATE(rs.getString("C_DATE"));
				courseBean.setC_VOL(rs.getInt("C_VOL"));
				courseBean.setC_CONTENT(rs.getString("C_CONTENT"));
				courseBean.setC_IMG(rs.getString("C_IMG"));
				courseBean.setC_RESDATE(rs.getString("C_RESDATE"));
				courseBean.setC_RESALTDATE(rs.getString("C_RESALTDATE"));
			}
		}catch(Exception ex){
			System.out.println("getDetail 에러 : " + ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return courseBean;

	}

	//글 등록.
	public int insertCourse(CourseBean course){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;

		try{
			pstmt=con.prepareStatement("select max(c_no) from course");
			rs = pstmt.executeQuery();

			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1000;

			sql="insert into course (C_NO, C_TITLE, P_NAME, C_DATE, C_VOL, C_CONTENT, C_IMG, C_RESDATE)";
			sql+=" values(?,?,?,?,?,?,?,SYSDATE)";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, course.getC_TITLE());
			pstmt.setString(3, course.getP_NAME());
			pstmt.setString(4, course.getC_DATE());
			pstmt.setInt(5, course.getC_VOL());
			pstmt.setString(6, course.getC_CONTENT());
			pstmt.setString(7, course.getC_IMG());
		
			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
			System.out.println("courseInsert 에러 : "+ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}


	//글 수정.
	public int updateCourse(CourseBean course){

		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		
		if(course.getC_IMG() != null) {		
			sql="update course set C_TITLE=?, P_NAME=?, C_DATE=?, C_VOL=?, C_CONTENT=?, C_IMG=?, C_RESALTDATE=SYSDATE where C_NO=?";
		}else {
			sql="update course set C_TITLE=?, P_NAME=?, C_DATE=?, C_VOL=?, C_CONTENT=?, C_RESALTDATE=SYSDATE where C_NO=?";	
		}

		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, course.getC_TITLE());
			pstmt.setString(2, course.getP_NAME());
			pstmt.setString(3, course.getC_DATE());
			pstmt.setInt(4, course.getC_VOL());
			pstmt.setString(5, course.getC_CONTENT());
			
			if(course.getC_IMG() != null) {
			pstmt.setString(6, course.getC_IMG());
			pstmt.setInt(7, course.getC_NO());
			}else {
				pstmt.setInt(6, course.getC_NO());				
			}
			updateCount = pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("courseModify 에러 : " + ex);
		}finally{
			close(pstmt);
		}

		return updateCount;

	}

	//글 삭제.
	public int deleteCourse(int c_no){

		PreparedStatement pstmt = null;
		String course_delete_sql;
		ResultSet rs = null;
		String filename = null;
		String filepath = null;
		int deleteCount=0;

		
		
		
		try{
			
			course_delete_sql = "select * from course where c_no = ?";
			pstmt = con.prepareStatement(course_delete_sql);
			pstmt.setInt(1, c_no);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				filename = rs.getString("C_IMG");
			}
			
			filepath = "C:\\jspwork\\1project\\src\\main\\webapp\\courseUpload\\";
			
			File file = new File(filepath + filename);
			
			if(file.exists()) {
				file.delete();
				close(rs);
				close(pstmt);
			}
			
			course_delete_sql="delete from course where c_no=?";
			pstmt=con.prepareStatement(course_delete_sql);
			pstmt.setInt(1, c_no);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("courseDelete 에러 : "+ex);
		}	finally{
			close(pstmt);
		}

		return deleteCount;

	}
	
	
	//강의 검색 결과 목록 보기.	
	   public ArrayList<CourseBean> selectSearchCourseList(String C_COL, String searchText, int pageNumber) {
		      Statement pstmt = null;
		      ResultSet rs = null;
		      ArrayList<CourseBean> courseList = new ArrayList<CourseBean>();
		      CourseBean course = null;
		      int startrow=(pageNumber-1)*10+1; //읽기 시작할 row 번호..   
		      int endrow=(pageNumber-1)*10+10;
		      
		      String col=null;
		      String text=searchText;
		      String course_list_sql=null;
		      
		      if(C_COL!=null || searchText !="") {
		         col=C_COL;
		         text=searchText;
		      }

		      
		      if("ALL".equals(col)){
		         
		         course_list_sql="select C_NO, C_TITLE, P_NAME, to_char(c_date, 'YYYY-MM-DD') as C_DATE, C_VOL, C_CONTENT, C_IMG, C_RESDATE, C_RESALTDATE" 
		          +" from(select rownum num, c.* from (select * from course" 
		         +" where replace(upper(p_name),' ','') LIKE replace(upper('%' || '"+searchText+"' || '%'),' ','')" 
		         +" or replace(upper(c_title),' ','') LIKE replace(upper('%' || '"+searchText+"' || '%'),' ','')"
		         + " order by c_date desc) C)"
		         + " where num BETWEEN "+startrow+" and "+endrow;
		         
		      }else {
		         course_list_sql= "select C_NO, C_TITLE, P_NAME, to_char(c_date,'yyyy-MM-DD') as C_DATE, C_VOL, C_CONTENT, C_IMG, C_RESDATE, C_RESALTDATE \r\n"
		                     + "from(select rownum num, C.* from \r\n"
		                     + "(select * from course \r\n"
		                     + "where replace(upper("+col+"),' ','') LIKE replace(upper('%' || '"+searchText+"' || '%'),' ','') \r\n"
		                     + "order by c_date desc) C)\r\n"
		                     + "where num BETWEEN "+startrow+" and "+endrow;
		      }
		      try{
		    	  
		         pstmt = con.createStatement();
		         rs = pstmt.executeQuery(course_list_sql);
		         
		         while(rs.next()){
		            course = new CourseBean();
		            course.setC_NO(rs.getInt("C_NO"));
		            course.setC_TITLE(rs.getString("C_TITLE"));   
		            course.setP_NAME(rs.getString("P_NAME"));
		            course.setC_DATE(rs.getString("C_DATE"));
		            course.setC_VOL(rs.getInt("C_VOL"));
		            course.setC_CONTENT(rs.getString("C_CONTENT"));
		            course.setC_IMG(rs.getString("C_IMG"));
		            course.setC_RESDATE(rs.getString("C_RESDATE"));
		            course.setC_RESALTDATE(rs.getString("C_RESALTDATE"));
		            courseList.add(course);
		         }

		      }catch(Exception ex){
		         System.out.println("getCourseList 에러 : " + ex);
		      }finally{
		         close(rs);
		         close(pstmt);
		      }

		      return courseList;

		   }
	   
	 //사용자 강의 목록 보기.	
		public ArrayList<CourseBean> selectUserCourseList(int page,int limit){

			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String course_list_sql="select C_NO, C_TITLE, P_NAME, to_char(c_date, 'YYYY-MM-DD') as C_DATE, C_VOL, C_CONTENT, C_IMG, C_RESDATE, C_RESALTDATE from (select rownum rnum, c.* from (select * from course order by c_date desc) c ) where rnum between ? and ?";
			ArrayList<CourseBean> courseList = new ArrayList<CourseBean>();
			CourseBean course = null;
			int startrow=(page-1)*8+1; //읽기 시작할 row 번호..	
			int endrow=(page-1)*8+8;

			try{
				pstmt = con.prepareStatement(course_list_sql);
				pstmt.setInt(1, startrow);
				pstmt.setInt(2, endrow);
				rs = pstmt.executeQuery();

				while(rs.next()){
				course = new CourseBean();
				course.setC_NO(rs.getInt("C_NO"));
	            course.setC_TITLE(rs.getString("C_TITLE"));
	            course.setP_NAME(rs.getString("P_NAME"));
	            course.setC_DATE(rs.getString("C_DATE"));
	            course.setC_RESDATE(rs.getString("C_RESDATE"));
	            course.setC_RESALTDATE(rs.getString("C_RESALTDATE"));
					courseList.add(course);
				}

			}catch(Exception ex){
				System.out.println("getCourseList 에러 : " + ex);
			}finally{
				close(rs);
				close(pstmt);
			}

			return courseList;

		}
	   //사용자 강의 검색 결과 목록 보기.	
	   public ArrayList<CourseBean> selectUserSearchCourseList(String C_COL, String searchText, int pageNumber) {
		   Statement pstmt = null;
		   ResultSet rs = null;
		   ArrayList<CourseBean> courseList = new ArrayList<CourseBean>();
		   CourseBean course = null;
		   int startrow=(pageNumber-1)*8+1; //읽기 시작할 row 번호..   
		   int endrow=(pageNumber-1)*8+8;
		   
		   String col=null;
		   String text=searchText;
		   String course_list_sql=null;
		   
		   if(C_COL!=null || searchText !="") {
			   col=C_COL;
			   text=searchText;
		   }
		   
		   
		   if("ALL".equals(col)){
			   
			   course_list_sql="select C_NO, C_TITLE, P_NAME, to_char(c_date, 'YYYY-MM-DD') as C_DATE, C_VOL, C_CONTENT, C_IMG, C_RESDATE, C_RESALTDATE" 
					   +" from(select rownum num, c.* from (select * from course" 
					   +" where replace(upper(p_name),' ','') LIKE replace(upper('%' || '"+searchText+"' || '%'),' ','')" 
					   +" or replace(upper(c_title),' ','') LIKE replace(upper('%' || '"+searchText+"' || '%'),' ','')"
					   + " order by c_date desc) C)"
					   + " where num BETWEEN "+startrow+" and "+endrow;
			   
		   }else {
			   course_list_sql= "select C_NO, C_TITLE, P_NAME, to_char(c_date,'yyyy-MM-DD') as C_DATE, C_VOL, C_CONTENT, C_IMG, C_RESDATE, C_RESALTDATE \r\n"
					   + "from(select rownum num, C.* from \r\n"
					   + "(select * from course \r\n"
					   + "where replace(upper("+col+"),' ','') LIKE replace(upper('%' || '"+searchText+"' || '%'),' ','') \r\n"
					   + "order by c_date desc) C)\r\n"
					   + "where num BETWEEN "+startrow+" and "+endrow;
		   }
		   try{
			   
			   pstmt = con.createStatement();
			   rs = pstmt.executeQuery(course_list_sql);
			   
			   while(rs.next()){
				   course = new CourseBean();
				   course.setC_NO(rs.getInt("C_NO"));
				   course.setC_TITLE(rs.getString("C_TITLE"));   
				   course.setP_NAME(rs.getString("P_NAME"));
				   course.setC_DATE(rs.getString("C_DATE"));
				   course.setC_VOL(rs.getInt("C_VOL"));
				   course.setC_CONTENT(rs.getString("C_CONTENT"));
				   course.setC_IMG(rs.getString("C_IMG"));
				   course.setC_RESDATE(rs.getString("C_RESDATE"));
				   course.setC_RESALTDATE(rs.getString("C_RESALTDATE"));
				   courseList.add(course);
			   }
			   
		   }catch(Exception ex){
			   System.out.println("getCourseList 에러 : " + ex);
		   }finally{
			   close(rs);
			   close(pstmt);
		   }
		   
		   return courseList;
		   
	   }

	   //강의 검색 결과 개수 구하기.
		   public int selectSearchListCount(String C_COL, String searchText, int pageNumber) {
		      int listCount= 0;
		      Statement pstmt = null;
		      ResultSet rs = null;
		      ArrayList<CourseBean> courseList = new ArrayList<CourseBean>();
		      CourseBean course = null;
		      String col=null;
		      String course_list_sql;
		         
		   
		      if(C_COL!=null) {
		         col=C_COL;
		      }
		      
		      if("ALL".equals(col)){
		         course_list_sql="select count(*) from course" 
		               + " where replace(upper(p_name),' ','') LIKE replace(upper('%' || '"+searchText+"' || '%'),' ','')" 
		               + " or replace(upper(c_title),' ','') LIKE replace(upper('%' || '"+searchText+"' || '%'),' ','')"
		               + " order by C_NO desc";
		         
		      }else {
		         course_list_sql= "select count(*) from course where replace(upper("+col+"),' ','') LIKE replace(upper('%' || '"+searchText+"' || '%'),' ','') order by C_NO desc";
		      }
		      
		      try{
		         pstmt= con.createStatement();
		         rs = pstmt.executeQuery(course_list_sql);
		         
		      if(rs.next()){
		         listCount=rs.getInt(1);
		         }
		         
		      }catch(Exception ex){
		         System.out.println("getSearchListCount 에러: " + ex);         
		      }finally{
		         close(rs);
		         close(pstmt);
		      }

		      return listCount;
		   }


}
