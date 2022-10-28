<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록</title>
<style>
input::file-selector-button {
   width: 100px; 
   height: 30px; 
   color: #fff; 
   background: #62b6cb; 
   border: 1px solid #62b6cb; 
   border-radius: 5px; 
   cursor: pointer; 
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
  width: 100%!important;
  position: absolute;
  bottom: 0;
}
</style>
<%@ include file="/header.jsp" %>
</head>
<body>
	<!-- 게시판 등록 -->
<div class="wrap">
	<div class="container text-center" >	
	<br>
	<h2>게시판 글등록</h2>
	<br>
	</div>
	
	<div class="container text-center" >

		<form action="boardWritePro.me" method="post"	enctype="multipart/form-data" name="boardform">
			<table class="table " style="width: 100%; border-collapse: collapse; table-layout: fixed;">
				<tr>
					<td class="col-2" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;" ><label for="M_ID">글쓴이</label></td>
					<td class="col"><input type="text" name="M_ID"
						id="M_ID" readonly="readonly" required="required" style=" width:100%; overflow:hidden;white-space:nowrap;" value="<%=session.getAttribute("id")%>"/></td>
				</tr>
				<tr>
					<td class="col-2 " style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;" ><label for="B_SUBJECT">제 목</label></td>
					<td class="col"><input name="B_SUBJECT" type="text"
						id="B_SUBJECT" required="required" style=" width:100%; overflow:hidden;white-space:nowrap;text-overflow:ellipsis;" /></td>
				</tr>
				<tr>
					<td class="col-2 "  style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"><label for="B_CONTENT">내 용</label></td>
					<td class="col" ><textarea id="B_CONTENT" name="B_CONTENT"
						 rows="15"	required="required" style=" width:100%; resize: none; overflow:hidden;white-space:nowrap;"></textarea></td>
				</tr>
				<tr>
					<td class="col-2"  style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"><label  for="B_FILE"> 파 일 </label></td>
					<td class="col"><input name="B_FILE" type="file" id="B_FILE"  /></td>
						
				</tr>
			</table>
			
				<button type="button" class="btn btn-outline-primary"  onclick="location.href='boardList.me'" >목록</button>&nbsp;&nbsp; 
				<input class="btn btn-outline-primary" type="submit" value="등록">&nbsp;&nbsp; 
				<input class="btn btn-outline-primary"	type="reset" value="다시쓰기" />
		
		</form>

	</div>
	<%@ include file="../footer.jsp"%>
</div>
</body>
</html>