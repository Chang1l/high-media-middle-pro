<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="vo.ReviewBean, java.util.*" %>  
<% ArrayList<ReviewBean> reviewList = (ArrayList<ReviewBean>) request.getAttribute("reviewList"); %> 

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>

<!DOCTYPE html>
<html>

<head>
<style>
body, html{
width:100%;
overflow-x:hidden;
}
/* 호버 시 후기 슬라이드 멈춤*/
div:hover {animation-play-state: paused;}


/* 후기 슬라이드 스타일 영역*/
#slidebox {
   overflow:hidden;
   position:relative;
   border:0px solid ;
   width:100%;
}

.slide-card{
	width:300px;
	margin: 10px;
	padding: 30px;
	overflow:hidden;
	word-break:break-all;
	background-color:white;
	text-align:center;
	border-radius: 10px;
	box-shadow: 0 5px 18px -7px rgba(0,0,0,1);
}

#slide-review{
	text-align:left;
	font-family:cursive, monospace;
	font-size:12.5px;
	padding: 10px;
}

.slide {
   height:280px;
   width:2550px; /* 보여야 하는 이미지 + 복사이미지 전체 합 */
   display:flex;
   flex-wrap:nowrap;
   animation: bannermove 26s linear infinite;
}
   
.slide > div {
   flex:0 0 auto;
   background-color:solid;
   vertical-align:top;
   text-align:center;
}

@keyframes bannermove {
  0% {
      transform: translate(0, 0);
  }
  100% {
      transform: translate(-100%, 0);
  }
}

@keyframes blink {
  50% {
    opacity: 0;
  }
}

.blink {
  animation: animation: blink 2.5s linear infinite
/* 후기 슬라이드 스타일 영역*/

</style>

<%@ include file="header.jsp" %>
</head>

<body>


<!-- 슬라이드 후기 데이터 가져오기 위한 함수 -->
<script>
$(document).ready(function(){
<%if(request.getParameter("check")==null){%>	
location.href = "index.me";
// 	$.ajax({
// 		url : "index.me", 
// 		type : "get",
// 		success : function(data) { 
// 			alert('success');
// // 			alert(data.list[0].number); // 날린 데이터 확인
// // 			alert(data.list[0].name);
// 		},
// 		errer : function() {
// 			alert('errer');
// 		}
// 	});
<%}%>	
});
</script>

<!-- 슬라이드 후기 데이터 가져오기 위한 함수 -->


<!--여기까지 헤더-->

<!--여기부터 아래를 수정하세요 -->
<!--여기부터 아래를 수정하세요 -->

<!-- 인덱스 상단 움직이는 이미지 -->
	<div id="topimg" style="position: relative;">
		<img src="img/top2.gif" width="700" height="450"
			style="filter: brightness(50%);" class="d-block w-100" id="topimg">
		<h1
			style="color: white; font-size: 30px; text-align: center; line-height: 200%; position: absolute; top: 35%; left: 50%; transform: translate(-50%, -50%);">
			<b class="toptext">하이미디어 학원에서<br>개발자의 꿈을 이루세요
			</b>
		</h1>

		<c:choose>
			<c:when test="${'admin' eq id}">
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-outline-light"
					onclick="location.href='usercourseList.me'"
					style="position: absolute; top: 75%; left: 50%; transform: translate(-50%, -50%);">강의실
					바로가기</button>
			</c:otherwise>
		</c:choose>
	</div>
	<!-- 인덱스 상단 움직이는 이미지 -->



<!-- 영역 구분선 -->
<br><br>
<hr style="color: black; background-color: black; width: 80%; height: 3px; margin: 0px auto; border:0;">
<br><br>
<!-- 영역 구분선 -->


<!-- 학원 소개 시작 -->
<div class="container">
<div class="row" style="padding: 0px 10px 0px 10px;">
<div class="col-lg-8">
<h3><b>The Specialist<br>
Training Academy</b></h3><br><br>
우리의 교육은 여러분의 뚜렷한 목표와 확실한 자신감을 이끌어내는 것에서 출발합니다.<br>
1993년 구로캠퍼스를 시작으로 현재까지 20년 이상의 오랜 시간동안 저희 하이미디어아카데미는 참된 인재양성이라는 사명감 하나로 매진해 왔습니다.<br>
오랜 전통과 경험을 바탕으로 한 명실상부한 대한민국 교육기관의 리더로서 앞으로도 최선을 다해 교육의 미래를 이끌어 나가겠습니다.<br>
</div>
<br><br>
<div class="col-lg-4" style="align-items:center; display: flex; justify-content:center;">
<img src="img/n3.jpg" width="300" height="200" border-radius="10">
</div>
</div>
<br><br><br><br>

<div class="row" style="padding: 0px 10px 0px 10px;">
<div class="col-lg-4" style="align-items:center; display: flex; justify-content:center;"  data-aos="zoom-out-right">
<img src="img/n4.webp" width="300" height="200">
</div>
<div class="col-lg-8"  data-aos="zoom-out-left">
<h3><b>몰입이 잘 되는 교육환경</b></h3><br><br>
하이미디어가 지향하는 가장 근본적인 교육의 목표는 저희 수강생들의 꿈과 희망을 얼마만큼 현실화 시켜줄 수 있느냐에 있습니다.<br>
전문 교과운영팀을 통한 철저한 과정개발을 시작으로 단순한 메뉴얼 위주의 수업이 아닌 현장감이 살아있는 실무위주의 수업을 진행하므로써 수업의 재미와 긴장감을 통한 수강생들의 집중도를 최대한 이끌어 내고 있습니다.<br> 또한 학원 운영진과 강사, 그리고 수강생 모두가 스스럼없이 친밀한 관계를 형성할 수 있도록 노력하고 있으며, 수강생들이 수업에만 몰입할 수 있는 편안한 환경조성에 모두가 최선을 다하고 있습니다.<br>
</div>
</div>
<br><br><br><br>

<div class="row" style="padding: 0px 10px 0px 10px;">
<div class="col-lg-8" data-aos="zoom-out-right">
<h3><b>취업에 성공하는 포트폴리오</b></h3><br><br>
취업전문사관학교 하이미디어가 높은 취업률을 자랑하는 이유중에는 높은 경쟁력을 갖춘 포트폴리오 제작을 빼놓을 수 없습니다.<br>
메뉴얼 위주의 단순 학습에서 벗어나 최근의 디자인 동향과 트렌드, 그리고 이를 구사할 수 있는 스킬들을 꼼꼼히 반영한 커리큘럼 구성, 또한 철저한 실무위주의 수업진행과 풍부한 현장경험을 갖춘 10년이상 경력의 베테랑 강사들을 통하여 여러분의 크리에이티브와 실력향상에 있어 거침없는 날개를 달아드립니다.<br>
</div>
<div class="col-lg-4" style="align-items:center; display: flex; justify-content:center;" data-aos="zoom-out-left">
<img src="img/n5.jpg" width="300" height="200">
</div>
</div>
</div>

<br>
<div data-aos="zoom-out-right" style="width:80%; text-align:right;"><a href="./introduce.me" style="color:gray; text-decoration-line: none; font-size:13px;">..학원 소개 전체보기</a></div>
<br><br><br>


<!-- 학원 소개 끝 -->


<!-- 영역 구분선 -->
<br><br>
<hr style="color: black; background-color: black; width: 80%; height: 3px; margin: 0px auto; border:0;">
<br><br>
<!-- 영역 구분선 -->


<!-- 후기 시작 -->
<div data-aos="zoom-out-right"></div><h3 style="text-align:center;"><b>생생한 후기를 들어보세요</b></h3><br><br></div>




<!-- 후기 슬라이드 영역 시작 -->
<div style="width:80%; text-align:center; margin: 0 auto;">
<div id="slidebox">
   <div class="slide" data-aos="zoom-in">
   
   	<%  if(reviewList != null){ for( ReviewBean rv: reviewList) { 
			int review_id = rv.getReview_id();
			String rc=rv.getReview_contents().replace("\r\n", "<br>");
	%> 
	<div class="slide-card">
		<div class="row"><b style="text-align: left">수강생 <%= rv.getReview_name()  %>님</b></div>
		<div class="row"><span style="text-align: left; color:gray; font-size:12.5px;">| <%= rv.getReview_job()  %></span></div>
		<div class="row" id="slide-review"><br><%=rc %></div>
	</div>
	<%  } }%>
      

      <!-- 무한재생을 위한 복사 -->

   	<%  if(reviewList != null){ for( ReviewBean rv: reviewList) { 
			int review_id = rv.getReview_id();
			String rc=rv.getReview_contents().replace("\r\n", "<br>");
	%> 
	<div class="slide-card">
		<div class="row"><b style="text-align: left">수강생 <%= rv.getReview_name()  %>님</b></div>
		<div class="row"><span style="text-align: left; color:gray; font-size:12.5px;">| <%= rv.getReview_job()  %></span></div>
		<div class="row" id="slide-review"><br><%=rc %></div>
	</div>
	<%  } }%>


   </div>
</div>
</div>
<!-- 수기 슬라이드 영역 끝 -->
<!-- 후기 끝 -->




<!-- 영역 구분선 -->
<br><br>
<hr style="color: black; background-color: black; width: 80%; height: 3px; margin: 0px auto; border:0;">
<br><br>
<!-- 영역 구분선 -->



<!-- 지도 시작 -->
<div class="container"  data-aos="zoom-out">
<h3 style="text-align:center;"><b>찾아오시는 길</b></h3><br><br>
<!-- 카카오맵 API 시작 -->
<!-- * 카카오맵 - 지도퍼가기 -->
<!-- 1. 지도 노드 -->
<div style="text-align:center;">
<div id="daumRoughmapContainer1663229109531" class="root_daum_roughmap root_daum_roughmap_landing" style="width:100%;" ></div>

<!--
	2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1663229109531",
		"key" : "2bq2h",
		
		"mapHeight" : "500"
	}).render();
</script>
</div>
<!-- 카카오맵 API 끝 -->
</div>
<!-- 지도 끝 -->
<br><br>

<!-- Top 버튼 -->

<div data-aos="fade-up" style="text-align: center; position: fixed; bottom:144px; right:36px; z-index:1000;">
<a href="#" class="a" id="topbutton" style="color:black;"><svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-arrow-up-circle" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
</svg></a>
</div>  
<!-- Top 버튼 -->


<!-- AOS 스크립트 시작 -->
<script>
	AOS.init();
</script>


<!-- 여기부터 위를 수정하세요 -->
<!-- 여기부터 위를 수정하세요 -->


<!-- 여기부터 footer -->
<%@ include file="footer.jsp" %>


</body></html>


