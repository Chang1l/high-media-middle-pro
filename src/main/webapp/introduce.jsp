<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학원 소개</title>

<!-- AOS 라이브러리 불러오기-->
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 



<style>
/* 화살표 깜박이기 */
.blinking{  animation:blink 0.8s ease-in-out infinite alternate;}
@keyframes blink{
  0% {opacity:0.2;}
  100% {opacity:0.9;}}

/* a 태그 하얗게 */
.a {color: white;}
.a:hover {color: white;}

/* 오른쪽 여백 생김 현상 방지*/
body, html{
width:100%;
overflow-x:hidden;
}

</style>
<%@ include file="header.jsp" %>
</head>
<body>
<div>
<!--여기까지 헤더-->

<!--여기부터 아래를 수정하세요 -->
<!--여기부터 아래를 수정하세요 -->

<script>
   $( window ).scroll( function() {
      if ( $( this ).scrollTop() > 200 ) {
         $( '.top' ).fadeIn();
      } else {
         $( '.top' ).fadeOut();
      }
   } );

   $(document).ready(function(){
      $('.top').fadeOut();
   })
</script>

<!-- Top 버튼 -->
<div style="text-align: center; position: fixed; bottom:144px; right:36px; z-index:1000;">
<a href="#" class="a top" id="topbutton" style="color:black;"><svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-arrow-up-circle" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
</svg></a>
</div>  
<!-- Top 버튼 -->



<!-- 아래로 이동 버튼 작동 -->
<script>
$(document).ready(function($) {
    $(".scroll_move").click(function(event){         
            event.preventDefault();
            $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
    });
});

</script>
<!-- 아래로 이동 버튼 작동 -->


<!-- 상단 이미지 -->
<div style="position:relative;">
  <img src="img/introduce_top3.jpg" style="filter: brightness(50%);" class="d-block w-100" height="700"  id="topimg">
  
  <span style="color: white; font-size: 12.5px; text-align: left; position: absolute; top: 2%; left: 2%;">home > 학원 소개</span>
  
  <h1 style="color: white; font-size: 30px; text-align: center; line-height: 200%; position: absolute; top: 40%; left: 50%; transform: translate(-50%, -50%);"><b class="toptext">하이미디어 아카데미는<br>여러분을 응원합니다.</b></h1>

<div class="image blinking" style="font-size: 24px; text-align: center; line-height: 200%; position: absolute; top: 80%; left: 50%; transform: translate(-50%, -50%);"><br>
<a href="#div1" class="a"  id="scroll_move"><svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-arrow-down-circle-fill" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V4.5z"/>
</svg></a> 
</div>
</div>
<!-- 상단 이미지 -->

<br><br>
<!-- 헛소리 -->
<div class="div1" id="div1"></div>
<br><br><br>
<div style="padding: 30px; text-align: center;">
<div><h3><b><div data-aos="zoom-out-left" data-aos-duration="500"> &quot; 컴퓨터랑 일하는 건 엄청 멋있다.<br></div>
<div data-aos="zoom-out-right" data-aos-duration="1000">누구랑 싸우지도 않고, 모든 것을 대신 기억해주고,<br></div>
<div data-aos="zoom-out-left" data-aos-duration="1500">내 맥주를 뺏어 마시지도 않는다. &quot; <br></div>
</b></h3>
<div data-aos="flip-left" data-aos-easing="ease-out-cubic" data-aos-duration="2000">
<b>- Paul Leary -</b></div>
</div></div>
<br><br><br>
<!-- 헛소리 -->


<!-- 학원장 인사말 -->
<div data-aos="fade-down"><h3><b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ·학원장 인사말</b></h3><br><br></div>
<div class="row" style="padding: 0px 10px 0px 10px;">
<div class="col-sm-3">&nbsp;</div>
<div class="col-sm-3 style="align-items:center; display: flex; justify-content:center;" data-aos="flip-left">
<img src="img/boss.png" width="300" height="400">
</div>
<div class="col-sm-3" data-aos="fade-up" data-aos-duration="2000" style="text-align:center;">
<br><br><br>
<h3><b>Hello, World!</b></h3>
</div>
<div class="col-sm-3">&nbsp;</div>
</div>
<br><br><br><br>
<!-- 학원장 인사말 -->


<!-- 학원 소개-->
<div data-aos="fade-up" data-aos-duration="5000"><h3><b>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  ·학원 소개</b></h3><br><br></div>

<div class="container">
<div class="row" style="padding: 0px 10px 0px 10px;">
<div class="col-lg-8" data-aos="zoom-out-right">
<h3><b>The Specialist<br>
Training Academy</b></h3><br><br>
우리의 교육은 여러분의 뚜렷한 목표와 확실한 자신감을 이끌어내는 것에서 출발합니다.<br>
1993년 구로캠퍼스를 시작으로 현재까지 20년 이상의 오랜 시간동안 저희 하이미디어아카데미는 참된 인재양성이라는 사명감 하나로 매진해 왔습니다.<br>
오랜 전통과 경험을 바탕으로 한 명실상부한 대한민국 교육기관의 리더로서 앞으로도 최선을 다해 교육의 미래를 이끌어 나가겠습니다.<br>
</div>
<br><br>
<div class="col-lg-4" style="align-items:center; display: flex; justify-content:center;"  data-aos="zoom-out-left">
<img src="img/n3.jpg" width="300" height="200">
</div>
</div>
<br><br><br><br>

<div class="row" style="padding: 0px 10px 0px 10px;">
<div class="col-lg-4" style="align-items:center; display: flex; justify-content:center;" data-aos="zoom-out-left">
<img src="img/n4.webp" width="300" height="200">
</div>
<div class="col-lg-8"  data-aos="zoom-out-right">
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
<div class="col-lg-4" style="align-items:center; display: flex; justify-content:center;"  data-aos="zoom-out-left">
<img src="img/n5.jpg" width="300" height="200">
</div>
</div>
</div>

<br><br><br><br>
<!-- 학원 소개 끝 -->


<!-- 학원 상세 소개 시작 -->
<div class="container">
<div class="row" style="padding: 0px 10px 0px 10px;">
<div class="col-lg-8" data-aos="zoom-out-right">
<h3><b>트렌드를 반영한 커리큘럼 과정개발</b></h3><br><br>
하이미디어의 전 과정은 NCS를 기반으로 합니다. 실무에서의 흐름과 활용성을 분석하고 근간의 트렌드를 적재적소에 반영한 과정을 끊임없이 개발하여 이를 통해 수강생들의 실력향상 및 직무활용능력을 배양합니다.<br>
</div>
<br><br>
<div class="col-lg-4" style="align-items:center; display: flex; justify-content:center;" data-aos="zoom-out-left">
<img src="img/introduce_1_curriculum.jpg" width="300" height="200">
</div>
</div>
<br><br><br><br>

<div class="row" style="padding: 0px 10px 0px 10px;">
<div class="col-lg-4" style="align-items:center; display: flex; justify-content:center;" data-aos="zoom-out-left">
<img src="img/introduce_2_consulting.jpg" width="300" height="200">
</div>
<div class="col-lg-8" data-aos="zoom-out-right">
<h3><b>국비지원을 통한 다양한 교육기회 제공</b></h3><br><br>
하이미디어에서는 취업과 이직을 희망하는 구직자와 재직자를 대상으로 한 다양한 맞춤교육을 운영하고 있습니다. 국비지원을 통한 부담없는 교육의 기회를 제공하고 있으며 여러분의 밝은 미래를 열어드리겠습니다.<br>
</div>
</div>
<br><br><br><br>

<div class="row" style="padding: 0px 10px 0px 10px;">
<div class="col-lg-8" data-aos="zoom-out-right">
<h3><b>국가에서 인정한 공인시험센터 운영</b></h3><br><br>
세무회계분야 전국 최다 수료, 최다 합격을 자랑하는 하이미디어는 구각에서 인정한 MOS, ACT 공인시험 센터를 함께 운영하고 있습니다. 수업과 시험을 한 자리에서 운영하니 합격률이 좋을 수 밖에 없습니다.<br>
</div>
<div class="col-lg-4" style="align-items:center; display: flex; justify-content:center;" data-aos="zoom-out-left">
<img src="img/introduce_3_exam.jpg" width="300" height="200">
</div>
</div>
<br><br><br><br>

<div class="row" style="padding: 0px 10px 0px 10px;">
<div class="col-lg-4" style="align-items:center; display: flex; justify-content:center;" data-aos="zoom-out-left">
<img src="img/introduce_4_teacher.webp" width="300" height="200">
</div>
<div class="col-lg-8"  data-aos="zoom-out-right">
<h3><b>실무경력 10년 이상의 완벽한 강사진</b></h3><br><br>
강의만 잘해서는 부족합니다. 배움에 갈망, 수업에 대한 열의, 그리고 실무에서의 스킬을 진솔하게 전달하기 위해서는 강사부터 실무에 강해야만 합니다. 하이미디어는 철저히 실무베이스의 경력자로만 구성됩니다.<br>
</div>
</div>
<br><br><br><br>


</div>




<br><br><br><br>
<h3><b><div data-aos="zoom-out-left" data-aos-duration="3500"  style="text-align:center;"> &quot; 교육의 질적 향상과 다양한 분야로의 인재양성을 위해</div>
<div><div data-aos="zoom-out-right" data-aos-duration="3500"  style="text-align:center;">혼신을 다하겠습니다. &quot;</div></b></h3><br>
<br><br><br><br>
<!-- 학원 상세 소개 끝 -->




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





<!-- AOS 스크립트 시작 -->
<script>
   AOS.init();
</script>

</div>

<%@ include file="footer.jsp" %>

</body>
</html>