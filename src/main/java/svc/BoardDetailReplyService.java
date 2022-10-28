package svc;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import dao.BoardDAO;

import vo.ReplyBean;

import static db.JdbcUtil.*;

public class BoardDetailReplyService {
	public int getListCount() throws Exception{
		// TODO Auto-generated method stub
		
		int listCount = 0;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		listCount = boardDAO.selectListCount();
		close(con);
		return listCount;
		
	}

	public ArrayList<ReplyBean> getArticleList(int board_num) throws Exception{
		
		ArrayList<ReplyBean> articleList = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		articleList = boardDAO.selectReply(board_num);
		close(con);
		return articleList;
		
	}

}
