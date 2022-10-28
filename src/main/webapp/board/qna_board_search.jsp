<%@page import="dao.BoardDAO"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.BoardBean"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<BoardBean> articleList=(ArrayList<BoardBean>)request.getAttribute("articleList");

    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount(); //1
	int nowPage=pageInfo.getPage(); // 1
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage(); //1
	int endPage=pageInfo.getEndPage(); //1
	BoardDAO boardDAO= BoardDAO.getInstance();
	
	int pageNumber = 1;

	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title> 게시판</title>
<script>
	function check(){
		alert("로그인 후 이용해주세요");
		location.href = "./memberLogin.me";
	}
</script>
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
<%@ include file="../header.jsp" %>
</head>

<body>
	<!-- 게시판 리스트 -->
<%


if (request.getParameter("pageNumber") != null) {
	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
}
%>
<br>
<div class="wrap">
	<section id="listForm">
		<div class="container">
		<br>
		<h1 style="text-align: center;">글 검색 목록</h1>
		<br>
		</div>
		<div class="container">
		<div class="row" style="float:right;">
			<form method="get" name="search" action="searchAction.me">
				<table class="pull-right">
					<tr>
						<td><select class="form-control" name="B_COL">
								<option value="B_SUBJECT" selected>제목</option>
								<option value="M_ID">작성자</option>
						</select></td>
						<td><input type="text" class="form-control"
							placeholder="검색어를 입력해주세요" name="searchText" maxlength="100"required="required"></td>
						<td><button type="submit" class="btn btn-primary">검색</button></td>
					</tr>
				</table>
				<br>
			</form>
		</div>
	</div>

	
	<div class="container">
	"<%=request.getParameter("searchText") %>" 검색 결과 | 검색 결과 수: ${listCount }
	
	</div>
<!-- 		게시판 목록 -->
				<%
			if(articleList != null && listCount > 0){
			%>
	<div class="container">
				 	  
	
		<table class="table" style="width: 100%; border-collapse: collapse; table-layout: fixed;">

		
			<tr class="bg-primary text-light text-center">
				<td class="col-2">번호</td>
				<td class="col-3">제목</td>
				<td class="col-3">작성자</td>
				<td class="col-2">날짜</td>
				<td class="col-2">조회수</td>
			</tr>
	
			<%
		for(int i=0;i<articleList.size();i++){
			
	%>
			<tr>
		
				<td class="col-2 text-center"><%=articleList.get(i).getB_NO()%></td> <!-- 1 -->
				
				<td class="col-3" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">	<a class="text-dark" href="boardDetail.me?b_no=<%=articleList.get(i).getB_NO()%>">
						<%=articleList.get(i).getB_SUBJECT()%></a>
				</td>
				<td class="col-3 text-center" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"><%=articleList.get(i).getM_ID() %></td>
				<td class="col-2 text-center" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"><%=articleList.get(i).getB_DATE() %></td>
				<td  class="col-2 text-center" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"><%=articleList.get(i).getB_READCOUNT() %></td>
			
			</tr>
			<%} %>
		</table>
		</div>
	</section>
<!-- 	페이징버튼 -->
		<div class="container ">
		
					 <nav aria-label="Page navigation example">
  	<ul class="pagination justify-content-center">
	 <li class="page-item " ><a class="page-link" href="searchAction.me?B_COL=<%=request.getParameter("B_COL") %>&searchText=<%=request.getParameter("searchText") %>&pageNumber=1">&laquo;</a></li>
	<%	if (pageNumber<=1){ %>
	 <li class="page-item "  ><a class="page-link" style="color:gray;">&lt;</a></li>
	<%} else{%>
		 <li class="page-item " ><a class="page-link" href="searchAction.me?B_COL=<%=request.getParameter("B_COL") %>&searchText=<%=request.getParameter("searchText") %>&pageNumber=<%=pageNumber-1%>">&lt;</a></li>
	<%} %>
	
		<%for(int i=startPage;i<pageNumber;i++){
				%>
				<li class="page-item" ><a class="page-link" href="searchAction.me?B_COL=<%=request.getParameter("B_COL") %>&searchText=<%=request.getParameter("searchText") %>&pageNumber=<%=i%>"><%=i%></a></li>
			<%	} %>
		
				 <li class="page-item active" ><a class="page-link" href="searchAction.me?B_COL=<%=request.getParameter("B_COL") %>&searchText=<%=request.getParameter("searchText") %>&pageNumber=<%=pageNumber%>"><%=pageNumber%></a></li>
			<!--자신페이지 -->
				<%for(int i=pageNumber+1; i<=endPage; i++){	
					%>
					<li class="page-item" ><a class="page-link" href="searchAction.me?B_COL=<%=request.getParameter("B_COL") %>&searchText=<%=request.getParameter("searchText") %>&pageNumber=<%=i%>"><%=i%></a></li>
			
				<%} %>
	
					<%if(pageNumber>=maxPage){%>
					<li class="page-item"><a class="page-link"href="#" style="color:gray;"> &gt;</a>
						 </li>
					<%}else{ %>
					 <li class="page-item">
						 <a class="page-link"href="searchAction.me?B_COL=<%=request.getParameter("B_COL") %>&searchText=<%=request.getParameter("searchText") %>&pageNumber=<%=pageNumber+1%>"> &gt;</a></li>
				<%} %>
				 <li class="page-item">
						 <a class="page-link"href="searchAction.me?B_COL=<%=request.getParameter("B_COL") %>&searchText=<%=request.getParameter("searchText") %>&pageNumber=<%=maxPage%>">&raquo;</a></li>
						 
			
				</ul>
			  </nav>		
				</div>
			
	<%
    }else{%>
	<div class="container">
	<table class="table" style="width: 100%; border-collapse: collapse; table-layout: fixed;">

		
			<tr class="bg-primary text-light text-center">
				<td class="col-2">번호</td>
				<td class="col-3">제목</td>
				<td class="col-3">작성자</td>
				<td class="col-2">날짜</td>
				<td class="col-2">조회수</td>
			</tr>
			<tr>
				<td class="text-center" colspan="5">검색 결과가 없습니다.</td>
				
			</tr>
			</table>

	</div>
	<%}	%>
	
	<div class="container">
	<div class="row" style="float:right;">
	<form>
	<table class="pull-right">
					<tr>
				<td><button type="button" class="btn btn-outline-primary " onclick="location.href='boardList.me'">목록으로</button>
	<%if(session.getAttribute("id")==null) {%>
		<td ><button type="button" class="btn btn-outline-primary" onclick="check()" >글쓰기</button></td>
	<%}else{ %>
		<td><button type="button" class="btn btn-outline-primary " onclick="location.href='boardWriteForm.me'">글쓰기</button></td>
		<%} %>
		
		</tr>
				</table>
				</form>
		</div>
		</div>
	<%@ include file="../footer.jsp"%>
	</div>
</body>
</html>