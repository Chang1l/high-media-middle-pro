<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% if( request.getRemoteUser()!= null) {
	session.setAttribute("id", request.getRemoteUser());
}
response.sendRedirect("./ManagerLoginForm.jsp?error=2"); %>
