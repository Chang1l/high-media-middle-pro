<%@page import="vo.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	BoardBean article = (BoardBean)request.getAttribute("article");
	String filename=article.getB_FILE();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
	<title>글 수정</title>
	
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

	#B_FILE{display:none;}
</style>
	<script type="text/javascript">
	function modifyboard(){
		modifyform.submit();
	}
	
	function changebtn(){
		$('#thImgBtn').css('display', 'none');
		$('#show_B_FILE').css('display', 'none');
		$('#B_FILE').show();
		
	}
		
		

	</script>
<%@ include file="/header.jsp" %>
	
</head>
<body>
<!-- 게시판 등록 -->
<div class="container text-center" >
<br>
<h2>게시판 글 수정</h2>
<br>
</div>

<div class="container text-center" >

<form action="boardModifyPro.me" method="post"
enctype="multipart/form-data" name = "modifyform">
<input type = "hidden" name ="B_NO" value ="<%=article.getB_NO()%>">

<table class="table " style="width: 100%; border-collapse: collapse; table-layout: fixed;">
	<tr>
		<td class="col-2" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;" ><label for = "M_ID">글쓴이</label></td>
		<td class="col"><input type ="text" id = "M_ID" value ="<%=article.getM_ID()%>" readonly="readonly" style=" width:100%; overflow:hidden;white-space:nowrap;">
			<input type="hidden" name="m_id" value="<%=session.getAttribute("id")%>">
		</td>
	</tr>
	<tr>
		<td class="col-2 " style="overflow:hidden; white-space:nowrap; text-overflow:ellipsis;" >
			<label for = "B_SUBJECT">제 목</label>
		</td>
		<td class="col">
			<input name="B_SUBJECT" type="text"  style=" width:100%;  overflow:hidden; white-space:nowrap; text-overflow:ellipsis;" id = "B_SUBJECT" value = "<%=article.getB_SUBJECT()%>"/>
		</td>
	</tr>
	<tr>
		<td  class="col-2 " style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;" >
			<label for = "B_CONTENT">내 용</label>
		</td>
		<td class="col">
			<textarea id = "B_CONTENT" name="B_CONTENT" cols="40" rows="15" style=" width:100%; resize: none; overflow:hidden;white-space:nowrap;"><%=article.getB_CONTENT()%></textarea>
		</td>
	</tr>
	
		<tr>
		
		<td class="col-2"  style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
			<label for = "B_FILE">파 일</label>
		</td>
	<%if (filename!=null) {%>
		<td class="col">
		<img src="./boardUpload/<%=article.getB_FILE()%>" style="width: 33%; height: 33%;"  alt="<%=article.getB_FILE()%>"/>
		
		<br>
		<br>
		  <input type="file" id = "B_FILE_changer" name="B_FILE">
			<br>
         
          <br>
		</td>
		<%}else{ %>
			<td class="col">
			
		  <input type="file" id = "B_FILE_null" name="B_FILE">
		
		</td>
		<%} %>
	</tr>
</table>
			<br>
			<a href="javascript:modifyboard()"  class="btn btn-outline-primary">수정</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)"  class="btn btn-outline-primary">뒤로</a>

</form>

</div>
<br><br>
	<%@ include file="../footer.jsp"%>
</body>
</html>