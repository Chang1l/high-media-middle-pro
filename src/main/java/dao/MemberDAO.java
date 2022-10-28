package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import vo.MemberBean;

import static db.JdbcUtil.*;

public class MemberDAO {
	public static MemberDAO instance;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	 public MemberDAO() {
	        try {
	        	Context initCtx = new InitialContext();
				Context envCtx = (Context)initCtx.lookup("java:comp/env");
				ds = (DataSource)envCtx.lookup("jdbc/OracleDB");
	        } catch (NamingException e) {
	            e.printStackTrace();
	        }
	    }
	 public boolean idCheck(MemberBean mv) { // 아이디 중복검사
	        if(mv.getM_ID() == null || mv.getM_ID().length() == 0) {
	        	System.out.println("아이디가 없습니다.");
	        }
	        boolean idchk = false;
	        String SQL = "select count(*) as result from member where m_id = ? ";

	        try {
	        	con = ds.getConnection();
	            pstmt = con.prepareStatement(SQL);
	            pstmt.setString(1, mv.getM_ID());

	            ResultSet rs = pstmt.executeQuery();

	            while(rs.next()) {
		            int result = rs.getInt(1);
		            if(result > 0) idchk = true;
	            }
	            rs.close();
	            return idchk;

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }finally {
	        	try {
					pstmt.close();
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        }
	        return idchk;
	    }
	public static MemberDAO getInstance(){
		if(instance == null){
			instance = new MemberDAO();
		}
		return instance;
	}
	public void setConnection(Connection con){
		this.con = con;
	}
	
	public MemberBean selectLoginId(MemberBean member){ // 로그인
//		String loginId = null;
		MemberBean memberBean =new MemberBean();
		String sql="SELECT * FROM MEMBER WHERE m_id=? AND m_pw=?";
		
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, member.getM_ID());
			pstmt.setString(2, member.getM_PW());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				memberBean.setM_ID(rs.getString("m_id"));
				memberBean.setM_PW(rs.getString("m_pw"));
				memberBean.setM_NAME(rs.getString("m_name"));
				memberBean.setM_ZIP(rs.getString("m_zip"));
				memberBean.setM_ADDR(rs.getString("m_addr"));
				memberBean.setM_TEL(rs.getString("m_tel"));
				memberBean.setM_BIRTH(rs.getString("m_birth"));
				memberBean.setM_EMAIL(rs.getString("m_email"));
			}
		}catch(Exception ex){
			System.out.println(" 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return memberBean;
	}
	
	public String findId(MemberBean member) { // 아이디 찾기

		String id = null;
		String sql = "SELECT * FROM MEMBER WHERE M_NAME = ? AND M_TEL = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getM_NAME());
			pstmt.setString(2, member.getM_TEL());
			rs = pstmt.executeQuery();

			if (rs.next())
				return id = rs.getString("M_ID");
			
		} catch (Exception ex) {
			System.out.println("findId 에러: " + ex);
		} 
		finally {
			close(rs);
			close(pstmt);
		}
		return id;
	}

	   // 비밀번호 찾기
	   public String findPw(MemberBean member) {

	      String pw = null;
	      String sql = "SELECT * FROM MEMBER WHERE M_ID = ? AND M_TEL = ?";
	      try {
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, member.getM_ID());
	         pstmt.setString(2, member.getM_TEL());
	         rs = pstmt.executeQuery();

	         if (rs.next())
	            return pw = rs.getString("M_PW");
	         
	      } catch (Exception ex) {
	         System.out.println("findPw 에러: " + ex);
	      } 
	      finally {
	         close(rs);
	         close(pstmt);
	      }
	      return pw;
	   }
	
	public int insertMember(MemberBean member){ // 회원가입
		String sql="INSERT INTO MEMBER VALUES (?,?,?,?,?,?,?,?)";
		int insertCount=0;
		
		try{

			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, member.getM_ID());
			pstmt.setString(2, member.getM_PW());
			pstmt.setString(3, member.getM_NAME());
			pstmt.setString(4, member.getM_ZIP());
			pstmt.setString(5, member.getM_ADDR());
			pstmt.setString(6, member.getM_TEL());
			pstmt.setString(7, member.getM_BIRTH());
			pstmt.setString(8, member.getM_EMAIL());
			insertCount=pstmt.executeUpdate();
			
		}catch(Exception ex){
			System.out.println("joinMember 에러: " + ex);			
		}finally{
			close(pstmt);
		}
		
		return insertCount;
	}
	
	
	public int updateMember(MemberBean member){ // 계정 수정
		String sql="UPDATE MEMBER set m_pw=?, m_name=?, m_zip=?, m_addr=?, m_tel=?, m_birth=?, m_email=? where m_id=?";
		int updateCount=0;
		
		try{

			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, member.getM_PW());
			pstmt.setString(2, member.getM_NAME());
			pstmt.setString(3, member.getM_ZIP());
			pstmt.setString(4, member.getM_ADDR());
			pstmt.setString(5, member.getM_TEL());
			pstmt.setString(6, member.getM_BIRTH());
			pstmt.setString(7, member.getM_EMAIL());
			pstmt.setString(8, member.getM_ID());
			updateCount=pstmt.executeUpdate();
			
		}catch(Exception ex){
			System.out.println("updateMember 에러: " + ex);			
		}finally{
			close(pstmt);
		}
		
		return updateCount;
	}
	
	public int deleteMember(String m_id){ // 계정 삭제
		String sql="DELETE from MEMBER WHERE M_ID=?";
		int deleteCount = 0;
		
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			deleteCount = pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("deleteMember 에러: " + ex);	
		}finally{
			close(pstmt);
		}
		
		return deleteCount;
	}
	
	public ArrayList<MemberBean> selectMemberList(){ // 리스트
		String sql="SELECT * FROM MEMBER order by m_name";
		ArrayList<MemberBean> memberList=new ArrayList<MemberBean>();
		MemberBean mb = null;
		try{
			
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				do{
				mb=new MemberBean();
				mb.setM_ID(rs.getString("m_id"));
				mb.setM_PW(rs.getString("m_pw"));
				mb.setM_NAME(rs.getString("m_name"));
				mb.setM_ZIP(rs.getString("m_zip"));
				mb.setM_ADDR(rs.getString("m_addr"));
				mb.setM_TEL(rs.getString("m_tel"));
				mb.setM_BIRTH(rs.getString("m_birth"));
				mb.setM_EMAIL(rs.getString("m_email"));
				memberList.add(mb);
				}while(rs.next());
			}
		}catch(Exception ex){
			System.out.println("getDeatilMember 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		return memberList;
	}
	
	public MemberBean selectMember(String id){ // ??
		String sql="SELECT * FROM MEMBER WHERE m_id=?";
		MemberBean mb = null;
		try{
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
			mb=new MemberBean();
			mb.setM_ID(rs.getString("m_id"));
			mb.setM_PW(rs.getString("m_pw"));
			mb.setM_NAME(rs.getString("m_name"));
			mb.setM_ZIP(rs.getString("m_zip"));
			mb.setM_ADDR(rs.getString("m_addr"));
			mb.setM_TEL(rs.getString("m_tel"));
			mb.setM_BIRTH(rs.getString("m_birth"));
			mb.setM_EMAIL(rs.getString("m_email"));
			}
		}catch(Exception ex){
			System.out.println("getDeatilMember 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return mb;
	}
}