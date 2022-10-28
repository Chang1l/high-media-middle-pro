package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ProfessorDAO;

import static db.JdbcUtil.*;

import vo.ProfessorVO;

public class ProfessorListService {
	
	public ArrayList<ProfessorVO> getProfessorList() throws Exception {
		ArrayList<ProfessorVO> professorList = null;
		Connection con = getConnection();
		ProfessorDAO professorDAO = ProfessorDAO.getInstance();
		professorDAO.setConnection(con);
		professorList = professorDAO.selectProfessorList();
		close(con);
		return professorList;
	}
}
