<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- AOS 라이브러리 불러오기-->
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 

<style>




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
<h3 style="text-align:center;">감사합니다.<br><br><%=m_id%>님의<br> 수강후기가 전송되었습니다.<br></h3>
<br><div style="color:blue; text-align: center; font-size:24px;"><h6>수강 후기는 횟수 제한없이 언제든 보낼 수 있습니다.</h6></div>

<br><br><br>

<!-- 학원장 감사말 -->
<div class="row" style="padding: 0px 10px 0px 10px;">
<div class="col-sm-3">&nbsp;</div>
<div class="col-sm-3 style="align-items:center; display: flex; justify-content:center;">
<img src="img/boss.png" width="300" height="400">
</div>
<div class="col-sm-3" style="text-align:center;">
<br><br><br>
<h3><b>Thanks, World.</b></h3>
</div>
<div class="col-sm-3">&nbsp;</div>
</div>
<!-- 학원장 감사말 -->
<br><br>


<div align="center">
<table>
<tr>
<td><input type="reset" value="강의실로" class="input2" onclick="location.href='./usercourseList.me'"></td>
<td><input type="button" value="나의 강의실로" class="input2" onclick="location.href='./registList.me'"></td>
</tr>
</table>
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
