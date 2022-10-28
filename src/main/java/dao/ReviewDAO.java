package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import vo.ReviewBean;

public class ReviewDAO {

	DataSource ds;
	Connection con;
	private static ReviewDAO reviewDAO;

	private ReviewDAO() {
		// TODO Auto-generated constructor stub
	}

	public static ReviewDAO getInstance(){
		if(reviewDAO == null){
			reviewDAO = new ReviewDAO();
		}
		return reviewDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}
	
	//모든 후기 List에 출력
	public ArrayList<ReviewBean> selectAllReviewList(int pageNumber) {
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from allReview order by all_review_id desc";
		ArrayList<ReviewBean> reviewList = new ArrayList<ReviewBean>();
		ReviewBean rvo = null;
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				rvo = new ReviewBean();
				rvo.setAll_review_id(rs.getInt("ALL_REVIEW_ID"));
				rvo.setM_id(rs.getString("M_ID"));
				rvo.setReview_name(rs.getString("REVIEW_NAME"));
				rvo.setReview_job(rs.getString("REVIEW_JOB"));
				rvo.setReview_contents(rs.getString("REVIEW_CONTENTS"));
				reviewList.add(rvo);
							
			}
		}catch(Exception e) {
				System.out.println("allReviewList 에러: " + e);
		}finally {
			close(rs);
			close(stmt);
		}
		return reviewList;
	}
	
	
	//후기 List에 출력
	public ArrayList<ReviewBean> selectReviewList(int pageNumber) {
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from Review order by review_id desc";
		ArrayList<ReviewBean> reviewList = new ArrayList<ReviewBean>();
		ReviewBean rvo = null;
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				rvo = new ReviewBean();
				rvo.setReview_id(rs.getInt("REVIEW_ID"));
				rvo.setReview_name(rs.getString("REVIEW_NAME"));
				rvo.setReview_job(rs.getString("REVIEW_JOB"));
				rvo.setReview_contents(rs.getString("REVIEW_CONTENTS"));
				rvo.setReview_count(rs.getInt("REVIEW_COUNT"));
				reviewList.add(rvo);
								
			}
		}catch(Exception e) {
				System.out.println("reviewList 에러: " + e);
		}finally {
			close(rs);
			close(stmt);
		}
		return reviewList;
	}
	
	
	
	//후기 index에 출력
	public ArrayList<ReviewBean> selectReviewList() {
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from Review";
		ArrayList<ReviewBean> reviewList = new ArrayList<ReviewBean>();
		ReviewBean rvo = null;
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				rvo = new ReviewBean();
				rvo.setReview_id(rs.getInt("REVIEW_ID"));
				rvo.setReview_name(rs.getString("REVIEW_NAME"));
				rvo.setReview_job(rs.getString("REVIEW_JOB"));
				rvo.setReview_contents(rs.getString("REVIEW_CONTENTS"));
				reviewList.add(rvo);
								
			}
		}catch(Exception e) {
				System.out.println("reviewList 에러: " + e);
		}finally {
			close(rs);
			close(stmt);
		}
		return reviewList;
	}
	
	//모든 후기 index에 출력
	public ArrayList<ReviewBean> selectAllReviewList() {
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from allReview";
		ArrayList<ReviewBean> reviewList = new ArrayList<ReviewBean>();
		ReviewBean rvo = null;
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				rvo = new ReviewBean();
				rvo.setAll_review_id(rs.getInt("ALL_REVIEW_ID"));
				rvo.setReview_name(rs.getString("REVIEW_NAME"));
				rvo.setReview_job(rs.getString("REVIEW_JOB"));
				rvo.setReview_contents(rs.getString("REVIEW_CONTENTS"));
				reviewList.add(rvo);
								
			}
		}catch(Exception e) {
				System.out.println("AllreviewList 에러: " + e);
		}finally {
			close(rs);
			close(stmt);
		}
		return reviewList;
	}
	
	
	//후기 등록
	public int insertReviewArticle(ReviewBean article) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		String sql = "";
		int insertCount = 0;
		
		try {
			pstmt = con.prepareStatement("select max(review_id) from review");
			rs = pstmt.executeQuery();
			
			if(rs.next())
				num = rs.getInt(1)+1;
			else
				num = 1;
			
			sql = "insert into review (review_id, review_name, review_job, review_contents) values (?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getReview_name());
			pstmt.setString(3, article.getReview_job());
			pstmt.setString(4, article.getReview_contents());
			
			insertCount = pstmt.executeUpdate();
			
			
		}catch(Exception ex) {
			System.out.println("reviewInsert 에러: "+ex);
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return insertCount;
	}

	
	//모든 후기 등록
	public int insertAllReviewArticle(ReviewBean reviewBean) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		String sql = "";
		int insertCount = 0;
		
		try {
			pstmt = con.prepareStatement("select max(all_review_id) from allreview");
			rs = pstmt.executeQuery();
			
			if(rs.next())
				num = rs.getInt(1)+1;
			else
				num = 1;
			
			sql = "insert into allreview (review_name, review_job, review_contents, m_id, all_review_id) values (?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reviewBean.getReview_name());
			pstmt.setString(2, reviewBean.getReview_job());
			pstmt.setString(3, reviewBean.getReview_contents());
			pstmt.setString(4, reviewBean.getM_id());
			pstmt.setInt(5, num);
			
			insertCount = pstmt.executeUpdate();
			
			
		}catch(Exception ex) {
			System.out.println("AllreviewInsert 에러: "+ex);
		}finally {
			close(pstmt);
		}
		
		return insertCount;
	}
	
	//후기 목록
	public ArrayList<ReviewBean> selectArticleList(int pageNumber){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String review_list_sql = "select review_id, review_name, review_job, review_contents, review_count from (select rownum num, n.* from (select * from review order by review_id desc ) N ) where num between ? and ?";
		
		ArrayList<ReviewBean> articleList = new ArrayList<ReviewBean>();
		ReviewBean review = null;
		int startrow = (pageNumber-1)*10+1; //읽기 시작할 row 번호
		int endrow=(pageNumber-1)*10+10;
		
		try {
			pstmt = con.prepareStatement(review_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				review = new ReviewBean();
				review.setReview_id(rs.getInt("REVIEW_ID"));
				review.setReview_name(rs.getString("REVIEW_NAME"));
				review.setReview_job(rs.getString("REVIEW_JOB"));
				review.setReview_contents(rs.getString("REVIEW_CONTENTS"));
				review.setReview_count(rs.getInt("REVIEW_COUNT"));
			}
		}catch(Exception ex) {
			System.out.println("getReviewList 에러: " + ex);
		}finally {
			close(rs);
			close(pstmt);
		}						
		return articleList;
	}
	
	//모든 후기 목록
	public ArrayList<ReviewBean> allReviewList(int pageNumber){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select m_id, review_name, review_job, review_contents, review_count, all_review_id from (select rownum num, n.* from (select * from allreview order by all_review_id desc ) N ) where num between ? and ?";
		
		ArrayList<ReviewBean> reviewList = new ArrayList<ReviewBean>();
		ReviewBean review = null;
		int startrow = (pageNumber-1)*10+1;
		int endrow = (pageNumber-1)*10+10;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				review = new ReviewBean();
				review.setAll_review_id(rs.getInt("ALL_REVIEW_ID"));
				review.setReview_name(rs.getString("REVIEW_NAME"));
				review.setReview_job(rs.getString("REVIEW_JOB"));
				review.setReview_contents(rs.getString("REVIEW_CONTENTS"));
			}
			
		} catch(Exception ex) {
			System.out.println("getAllReviewList 에러: "+ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return reviewList;
	}

	
	//후기 상세 조회
	public ReviewBean selectArticle(int review_id) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReviewBean reviewBean = null;
		
		try {
			pstmt = con.prepareStatement("select review_id, review_name, review_job, review_contents, review_count from review where review_id = ?");
			pstmt.setInt(1, review_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				reviewBean = new ReviewBean();
				reviewBean.setReview_id(rs.getInt("REVIEW_ID"));
				reviewBean.setReview_name(rs.getString("REVIEW_NAME"));
				reviewBean.setReview_job(rs.getString("REVIEW_JOB"));
				reviewBean.setReview_contents(rs.getString("REVIEW_CONTENTS"));
				reviewBean.setReview_count(rs.getInt("REVIEW_COUNT"));
				}
		} catch(Exception ex) {
			System.out.println("getDetail 에러: "+ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return reviewBean;
	}
	
	//후기 수정
	public int updateArticle(ReviewBean article) {
		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql = null;
		sql = "update review set REVIEW_NAME =?, REVIEW_JOB =?, REVIEW_CONTENTS = ? where REVIEW_ID=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getReview_name());
			pstmt.setString(2, article.getReview_job());
			pstmt.setString(3, article.getReview_contents());
			pstmt.setInt(4, article.getReview_id());
			updateCount = pstmt.executeUpdate();
		} catch(Exception ex) {
			System.out.println("reviewModify 에러: " + ex);
		} finally {
			close(pstmt);
		}
		
		return updateCount;
	}
	
	//후기 삭제
	public int deleteArticle(int review_id) {
		PreparedStatement pstmt = null;
		String review_delete_sql = "delete from review where review_id=?";
		int deleteCount = 0;
		
		try {
			pstmt = con.prepareStatement(review_delete_sql);
			pstmt.setInt(1, review_id);
			deleteCount = pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("reviewDelete 에러: " + ex);			
		} finally {
			close(pstmt);
		}
		return deleteCount;
	}
	
	//[모든 후기 리스트]에서 후기 삭제
	public int deleteArticle2(int all_review_id) {
		PreparedStatement pstmt = null;
		String review_delete_sql = "delete from allReview where all_review_id=?";
		int deleteCount = 0;
		
		try {
			pstmt = con.prepareStatement(review_delete_sql);
			pstmt.setInt(1, all_review_id);
			deleteCount = pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("allReviewDelete 에러: " + ex);			
		} finally {
			close(pstmt);
		}
		return deleteCount;
	}
	
	
	//글의 개수 구하기
	public int selectListCount() {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			System.out.println("getConnection");
			pstmt = con.prepareStatement("select count(*) from review");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch(Exception ex) {
			System.out.println("getListCount 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}
	
	
	//모든 후기 글의 개수 구하기
	public int selectAllListCount() {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			System.out.println("getConnection");
			pstmt = con.prepareStatement("select count(*) from allreview");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);


			}
		} catch(Exception ex) {
			System.out.println("getListCount 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}
	
	
	
	
	//후기 조회수 증가
	public int updateReadCount(int review_id) {
		
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql = "update review set review_count = "+"review_count+1 where review_id = " + review_id;
		
		try {
			pstmt = con.prepareStatement(sql);
			updateCount = pstmt.executeUpdate();
		} catch(SQLException ex) {
			System.out.println("setReadCountUpdate 에러: "+ex);
		} finally {
			close(pstmt);
		}
		return updateCount;
		
	}
	
	public ReviewBean selectOneReview(int all_review_id) {
		ReviewBean reviewBean = null;
		reviewBean = new ReviewBean();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from allReview where all_review_id=?";
				
				try {
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, all_review_id);
					rs = pstmt.executeQuery();
					while(rs.next()) {
						reviewBean.setReview_name(rs.getString("review_name"));
						reviewBean.setReview_job(rs.getString("review_job"));
						reviewBean.setReview_contents(rs.getString("review_contents"));
						
					}
				} catch(SQLException ex) {
					System.out.println("setReadCountUpdate 에러: "+ex);
	} finally {
		close(rs);
		close(pstmt);
	}
				return reviewBean;
	
	
}
}