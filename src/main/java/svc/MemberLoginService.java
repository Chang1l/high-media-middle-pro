package svc;

import vo.MemberBean;
import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.MemberDAO;

public class MemberLoginService {

	public MemberBean login(MemberBean member) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		boolean loginResult = false;
		MemberBean memberBean = memberDAO.selectLoginId(member);
		String loginId=memberBean.getM_ID();
		if(loginId != null){
			loginResult = true;
		}
		close(con);
		return memberBean;
	}

}
