package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.connector.Request;

import dao.BoardDAO;
import vo.ReplyBean;

public class BoardReplyProService {

	public boolean replyArticle(ReplyBean article) throws Exception{
		// TODO Auto-generated method stub
		
	
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		int insertCount = boardDAO.insertReplyArticle(article);
		
		if(insertCount > 0){
			commit(con);
			isWriteSuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isWriteSuccess;
		
	}

}
