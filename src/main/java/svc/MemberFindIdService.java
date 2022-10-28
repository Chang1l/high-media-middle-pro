package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberBean;

public class MemberFindIdService {

	public String findId(MemberBean member) {
		
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		boolean findId = false;
		String id = memberDAO.findId(member);
		if(id != null){
			findId = true;
		}
		close(con);
		return id;
	}
	public Boolean findIdCheck(MemberBean member) {
		
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		boolean findId = false;
		String id = memberDAO.findId(member);
		if(id != null){
			findId = true;
		}
		close(con);
		return findId;
	}
}

