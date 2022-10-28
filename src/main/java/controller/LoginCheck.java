package controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.MemberDAO;
import vo.MemberBean;

@WebServlet("/loginCheck")
public class LoginCheck extends HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		아이디 중복검사
		String id = request.getParameter("m_id");

		MemberBean m_id = new MemberBean();
		m_id.setM_ID(id);
		MemberDAO mv = new MemberDAO();
		boolean result = mv.idCheck(m_id);
		String str ;
		
		if(result) str = "이미 존재하는 아이디입니다.";
		else str = "";
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("str", str);
		map.put("id", id);

		JSONObject jObject = new JSONObject();
		jObject.put("map", map);

		response.setContentType("application/x-json; charset=utf-8");
		response.getWriter().print(jObject); 
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
}
