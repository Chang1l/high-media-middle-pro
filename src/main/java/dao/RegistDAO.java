package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;
import javax.swing.plaf.basic.BasicSplitPaneUI.KeyboardResizeToggleHandler;

import vo.CourseBean;
import vo.RegistBean;

public class RegistDAO {

	DataSource ds;
	Connection con;
	private static RegistDAO registDAO;

	private RegistDAO() {
		// TODO Auto-generated constructor stub
	}

	public static RegistDAO getInstance() {
		if (registDAO == null) {
			registDAO = new RegistDAO();
		}
		return registDAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	// 등록 조회
	public ArrayList<RegistBean> selectRegistList(int page, int limit, String m_id) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
//		String regist_list_sql = "SELECT r.G_NO, r.C_NO, c.C_TITLE, c.C_DATE, c.P_NAME FROM REGIST r INNER JOIN COURSE c ON r.C_NO = c.C_NO";
//		String regist_list_sql = "SELECT ROWNUM, r.G_NO, r.C_NO, c.C_TITLE, c.C_DATE, c.P_NAME FROM REGIST r INNER JOIN COURSE c ON r.C_NO = c.C_NO WHERE ROWNUM BETWEEN ? AND ? AND r.M_ID = ?";
//		String regist_list_sql = "SELECT * FROM REGIST r INNER JOIN COURSE c ON r.C_NO = c.C_NO WHERE ROWNUM BETWEEN ? AND ? AND r.M_ID = ?";
		String regist_list_sql = "select * from (select rownum rnum, c.* from ( SELECT * FROM REGIST r INNER JOIN COURSE c ON r.C_NO = c.C_NO where r.M_ID = ? ) c )  where rnum between ? and ?";
		ArrayList<RegistBean> registList = new ArrayList<RegistBean>();
		RegistBean rb = null;
		int startrow = (page - 1) * 8 + 1; // 읽기 시작할 row 번호..
		int endrow = (page - 1) * 8 + 8;

		try {
			pstmt = con.prepareStatement(regist_list_sql);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);
			pstmt.setString(1, m_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				rb = new RegistBean();
				rb.setG_NO(rs.getInt("g_NO"));
				rb.setC_NO(rs.getInt("c_NO"));
				rb.setC_TITLE(rs.getString("c_TITLE"));
				rb.setC_DATE(rs.getString("c_DATE"));
				rb.setP_NAME(rs.getString("p_NAME"));
				rb.setC_VOL(rs.getInt("c_VOL"));
				rb.setC_IMG(rs.getString("c_IMG"));
				registList.add(rb);
			}

		} catch (Exception ex) {
			System.out.println("getRegistList 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return registList;

	}

	public ArrayList<RegistBean> selectRegistList(String m_id) {
		java.sql.Statement stmt = null;
		ResultSet rs = null;
		String id = m_id;
		String sql = "select r.g_no as G_NO, r.c_no as C_NO, c.c_title as C_TITLE, c.c_date as C_DATE, c.p_name as P_NAME from regist r inner join course c on r.c_no = c.c_no where r.m_id ='"
				+ id + "'";
		ArrayList<RegistBean> RegistList = new ArrayList<RegistBean>();
		RegistBean rb = null;

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				rb = new RegistBean();
				rb.setG_NO(rs.getInt("G_NO"));
				rb.setC_NO(rs.getInt("C_NO"));
				rb.setC_TITLE(rs.getString("C_TITLE"));
				rb.setC_DATE(rs.getString("C_DATE"));
				rb.setP_NAME(rs.getString("P_NAME"));
				RegistList.add(rb);
			}
		} catch (Exception e) {
			System.out.println("selectRegistList 에러: " + e);
		} finally {
			close(rs);
			close(stmt);
		}
		return RegistList;
	}

	// 삭제
	
	public int deleteRegist(int rno) {
		PreparedStatement pstmt = null;
		String sql = "";
		int g_no = rno;

		ResultSet rs = null;
		int deleteCount = 0;
		System.out.println(g_no);
		try {
			sql = "DELETE FROM REGIST WHERE G_NO = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, g_no);

			deleteCount = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("deleteRegist 에러: " + e);
		} finally {
			close(pstmt);
		}
		return deleteCount;
	}

	public int insertArticle(RegistBean regist) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;

		try{
			pstmt=con.prepareStatement("select max(g_No) from regist");
			rs = pstmt.executeQuery();

			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;

			sql="insert into regist (G_No,C_NO,M_ID) values(?,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, regist.getC_NO());
			pstmt.setString(3, regist.getM_ID());
		
			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
			System.out.println("registInsert 에러 : "+ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;
	}

	
	
	//글의 개수 구하기
	public int selectListCount(String m_id) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="SELECT count(*) FROM REGIST r INNER JOIN COURSE c ON r.C_NO = c.C_NO WHERE  r.M_ID = ?";
		try {
			System.out.println("getConnection");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,m_id);
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
	
	public ArrayList<RegistBean> selectRegistList(int page,int limit){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String regist_list_sql="select C_NO, C_TITLE, P_NAME, to_char(c_date, 'YYYY-MM-DD') as C_DATE, C_VOL, C_CONTENT, C_IMG, C_RESDATE, C_RESALTDATE from (select rownum rnum, c.* from (select * from course order by c_date desc) c ) where rnum between ? and ?";
		ArrayList<RegistBean> registList = new ArrayList<RegistBean>();
		RegistBean regist = null;
		int startrow=(page-1)*8+1; //읽기 시작할 row 번호..	
		int endrow=(page-1)*8+8;

		try {
			pstmt = con.prepareStatement(regist_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				regist = new RegistBean();
				regist.setG_NO(rs.getInt("g_NO"));
				regist.setC_NO(rs.getInt("c_NO"));
				regist.setC_TITLE(rs.getString("c_TITLE"));
				regist.setC_DATE(rs.getString("c_DATE"));
				regist.setP_NAME(rs.getString("p_NAME"));
				regist.setC_VOL(rs.getInt("c_VOL"));
				regist.setC_IMG(rs.getString("c_IMG"));
				registList.add(regist);
			}

		}catch(Exception ex){
			System.out.println("getCourseList 에러 : " + ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return registList;

	}

	public int selectInsertCount(RegistBean regist) {
		// TODO Auto-generated method stub
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String regist_list_sql = "select count(*) from regist where m_id= ? and c_no= ? ";
		int result=0;
		try {
			pstmt = con.prepareStatement(regist_list_sql);
			pstmt.setString(1, regist.getM_ID());
			pstmt.setInt(2,regist.getC_NO() );
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				result=rs.getInt(1);			
			}

		} catch (Exception ex) {
			System.out.println("insert c_no 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return result;
	
	}

	public int selectRegistCno(String m_id ,int cno) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String regist_list_sql = "select * from regist where m_id= ? and c_no= ? ";
		int result=0;
		try {
			pstmt = con.prepareStatement(regist_list_sql);
			pstmt.setString(1, m_id);
			pstmt.setInt(2,cno );
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				result=rs.getInt("c_no");			
			}

		} catch (Exception ex) {
			System.out.println("insert c_no 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return result;
		
	}
}
