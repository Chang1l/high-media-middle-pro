<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="vo.MemberBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디찾기</title>

<style>
html, body {
	height: 100%;
	padding: 0;
	margin: 0;
}

body {
	display: -ms-flexbox;
	-ms-flex-align: center;
	flex-direction: column;
	align-items: center;
	background-color: #f5f5f5;
}

#wrap {
	display: flex;
	min-height: 100vh;
	flex-direction: column;
}

.content {
	flex: 1;
}

.ti{
margin-top: 30px;
margin-bottom: 20px;
}

.form-findid {
	width: 100%;
	max-width: 330px;
	padding: 15px;
	margin: auto;
	margin-top: 50px;
}

.jb-container {
	width: 100%;
	margin-top: 45px;
	margin-bottom: 147px;
	padding: 5px;
	background-color: #e3e3e3;
}

.jb-item {
	margin: 0px;
	padding: 40px;
	background-color: #17a2b8;
}

a {
	font-weight: bold;
}

a:link {
	color: #17a2b8;
}

a:visited {
	color: #17a2b8;
}

a:hover {
	color: #17a2b8;
}

a:active {
	color: #17a2b8;
}
</style>
<script type="text/javascript">
const autoHyphen = (target) => {
 target.value = target.value
   .replace(/[^0-9]/g, '')
  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}	
</script>
	<%@ include file="/header.jsp"%>
</head>

<body class="text-center">

	<div id="wrap">
		<div class="content">
			<form name="findIdForm" class="form-findid">
				<img class="mb-4" id="mb-4"
					src="./img/pierre-chatel-innocenti-pxoZSTdAzeU-unsplash.jpg" alt=""
					width=100%> 

				<h1 class="ti">아이디 찾기</h1>


				<div class="jb-container">

					<div class="jb-item">
						<%
						out.print((String) request.getAttribute("M_ID"));
						%>
					</div>

				</div>
				
				<span> <a href="./memberLogin.me">로그인</a>&nbsp;&nbsp;&nbsp;
					<a href="./memberFindPw.me">비밀번호찾기</a>&nbsp;&nbsp;&nbsp; <a
					href="./memberJoin.me">회원가입</a>
				</span>
			</form>
		</div>
		<%@ include file="/footer.jsp"%>
	</div>
</body>
</html>