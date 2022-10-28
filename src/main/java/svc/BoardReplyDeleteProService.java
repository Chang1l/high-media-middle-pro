package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.connector.Request;

import dao.BoardDAO;
import vo.ReplyBean;

public class BoardReplyDeleteProService {

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
	public boolean replyDeleteArticle(ReplyBean article) throws Exception{
		// TODO Auto-generated method stub
		
	
		boolean isDeleteSuccess = false;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		int deleteCount = boardDAO.deleteReplyArticle(article);
	
		if(deleteCount > 0){
			commit(con);
			isDeleteSuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isDeleteSuccess;
		
	}

}
