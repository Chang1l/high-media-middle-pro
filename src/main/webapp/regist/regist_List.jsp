<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.PageInfo"%>
<%@ page import="vo.CourseBean"%>
<%@ page import="vo.RegistBean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
ArrayList<RegistBean> registList = (ArrayList<RegistBean>) request.getAttribute("registList");
PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
int listCount = pageInfo.getListCount();
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();

int c_no = (Integer) request.getAttribute("c_no");
%>

<!DOCTYPE html>

<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>나의 강의 목록 보기</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<style type="text/css">
#title {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
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
#card:hover {
box-shadow : 10px 10px 3px #ddd;
cursor : pointer;
}
button.btn.btn-outline-danger {
    margin-top: 5px;
}
a.btn.btn-outline-primary {
    margin-top: 5px;
}
/* 수강후기 스타일 */

a{
   text-decoration-line: none!important;
}

.doit:hover{
   color: #62b6cb !important;
   background: #fff !important;
   border: 2px solid #62b6cb;
   padding: 15px;
}

.doit:hover a{
   border-radius: 25px;
   color: #62b6cb !important;
   background: transparent !important;
}

.doit{
   border-radius: 100px;
   color: white;
   background: #62b6cb;
   width: 100px;
   height: 100px;
   border: 2px solid #62b6cb;
   padding: 15px;
/* 수강후기 스타일 */

</style>
<%@ include file="/header.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
	
</script>
<script>
	function r_delete(g_no) {
		var deleteYnF = confirm("수강신청을 취소 하시겠습니까?");

		if (deleteYnF == true) {
			location.href = "RegistDelete.me?g_no=" + g_no;
		} else {
			alert("수강신청을 유지합니다.");
			return;
		}
	}
</script>
</head>
<body>
<br><br>

<!-- 수강후기 보내기 -->
<a href="./all_review_write.me" style="color:white; font-size:13;">
<div class="doit" style="text-align: center; position: fixed; bottom:144px; right:28px; z-index:1000; box-shadow: 0 5px 18px -7px rgba(0,0,0,1);">
<b>
<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">
  <path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/>
</svg>
<br>수강후기</b>
</div>  
</a>
<!-- 수강후기 보내기 -->

<div class="wrap">
<h1 style="text-align: center;">나의 수강 정보</h1>
	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<!--             <div class="container px-5 px-lg-5 mt-5"> -->
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<!--                 <div class="row gx-5 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-5 justify-content-center"> -->
				<%
				if (registList != null && listCount > 0) {
					for (RegistBean ro : registList) {
				%>

				<div class="col mb-5">
					<div class="card h-100" id="card">
						<!-- 강좌수-->
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem"><%=ro.getC_VOL()%>강
						</div>
						<!-- 강의 이미지 -->
						<img class="card-img-top" src="courseUpload/<%=ro.getC_IMG()%>"
							alt="<%=ro.getC_IMG()%>">
						<!-- 상세보기틀 -->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- 강좌명 -->
								<h5 class="text-muted"><%=ro.getP_NAME()%></h5>
								<!-- 강사명-->
								<div
									class="card-footer p-4 pt-0 border-top-1 bg-transparent fw-bolder text-muted">
									<div id="title">
										<%=ro.getC_TITLE()%>
									</div>
								</div>
							</div>
						</div>

						<!-- 상세보기 이동-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<%
								if (ro.getC_NO() > 0)
								%>
								<a class="btn btn-outline-primary"
									href="usercourseDetail.me?c_no=<%=ro.getC_NO()%>&page=<%=nowPage%>">상세보기</a> 
								<a> 
							
								<button class="btn btn-outline-danger" onclick="r_delete(<%=ro.getG_NO()%>)">수강취소</button></a>
								
							</div>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</section>


	<!-- 페이지 이동-->
	<nav aria-label="Page navigation example" id="pageList">
		<ul class="pagination justify-content-center">
			<%
			if (nowPage <= 1) {
			%>
			<li class="page-item disabled">
				<%
				} else {
				%>
			
			<li class="page-item"><a class="page-link"
				href="registList.me?page=<%=nowPage - 1%>" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
			</a></li>
			<%
			}
			%>

			<%
			for (int a = startPage; a <= endPage; a++) {
				if (a == nowPage) {
			%>
			<li class="page-item active" aria-current="page"><a
				class="page-link" href="registList.me?page=<%=a%>"><%=a%></a></li>
			<%
			} else {
			%>
			<li class="page-item"><a class="page-link"
				href="registList.me?page=<%=a%>"><%=a%></a></li>
			<%
			}
			%>
			<%
			}
			%>

			<%
			if (nowPage >= maxPage) {
			%>
			<%
			} else {
			%>
			<a href="registList.me?page=<%=nowPage + 1%>" class="page-link"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a>
			<%
			}
			%>
			</li>
		</ul>
	</nav>
	<%
						} else {
	%>
	<section id="emptyArea">등록된 강의가 없습니다.</section>
	<%
	}
	%>



	<!-- 여기부터 footer -->
	<%@ include file="../footer.jsp"%>
	</div>
</body>
</html>