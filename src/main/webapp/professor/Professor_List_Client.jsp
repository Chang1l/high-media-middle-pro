<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*, java.util.*, vo.ProfessorVO" %>


<% 
ArrayList<ProfessorVO> professorList = (ArrayList<ProfessorVO>)request.getAttribute("professorList"); 
%>

<html>

<head>

<title>교수 목록</title>
<%@ include file="../header.jsp" %>

<style>

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.root_daum_roughmap {
	margin: auto !important;
  }

*{font-family: 'Noto Sans KR', sans-serif !important;}

#topimg{
  postiion: relative;
  width: 100%;
  height: 100%;
}

.js-load {
    display: none;
}
.js-load.active {
    display: block;
}
.js-load:after {
    display: none;
}
.btn-wrap {
    display: block;
}
.btn-wrap {
    text-align: center;
}

#listBody { 
	width: 75%;
	margin: auto;
	padding-top: 50px;
	padding-bottom: 50px;
}

.ProfImgDiv:hover img {
	transform: scale(1.1);
	
	/*사진 이미지 10% 확대*/
}

.ProfImgDiv {
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
	width: 200px;
	height: 250px;
	margin: 0 auto;
	overflow: hidden;
	
	/*확대될때 확대된 만큼 넘친 부분 없애주기 위해서 overflow: hidden 설정*/
}

#ProfImg {
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
	max-width: 100%;
	transition: all 0.2s linear;
}

/*transition all 세로 높이 가로 길이 모두 변화 0.2s안에 모든 애니메이션 진행 완료 linear 애니메이션 변하는 속도 일정*/

#ProfImgAlink {
	display: block;
	width: 100%;
	height: 100%;
	overflow: hidden;
  	position: relative;
  	
  	/*확대될때 확대된 만큼 넘친 부분 없애주기 위해서 overflow: hidden 설정*/
  	
  	/*a 태그 안에 들어가는 position absolute로 된 figure 태그와 figurecaption 태그가 안에서만 움직이도록 position relative 처리*/
}

#ProfImgAlink figure {
	width: 100%;
	height: 100%;
}

#ProfImgAlink figcaption {
	width: 100%; 
	height: 100%;
 	background-color: rgba(0,0,0,0.7);
 	position: absolute;
	top: 0;
	left: 0;
	color: #fff;
	text-align: center;
	line-height: 200px;
	opacity: 0;
	transition: 0.3s;
}

/*
background-color rgba 0,0,0,0.7로 배경색은 검지만 흐릿하게 처리 마지막 값이 투명도

글자색 흰색 #fff, text-align center로 가운데 정렬, 원래는 투명도 opacity 0 안보이게, transition 0.3s로 0.3초 안에 애니메이션 실행
*/

#ProfImgAlink:hover figcaption {
	opacity: 1;
}

/*a태그 위에 마우스 올리면 figcaption이 보이도록 opacity 1 투명도 x*/

hr {
  height: 1px;
  background-color: black;
  width: 200px;
}

p[class="lead"] {
	width: 200px;
	word-break: keep-all;
	font-size: 1.1rem;
}

/*word-break keep-all을 통해 단어절마다 줄바꿈이 이뤄지도록 설정*/

#ProfModalImg img {
	float: left;
	margin-right: 15px;
	border-radius: 5px;
}

/*모달창 이미지는 왼쪽 float left 정렬한뒤 나머지 영역에 텍스트 배치*/

#ProfModalBody p {
	text-align: left;
	word-break: keep-all;
}
   
#emptyArea {
	font-size: 20px;
	font-weight: bolder;
	margin: auto;
	text-align: center;
}

</style>

<script>

$(document).ready(function () {
    load('#js-load', '8');
    $("#js-btn-wrap .button").on("click", function () {
        load('#js-load', '4', '#js-btn-wrap');
    })
});

/*
처음 실행하는 load('#js-load', '8'); 부분과

$("#js-btn-wrap .button").on("click", function () {
        load('#js-load', '4', '#js-btn-wrap');
    })
으로 나뉘어져 있음
*/
 
function load(id, cnt) {
    var Profs_list = id + " .js-load:not(.active)";
    //Profs_list에는 id 선택자 # js-load(display: none => 보이지 않음)와 클래스 선택자 .js-load 중 .active가 붙지 않은것이 결합 => id js-load 중 클래스 js-load 중 .active가 붙지 않은 요소들 고르는 선택자
    var Profs_length = $(Profs_list).length;
    //위의 선택자로 고른 모든 요소들의 배열 길이 (인덱스)
    var Profs_total_cnt;
    if (cnt < Profs_length) {
        Profs_total_cnt = cnt;
        //만약 그 길이가 매개변수로 주어진 값보다 크다면 매개변수로 주어진 값이 Profs_total_cnt로 대입 (<-active로 변환될 클래스 개수 지정)
    } else {
        Profs_total_cnt = Profs_length;
        $('.button').hide()
        //같거나 작다면 길이가 total_cnt로 대입되고 클래스 .button은 감춰짐
    }
    $(Profs_list + ":lt(" + Profs_total_cnt + ")").addClass("active");
    //마지막 처리는 Profs_list 선택자로 고른 active 클래스가 안 붙은것들을 전체 대상으로 놓고 거기에 :lt를 total_cnt만큼 (0부터 total_cnt보다 작은 인덱스 번호까지만 선택)
    //거기에 addClass 클래스 부여를 active로 함 => active 클래스의 css는 display: block => 브라우저에 표시됨
}

</script>
</head>

<body>
<br><br>
<h1 style="text-align: center;">교수 목록</h1>
<div id="listBody">
	
	<div class="row" align="center" id="js-load">

<%
if(professorList != null){
%>
	
<%
	for(int i = 0; i < professorList.size(); i++) { 
	
// 	int p_id = professorList.get(i).getP_id();
	String p_name = professorList.get(i).getP_name();
	String p_record1 = professorList.get(i).getP_record1();
	String p_record2 = professorList.get(i).getP_record2();
	String p_record3 = professorList.get(i).getP_record3();
	String p_img = professorList.get(i).getP_img();
	String p_word = professorList.get(i).getP_word();

	if (p_record1 != null && p_record2 == null && p_record3 == null) {
%>
		<div class="col-lg-4 col-xl-3 js-load">
		<div class="ProfImgDiv">
			<a data-bs-toggle="modal" href="#ProfModal<%=i%>" id="ProfImgAlink">
				<figure>
				<img id="ProfImg" src="professor/ProfessorImg/<%=p_img%>" width="200" height="250" alt="교수님 사진" title="교수님 사진"/>
				<figcaption>교수님 프로필 자세히 보기</figcaption>
				</figure>
			</a>
		</div>
		<hr>
		<p class="h4"><%=p_name%></p>
		<p class="lead"><%=p_word%></p>
		</div>
	  
	
		<!-- Modal -->
		<div class="modal fade" id="ProfModal<%=i%>" data-bs-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  			<div class="modal-dialog">
    			<div class="modal-content">
      				<div class="modal-header">
        				<h5 class="modal-title" id="ProfModalTitle">교수님 프로필</h5>
        				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      				</div>
      				<div class="modal-body">
      					<div id="ProfModalImg">
      					<img src="professor/ProfessorImg/<%=p_img%>" width="200" height="250" alt="교수님 사진" title="교수님 사진"/>
      					</div>
						<div id="ProfModalBody">
							<p><strong>교수님 이름</strong></p>
							<p><%=p_name%></p>
							<p><strong>교수님 경력</strong></p>
							<p><%=p_record1%></p>
						</div>
      				</div>
      				<div class="modal-footer">
        				<button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
      				</div>
    			</div>
  			</div>
		</div>
		
		
	<% } %>
	
	
	<% if (p_record1 != null && p_record2 != null && p_record3 == null) { %>
		
		<div class="col-lg-4 col-xl-3 js-load">
		<div class="ProfImgDiv">
			<a data-bs-toggle="modal" href="#ProfModal<%=i%>" id="ProfImgAlink">
				<figure>
				<img id="ProfImg" src="professor/ProfessorImg/<%=p_img%>" width="200" height="250" alt="교수님 사진" title="교수님 사진"/>
				<figcaption>교수님 프로필 자세히 보기</figcaption>
				</figure>
			</a>
		</div>
		<hr>
		<p class="h4"><%=p_name%></p>
		<p class="lead"><%=p_word%></p>
		</div>
		
		
		<div class="modal fade" id="ProfModal<%=i%>" data-bs-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  			<div class="modal-dialog">
    			<div class="modal-content">
      				<div class="modal-header">
        				<h5 class="modal-title" id="ProfModalTitle">교수님 프로필</h5>
        				<button type="button" class="btn-close"  data-bs-dismiss="modal" aria-label="Close"></button>
      				</div>
      				<div class="modal-body">
      					<div id="ProfModalImg">
      					<img src="professor/ProfessorImg/<%=p_img%>" width="200" height="250" alt="교수님 사진" title="교수님 사진"/>
      					</div>
						<div id="ProfModalBody">
							<p><strong>교수님 이름</strong></p>
							<p><%=p_name%></p>
							<p><strong>교수님 경력</strong></p>
							<p><%=p_record1%></p>
							<p><%=p_record2%></p>
						</div>
      				</div>
      				<div class="modal-footer">
        				<button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
      				</div>
    			</div>
  			</div>
		</div>
		
				
	<% } %>
	
	
	<% if (p_record1 != null && p_record2 != null && p_record3 != null) { %>
		
		<div class="col-lg-4 col-xl-3 js-load">
		<div class="ProfImgDiv">
			<a data-bs-toggle="modal" href="#ProfModal<%=i%>" id="ProfImgAlink">
				<figure>
				<img id="ProfImg" src="professor/ProfessorImg/<%=p_img%>" width="200" height="250" alt="교수님 사진" title="교수님 사진"/>
				<figcaption>교수님 프로필 자세히 보기</figcaption>
				</figure>
			</a>
		</div>
		<hr>		
		<p class="h4"><%=p_name%></p>
		<p class="lead"><%=p_word%></p>
		</div>
		
		
		<div class="modal fade" id="ProfModal<%=i%>" data-bs-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  			<div class="modal-dialog">
    			<div class="modal-content">
      				<div class="modal-header">
        				<h5 class="modal-title" id="ProfModalTitle">교수님 프로필</h5>
        				<button type="button" class="btn-close"  data-bs-dismiss="modal" aria-label="Close"></button>
      				</div>
      				<div class="modal-body">
       					<div id="ProfModalImg">
      					<img src="professor/ProfessorImg/<%=p_img%>" width="200" height="250" alt="교수님 사진" title="교수님 사진"/>
      					</div>
						<div id="ProfModalBody">
							<p><strong>교수님 이름</strong></p>
							<p><%=p_name%></p>
							<p><strong>교수님 경력</strong></p>
							<p><%=p_record1%></p>
							<p><%=p_record2%></p>
						</div>
      				</div>
      				<div class="modal-footer">
        				<button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
      				</div>
    			</div>
  			</div>
		</div>	
		
		    
	<% } %>
	
<% } %>
<div id="js-btn-wrap" class="btn-wrap"> <button onclick="location.href='javascript:;'" class="button btn btn-primary">더보기</button> </div>

	</div>
<%-- 	<%@include file="../NewFile.jsp" %> --%>
	
	<% } else { %>
	<section id="emptyArea">등록된 교수님이 없습니다.</section>
	<% } %>	

</div>

<%@include file="../footer.jsp" %>
</body>
</html>