package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.BoardDAO;
import vo.BoardBean;

public class BoardListService {

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

	public ArrayList<BoardBean> getArticleList(int pageNumber) throws Exception{
		
		ArrayList<BoardBean> articleList = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		articleList = boardDAO.selectArticleList(pageNumber);
		close(con);
		return articleList;
		
	}
	//검색 글수 카운트
	public int getSearchListCount(String B_COL,String searchText,int pageNumber) throws Exception{
		// TODO Auto-generated method stub
		
		int listCount = 0;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		listCount = boardDAO.selectSearchListCount(B_COL,searchText,pageNumber);
	
		close(con);
		return listCount;
		
	}
	
	//검색
	public ArrayList<BoardBean> getSearchArticleList(String B_COL,String searchText,int pageNumber) throws Exception{
		
		ArrayList<BoardBean> articleList = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		articleList = boardDAO.selectSearchArticleList(B_COL,searchText,pageNumber);
		close(con);
		return articleList;
		
	}
}
