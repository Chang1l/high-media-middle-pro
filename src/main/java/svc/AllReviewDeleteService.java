package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;
import java.sql.Connection;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReviewDAO;

public class AllReviewDeleteService {

	public boolean removeArticle2(int review_num) throws Exception{
		
		boolean isRemoveSuccess = false;
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		int deleteCount = reviewDAO.deleteArticle2(review_num);
		
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
