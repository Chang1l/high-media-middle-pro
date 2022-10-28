<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교수 등록</title>
<%@include file="../header.jsp"%>

<style>
@media ( max-width : 800px) {
	#insertFormSubmit, #ProfListBtn {
		display: block;
		margin: auto;
	}
	#insertFormDiv h2 {
		margin-top: 10px;
	}
}

h2 {
	margin-top: 40px;
	padding-top: 20px;
	margin-bottom: 40px;
	text-align: center;
}

#insertFormDiv {
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

#insertForm textarea {
	height: 7rem;
	border: 1px solid black;
	text-align: center;
	resize: none;
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

#ProfsDiv label[for=p_record1]:after, #ProfsDiv label[for=p_record2]:after,
	#ProfsDiv label[for=p_record3]:after {
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

<script>
	$(document)
			.ready(
					function() {
						$("#insertFormSubmit")
								.click(
										function() {

											var ipt_id = $.trim($("#p_id")
													.val());
											var ipt_name = $.trim($("#p_name")
													.val());
											var ipt_record1 = $.trim($(
													"#p_record1").val());
											var ipt_record2 = $.trim($(
													"#p_record2").val());
											var ipt_record3 = $.trim($(
													"#p_record3").val());
											var ipt_class = $
													.trim($("#p_class").val());

											var ipt_fileValue = $(
													"input[id='p_img']").val()
													.split("\\");

											var ipt_fileName = ipt_fileValue[ipt_fileValue.length - 1];

											var ipt_word = $.trim($("#p_word")
													.val());

											if (ipt_id == "" && ipt_name == ""
													&& ipt_record1 == ""
													&& ipt_record2 == ""
													&& ipt_record3 == ""
													&& ipt_class == ""
													&& ipt_fileName == ""
													&& ipt_word == "") {
												alert("모든 입력창 값이 비어있습니다. 확인후 다시 등록해주세요.");
												return false;
											}
										});
					});
</script>
</head>
<body>
	<div id=insertFormDiv class="container-fluid">
		<h2>교수 등록</h2>
		<form method="post" action="ProfessorInsert.me"
			enctype="multipart/form-data" name="boardform" id="insertForm">
			<div class="form-group row align-items-center" id="ProfsDiv">
				<label for="p_id" class="col-sm-6 col-form-label-lg">교수 아이디</label>
				<div class="col-sm-3" id="ProfInputsDiv">
					<input class="form-control" type="number" name="P_ID" id="p_id"
						required minlength="1" maxlength="6">
				</div>
			</div>
			<br>

			<div class="form-group row align-items-center" id="ProfsDiv">
				<label for="p_name" class="col-sm-6 col-form-label-lg">교수명</label>
				<div class="col-sm-3" id="ProfInputsDiv">
					<input class="form-control" type="text" name="P_NAME" id="p_name"
						required>
				</div>
			</div>
			<br>

			<div class="form-group row align-items-center" id="ProfsDiv">
				<label for="p_record1" class="col-sm-6 col-form-label-lg">경력1</label>
				<div class="col-sm-5" id="ProfInputsDiv">
					<textarea class="form-group form-control" name="P_RECORD1"
						id="p_record1" required></textarea>
				</div>
			</div>
			<br>

			<div class="form-group row align-items-center" id="ProfsDiv">
				<label for="p_record2" class="col-sm-6 col-form-label-lg"
					id="ProfLabelsDiv">경력2</label>
				<div class="col-sm-5" id="ProfInputsDiv">
					<textarea class="form-group form-control" name="P_RECORD2"
						id="p_record2"></textarea>
				</div>
			</div>
			<br>

			<div class="form-group row align-items-center" id="ProfsDiv">
				<label for="p_record3" class="col-sm-6 col-form-label-lg"
					id="ProfLabelsDiv">경력3</label>
				<div class="col-sm-5" id="ProfInputsDiv">
					<textarea class="form-group form-control" name="P_RECORD3"
						id="p_record3"></textarea>
				</div>
			</div>
			<br>

			<div class="form-group row align-items-center" id="ProfsDiv">
				<label for="p_img" class="col-sm-6 col-form-label-lg"
					id="ProfLabelsDiv">교수 프로필 사진</label>
				<div class="col-sm-4" id="ProfInputsDiv">
					<input class="form-control" type="file" name="P_IMG" id="p_img"
						class="form-control-file" required>
				</div>
			</div>
			<br>

			<div class="form-group row align-items-center" id="ProfsDiv">
				<label for="p_word" class="col-sm-6 col-form-label-lg"
					id="ProfLabelsDiv">교수 캐치프레이즈</label>
				<div class="col-sm-5" id="ProfInputsDiv">
					<textarea class="form-group form-control" name="P_WORD" id="p_word"
						required></textarea>
				</div>
			</div>
			<br>

		</form>

		<div style="text-align: center;">
			<button type="submit" form="insertForm" class="btn btn-primary"
				id="insertFormSubmit">교수 등록</button>
			&nbsp;&nbsp;
			<button style="text-align: center" id="ProfListBtn"
				class="btn btn-primary"
				onclick="location.href='ProfessorListManager.me'">교수님 목록 보기</button>
		</div>

		<br>
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>

