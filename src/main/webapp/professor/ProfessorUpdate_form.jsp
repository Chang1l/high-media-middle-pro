<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, vo.ProfessorVO" %>

<% 
ProfessorVO professorInfo = (ProfessorVO) request.getAttribute("ProfessorInfo");
int p_id = professorInfo.getP_id();
String p_name = professorInfo.getP_name();
String p_record1 = professorInfo.getP_record1();
String p_record2 = professorInfo.getP_record2();
String p_record3 = professorInfo.getP_record3();
String p_word = professorInfo.getP_word();
String p_img = professorInfo.getP_img();
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../header.jsp" %>
<meta charset="UTF-8">
<title>교수 수정</title>
<script>
//아이디 imgBtn 클릭했을때 그 아이디를 가진 요소의 텍스트가 교수님 이미지 변경이면
//그 전 요소 (input type=file) 보여주고 이미지 변경 취소로 버튼 텍스트 변경
//아니라면 그 전 요소 (input type=file) 감추소 교수님 이미지 변경으로 텍스트 변경
	$(function() {
		$("#imgBtn").on("click", function(){
			if($(this).text() == "교수님 이미지 변경") {
				$(this).prev().show();
				$(this).text("이미지 변경 취소");
			} else {
				$(this).prev().hide();
				$(this).text("교수님 이미지 변경")
			}
		});
	});
</script>
<style>

	@media (max-width: 800px) {
		#updateFormSubmit, #ProfListBtn {
			display: block;
			margin: auto;
		}
		
		#updateFormDiv h2 {
			margin-top: 10px;
		}
	}
	
	h2 {
		margin-top: 40px;
		padding-top: 20px;
		margin-bottom: 40px;
		text-align: center;
	}
	
	input[type="file"] {
		display: none;
		float:left;
	}
	
	#imgBtn:after {
		content:'';
  		display:block;
  		clear:both;
	}
	
	/*float 절단*/
	
	#updateFormDiv {
		width: 50%;
		margin: 0 auto;
		padding-top: 1.5%;
  		padding-bottom: 1.5%;
	}
	
	#ProfsDiv {
		text-align: center;
		padding-bottom: 10px;
	}
	
	#ProfsDiv input {
		text-align: center;
		border: 1px solid black;
	}

	#updateForm textarea {
		height: 7rem;
		border: 1px solid black;
		text-align: center;
		resize:none;
		word-break: keep-all;
	}
	
	#ProfsDiv label[for=p_id]:after {
		content: "";
		padding-top: 5px;
		margin: 8px auto;
		display: block;
		width: 95px;
		border-bottom: 1px solid #BDBDBD;
	}
	
	#ProfsDiv label[for=p_name]:after {
		content: "";
		padding-top: 5px;
		margin: 8px auto;
		display: block;
		width: 50px;
		border-bottom: 1px solid #BDBDBD;
	}
	
	#ProfsDiv label[for=p_record1]:after, #ProfsDiv label[for=p_record2]:after, #ProfsDiv label[for=p_record3]:after  {
		content: "";
		padding-top: 5px;
		margin: 8px auto;
		display: block;
		width: 47px;
		border-bottom: 1px solid #BDBDBD;
	}
	
	#ProfsDiv label[for=p_img]:after, #ProfsDiv label[for=p_word]:after {
		content: "";
		padding-top: 5px;
		margin: 8px auto;
		display: block;
		width: 160px;
		border-bottom: 1px solid #BDBDBD;
	}
	
</style>
</head>
<body>
	<div id=updateFormDiv class="container-fluid">
	<h2>교수 수정</h2>
	<form method="post" action="ProfessorUpdate.me" enctype="multipart/form-data" name="boardform" id="updateForm">
		
		<input type="hidden" name="P_ID_ORIGINAL" value="<%=p_id %>">
		
		<div class="form-group row align-items-center" id="ProfsDiv">
		<label for="p_id" class="col-sm-6 col-form-label-lg">교수 아이디</label>
		<div id="ProfInputsDiv" class="col-sm-3">
		<input class="form-control" type="number" name="P_ID" value="<%=p_id%>" id="p_id" required>
		</div>
		</div>
		<br>
		
		<div class="form-group row align-items-center" id="ProfsDiv">
		<label for="p_name" class="col-sm-6 col-form-label-lg">교수명</label>
		<div id="ProfInputsDiv" class="col-sm-3">
		<input class="form-control" type="text" name="P_NAME" value="<%=p_name%>" id="p_name" required>
		</div>
		</div>
		<br>
		
		<div class="form-group row align-items-center" id="ProfsDiv">
		<label for="p_record1" class="col-sm-6 col-form-label-lg">경력 1</label>
		<div id="ProfInputsDiv" class="col-sm-5">
		<textarea class="form-group form-control" name="P_RECORD1" id="p_record1" required><%=p_record1%></textarea>
		</div>
		</div>
		<br>
		
		<% if(p_record2 == null && p_record3 == null) { %>
		<div class="form-group row align-items-center" id="ProfsDiv">
		<label for="p_record2" class="col-sm-6 col-form-label-lg">경력 2</label>
		<div id="ProfInputsDiv" class="col-sm-5">
		<textarea class="form-group form-control" name="P_RECORD2" id="p_record2"></textarea>
		</div>
		</div>
		<br>
		
		<div class="form-group row align-items-center" id="ProfsDiv">
		<label for="p_record3" class="col-sm-6 col-form-label-lg">경력 3</label>
		<div id="ProfInputsDiv" class="col-sm-5">
		<textarea class="form-group form-control" name="P_RECORD3" id="p_record3"></textarea>
		</div>
		</div>
		<br>
		<% } %> 
		
		<% if (p_record2 != null && p_record3 == null) {%>
		<div class="form-group row align-items-center" id="ProfsDiv">
		<label for="p_record2" class="col-sm-6 col-form-label-lg">경력 2</label>
		<div id="ProfInputsDiv" class="col-sm-5">
		<textarea class="form-group form-control" name="P_RECORD2" id="p_record2"><%=p_record2%></textarea>
		</div>
		</div>
		<br>
		
		<div class="form-group row align-items-center" id="ProfsDiv">
		<label for="p_record3" class="col-sm-6 col-form-label-lg">경력 3</label>
		<div id="ProfInputsDiv" class="col-sm-5">
		<textarea class="form-group form-control" name="P_RECORD3" id="p_record3"></textarea>
		</div>
		</div>
		<br>
		<% } %>
		
		<% if (p_record2 != null && p_record3 != null) { %>
		<div class="form-group row align-items-center" id="ProfsDiv">
		<label for="p_record2" class="col-sm-6 col-form-label-lg">경력 2</label>
		<div id="ProfInputsDiv" class="col-sm-5">
		<textarea class="form-group form-control" name="P_RECORD2" id="p_record2"><%=p_record2%></textarea>
		</div>
		</div>
		<br>
		
		<div class="form-group row align-items-center" id="ProfsDiv">
		<label for="p_record3" class="col-sm-6 col-form-label-lg">경력 3</label>
		<div id="ProfInputsDiv" class="col-sm-5">
		<textarea class="form-group form-control" name="P_RECORD3" id="p_record3"><%=p_record3%></textarea>
		</div>
		</div>
		<br>
		<% } %>

		<div class="form-group row align-items-center" id="ProfsDiv">
		<label for="p_img" class="col-sm-6 col-form-label-lg">교수 프로필 사진</label>
		<div id="ProfInputsDiv" class="col-sm-4">
		<img src="professor/ProfessorImg/<%=p_img%>" alt="교수님 기존 사진" title="교수님 기존 사진" width="85px" height="85px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input class="p_file form-control" type="file" name="P_IMG" id="p_img">
		<button type="button" id="imgBtn">교수님 이미지 변경</button>
		</div>
		</div>
		<br>
		
		<div class="form-group row align-items-center" id="ProfsDiv">
		<label for="p_word" class="col-sm-6 col-form-label-lg">교수 캐치프레이즈</label>
		<div id="ProfInputsDiv" class="col-sm-5">
		<textarea class="form-group form-control" name="P_WORD" id="p_word" required><%=p_word%></textarea>
		</div>
		</div>
		<br>
		<br>
		
	</form>
	
	<div style="text-align:center;">
		<button type="submit" form="updateForm" class="btn btn-primary" id="updateFormSubmit">교수 수정</button>&nbsp;&nbsp;
		<button style="text-align:center" id="ProfListBtn" class="btn btn-primary" onclick = "location.href='ProfessorListManager.me'">교수님 목록 보기</button>
	</div>
	
	<br>
	</div>
<%@include file="../footer.jsp" %>
</body>
</html>