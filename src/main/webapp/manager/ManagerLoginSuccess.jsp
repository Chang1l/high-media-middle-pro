<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 인증 성공</title>
</head>
<body>
<% if( request.getRemoteUser()!= null) {
	session.setAttribute("id", request.getRemoteUser());
}
response.sendRedirect("../index.jsp"); %>
</body>
</html>