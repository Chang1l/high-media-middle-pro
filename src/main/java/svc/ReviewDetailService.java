package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import dao.ReviewDAO;
import vo.ReviewBean;

public class ReviewDetailService {

	public ReviewBean getArticle(int review_id, HttpServletRequest request) throws Exception{
		
		ReviewBean article = null;
		
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		if( !(command.equals("/reviewModifyForm.me") || request.getParameter("check")!=null)) {
			int updateCount = reviewDAO.updateReadCount(review_id);
			
			if(updateCount > 0) {
				commit(con);
			}
			else {
				rollback(con);
			}
		}
		
		article = reviewDAO.selectArticle(review_id);
		close(con);
		return article;
	}
	
}
