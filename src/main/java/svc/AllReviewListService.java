package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ReviewDAO;
import vo.ReviewBean;
public class AllReviewListService {
	
	public int getListCount() throws Exception{
		
		int listCount = 0;
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		listCount = reviewDAO.selectAllListCount();
		close(con);
		return listCount;
		
	}
	
	public ArrayList<ReviewBean> getReviewList(int pageNumber) throws Exception {
		ArrayList<ReviewBean> reviewList = null;
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		reviewList = reviewDAO.selectAllReviewList(pageNumber);
		close(con);
		return reviewList;
	}
	
	public ArrayList<ReviewBean> getMainReviewList() throws Exception {
		ArrayList<ReviewBean> reviewList = null;
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		reviewList = reviewDAO.selectAllReviewList();
		close(con);
		return reviewList;
	}
	

}
