package dao;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.sql.DataSource;
import javax.websocket.Session;

import vo.BoardBean;
import vo.ReplyBean;
public class BoardDAO {

	DataSource ds;
	Connection con;
	private static BoardDAO boardDAO;

	private BoardDAO() {
		// TODO Auto-generated constructor stub
	}

	public static BoardDAO getInstance(){
		if(boardDAO == null){
			boardDAO = new BoardDAO();
		}
		return boardDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}

	//글의 개수 구하기.
	public int selectListCount() {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{


			System.out.println("getConnection");
			pstmt=con.prepareStatement("select count(*) from board");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){
			System.out.println("getListCount 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}

		return listCount;

	}
	


	
	
	//글 목록 보기.	
	public ArrayList<BoardBean> selectArticleList(int pageNumber){

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String board_list_sql="select B_no,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT, to_char(B_DATE,'MM-DD') as B_DATE from (\r\n"
				+ "select rownum num, B.* from \r\n"
				+ "(select* from board order by b_no desc) B\r\n"
				+ ")\r\n"
				+ "where num BETWEEN ? and ? ";
		
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		BoardBean board = null;
		int startrow=(pageNumber-1)*10+1; //읽기 시작할 row 번호..	
		int endrow=(pageNumber-1)*10+10;


		try{
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				board = new BoardBean();
				board.setB_NO(rs.getInt("B_NO"));
				board.setM_ID(rs.getString("M_ID"));
				board.setB_SUBJECT(rs.getString("B_SUBJECT"));
				board.setB_CONTENT(rs.getString("B_CONTENT"));
				board.setB_FILE(rs.getString("B_FILE"));
				board.setB_READCOUNT(rs.getInt("B_READCOUNT"));
				board.setB_DATE(rs.getString("B_DATE"));
				articleList.add(board);
			}

		}catch(Exception ex){
			System.out.println("getBoardList 에러 : " + ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return articleList;

	}

	//글 내용 보기.
	public BoardBean selectArticle(int b_no){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardBean boardBean = null;

		try{
			pstmt = con.prepareStatement( "select B_NO,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT, to_char(B_DATE,'yy-MM-DD hh:MI:ss') as B_DATE from board where B_No = ?");
			pstmt.setInt(1, b_no);
			rs= pstmt.executeQuery();

			if(rs.next()){
				boardBean = new BoardBean();
				boardBean.setB_NO(rs.getInt("B_NO"));
				boardBean.setM_ID(rs.getString("M_ID"));
				boardBean.setB_SUBJECT(rs.getString("B_SUBJECT"));
				boardBean.setB_CONTENT(rs.getString("B_CONTENT"));
				boardBean.setB_FILE(rs.getString("B_FILE"));
				boardBean.setB_READCOUNT(rs.getInt("B_READCOUNT"));
				boardBean.setB_DATE(rs.getString("B_DATE"));
			}
		}catch(Exception ex){
			System.out.println("getDetail 에러 : " + ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return boardBean;

	}

	//글 등록.
	public int insertArticle(BoardBean article){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;

		try{
			pstmt=con.prepareStatement("select max(b_No) from board");
			rs = pstmt.executeQuery();

			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;

			sql="insert into board (B_No,M_ID,B_SUBJECT,";
			sql+="B_CONTENT, B_FILE,B_READCOUNT,"+
					"B_DATE) values(?,?,?,?,?,?,SYSDATE)";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getM_ID());
			pstmt.setString(3, article.getB_SUBJECT());
			pstmt.setString(4, article.getB_CONTENT());
			pstmt.setString(5, article.getB_FILE());
			pstmt.setInt(6, 0);
		

			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
			System.out.println("boardInsert 에러 : "+ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

	//글 수정.
	public int updateArticle(BoardBean article){

		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql=null;
		String b_file=article.getB_FILE();
		System.out.println(b_file);
		if(b_file!=null) {
			sql="update board set B_SUBJECT=?,B_CONTENT=?, B_FILE=? where B_NO=?";
		}
		else {
			sql="update board set B_SUBJECT=?,B_CONTENT=? where B_NO=?";			
		}
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getB_SUBJECT());
			pstmt.setString(2, article.getB_CONTENT());
			if(b_file!=null) {
				pstmt.setString(3, article.getB_FILE());
				pstmt.setInt(4, article.getB_NO());
			}else {
				pstmt.setInt(3, article.getB_NO());
			}		
			updateCount = pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("boardModify 에러 : " + ex);
		}finally{
			close(pstmt);
		}

		return updateCount;

	}

	//글 삭제.
	public int deleteArticle(int b_no){

		PreparedStatement pstmt = null;
		String board_delete_sql="delete from board where B_no=?";
		int deleteCount=0;

		try{
			pstmt=con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, b_no);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("boardDelete 에러 : "+ex);
		}	finally{
			close(pstmt);
		}

		return deleteCount;

	}
	//파일 삭제--------------------------------------
	public int deleteFile(int b_no){

		PreparedStatement pstmt = null;
		String board_delete_sql="";
		int deleteCount=0;

		try{
			pstmt=con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, b_no);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println(" 에러 : "+ex);
		}	finally{
			close(pstmt);
		}

		return deleteCount;

	}
	

	//조회수 업데이트.
	public int updateReadCount(int b_no){

		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql="update board set B_READCOUNT = "+
				"B_READCOUNT+1 where b_no = " +b_no;

		try{
			pstmt=con.prepareStatement(sql);
			updateCount = pstmt.executeUpdate();
		}catch(SQLException ex){
			System.out.println("setReadCountUpdate 에러 : "+ex);
		}
		finally{
			close(pstmt);

		}

		return updateCount;

	}

	//글쓴이인지 확인.
	public boolean isArticleBoardWriter(int b_no,String m_id){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_sql="select * from board where B_no=?";
		boolean isWriter = false;

		try{
			pstmt=con.prepareStatement(board_sql);
			pstmt.setInt(1, b_no);
			rs=pstmt.executeQuery();
			rs.next();
			
			if(m_id.equals(rs.getString("M_ID"))||m_id.equals("admin")){
				isWriter = true;
			}
		}catch(SQLException ex){
			System.out.println("isBoardWriter 에러 : "+ex);
		}
		finally{
			close(pstmt);
		}

		return isWriter;

	}
	
	//댓글 등록.
		public int insertReplyArticle(ReplyBean article){

			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int num =0;
			String sql="";
			int insertCount=0;

			try{
				pstmt=con.prepareStatement("select max(r_no) from reply");
				rs = pstmt.executeQuery();

				if(rs.next())
					num =rs.getInt(1)+1;
				else
					num=1;

				sql="insert into reply (r_no,M_id,r_comment,B_No,r_Date)values(?,?,?,?,sysdate)";
			
			
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2,article.getM_ID());
				pstmt.setString(3, article.getR_comment());
				pstmt.setInt(4,article.getB_NO());
				
		
				insertCount=pstmt.executeUpdate();

			}catch(Exception ex){
				System.out.println("boardInsert 에러 : "+ex);
			}finally{
				close(rs);
				close(pstmt);
			}

			return insertCount;

		}
	
//	댓글목록 보기

	public ArrayList<ReplyBean> selectReply(int b_no){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select M_ID,r_comment,r_no ,to_char(r_DATE,'yy-MM-DD hh:MI:ss') as r_date from reply where b_no=? ";
		ArrayList<ReplyBean> articleList = new ArrayList<ReplyBean>();
		ReplyBean reply = null;
	
		try{
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, b_no);
			rs= pstmt.executeQuery();
			
			while(rs.next()){
				reply=new ReplyBean();
				reply.setM_ID(rs.getString("M_ID"));
				reply.setR_comment(rs.getString("r_comment"));
				reply.setR_date(rs.getString("r_date"));
				reply.setR_NO(rs.getInt("r_no"));
				articleList.add(reply);
			}

		}catch(Exception ex){
			System.out.println("getReplyBoardList 에러 : " + ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return articleList;

	}
	
	//댓글삭제
	
	public int deleteReplyArticle(ReplyBean article){

		PreparedStatement pstmt = null;
		String board_delete_sql="delete from reply where B_no=? and r_no=? ";
		int deleteCount=0;		
		try{
			pstmt=con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, article.getB_NO());
			pstmt.setInt(2,article.getR_NO());
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("boardDelete 에러 : "+ex);
		}	finally{
			close(pstmt);
		}

		return deleteCount;

	}
	//댓글 글쓴이 확인
	public boolean isArticleReplydWriter(int r_no,String m_id){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_sql="select * from reply where r_no=?";
	
		boolean isWriter = false;
		System.out.println(m_id);
		try{
			pstmt=con.prepareStatement(board_sql);
			System.out.println(board_sql);
			pstmt.setInt(1, r_no);
			rs=pstmt.executeQuery();
			rs.next();
			if(m_id.equals(rs.getString("M_ID")) || m_id.equals("admin")){
				
				isWriter = true;
			}
		}catch(SQLException ex){
			System.out.println("isBoardWriter 에러 : "+ex);
		}
		finally{
			close(pstmt);
		}

		return isWriter;

	}
	
	//댓글 수정.
	public int ReplyupdateArticle(ReplyBean article){

		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql="update reply set r_Comment=?, r_date=sysdate where r_no=? ";

		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getR_comment());
			pstmt.setInt(2, article.getR_NO());
			updateCount = pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("댓글 수정 에러 : " + ex);
		}finally{
			close(pstmt);
		}

		return updateCount;

	}
	
	//검색글 목록 보기.	
		public ArrayList<BoardBean> selectSearchArticleList(String B_COL,String searchText,int pageNumber){

			Statement pstmt = null;
			ResultSet rs = null;
			ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
			BoardBean board = null;
			int startrow=(pageNumber-1)*10+1; //읽기 시작할 row 번호..	
			int endrow=(pageNumber-1)*10+10;
			
			String col=null;

			if(B_COL!=null) {
				col=B_COL;
			}
			String board_list_sql="select B_no,M_ID,B_SUBJECT,B_CONTENT,B_FILE,B_READCOUNT, to_char(B_DATE,'yyyy-MM-DD') as B_DATE from (\r\n"
					+ "select rownum num, B.* from \r\n"
					+ "(select* from board \r\n"
					+ "where replace(trim(upper("+col+")),' ','')  LIKE replace(trim(upper('%' || '"+searchText +"' || '%' \r\n"
					+ ")),' ','')order by b_no desc) B\r\n"
					+ ")\r\n"
					+ "where num BETWEEN "+startrow+" and "+endrow;
	
			try{
				pstmt = con.createStatement();
				rs = pstmt.executeQuery(board_list_sql);
				
				while(rs.next()){
					board = new BoardBean();
					board.setB_NO(rs.getInt("B_NO"));
					board.setM_ID(rs.getString("M_ID"));
					board.setB_SUBJECT(rs.getString("B_SUBJECT"));
					board.setB_CONTENT(rs.getString("B_CONTENT"));
					board.setB_FILE(rs.getString("B_FILE"));
					board.setB_READCOUNT(rs.getInt("B_READCOUNT"));
					board.setB_DATE(rs.getString("B_DATE"));
					articleList.add(board);
				}

			}catch(Exception ex){
				System.out.println("getBoardList 에러 : " + ex);
			}finally{
				close(rs);
				close(pstmt);
			}

			return articleList;

		}

		//검색 글의 개수 구하기.
		public int selectSearchListCount(String B_COL,String searchText,int pageNumber) {
			
			int listCount= 0;
			Statement pstmt = null;
			ResultSet rs = null;
			ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
			BoardBean board = null;
			String col=null;
				
		
			if(B_COL!=null) {
				col=B_COL;
			}
			
			try{	
				pstmt= con.createStatement();
				String board_list_sql="select count(*) from board where replace(trim(upper("+col+")),' ','')  LIKE replace(trim(upper('%' || '"+searchText+"' || '%' )),' ','') order by B_no desc";
				rs = pstmt.executeQuery(board_list_sql);
			
			if(rs.next()){
				listCount=rs.getInt(1);
				}
				
			}catch(Exception ex){
				System.out.println("getListCount 에러: " + ex);			
			}finally{
				close(rs);
				close(pstmt);
			}

			return listCount;

		}
}
