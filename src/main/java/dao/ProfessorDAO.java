package dao;

import static db.JdbcUtil.*;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;
import vo.ProfessorVO;

public class ProfessorDAO {
	DataSource ds;
	Connection con;
	private static ProfessorDAO pao;
	
	private ProfessorDAO() {
		
	}
	
	public static ProfessorDAO getInstance() {
		if(pao == null) {
			pao= new ProfessorDAO();
		}
		return pao;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public int insertProfessor(ProfessorVO pvo) {
		PreparedStatement pstmt = null;
		String sql="";
		int insertCount=0;
		
		try {
			sql = "INSERT INTO PROFESSOR (P_ID, P_NAME, P_RECORD1, P_RECORD2, P_RECORD3, P_IMG, P_WORD) VALUES(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pvo.getP_id());
			pstmt.setString(2, pvo.getP_name());
			pstmt.setString(3, pvo.getP_record1());
			pstmt.setString(4, pvo.getP_record2());
			pstmt.setString(5, pvo.getP_record3());
			pstmt.setString(6, pvo.getP_img());
			pstmt.setString(7, pvo.getP_word());
			
			insertCount = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertProfessor 에러 : " + e);
		} finally {
			close(pstmt);
		}
		return insertCount;
	}
	
	public ArrayList<ProfessorVO> selectProfessorList() {
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from professor order by p_name";
		ArrayList<ProfessorVO> professorList = new ArrayList<ProfessorVO>();
		ProfessorVO pvo = null;
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				pvo = new ProfessorVO();
				pvo.setP_id(rs.getInt("P_ID"));
				pvo.setP_img(rs.getString("P_IMG"));
				pvo.setP_name(rs.getString("P_NAME"));
				pvo.setP_record1(rs.getString("P_RECORD1"));
				pvo.setP_record2(rs.getString("P_RECORD2"));
				pvo.setP_record3(rs.getString("P_RECORD3"));
				pvo.setP_word(rs.getString("P_WORD"));
				professorList.add(pvo);
			}
		}catch(Exception e) {
				System.out.println("selectProfessorList 에러: " + e);
		}finally {
			close(rs);
			close(stmt);
		}
		return professorList;
	}
	
	public int deleteProfessor(ProfessorVO pvo) {
		PreparedStatement pstmt = null;
		String sql = "";
		int p_id = pvo.getP_id();
		ResultSet rs = null;
		String filename = null;
		String filepath = null;
		int deleteCount = 0;
		
		
		try {
			sql = "SELECT * FROM PROFESSOR WHERE P_ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, p_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				filename = rs.getString("P_IMG");
			}
			
			filepath = "C:\\jspwork\\1project\\src\\main\\webapp\\professor\\ProfessorImg\\";
			
			File file = new File(filepath + filename);
			
			if(file.exists()) {
				file.delete();
			}
			
			sql = "DELETE FROM PROFESSOR WHERE P_ID = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, p_id);
			deleteCount = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("deleteProfessor 에러: " + e);
		} finally {
			close(pstmt);
		}
		return deleteCount;
	}
	
	public ProfessorVO selectProfessorInfo(int p_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProfessorVO professorInfo = null;
		
		try {
			pstmt = con.prepareStatement("SELECT * FROM PROFESSOR WHERE P_ID = ?");
			pstmt.setInt(1, p_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				professorInfo = new ProfessorVO();
				professorInfo.setP_id(rs.getInt("P_ID"));
				professorInfo.setP_name(rs.getString("P_NAME"));
				professorInfo.setP_record1(rs.getString("P_RECORD1"));
				professorInfo.setP_record2(rs.getString("P_RECORD2"));
				professorInfo.setP_record3(rs.getString("P_RECORD3"));
				professorInfo.setP_img(rs.getString("P_IMG"));
				professorInfo.setP_word(rs.getString("P_WORD"));
			}
		} catch (Exception e) {
			System.out.println("selectProfessorInfo 에러: " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return professorInfo;
	}
	
	public int updateProfessor(ProfessorVO pvo_original, ProfessorVO pvo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		String filename = null;
		String filepath = null;
		int updateCount = 0;
		
		try {
			if(pvo.getP_img() == null) {
				sql = "UPDATE PROFESSOR SET P_ID = ?, P_NAME = ?, P_RECORD1 = ?, P_RECORD2 = ?, P_RECORD3 = ?, P_WORD = ? WHERE P_ID = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, pvo.getP_id());
				pstmt.setString(2, pvo.getP_name());
				pstmt.setString(3, pvo.getP_record1());
				pstmt.setString(4, pvo.getP_record2());
				pstmt.setString(5, pvo.getP_record3());
				pstmt.setString(6, pvo.getP_word());
				pstmt.setInt(7, pvo_original.getP_id());
				
				updateCount = pstmt.executeUpdate();
			} else {
				sql = "SELECT * FROM PROFESSOR WHERE P_ID = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, pvo_original.getP_id());
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					filename = rs.getString("P_IMG");
				}
				
				filepath = "C:\\jspwork\\1project\\src\\main\\webapp\\professor\\ProfessorImg\\";
				
				File file = new File(filepath + filename);
				
				if(file.exists()) {
					file.delete();
				}
				
				sql = "UPDATE PROFESSOR SET P_ID = ?, P_NAME = ?, P_RECORD1 = ?, P_RECORD2 = ?, P_RECORD3 = ?, P_IMG =?, P_WORD = ? WHERE P_ID = ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, pvo.getP_id());
				pstmt.setString(2, pvo.getP_name());
				pstmt.setString(3, pvo.getP_record1());
				pstmt.setString(4, pvo.getP_record2());
				pstmt.setString(5, pvo.getP_record3());
				pstmt.setString(6, pvo.getP_img());
				pstmt.setString(7, pvo.getP_word());
				pstmt.setInt(8, pvo_original.getP_id());
				
				updateCount = pstmt.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println("updateProfessor 에러: " + e);
		} finally {
			close(pstmt);
		}
		return updateCount;
	}
}
