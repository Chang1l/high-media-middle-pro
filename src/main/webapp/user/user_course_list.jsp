<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.PageInfo"%>
<%@ page import="vo.CourseBean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
ArrayList<CourseBean> courseList = (ArrayList<CourseBean>) request.getAttribute("courseList");
PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
int listCount = pageInfo.getListCount();
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();

int c_no = (Integer) request.getAttribute("c_no");
int pageNumber=1;
%>

<!DOCTYPE html>

<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>전체 강의 목록 보기</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<style type="text/css">
#title {
	height:4.5rem;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
}
#card:hover {
box-shadow : 10px 10px 3px #ddd;
cursor : pointer;
}
/* medium 이상(태블릿, 768px 이상) */
@media (min-width: 768px){

    .grid-td {
        display: grid;
		grid-template-columns: 75px 1fr 75px;
		grid-gap:2px;
    }
    .searchtal {
    display: grid;
    align-content : center;
    width: 500px!important;
    }
	.mobile {
	display: none;
}
}
/* medium 이하(모바일, 767px 이하) */
@media (max-width: 767px){
.pc {
	display: none;
}
.searchtal {
    display: grid;
    align-content : center;
    }
.searchtal{
	width: 100%;
}
.btn-primary{
	width: 100%
}
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
.container2 {
    text-align: center;
   margin-top: 30px;
}

.intro_border:after {
    content: '';
    position: absolute;
    left: 0;
    bottom: .07em;
    height: 15px;
    width: 100%;
    background:linear-gradient(90deg,#1689f7,#37cdcc);
    z-index: -1;
    transition: height .25s cubic-bezier(.6,0,.4,1);
}

.intro_border {
    display: inline-block;
    position: relative;
    z-index: 1;
    font-weight: 700;
}

 :after { 
     box-sizing: border-box; 
 } 
 input.form-control {
    margin-bottom: 5px;
}
select.form-control.searchselect {
    margin-bottom: 5px;
}
</style>
<%@ include file="../header.jsp"%>
</head>
<body>
<div class="wrap">
	<div class="container2">
        <h1 class="intro_border">하이미디어에서 가치를 높이세요</h1>
    </div>
<!-- 	검색 -->
   <div class="container searchtal">
					<form method="get" name="search" action="usersearchAction.me">
				<br>
				<div class="searchtable grid-td">
						<select class="form-control searchselect" name="C_COL">
								<option value="ALL">전체</option>
								<option value="C_TITLE">강의명</option>
								<option value="P_NAME">교수명</option>
						</select>
						<div class="search">
						<input type="text" class="form-control"
							placeholder="검색어를 입력해주세요" name="searchText" maxlength="100"></div>
						<div class="searchbutton">
						<button type="submit" class="btn btn-primary">검색</button></div>
				</div>
				<br>
			</form>
		</div>
	
	
	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<%
				if (courseList != null && listCount > 0) {
					for (CourseBean co : courseList) {
				%>
				<div class="col mb-5">
					<div class="card h-100" id="card" onclick="location.href='usercourseDetail.me?c_no=<%=co.getC_NO()%>&page=<%=nowPage%>';">
						<div class="badge bg-dark text-white position-absolute"
							style="top:0.5rem; left: 0.5rem">개강일자 <%=co.getC_DATE()%>
						</div>
<!-- 						강좌수 -->
						<div class="badge bg-dark text-white position-absolute"
							style="bottom: 14.2rem; right: 0.5rem"><%=co.getC_VOL()%>강
						</div>
						<!-- 강의 이미지 -->
						<img class="card-img-top" src="courseUpload/<%=co.getC_IMG()%>"
							alt="<%=co.getC_IMG()%>">
						<!-- 상세보기틀 -->
						<div class="card-body p-4">
							<div class="text-center">
<!-- 								강사명 -->
								<h5 class="text-muted"><%=co.getP_NAME()%></h5>
								<!-- 강의명-->
								<div
									class="card-footer p-1 pt-0 border-top-1 bg-transparent fw-bolder text-muted">
									<div id="title">
										<%=co.getC_TITLE()%>
									</div>
								</div>
							</div>
						</div>
						<!-- 상세보기 이동-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<%
								if (co.getC_NO() > 0)
								%>
								<a class="btn btn-outline-primary mt-auto"
									href="usercourseDetail.me?c_no=<%=co.getC_NO()%>&page=<%=nowPage%>">
									상세보기 </a>
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
				href="usercourseList.me?page=<%=nowPage - 1%>" aria-label="Previous">
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
				class="page-link" href="usercourseList.me?page=<%=a%>"><%=a%></a></li>
			<%
			} else {
			%>
			<li class="page-item"><a class="page-link"
				href="usercourseList.me?page=<%=a%>"><%=a%></a></li>
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
			<li class="page-item">
			<a class="page-link" href="usercourseList.me?page=<%=nowPage + 1%>" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
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