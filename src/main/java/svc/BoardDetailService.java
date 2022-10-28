package svc;

import java.sql.Connection;
import javax.servlet.http.HttpServletRequest;
import dao.BoardDAO;
import vo.BoardBean;


import static db.JdbcUtil.*;

public class BoardDetailService {

	public BoardBean getArticle(int b_no, HttpServletRequest request) throws Exception{
		// TODO Auto-generated method stub
		
		BoardBean article = null;
		
		
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		
		if( !(command.equals("/boardModifyForm.bo") || request.getParameter("check")!=null ) ) {
			int updateCount = boardDAO.updateReadCount(b_no);
			
			if(updateCount > 0){
				commit(con);
			}
			else{
				rollback(con);
			}
		}
		
		article = boardDAO.selectArticle(b_no);
		close(con);
		return article;
		
	}

}
