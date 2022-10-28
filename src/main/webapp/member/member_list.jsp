<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<style>
table {
	margin-left: auto;
	margin-right: auto;
	width: 90% !important;
}

.res_tbl_wrap {
	position: relative;
	overflow: hidden;
	margin: 0 auto;
	width: 75%;
}

.res_tbl_wrap table {
	display: table;
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
}

/* desktop only */
@media screen and (min-width: 1200px) {
	.res_tbl_wrap table thead tr th, .res_tbl_wrap table tbody tr td {
		padding: 12px 20px;
		font-size: 16px;
		line-height: 22px;
	}
}

/* mobile only */
@media screen and (max-width: 990px) {
	.res_tbl_wrap table col {
		width: 100% !important;
	}
	.res_tbl_wrap table thead {
		display: none;
	}
	.res_tbl_wrap table tbody tr {
		border-bottom: 1px solid #efefef;
	}
	.res_tbl_wrap table tbody tr td {
		width: 100%;
		display: flex;
		margin-bottom: 2px;
		padding: 5px;
		border-bottom: none;
		font-size: 14px;
		line-height: 18px;
	}
	.res_tbl_wrap table tbody tr td:first-child, .res_tbl_wrap table tbody tr th:first-child
		{
		padding-top: 16px;
	}
	.res_tbl_wrap table tbody tr td:last-child, .res_tbl_wrap table tbody tr th:last-child
		{
		padding-bottom: 15px;
	}
	.res_tbl_wrap table tbody tr td:before {
		display: inline-block;
		margin-right: 12px;
		-webkit-box-flex: 0;
		-ms-flex: 0 0 100px;
		flex: 0 0 100px;
		font-weight: 700;
		content: attr(data-label);
	}
}

tr:hover {
	background-color: #f8f8ff;
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
<script>
function deletecheck(m_id){
		if (confirm("정말 삭제하시겠습니까?")){ 
			$('.deleteform'+m_id).submit();
			 }
	}	
</script>
	<%@ include file="/header.jsp"%>
</head>
<body>
	<br><br><br>
	<div class="wrap">
	<div class="container">
		<h2 style="text-align: center;">회원 목록</h2>
		</div>
		<br><br><br>
		
	<div class="res_tbl_wrap">
	<table class="table" >
	<colgroup>
        <col style="width:10%" >
        <col style="width:10%" >
        <col style="width:20%" >
        <col style="width:15%" >
        <col style="width:15%" >
        <col style="width:20%" >
        <col style="width:10%" >
      </colgroup>
		<thead>
			<tr class="bg-primary text-light text-center">
		<td>아이디</td>
		<td>이름</td>
		<td>주소</td>
		<td>전화번호</td>
		<td>생년월일</td>
		<td>이메일</td>
		<td>회원관리</td>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="member" items="${memberList}">
			<tr class="text-center">
				<td scope="row" data-label="아이디">${member.m_ID}</td>
				<td data-label="이름">${member.m_NAME}</td>
				<td data-label="주소">${member.m_ADDR}</td>
				<td data-label="전화번호">${member.m_TEL}</td>
				<td data-label="생년월일">${member.m_BIRTH}</td>
				<td data-label="이메일">${member.m_EMAIL}</td>
				<td data-label="회원관리"><input type="button" class="btn btn-outline-danger" value="삭제" onclick="deletecheck('${member.m_ID }');"/></td>
				<form name="deleteform" class="deleteform${member.m_ID }" class="form-horizontal" action="./memberDeleteAction.me" method="post" style="display:none;">
			<input id="m_id" name="m_id"  type="hidden" class="form-control" value="${member.m_ID}" readonly />
			</form>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
<%@ include file="../footer.jsp"%>
	</div>
</body>
</html>