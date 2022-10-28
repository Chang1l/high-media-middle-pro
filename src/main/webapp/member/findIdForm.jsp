<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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

.form-control:focus {
	border-color: #978786;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 10px
		rgba(32, 193, 191, 0.8);
}

.form-findid {
	width: 100%;
	max-width: 330px;
	padding: 15px;
	margin: auto;
	margin-top: 50px;
}

.form-findid .form-control {
	position: relative;
	box-sizing: border-box;
	height: auto;
	padding: 10px;
	font-size: 16px;
}

.form-findid .form-control:focus {
	z-index: 2;
}

.form-findid input[type="text"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

button.btn.btn-primary {
	width: 100%;
	margin-top: 70px;
	margin-bottom: 40px;
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
			<form name="findIdForm" class="form-findid"
				action="memberFindIdAction.me" method="post">
				<img class="mb-4" id="mb-4"
					src="./img/pierre-chatel-innocenti-pxoZSTdAzeU-unsplash.jpg" alt=""
					width=100%>

				<h1 class="ti">아이디 찾기</h1>
				 <label for="M_NAME"> </label> <input type="text"
					name="M_NAME" class="form-control" id="M_NAME" maxlength="10"
					placeholder="이름를 입력해 주세요" required autofocus> <label
					for="M_TEL"> </label> <input type="text" name="M_TEL"
					class="form-control" id="M_TEL" oninput="autoHyphen(this)"
					maxlength="13" placeholder="핸드폰번호를 입력해주세요(-생략)" required>
				<div>
					<button class="btn btn-primary" type="submit">아이디 찾기</button>
				
				</div>

				<span> 
					<a href="./memberLogin.me">로그인</a>&nbsp;&nbsp;&nbsp; 
					<a href="./memberFindPw.me">비밀번호찾기</a>&nbsp;&nbsp;&nbsp; 
					<a href="./memberJoin.me">회원가입</a>
				</span>
			</form>
		</div>
		<%@ include file="/footer.jsp"%>
	</div>
</body>
</html>