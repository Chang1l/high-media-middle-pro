<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 등록</title>
<style type="text/css">
#writeForm {
   width: 75%;
   margin: auto;
}

h2 {
   text-align: center;
}

img {
   width: 303px;
   height: 250px;
}

table {
   margin: auto;
   width: 70%;
}

.td_left {
   width: 150px;
}

.td_right {
   width: 300px;
}

#commandCell {
   text-align: center;
}

#C_CONTENT{
	width: 100%;
}
#C_DATE{
	width: 224px;
}
 input::file-selector-button {
    width: 100px;  
    height: 30px;  
    color: #62b6cb;  
    background: #fff;  
    border: 1px solid #62b6cb;  
    border-radius: 5px;  
    cursor: pointer;  
 } 

/* medium 이상(태블릿, 768px 이상) */
@media ( min-width : 768px) {
.mobile {
	display: none;
}
}
@media ( max-width : 767px) {
.pc {
	display: none;
}
#C_NO, #C_TITLE, #P_NAME, #C_DATE, #C_VOL, #C_CONTENT{
	width: 303px
}
}
</style>

<%@ include file="../header.jsp" %>
</head>
<body>
<br>
	<!-- 강의 등록 -->
	
	<div id="writeForm" class="pc">
	<br><br><br>
		<h2>강의 등록하기</h2>
		<hr>
		<br>
		<form action="courseWritePro.me" method="post"
			enctype="multipart/form-data" name="courseform">
			<table class="table">
				<tr>
					<td class="td_left"><label for="C_TITLE">강의명</label></td>
					<td class="td_right"><input type="text" name="C_TITLE"
						id="C_TITLE" required="required"></td>
				</tr>
				<tr>
					<td class="td_left"><label for="P_NAME">교수명</label></td>
					<td class="td_right"><input type="text" name="P_NAME"
						id="P_NAME" required="required"></td>
				</tr>
				<tr>
					<td class="td_left"><label for="C_DATE">개강일자</label></td>
					<td class="td_right"><input type="date" name="C_DATE"
						id="C_DATE" required="required"></td>
				</tr>
				<tr>
					<td class="td_left"><label for="C_VOL">강좌수</label></td>
					<td class="td_right"><input type="number" max="9999" name="C_VOL"
						id="C_VOL" required="required"></td>
				</tr>
				<tr>
					<td class="td_left"><label for="C_CONTENT">강의설명</label></td>
					<td><textarea style="resize:none;" id="C_CONTENT" name="C_CONTENT"
							cols="40" rows="15" required="required"></textarea></td>
				</tr>
				<tr>
					<td class="td_left"><label for="C_IMG"> 파일첨부 </label></td>
					<td class="td_right"><input type="file" name="C_IMG"
						id="C_IMG" required="required"></td>
				</tr>
			</table>
			<br>
			<div id="commandCell">
				<a href="courseList.me"><input type="button" class="btn btn-outline-primary" value="목록"></a>&nbsp;&nbsp; <input
					type="submit" class="btn btn-outline-primary" value="등록">&nbsp;&nbsp; <input
					type="reset" class="btn btn-outline-primary" value="다시입력" />
			</div>
		</form>
	</div>
	<!-- 강의 등록 -->
	
<!-- 	모바일 뷰 -->
	<div id="writeForm" class="mobile">
	<br><br><br>
		<h2>강의 등록하기</h2>
		<hr>
		<br>
		<form action="courseWritePro.me" method="post"
			enctype="multipart/form-data" name="courseform">
			<table class="table">
				<tr>
					<td><label for="C_TITLE">강의명<br>
					<input type="text" name="C_TITLE"
						id="C_TITLE" required="required">
					</label></td>
				</tr>
				<tr>
					<td>
					<label for="P_NAME">교수명<br>
					<input type="text" name="P_NAME"
						id="P_NAME" required="required">
					</label></td>
				</tr>
				<tr>
					<td><label for="C_DATE">개강일자<br>
					<input type="date" name="C_DATE"
						id="C_DATE" required="required">
					</label></td>
				</tr>
				<tr>
					<td><label for="C_VOL">강좌수<br>
					<input type="number" max="9999" name="C_VOL"
						id="C_VOL" required="required">
					</label></td>
				</tr>
				<tr>
					<td><label for="C_CONTENT">강의설명<br>
					<textarea style="resize:none;" id="C_CONTENT" name="C_CONTENT"
							cols="30" rows="13" required="required"></textarea>
					</label></td>
				</tr>
				<tr>
					<td><label for="C_IMG">파일첨부
					<input type="file" name="C_IMG"
						id="C_IMG" required="required">
					</label></td>
				</tr>
			</table>
			<br>
			<div id="commandCell">
				<a href="courseList.me"><input type="button" class="btn btn-outline-primary" value="목록"></a>&nbsp;&nbsp; <input
					type="submit" class="btn btn-outline-primary" value="등록">&nbsp;&nbsp; <input
					type="reset" class="btn btn-outline-primary" value="다시입력" />
			</div>
		</form>
	</div>

	
	<br>
<%@ include file="../footer.jsp" %>
</body>
</html>