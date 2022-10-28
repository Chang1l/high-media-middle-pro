package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;
import java.sql.Connection;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReviewDAO;

public class ReviewDeleteService {

	public boolean removeArticle(int review_num) throws Exception{
		
		boolean isRemoveSuccess = false;
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		int deleteCount = reviewDAO.deleteArticle(review_num);
		
		if(deleteCount > 0) {
			commit(con);
			isRemoveSuccess = true;			
		} else {
			rollback(con);
		}
		close(con);
		return isRemoveSuccess;
	}
	
	
}
