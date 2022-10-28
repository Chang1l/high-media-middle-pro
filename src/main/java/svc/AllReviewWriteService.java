package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.ReviewDAO;
import vo.ReviewBean;

public class AllReviewWriteService {
	
	public boolean allReviewArticle(ReviewBean reviewBean) throws Exception {
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		int insertCount = reviewDAO.insertAllReviewArticle(reviewBean);
		
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
