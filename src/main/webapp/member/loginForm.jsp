<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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

<script>

	$(document).ready(function() {
		var key = getCookie("key");
		$("#M_ID").val(key); // 쿠키에 저장된 키값을 ID 칸에 저장

		if ($("#M_ID").val() != "") { // 저장된 ID가 표시된 상태라면
			$("#saveId").attr("checked", true); // ID 저장을 체크 상태로
		}

		$("#saveId").change(function() { // 체크박스에 변화가 있다면
			if ($("#saveId").is(":checked")) { // ID 저장하기 체크했을 때
				setCookie("key", $("#M_ID").val(), 7); // 7일 동안 쿠키 보관
			} else { // ID 저장하기 체크 해제 시
				deleteCookie("key"); // 쿠키 삭제
			}
		});

		// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
		$("#M_ID").keyup(function() { // ID 입력 칸에 ID를 입력할 때,
			if ($("#saveId").is(":checked")) { // ID 저장하기를 체크한 상태라면,
				setCookie("key", $("#M_ID").val(), 7); // 7일 동안 쿠키 보관
			}
		});
	});

	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}

	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}

	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) {
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1)
				end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}
</script>
	<%@ include file="/header.jsp"%>
</head>
<body>

	
	<div id="wrap">
		<div class="content">
			<form name="loginform" class="form-signin"
				action="./memberLoginAction.me" method="post">
				<img class="mb-4" id="mb-4"
					src="./img/pierre-chatel-innocenti-pxoZSTdAzeU-unsplash.jpg" alt=""
					width=100%>
				
				<h1 id="logo" class="ti text-center" style="cursor: default;">HIGH LEARN</h1>
				
				
		
				<label for="M_ID"> </label> 
					<input type="text" name="M_ID"
					class="form-control" id="M_ID" maxlength="20"
					placeholder="ID를 입력해 주세요" required autocomplete="off" autofocus> 
					
				<label for="M_PW"> </label> 
					<input type="password" name="M_PW"
					class="form-control" id="M_PW" maxlength="20"
					placeholder="비밀번호를 입력해 주세요" required>
					
				<div>
					<button class="btn btn-primary" type="submit">로그인</button>
				</div>
				
				<div class="checkbox mb-3 text-center">
					<label> <input type="checkbox" id="saveId" value="saveId">&nbsp;아이디
						저장
					</label>
				</div>


			<div class="text-center">
				<span class="memberField"> 
					<a href="./memberFindId.me">아이디 찾기</a>&nbsp;&nbsp;
					<a href="./memberFindPw.me">비밀번호 찾기</a>&nbsp;&nbsp;
					<a href="./memberJoin.me">회원 가입</a>
				</span>
			</div>
			</form>
		</div>
		
	</div>

<%@ include file="/footer.jsp"%>
</body>
</html>