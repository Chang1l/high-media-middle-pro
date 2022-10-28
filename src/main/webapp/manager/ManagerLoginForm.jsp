<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 로그인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
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

.ti {



	margin-top: 30px;
	margin-bottom: 20px;
}

.form-control:focus {
	border-color: #978786;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 10px
		rgba(32, 193, 191, 0.8);
}

.form-signin {
	width: 100%;
	max-width: 330px;
	padding: 15px;
	margin: auto;
	margin-top: 50px;
}

.form-signin .checkbox {
	font-weight: 400;
}

.form-signin .form-control {
	position: relative;
	box-sizing: border-box;
	height: auto;
	padding: 10px;
	font-size: 16px;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input[type="text"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 20px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

button.btn.btn-primary {
	width: 100%;
	margin-bottom: 40px;
	color: #fff;
    background-color: #62b6cb;
    border-color: #62b6cb;
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

</head>
<body class="text-center">
	
	<div id="wrap">
		<div class="content">
			<form name="loginform" class="form-signin" action="j_security_check"
				method="post">

				<h1 class="ti">HIGH LEARN</h1>

				<%
				String error = request.getParameter("error");
				if (error != null) {
					if (error.equals("1")) {
						out.println("<div class='alert alert-danger'>");
						out.println("아이디와 비밀번호를 확인해 주세요");
						out.println("</div>");
					} else {
				%>
				<jsp:forward page="./ManagerLoginSuccess.jsp"></jsp:forward>
				<%
				}
				}
				%>



				<label for="ManagerId"></label> <input type="text" name="j_username"
					class="form-control" id="ManagerId" maxlength="20"
					placeholder="관리자 ID를 입력해 주세요" required autofocus> <label
					for="ManagerPw"></label> <input type="password" name="j_password"
					class="form-control" id="ManagerPw" maxlength="20"
					placeholder="관리자 비밀번호를 입력해 주세요" required>

				<div>
					<button class="btn btn-primary" type="submit">관리자 로그인</button>
				</div>
		
			</form>
		</div>
	</div>
</body>
</html>