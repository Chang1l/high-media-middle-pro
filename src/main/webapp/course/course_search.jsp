<%@page import="vo.PageInfo"%>
<%@page import="vo.CourseBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
int pageNumber = 1;
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>강의 목록</title>
<style type="text/css">
h2 {
	text-align: center;
}

.table {
	margin: auto;
	width: 75%;
	table-layout: fixed;
}

#title {
	overflow: hidden;
	text-overflow: ellipsis;
	width: 70%;
	white-space: nowrap;
}

#tr_top {
	text-align: center;
}

.listcount {
	display: flex;
	justify-content: space-between;
}

#emptyArea {
	margin: auto;
	width: 100%;
	text-align: center;
}

/* medium 이상(태블릿, 768px 이상) */
@media ( min-width : 768px) {
	/* 20220927_ym  */
	.grid-thead.bg-primary.text-light {
		padding: 7px;
		margin-bottom: 20px;
	}
	/* 20220927_ym  */
	.grid-thead {
		display: grid;
		grid-template-columns: 5% 55% 10% 10% 10% 10%;
	}
	.grid-tbody {
		display: grid;
		grid-template-columns: 5% 55% 10% 10% 10% 10%;
	}
	.grid-td {
		display: grid;
		grid-template-columns: 75px 1fr 75px;
		grid-gap: 2px;
	}
	.searchtal {
		display: grid;
		align-content: center;
		width: 500px !important;
	}
	.mobile {
		display: none;
	}
}
/* medium 이하(모바일, 767px 이하) */
@media ( max-width : 767px) {
	.pc {
		display: none;
	}
	#trline {
		border: solid 0.1px;
	}
	.searchtal {
		width: 100px;
	}
	.btn-primary {
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
	position: absolute;
	bottom: 0;
	width: 100%;
}
</style>
<%@ include file="../header.jsp"%>
</head>

<body>

	<div class="wrap">
		<%
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		%>
		<!-- 게시판 리스트 -->
		<br>
		<br>
		<br>
		<div id="listForm" class="container">
			<h2>강의 목록</h2>
		</div>

		<!-- 	검색 -->
		<div class="container searchtal">
			<form method="get" name="search" action="courseSearchAction.me">
				<br><br>
				<div class="searchtable grid-td">
					<select class="form-control searchselect" name="C_COL">
						<option value="ALL">전체</option>
						<option value="C_TITLE">강의명</option>
						<option value="P_NAME">교수명</option>
					</select>
					<div class="search">
						<input type="text" class="form-control" placeholder="검색어를 입력해주세요"
							name="searchText" maxlength="100">
					</div>
					<div class="searchbutton">
						<button type="submit" class="btn btn-primary">검색</button>
					</div>
				</div>
				<br>
			</form>
		</div>

		<div class="container listcount">
			<div class="rs">
				<%
				if ("".equals(request.getParameter("searchText"))) {
				%>
				<span>전체 검색결과 | 총 <%=listCount%>강
				</span>
				<%
				} else {
				%>
				<span>"<%=request.getParameter("searchText")%>" 검색결과 | 총 <%=listCount%>강
				</span>
				<%
				}
				%>
			</div>
			<a href="courseWriteForm.me"><button type="button"
					class="btn btn-outline-primary">강의 등록</button></a>
		</div>
		<%
		if (courseList != null && listCount > 0) {
		%>
		<!-- 			강의 리스트 -->
		<div class="container pc">
			<br>
			<div class="grid-thead bg-primary text-light">
				<div class="c_no">번호</div>
				<div class="c_title">강의명</div>
				<div class="p_name">교수명</div>
				<div class="c_date">개강일자</div>
				<div class="c_resdate">등록일</div>
				<div class="c_resaldate">최종수정일</div>
			</div>
<!-- 			<hr id="trline"> -->
			<%
			for (CourseBean co : courseList) {
			%>
			<div class="grid-tbody">
				<div class="c_no"><%=co.getC_NO()%></div>
				<div id="title" class="c_title">
					<%
					if (co.getC_NO() > 0)
					%>
					<a href="courseDetail.me?c_no=<%=co.getC_NO()%>&page=<%=nowPage%>">
						<%=co.getC_TITLE()%></a>
				</div>
				<div class="p_name"><%=co.getP_NAME()%></div>
				<div class="c_date"><%=co.getC_DATE()%></div>
				<div class="c_resdate"><%=co.getC_RESDATE()%></div>
				<div class="c_resaldate">
					<%
					if (co.getC_RESALTDATE() != null) {
					%>
					<%=co.getC_RESALTDATE()%>
					<%
					} else {
					%>&nbsp;<%
					}
					%>
				</div>
			</div>
			<hr>
			<%
			}
			%>
		</div>
		<br>

		<!-- 				모바일 뷰	 -->
		<div class="container mobile">
			<hr id="trline">
			<%
			for (CourseBean co : courseList) {
			%>
			<div class="grid-thead">
				<div class="c_no">
					번호 :
					<%=co.getC_NO()%></div>
				<div class="c_title">
					강의명 :
					<%
				if (co.getC_NO() > 0)
				%>
					<a href="courseDetail.me?c_no=<%=co.getC_NO()%>&page=<%=nowPage%>">
						<%=co.getC_TITLE()%></a>
				</div>
				<div class="p_name">
					교수명 :
					<%=co.getP_NAME()%></div>
				<div class="c_date">
					개강일자 :
					<%=co.getC_DATE()%></div>
				<div class="c_resdate">
					등록일 :
					<%=co.getC_RESDATE()%></div>
				<div class="c_resaldate">
					최종수정일 :
					<%
				if (co.getC_RESALTDATE() != null) {
				%>
					<%=co.getC_RESALTDATE()%>
					<%
					} else {
					%>&nbsp;<%
					}
					%>
				</div>
			</div>
			<hr>
			<%
			}
			%>
		</div>

		<!-- 	페이징 처리 -->
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
					href="courseSearchAction.me?C_COL=<%=request.getParameter("C_COL")%>&searchText=<%=request.getParameter("searchText")%>&pageNumber=<%=nowPage - 1%>"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<%
				}
				%>

				<%
				for (int a = startPage; a <= endPage; a++) {
					if (a == nowPage) {
				%>
				<li class="page-item active" aria-current="page"><a
					class="page-link"
					href="courseSearchAction.me?C_COL=<%=request.getParameter("C_COL")%>&searchText=<%=request.getParameter("searchText")%>&pageNumber=<%=a%>"><%=a%></a></li>
				<%
				} else {
				%>
				<li class="page-item"><a class="page-link"
					href="courseSearchAction.me?C_COL=<%=request.getParameter("C_COL")%>&searchText=<%=request.getParameter("searchText")%>&pageNumber=<%=a%>"><%=a%></a></li>
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
				<li class="page-item"><a
					href="courseSearchAction.me?C_COL=<%=request.getParameter("C_COL")%>&searchText=<%=request.getParameter("searchText")%>&pageNumber=<%=nowPage + 1%>"
					class="page-link" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a> <%
 }
 %></li>
			</ul>
		</nav>
		<%
		} else {
		%>
		<div id="emptyArea">등록된 강의가 없습니다.</div>
		<%
		}
		%>

		<br>
		<br>
		<br>
		<%@ include file="../footer.jsp"%>
	</div>
</body>
</html>