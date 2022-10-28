<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, vo.ProfessorVO" %>
<% 
ArrayList<ProfessorVO> professorList = (ArrayList<ProfessorVO>)request.getAttribute("professorList"); 
%>

<html>
<head>
<title>교수 관리</title>
<%@include file="../header.jsp" %>

<script>
	//삭제,수정 버튼은 단순히 컨펌창과 true 던져주면 location.href 기능을 통해 페이지 이동 (대신 쿼리스트링으로 p_id 같이 전송)
	//false면 alert 뜨고 return 종료
	function f_delete(p_id, p_name) {
		var deleteYnF = confirm(p_name + " 교수님을 삭제하시겠습니까?");
		
		if(deleteYnF == true) {
			location.href = "ProfessorDelete.me?p_id=" + p_id;
		}
		else {
			alert("삭제를 취소하셨습니다.");
			return;
		}
	}
	
	function f_update(p_id, p_name) {
		var updateYnF = confirm(p_name + " 교수님을 변경하시겠습니까?");
		
		if(updateYnF == true) {
			location.href = "ProfessorUpdateForm.me?p_id=" + p_id; 
		}
		else {
			alert("변경을 취소하셨습니다.");
			return;
		}
	}
</script>
<style>
/*
	@media 미디어 쿼리를 통해 모바일 화면에서 작동할 css 구현
	
	태블릿이 보통 가로로 700~800px 정도 되니 최대 이 기준까지 아래 css 적용 됨
*/
@media (max-width: 800px) {

	.table thead, .table tbody, .table th, .table td, .table tr { 
		display: block; 
	}
	
	/*테이블 태그의 thead, tbody, th, td, tr 전부 블락 태그로 변형 (가로가 짧은 모바일에서 가로로 보여주는 대신 세로로 깔끔하게 떨어지면서 보여지게끔)*/
	
	/* 헤더는 감추되 display: none을 쓰지 말고 일반적인 사용자가 볼수 없는 곳으로 숨김*/
	.table thead tr { 
		position: absolute;
		top: -9999px;
		left: -9999px;
	}
	
	.table tr {
      margin: 0 0 1rem 0;
      border: 1px solid #ccc;
    }
    
    /*시각적인 편의성을 위해 홀수 줄마다 배경색을 약간 회색으로 변경*/
	
	.table tr:nth-child(odd) {
      background: #f8f8ff;
    }
    
    /*td가 메인 row가 됨 relative 선언 
    
    나중에 들어올 th 태그 내용을 위해 안쪽 여백 반 50%를 여백으로 줌 
    
    td:before 선택자 (td 앞 부분)을 위해 남겨둠*/
	
	.table td {
		border: none;
		border-bottom: 1px solid #eee; 
		position: relative;
		padding-left: 50%;
	}
	
	/*td:before이 position absoulte 선언됐으므로 td안에서 움직임
	
	top 50%, left 25%, transform: translate(-50%, -50%)가 딱 정중앙 위치 + 여백까지 갖춤
	
	padding-right로 살짝 오른쪽 td와 여백 주면서 white-space nowrap으로 줄바꿈 없음*/
	
	.table td:before { 
		position: absolute;
		top: 50%;
		left: 25%;
		transform: translate(-50%, -50%);
		width: 45%; 
		padding-right: 10px; 
		white-space: nowrap;
	}
	
	/*th에 들어가는 내용 하나 하나씩 입력*/
	
	.table td:nth-of-type(1):before { content: "교수 프로필 사진";}
	.table td:nth-of-type(2):before { content: "교수 아이디";}
	.table td:nth-of-type(3):before { content: "교수명";}
	.table td:nth-of-type(4):before { content: "경력";}
	.table td:nth-of-type(7):before { content: "캐치프레이즈";}
	.table td:nth-of-type(8):before { content: "관리";}
}

#listBody {
	margin: auto;
	padding-top: 1.5%;
	padding-bottom: 1.5%;
	width: 100%;
}

table, th, td {
	text-align: center;
}

th, td {
	vertical-align: middle;
}

table {
	width: 100%;
	margin: auto;
	table-layout: fixed;
	word-break: keep-all;
}

h2 {
	text-align: center;
}
	
hr {
	margin-left: auto;
	margin-right: auto;
}
	
.p_id {
	display: none;
}

#emptyArea {
	font-size: 20px;
	font-weight: bolder;
	margin: auto;
	text-align: center;
}

.btn{margin-top: 5px;}
</style>

</head>
<body>
<br><br><br>
<div class="container">
	<div id="listBody">
		<h2>교수 목록</h2>
		<h3 style="text-align: right;">
		<a href="ProfessorInsertForm.me"><button type="button" class="btn btn-outline-primary">교수 등록</button></a>
		</h3>
		<table class="table">
<%
if(professorList != null){
%>
	<thead>
	<tr class="bg-primary text-light" style="text-align: center;">
		<td>교수 프로필 사진</td>
		<td class="p_id">교수 아이디</td>
		<td>교수명</td>
		<td colspan="3">경력</td>
		<td>캐치프레이즈</td>
		<td>관리</td>
		
	</tr>
	</thead>
	
	<tbody>
	<% for(int i = 0; i < professorList.size(); i++) { 
	
	int p_id = professorList.get(i).getP_id();
	String p_name = professorList.get(i).getP_name();
	String p_record1 = professorList.get(i).getP_record1();
	String p_record2 = professorList.get(i).getP_record2();
	String p_record3 = professorList.get(i).getP_record3();
	String p_img = professorList.get(i).getP_img();
	String p_word = professorList.get(i).getP_word();
	
	if (p_record1 != null && p_record2 == null && p_record3 == null) { %>
	<tr>
		<td><img class="p_img" src="professor/ProfessorImg/<%=p_img%>" width="90" height="90" alt="교수님 사진" title="교수님 사진"/></td>
		<td class="p_id"><%=p_id%></td>
		<td class="p_name"><%=p_name%></td>
		<td class="p_record1"><%=p_record1%></td>
		<td class="p_record2"></td>
		<td class="p_record3"></td>
		<td class="p_word"><%=p_word%></td>
		<td><button onclick="f_update(<%=p_id%>,'<%=p_name%>')" class="btn btn-outline-primary">수정하기</button>
		<button onclick="f_delete(<%=p_id%>,'<%=p_name%>')" class="btn btn btn-outline-danger">삭제하기</button></td>
	</tr>
	<% } %>
	<% if (p_record1 != null && p_record2 != null && p_record3 == null) { %>
	<tr>
		<td><img class="p_img" src="professor/ProfessorImg/<%=p_img%>" width="90" height="90" alt="교수님 사진" title="교수님 사진"/></td>
		<td class="p_id"><%=p_id%></td>
		<td class="p_name"><%=p_name%></td>
		<td class="p_record1"><%=p_record1%></td>
		<td class="p_record2"><%=p_record2%></td>
		<td class="p_record3"></td>
		<td class="p_word"><%=p_word%></td>
		<td><button onclick="f_update(<%=p_id%>,'<%=p_name%>')" class="btn btn-outline-primary">수정하기</button>
		<button onclick="f_delete(<%=p_id%>,'<%=p_name%>')" class="btn btn btn-outline-danger">삭제하기</button></td>
	</tr>
	<% } %>
	<% if (p_record1 != null && p_record2 != null && p_record3 != null) { %>
	<tr>
		<td><img class="p_img" src="professor/ProfessorImg/<%=p_img%>" width="90" height="90" alt="교수님 사진" title="교수님 사진"/></td>
		<td class="p_id"><%=p_id%></td>
		<td class="p_name"><%=p_name%></td>
		<td class="p_record1"><%=p_record1%></td>
		<td class="p_record2"><%=p_record2%></td>
		<td class="p_record3"><%=p_record3%></td>
		<td class="p_word"><%=p_word%></td>
		<td><button onclick="f_update(<%=p_id%>,'<%=p_name%>')" class="btn btn-outline-primary">수정하기</button>
		<button onclick="f_delete(<%=p_id%>,'<%=p_name%>')" class="btn btn-outline-danger">삭제하기</button></td>
	</tr>
	<% } %>
<% } %>

</tbody>

</table>
	<%
    }
	else
	{
	%>
	<section id="emptyArea">등록된 교수님이 없습니다.</section>
	<% } %>
	</div>
</div>
<%@include file="../footer.jsp" %>
</body>
</html>