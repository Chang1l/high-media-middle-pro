package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberBean;

public class MemberFindPwService {

	public String findPw(MemberBean member) {
		
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		boolean findPw = false;
		String pw = memberDAO.findPw(member);
		if(pw != null){
			findPw = true;
		}
		close(con);
		return pw;
	}
	public Boolean findPwCheck(MemberBean member) {
		
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		boolean findPw = false;
		String pw = memberDAO.findPw(member);
		if(pw != null){
			findPw = true;
		}
		close(con);
		return findPw;
	}
}

