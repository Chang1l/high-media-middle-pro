package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.MemberDAO;
import vo.MemberBean;

public class MemberUpdateService {

	public boolean updateMember(MemberBean member) {
		boolean updateResult = false;
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		int updateCount = memberDAO.updateMember(member);
		if(updateCount > 0){
			commit(con);
			updateResult = true;
		}
		else{
			rollback(con);
		}
		close(con);
		return updateResult;
	}

}
