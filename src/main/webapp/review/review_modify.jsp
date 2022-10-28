<%@page import="vo.ReviewBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	ReviewBean article = (ReviewBean)request.getAttribute("article");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 수정</title>

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
	height: 30px;
	color: #fff;
	background: #62b6cb; 
 	cursor: pointer;
 	border: 2px solid #62b6cb;
 	border-radius: 2px;
 	padding: 4px 14px;
 	margin: 4px;
}

.input2:hover{
	height: 30px;
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
<br><br><br><br><br>
<h3 style="text-align:center;">후기 수정</h3>
<div class="container" align="center" style="font-size:13px;">
<form action="reviewModify.me" method="post">
<table>
<tr>
<td><label for="ID">후기 ID&nbsp;&nbsp;&nbsp;</label></td>
<td><input type="text" id="id" readonly="readonly" name="review_id" value="<%=article.getReview_id()%>"  class="input1">
</td>
</tr>
<tr>
<td><label for="NAME">이름&nbsp;&nbsp;&nbsp;</label></td>
<td><input type="text" name="review_name" id="NAME" required="required" value="<%=article.getReview_name()%>" class="input1"></td>
</tr>

<tr>
<td><label for="JOB">직업&nbsp;&nbsp;&nbsp;</label></td>
<td><input type="text" name="review_job" id="JOB" required="required" value="<%=article.getReview_job()%>" class="input1"></td>
</tr>

<tr>
<td><label for="CONTENTS">내용&nbsp;&nbsp;&nbsp;</label></td>
<td><textarea type="text" name="review_contents" id="CONTENTS" required="required" cols="40" rows="15" required="required" style="resize: none;" class="input1"><%=article.getReview_contents()%></textarea></td>
</tr>

<br><br>


</table>
<tr align="center">
<input type="submit" value="수정" class="input2">&nbsp;&nbsp;&nbsp;
<input type="button" value="목록" class="input2" onclick="history.back(-1);">

</tr>
</form>


</div>


<br><br><br><br><br>

<%@ include file="/footer.jsp" %>
</div>
</body>
</html>