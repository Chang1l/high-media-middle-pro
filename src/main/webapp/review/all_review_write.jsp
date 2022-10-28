<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>


/* 이름, 직업, 내용 입력창 */
.input1:focus {
	border: 1px solid #62b6cd;
	border-radius: 5px;
	resize:none;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 10px
      rgba(32, 193, 191, 0.8);
	color:black;
	cursor: defalut;
	outline: 0;
}

.input1 {
	border: 1px solid #978786;
	border-radius: 5px;
	resize:none;
	background:#fff;
	color:black;
	cursor: defalut;
}


/* 하단 input 버튼 */
.input2{
	color: #fff;
	background: #62b6cb; 
 	cursor: pointer;
 	border: 2px solid #62b6cb;
 	border-radius: 2px;
 	padding: 4px 14px;
 	margin: 4px;
}

.input2:hover{
	color: #62b6cd;
	background: #fff; 
 	cursor: pointer;
 	border: 2px solid #62b6cd;
 	border-radius: 2px;
}
html, body {
  height: 100%;
}
.wrap {
  position: relative;
  min-height: 100%;
  padding-bottom: 200px;
}
footer {
	position: absolute;
	bottom: 0;
	width: 100%;
}
</style>
<%@ include file="/header.jsp" %>
</head>
<body>
<div class="wrap">
<!-- 여기까지 header -->
    
<!-- 여기부터 아래를 수정하세요 -->
<!-- 여기부터 아래를 수정하세요 -->



<%String m_id = (String) session.getAttribute("id");%>
<br><br><br><br><br>
<h3 style="text-align:center;">수강후기 보내기</h3>
<br><div style="color:red; text-align: center; font-size:13px;" >*작성하신 후기는 마케팅 활동에 사용될 수 있습니다.</div>
<div class="container" align="center">
<form action="allReviewWrite.me" method="post" name="allReviewform">
<table>
<tr><td><input type="hidden" name="M_ID" id="ID" value="<%=m_id%>"></td></tr>
<tr>
<td><label for="NAME">이름&nbsp;&nbsp;&nbsp;</label></td>
<td><input type="text" name="REVIEW_NAME" id="NAME" required="required" cols="40" class="input1" placeholder="이름 또는 닉네임을 적어주세요."></td>
</tr>

<tr>
<td><label for="JOB">직업&nbsp;&nbsp;&nbsp;</label></td>
<td><input type="text" name="REVIEW_JOB" id="JOB" required="required" cols="40" class="input1" placeholder="직업을 적어주세요 (예: 회사원)"></td>
</tr>

<tr>
<td><label for="CONTENTS">후기&nbsp;&nbsp;&nbsp;</label></td>
<td><textarea type="text" name="REVIEW_CONTENTS" id="CONTENTS" required="required" cols="40" rows="15" required="required" style="resize: none; cursor: defalut !important;" class="input1" placeholder="솔직하고 생생한 후기를 적어주세요. 우수 후기로 선발되면 학원 홈페이지에 전시됩니다."></textarea></td>
</tr>



<br><br>




</table>
<tr align="center">
<input type="submit" value="보내기" class="input2">
<input type="reset" value="다시쓰기" class="input2">
<input type="button" value="취소" class="input2" onclick="history.back(-1);">
</tr>
</form>


</div>


<br><br><br><br><br>




<!-- 여기부터 위를 수정하세요 -->
<!-- 여기부터 위를 수정하세요 -->

<!-- 여기부터 위를 수정하세요 -->
<!-- 여기부터 위를 수정하세요 -->


<!-- 여기부터 footer --> 
     
<%@ include file="/footer.jsp" %>
</div>
</body>
</html>
