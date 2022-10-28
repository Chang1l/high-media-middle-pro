package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.RegistDAO;
import vo.RegistBean;

public class RegistListService {

	public int getUserListCount(String m_id) throws Exception {
		// TODO Auto-generated method stub

		int listCount = 0;
		Connection con = getConnection();
		RegistDAO registDAO = RegistDAO.getInstance();
		registDAO.setConnection(con);
		listCount = registDAO.selectListCount(m_id);
		close(con);
		return listCount;

	}

	public ArrayList<RegistBean> getRegistList(int page, int limit, String m_id) throws Exception {

		ArrayList<RegistBean> registList = null;
		Connection con = getConnection();
		RegistDAO registDAO = RegistDAO.getInstance();
		registDAO.setConnection(con);
		registList = registDAO.selectRegistList(page, limit, m_id);
		close(con);
		return registList;

	}

	public ArrayList<RegistBean> getRegistList(String m_id) throws Exception {
		ArrayList<RegistBean> registList = null;
		Connection con = getConnection();
		RegistDAO registBean = RegistDAO.getInstance();
		registBean.setConnection(con);
		registList = registBean.selectRegistList(m_id);
		close(con);

		return registList;
	}

	public ArrayList<RegistBean> getRegistList(int page, int limit) throws Exception{
		
		ArrayList<RegistBean> registList = null;
		Connection con = getConnection();
		RegistDAO registDAO = RegistDAO.getInstance();
		registDAO.setConnection(con);
		registList = registDAO.selectRegistList(page,limit);
		close(con);
		return registList;
		
	}
	
	public int getRegistCno(String m_id, int cno) throws Exception{
		
		int registCno = 0;
		Connection con = getConnection();
		RegistDAO registDAO = RegistDAO.getInstance();
		registDAO.setConnection(con);
		registCno = registDAO.selectRegistCno(m_id,cno);
		close(con);
		return registCno;
		
	}
}
