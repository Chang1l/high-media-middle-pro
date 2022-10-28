package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import org.apache.catalina.connector.Request;

import dao.ReviewDAO;
import vo.ReviewBean;

public class ReviewWriteService {
	
	public boolean reviewArticle(ReviewBean article) throws Exception {
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		int insertCount = reviewDAO.insertReviewArticle(article);
		
		if(insertCount > 0) {
			commit(con);
			isWriteSuccess = true;
		}
		else {
			rollback(con);
		}
		
		close(con);
		return isWriteSuccess;
		
	}

}
