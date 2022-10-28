<%@page import="vo.ReplyBean"%>
<%@page import="vo.BoardBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%
	BoardBean article = (BoardBean)request.getAttribute("article");
	ArrayList<ReplyBean> replyList=(ArrayList<ReplyBean>)request.getAttribute("articleList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>
<style>
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
<script src="./script/qna_board_view.js">
</script>
<script>
$(document).ready(function(){
function change() {
	var str = $('#content').val();

	str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');

	$('#content').val(str);
  }};

</script>
<%@ include file="/header.jsp" %>
</head>
<body>


	<!-- 글 보기 -->
	<br>
	<div class="wrap">
	<div class="container">
		<div class="row">
				<table class="table" style="width: 100%; border-collapse: collapse; table-layout: fixed;">
			<thead>
			<tr >
			<th colspan="3"  style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">	
			<h2><%=article.getB_SUBJECT()%></h2> </th>
			</tr>
			<tr>
			<td colspan="3" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
			  <div class="row">
    		<div class="col-sm d-flex justify-content-start" >
    		<span>작성자:
			<%=article.getM_ID() %> &nbsp;
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
			  <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z"/>
			  <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0z"/>
			</svg>	<%=article.getB_DATE()%></span>
		    </div>
		    <div class="col-sm-3 d-flex justify-content-end">
		     <span>첨부파일 :
					<%if(article.getB_FILE()!=null){ %>
					<a href="./boardUpload/<%=article.getB_FILE()%>" download=<%=article.getB_FILE()%>> <%=article.getB_FILE() %>
					</a>
					<%} %>
			</span> 
		    </div></div>
				
			</td>
		
			</tr>
			</thead>
			<tbody style="background-color: #fff;"class="text-left" >
			<tr>
			
			<%
		    String str1 = article.getB_CONTENT();
		    String str2 = str1.replace("\r\n","<br>");
			%>
			<td colspan="3">
			<%if(!(article.getB_FILE()==null)){ %>
			<div class="text-center">
			<img src="./boardUpload/<%=article.getB_FILE()%>" style="width:35%; height: 35%" alt="<%=article.getB_FILE()%>"/>
			</div>
			<br><span id="content"><%=str2 %></span>
			
			<%}else{ %>
			<br> <span id="content"><%=str2 %></span>
			
			<%} %>
			
			</td></tr></tbody>
	</table>

	</div>
	</div>
	<div class="container d-flex justify-content-end" >
		<a	href="boardModifyForm.me?b_no=<%=article.getB_NO() %>" style="text-decoration:none;">	[수정]&nbsp;</a> 
		 <%if(session.getAttribute("id")!=null){ %>
			 <a style="cursor:pointer;text-decoration:none; color:#007bff;" onclick="boardremoveCheck(<%=article.getB_NO() %>)">[삭제]&nbsp; </a>
			 <% }else{%>
			 <a style="cursor:pointer; color:#007bff;" onclick="check()">[삭제]&nbsp; </a>
			<%} %>
		
		<% if(request.getAttribute("page") !=null ){%>
			<a href="boardList.me?page=${page }" style="text-decoration:none;">[목록]</a>&nbsp;&nbsp;
		<%}else{ %>
			<a href="boardList.me" style="text-decoration:none;">[목록]</a>&nbsp;&nbsp;
		<%} %>
		
		</div>	
	
<!-- 	댓글보기 -->
	<div class="container">
		<div class="row">
		<br>
		<h5><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-left-text" viewBox="0 0 16 16">
		<path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
		<path d="M3 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 6a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 6zm0 2.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
		</svg> &nbsp; 댓글</h5>
		<table class="table" >
					<%
					for(int i=0;i<replyList.size();i++){	
					%>
			<tr>
			<td class="reply_Update" >작성자:
			<%=replyList.get(i).getM_ID() %>
			&nbsp;
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
			  <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z"/>
			  <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0z"/>
			</svg>	<%=replyList.get(i).getR_date() %><br>
			<span class="reply_Update" >내용: <%=replyList.get(i).getR_comment()%></span>	
			<br>	
			</td>
			
			<td class="reply_Update"> 
			 <a style="cursor:pointer; color:#007bff;" onclick="replyUpdate(<%=replyList.get(i).getR_NO()%>)">[수정]</a><br>	
			 <a style="cursor:pointer; color:#007bff;" onclick="replyremoveCheck(<%=replyList.get(i).getR_NO()%>)">[삭제] </a>
			</td>
	
			<td  id="replyUpdateForm<%=replyList.get(i).getR_NO()%>" style="display:none;">
<!-- 			댓글 수정폼  -->
			<form action="boardReplyUpdatePro.me?b_no=<%=article.getB_NO()%>&r_no=<%=replyList.get(i).getR_NO()%>" method="post" name="replyUpdateform">
				댓글 수정<br>
				<table class="table">
					<tr>	
						작성자: <%=replyList.get(i).getM_ID()%><br>
						<input type="text" name="M_ID" value="<%=session.getAttribute("id")%>" style="display: none;">
						<td>
						<div class="row">
						<div class="col-9">
							<textarea  class="form-control"id="REPLY_UPDATE_CONTENT" name="R_COMMENT"
							cols="150" rows="3" required="required" style="resize: none;"><%=replyList.get(i).getR_comment()%></textarea>
							</div>
							<div class="col">	
								<input class="btn btn-primary" style="margin: 2px;" type="submit" value="등록">
						
								<input class="btn btn-primary" style="margin: 2px;" type="button" value="취소" onClick="replyUpdate_Cancel(<%=replyList.get(i).getR_NO()%>)">						
							</div>	
						</div>
						</td>				
					</tr>		
				</table>
				</form>
			</td>
			
			<td  id="replyUpdateForm<%=replyList.get(i).getR_NO()%>" style="display:none;">
<!-- 			댓글 삭제폼  -->
			<form  id="replydeleteForm"action="boardReplyDeletePro.me?b_no=<%=article.getB_NO()%>&r_no=<%=replyList.get(i).getR_NO()%>" method="post" name="replyUpdateform">
				댓글 삭제<br>
				<input type="hidden" name="M_ID" value="<%=session.getAttribute("id")%>" style="display: none;">								
				</form>
			</td>
			</tr>
			<%} %>
	
	</table>
</div>
<!-- 	</div> -->
	
<!-- 	댓글 달기 폼 -->
	<div class="container">
	<div class="row justify-content-md-center">
	<form class="reply_Update" action="boardReplyPro.me?b_no=<%=article.getB_NO()%>" method="post" name="replyform">
		<fieldset>
            <legend>댓글쓰기</legend>		
            		<div class="row">	
					<input class="form-control" name="M_ID" value=<%=(String)session.getAttribute("id")%> required="required" style="display: none;">							
					
					<%if(session.getAttribute("id")!=null){ %>
					<div class="col">
					<textarea  class="form-control"id="REPLY_CONTENT" name="R_COMMENT"
							 rows="3" required="required" style="resize: none;" placeholder="댓글을 입력해주세요"></textarea>
					</div>
					<div class="col-2">	
			
						<button class="btn btn-primary btn-lg" type="submit" >등록</button>
				
					</div>
					<%}else { %>
					<div class="col">
					<textarea  class="form-control "id="REPLY_CONTENT" name="R_COMMENT"
							rows="3" required="required" style="resize: none;" placeholder="로그인 후 이용해주세요" ></textarea>	
					</div>
					<div class="col-2">	
					<button type="button" class="btn btn-primary btn-lg" onclick="check()" >등록</button>
						</div>
					<%} %>		
					</div>
				
			</fieldset>
	</form>
	</div>
	
	</div>
	
	<br>
	<br>
	<br>
	</div>
	<%@ include file="../footer.jsp"%>
</div>
</body>
</html>