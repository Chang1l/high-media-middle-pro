<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<jsp:include page="/header.jsp" />

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="./script/join.js"></script>
</head>
<style>
.form-control:focus {
   border-color: #978786;
   box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 10px
      rgba(32, 193, 191, 0.8);
}
.smStyle {
	width: 31%; 
	display: inline-block;
}
.sm1Style { 
width: 49%;  
display: inline-block; 
} 
.sm2Style { 
width: 49%;  
display: inline-block;
float: right;
} 
.sm3Style {
width: 31%;
	float: right;
}
.smStyle4 {
display: inline-block;
}
h1 {
.container{text-align: center; width: 75%; margin: 0 auto;}
.form-control{
margin:0 auto;
text-align: center;
}
input[type="button"] {
	height: calc(1.5em + 0.75rem + 2px);
}
.form-group{text-align: center;}
* {
	font-family: 'Noto Sans KR', sans-serif !important;
}
</style>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3" style="text-align: center;"><b>회원 가입</b></h1>
		</div>
	</div>

	<div class="container">
		<form name="joinform" class="form-horizontal" 
			action="./memberJoinAction.me" method="post"
			onsubmit="return checkForm()">
			<div class="text-danger" style="text-align: center;" >*은 필수입력란입니다.</div><br>
			<br>

			<div class="form-group row">
				<div class="col-md-5" style="float: none; margin:0 auto;">
					<h5>*아이디<span id="m_idMessage" style="float: right;"></span></h5><input name="m_id" id="m_id" type="text" 
						onkeydown="onlyAlphabet(this)" class="form-control"
						placeholder="아이디"  autocomplete='off' maxlength="20" minlength="8" pattern="^[0-9|a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$" />
				<span><small id="m_id1" class="text-danger" hidden>한글, 특수문자를 사용할 수 없습니다.<br>8자 이상 20자 이하로 만들어주세요</small></span>
				</div>
			</div><br>
			<div class="form-group row">
				<div class="col-md-5" style="float: none; margin:0 auto;">
				<h5>*비밀번호</h5><input name="m_pw" id="m_pw" type="password" class="form-control" required title="8자 이상 20자 이하로 만들어주세요"
						placeholder="비밀번호" maxlength="20" minlength="8" onkeydown="onlyAlphabet(this)">
				<span><small id="m_pw1" class="text-danger" hidden>8자 이상 20자 이하로 입력해주세요.</small></span>
				</div>
			</div><br>
			<div class="form-group row">
				<div class="col-md-5" style="float: none; margin:0 auto;">
					<h5>*비밀번호확인</h5><input name="password_confirm" id="m_pwc" type="password"
						class="form-control" placeholder="비밀번호확인" maxlength="20" 
						minlength="8" onkeydown="onlyAlphabet(this)">
				<span><small id="m_pw2" class="text-danger" hidden>8자 이상 20자 이하로 입력해주세요.</small></span>
				</div>
			</div><br>
			<div class="form-group row">
				<div class="col-md-5" style="float: none; margin:0 auto;">
					<h5>*성명</h5><input name="m_name" type="text" class="form-control" autocomplete='off'
						placeholder="성명" pattern="^[a-zA-Z가-힣]*$">
				</div>
			</div><br>
			
			<div class="form-group row">
				<div class="col-md-5" style="float: none; margin:0 auto;"><h5>*주소</h5>
					<input type="text" name="m_zip" id="sample3_postcode" autocomplete='off' placeholder="우편번호" class="form-control smStyle" required> 
					<input type="button" style="margin-bottom: 5px;" class="form-control smStyle btn btn-primary" autocomplete='off' onclick="sample3_execDaumPostcode()" value="우편번호" ><br>
					<input type="text" name="m_addr" style="margin-bottom: 5px;" id="sample3_address" placeholder="주소" class="form-control sm4Style" autocomplete='off' required>
					<input type="text" name="m_addr_sub" id="sample3_detailAddress" placeholder="상세주소" autocomplete='off' class="form-control sm1Style" required> 
					<input type="text" name="m_addr_sub2" id="sample3_extraAddress" placeholder="참고항목" class="form-control sm2Style" autocomplete='off'>

					<div id="wrap"
						style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
							id="btnFoldWrap"
							style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
							onclick="foldDaumPostcode()" alt="접기 버튼">
					</div>

					<script
						src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<script>
						// 우편번호 찾기 찾기 화면을 넣을 element
						var element_wrap = document.getElementById('wrap');

						function foldDaumPostcode() {
							// iframe을 넣은 element를 안보이게 한다.
							element_wrap.style.display = 'none';
						}

						function sample3_execDaumPostcode() {
							// 현재 scroll 위치를 저장해놓는다.
							var currentScroll = Math.max(
									document.body.scrollTop,
									document.documentElement.scrollTop);
							new daum.Postcode(
									{
										oncomplete : function(data) {
											// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

											// 각 주소의 노출 규칙에 따라 주소를 조합한다.
											// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
											var addr = ''; // 주소 변수
											var extraAddr = ''; // 참고항목 변수

											//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
											if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
												addr = data.roadAddress;
											} else { // 사용자가 지번 주소를 선택했을 경우(J)
												addr = data.jibunAddress;
											}

											// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
											if (data.userSelectedType === 'R') {
												// 법정동명이 있을 경우 추가한다. (법정리는 제외)
												// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
												if (data.bname !== ''
														&& /[동|로|가]$/g
																.test(data.bname)) {
													extraAddr += data.bname;
												}
												// 건물명이 있고, 공동주택일 경우 추가한다.
												if (data.buildingName !== ''
														&& data.apartment === 'Y') {
													extraAddr += (extraAddr !== '' ? ', '
															+ data.buildingName
															: data.buildingName);
												}
												// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
												if (extraAddr !== '') {
													extraAddr = ' ('
															+ extraAddr + ')';
												}
												// 조합된 참고항목을 해당 필드에 넣는다.
												document
														.getElementById("sample3_extraAddress").value = extraAddr;

											} else {
												document
														.getElementById("sample3_extraAddress").value = '';
											}

											// 우편번호와 주소 정보를 해당 필드에 넣는다.
											document
													.getElementById('sample3_postcode').value = data.zonecode;
											document
													.getElementById("sample3_address").value = addr;
											// 커서를 상세주소 필드로 이동한다.
											document.getElementById(
													"sample3_detailAddress")
													.focus();

											// iframe을 넣은 element를 안보이게 한다.
											// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
											element_wrap.style.display = 'none';

											// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
											document.body.scrollTop = currentScroll;
										},
										// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
										onresize : function(size) {
											element_wrap.style.height = size.height
													+ 'px';
										},
										width : '100%',
										height : '100%'
									}).embed(element_wrap);

							// iframe을 넣은 element를 보이게 한다.
							element_wrap.style.display = 'block';
						}
					</script>
				</div>
			</div><br>
			
			<div class="form-group row">
				<div class="col-md-5" style="float: none; margin:0 auto;">
					<h5>*전화번호</h5><input name="m_tel" id="m_tel" type="text" class="form-control"
						placeholder="010-1234-1234"
						pattern="[0-1]{2}[0]{1}-[0-9]{4}-[0-9]{4}" autocomplete='off'>
			<span><small id="m_tel1" class="text-danger" hidden>전화번호는 (-)를 꼭
				입력해주세요.</small></span>
				</div>
			</div><br>
			
			<div class="form-group row">
				<div class="col-md-5" style="float: none; margin:0 auto;">
					<h5>*생년월일</h5><input type="date" name="m_birth" class="form-control" min="1900-01-01" max="2022-09-30">
				</div>
			</div><br>

			<div class="form-group row ">
				<div class="col-md-5" style="float: none; margin:0 auto;" >
					<h5>*이메일</h5><input type="text" id="m_email" name="m_email" value="" autocomplete='off'
						placeholder="이메일 입력" onkeydown="onlyAlphabet(this)"
						pattern="^[0-9|a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$"
						class="form-control smStyle">&nbsp;@&nbsp;<input pattern="[a-z0-9.-]+\.[a-z]{2,}$" id="textEmail" autocomplete='off'
						name="textEmail" onkeydown="onlyAlphabet(this)"
						placeholder="이메일을 선택하세요." class="form-control smStyle"> <select
						id="select" name="select" class="form-control sm3Style" >
						<option value="" disabled selected>E-Mail 선택</option>
						<option value="naver.com">naver.com</option>
						<option value="kakao.com">kakao.com</option>
						<option value="daum.net">daum.net</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="yahoo.co.kr">yahoo.co.kr</option>
						<option value="gmail.com">gmail.com</option>
						<option value="directly" id="textEmail">직접 입력하기</option>
					</select><br>
			<span><small id="m_email1" class="text-danger" hidden>이메일에는 한글,
				특수문자를 사용할 수 없습니다.</small></span>
				</div>
			</div>
			<br><br>
			<div class="form-group row">
				<div class="col-lg-offset-2 col-lg-12" style="text-align: center;">
					<input type="submit" class="btn btn-outline-primary" value="등록">
					<input type="reset" class="btn btn-outline-primary" value="다시쓰기" onclick="reset()">
				</div>
			</div>
		</form>
	</div>
	<br><br><br>
	<jsp:include page="/footer.jsp" />
</body>
</html>