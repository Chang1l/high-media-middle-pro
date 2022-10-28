package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import dao.BoardDAO;
import vo.ReplyBean;


public class BoardReplyUpdateProService {

	public boolean isArticleWriter(int r_no, String m_id) throws Exception {
		// TODO Auto-generated method stub
		
		boolean isArticleWriter = false;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		isArticleWriter = boardDAO.isArticleReplydWriter(r_no, m_id);
		close(con);
		return isArticleWriter;
		
	}

	public boolean replyUpdaterticle(ReplyBean article) throws Exception {
		// TODO Auto-generated method stub
		
		boolean isModifySuccess = false;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		int updateCount = boardDAO.ReplyupdateArticle(article);
		
		if(updateCount > 0){
			commit(con);
			isModifySuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isModifySuccess;
		
	}

}
