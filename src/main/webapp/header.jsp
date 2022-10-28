<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 반응형 앱 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 부트스트랩 등 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script  src="https://code.jquery.com/jquery-1.11.3.js"
	 type="text/javascript"></script>
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<!--도메인에 아이콘 -->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

<!-- 폰트: 애플산돌고딕 -->
<!-- <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/font-applesdgothicneo@1.0/all.min.css"> -->

<!-- 폰트: 구글노토산스 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">

<!-- 폰트: 배달의민족도현 -->
<!-- <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet"> -->

<!-- 폰트보관소
 AppleSDGothic, 'Apple SD Gothic' 'Apple SD Gothic Neo' 'AppleSDGothicNeo',


 -->
<link href="css/bootstrap.css" rel="stylesheet">
<link rel="shortcut icon" href="favicon.png" type="image/x-icon">
<link rel="icon" href="favicon.png" type="image/x-icon">
<title>수강신청 프로젝트 :)</title>

<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.root_daum_roughmap {
	margin: auto !important;
}

* {
	font-family: 'Noto Sans KR', sans-serif !important;
}

.nav-link:hover {
	color: #2A8CC9 !important;
}

  
  
</style>

<!-- 네비게이션 바 여닫는 jQuery 시작 -->
<script>
	$(document).ready(function() {
		$(".navbar-toggler").click(function() {
			$("#navbarTogglerDemo02").toggle();
		});
	});
	

</script>
<!-- 네비게이션 바 여닫는 jQuery 끝 -->

 <script>  
    $(document).ready(function() {
    	$(document).on("click",
    			"#logo", function() {  
         $("#admin_login").removeAttr('hidden');
        });
      });
    </script>
    
</head>
<%
String id = (String) session.getAttribute("id");
%>

<!-- 네비게이션 바 시작 -->
<nav class="navbar navbar-expand-md sticky-top navbar-light "
style="background-color: #f8f8ff"	>
	<!-- 	관리자일 경우 -->
	<c:choose>
	
	
		<c:when test="${'admin' eq id}">
		
			<div class="container-fluid">
				<a class="navbar-brand" href="index.jsp">
					Home
				</a>
				
				<!--<button class="navbar-toggler" type="button" data-bs-target="#navbarTogglerDemo02"> -->
				
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" aria-controls="navbarSupportedContent"
				aria-expanded="false" aria-label="Toggle navigation">
					
					<span class="navbar-toggler-icon"></span>
					
				</button>


				<div class="collapse navbar-collapse justify-content-between" id="navbarTogglerDemo02">
				
					<ul class="navbar-nav">
					
						<li class="nav-item">
							<a class="nav-link active" href="introduce.me">
								<svg 
									xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" 
									class="bi bi-bank text-center" viewBox="0 0 16 16">
	  									<path d="m8 0 6.61 3h.89a.5.5 0 0 1 
	  									.5.5v2a.5.5 0 0 1-.5.5H15v7a.5.5 0 0 1 
	  									.485.38l.5 2a.498.498 0 0 1-.485.62H.5a.498.498 
	  									0 0 1-.485-.62l.5-2A.501.501 0 0 1 1 
	  									13V6H.5a.5.5 0 0 1-.5-.5v-2A.5.5 0 0 1 
	  									.5 3h.89L8 0ZM3.777 3h8.447L8 1 3.777 
	  									3ZM2 6v7h1V6H2Zm2 0v7h2.5V6H4Zm3.5 0v7h1V6h-1Zm2 
	  									0v7H12V6H9.5ZM13 6v7h1V6h-1Zm2-1V4H1v1h14Zm-.39 9H1.39l-.25 1h13.72l-.25-1Z" />
								</svg>
								
								학원 소개
							</a>
						</li>
						
						
						<li class="nav-item">
							<a class="nav-link active" href="./ProfessorListManager.me">
								<svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
		  								<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 
		  								6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 
		  								0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 
		  								6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 
		  								10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
								</svg>
								
								교수 관리
							</a>
						</li>


						<li class="nav-item">
							<a class="nav-link active" href="./courseList.me">
								<svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-play-btn" viewBox="0 0 16 16">
  										<path d="M6.79 5.093A.5.5 0 0 0 6 5.5v5a.5.5 0 0 0 
  										.79.407l3.5-2.5a.5.5 0 0 0 0-.814l-3.5-2.5z" />
  										<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 
  										2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm15 0a1 1 0 0 0-1-1H2a1 
  										1 0 0 0-1 1v8a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4z" />
								</svg>
								
								강의 관리
							</a>
						</li>


						<li class="nav-item">
							<a class="nav-link active" href="./boardList.me">
								<svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-calendar2-minus"
									viewBox="0 0 16 16">
	  									<path d="M5.5 10.5A.5.5 0 0 1 6 10h4a.5.5 0 0 1 0 1H6a.5.5 0 0 1-.5-.5z" />
	  									<path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 
	  									2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 
	  									1 0 0 0-1 1v11a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H2z" />
										<path d="M2.5 4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5V4z" />
								</svg>
								
								게시판 관리	
							</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link active" href="./memberListAction.me">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-check" viewBox="0 0 16 16">
							  <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
							  <path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
							</svg>
								
								회원 관리
							</a>
						</li>
						
							<li class="nav-item">
							<a class="nav-link active" href="./review_list.me"">
							 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-gift" viewBox="0 0 16 16">
  <path d="M3 2.5a2.5 2.5 0 0 1 5 0 2.5 2.5 0 0 1 5 0v.006c0 .07 0 .27-.038.494H15a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1v7.5a1.5 1.5 0 0 1-1.5 1.5h-11A1.5 1.5 0 0 1 1 14.5V7a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h2.038A2.968 2.968 0 0 1 3 2.506V2.5zm1.068.5H7v-.5a1.5 1.5 0 1 0-3 0c0 .085.002.274.045.43a.522.522 0 0 0 .023.07zM9 3h2.932a.56.56 0 0 0 .023-.07c.043-.156.045-.345.045-.43a1.5 1.5 0 0 0-3 0V3zM1 4v2h6V4H1zm8 0v2h6V4H9zm5 3H9v8h4.5a.5.5 0 0 0 .5-.5V7zm-7 8V7H2v7.5a.5.5 0 0 0 .5.5H7z"/>
</svg>
								
								후기 관리
							</a>
						</li>
					</ul>
					
					<ul class="navbar-nav">
					
						<li class="nav-item">
							<span class="nav-link">${id}님 안녕하세요</span>
						</li>
						
						<li class="nav-item">
						<a class="nav-link" href='<c:url value="./manager/ManagerLogout.jsp"/>'>로그아웃</a>
						</li>
						
					</ul>
					
				</div>
				
			</div>
		
		</c:when>
		
		
		<c:when test="${empty id}">
		
			<div class="container-fluid">
				<a class="navbar-brand" href="index.jsp">
					Home
				</a>
				
				<!--<button class="navbar-toggler" type="button" data-bs-target="#navbarTogglerDemo02">-->
				
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" aria-controls="navbarSupportedContent"
				aria-expanded="false" aria-label="Toggle navigation">
				
					<span class="navbar-toggler-icon"></span>
					
				</button>

				<div class="collapse navbar-collapse justify-content-between" id="navbarTogglerDemo02">
				
					<ul class="navbar-nav">
					
						<li class="nav-item">
							<a class="nav-link active" href="introduce.me">
								<svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-bank text-center"
									viewBox="0 0 16 16">
  										<path d="m8 0 6.61 3h.89a.5.5 0 0 1 
  										.5.5v2a.5.5 0 0 1-.5.5H15v7a.5.5 0 0 1 
  										.485.38l.5 2a.498.498 0 0 1-.485.62H.5a.498.498 0 0 1-.485-.62l.5-2A.501.501 0 0 1 1 
  										13V6H.5a.5.5 0 0 1-.5-.5v-2A.5.5 0 0 1 .5 3h.89L8 0ZM3.777 3h8.447L8 1 
  										3.777 3ZM2 6v7h1V6H2Zm2 0v7h2.5V6H4Zm3.5 0v7h1V6h-1Zm2 0v7H12V6H9.5ZM13 
  										6v7h1V6h-1Zm2-1V4H1v1h14Zm-.39 9H1.39l-.25 1h13.72l-.25-1Z" />
								</svg>
								
								학원 소개
							</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link active" href="./ProfessorListClient.me">
								<svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
										<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 
										6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 
										1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 
										10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
								</svg>
								
								교수 소개
							</a>
						</li>

						<li class="nav-item">
							<a class="nav-link active" href="./usercourseList.me">
								<svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-play-btn" viewBox="0 0 16 16">
		  								<path d="M6.79 5.093A.5.5 0 0 0 6 5.5v5a.5.5 0 0 0 
		  								.79.407l3.5-2.5a.5.5 0 0 0 0-.814l-3.5-2.5z" />
	  									<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 
	  									2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm15 
	  									0a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v8a1 1 0 0 0 1 
	  									1h12a1 1 0 0 0 1-1V4z" />
								</svg>
								
								강의실
							</a>
						</li>

						<li class="nav-item">
							<a class="nav-link active" href="./boardList.me"> 
								<svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-calendar2-minus"
									viewBox="0 0 16 16">
		  								<path d="M5.5 10.5A.5.5 0 0 1 6 10h4a.5.5 0 0 1 0 1H6a.5.5 0 0 1-.5-.5z" />
			  							<path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 
			  							2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 1 0 0 
			  							0-1 1v11a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H2z" />
		  								<path d="M2.5 4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5V4z" />
								</svg>
								
								게시판
							</a>
						</li>
						
				
						
					</ul>

					<ul class="navbar-nav">
						
						<li class="nav-item" id="admin_login" hidden>
							<a class="nav-link" href="./manager/ManagerLogin.jsp">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" 
								class="bi bi-wrench-adjustable-circle" viewBox="0 0 16 16">
									  <path d="M12.496 8a4.491 4.491 0 0 1-1.703 3.526L9.497 8.5l2.959-1.11c.027.2.04.403.04.61Z"/>
									  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0Zm-1 0a7 7 0 1 0-13.202 3.249l1.988-1.657a4.5 4.5 0 
									  0 1 7.537-4.623L7.497 6.5l1 2.5 1.333 3.11c-.56.251-1.18.39-1.833.39a4.49 4.49 0 0 1-1.592-.29L4.747 
									  14.2A7 7 0 0 0 15 8Zm-8.295.139a.25.25 0 0 0-.288-.376l-1.5.5.159.474.808-.27-.595.894a.25.25 0 0 0 
									  .287.376l.808-.27-.595.894a.25.25 0 0 0 .287.376l1.5-.5-.159-.474-.808.27.596-.894a.25.25 0 0 
									  0-.288-.376l-.808.27.596-.894Z"/>
								</svg>
								
								관리자 로그인
							</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link" href='<c:url value="./memberLogin.me"/>'>
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
								class="bi bi-cloud-arrow-up" viewBox="0 0 16 16">
						  			<path fill-rule="evenodd" d="M7.646 5.146a.5.5 0 0 1 .708 0l2 2a.5.5 0 0 
						  			1-.708.708L8.5 6.707V10.5a.5.5 0 0 1-1 0V6.707L6.354 7.854a.5.5 
						  			0 1 1-.708-.708l2-2z" />
						  			<path d="M4.406 3.342A5.53 5.53 0 0 1 8 2c2.69 0 4.923 
						  			2 5.166 4.579C14.758 6.804 16 8.137 16 9.773 16 11.569 14.502 
						  			13 12.687 13H3.781C1.708 13 0 11.366 0 9.318c0-1.763 1.266-3.223 
						  			2.942-3.593.143-.863.698-1.723 1.464-2.383zm.653.757c-.757.653-1.153 
						  			1.44-1.153 2.056v.448l-.445.049C2.064 6.805 1 7.952 1 9.318 1 10.785 2.23 
						  			12 3.781 12h8.906C13.98 12 15 10.988 15 9.773c0-1.216-1.02-2.228-2.313-2.228h-.5v-.5C12.188 
						  			4.825 10.328 3 8 3a4.53 4.53 0 0 0-2.941 1.1z" />
								</svg>
								
								로그인
							</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link" href='<c:url value="./memberJoin.me"/>'>
									
								<svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-emoji-smile"
									viewBox="0 0 16 16">
								  		<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 
								  		1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
								  		<path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 
								  		3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 
								  		0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 
								  		0 0 1-3.898-2.25.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 
								  		8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 
								  		1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z" />
								</svg>
								
								회원가입
							</a>
						</li>
						
					</ul>

				</div>
				
			</div>
			
		</c:when>


		<c:otherwise>
		
		
			<div class="container-fluid">
				<a class="navbar-brand" href="index.jsp">
					Home
				</a>
				<!--<button class="navbar-toggler" type="button" data-bs-target="#navbarTogglerDemo02">-->
				<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" aria-controls="navbarSupportedContent"
				aria-expanded="false" aria-label="Toggle navigation">
					
					<span class="navbar-toggler-icon"></span>
					
				</button>

				<div class="collapse navbar-collapse justify-content-between" id="navbarTogglerDemo02">
					<ul class="navbar-nav">
						<li class="nav-item">
							<a class="nav-link active" href="introduce.me">
								<svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-bank text-center"
									viewBox="0 0 16 16">
  										<path d="m8 0 6.61 3h.89a.5.5 0 0 1 
  										.5.5v2a.5.5 0 0 1-.5.5H15v7a.5.5 0 0 1 
  										.485.38l.5 2a.498.498 0 0 1-.485.62H.5a.498.498 0 0 
  										1-.485-.62l.5-2A.501.501 0 0 1 1 13V6H.5a.5.5 0 0 1-.5-.5v-2A.5.5 
  										0 0 1 .5 3h.89L8 0ZM3.777 3h8.447L8 1 3.777 3ZM2 6v7h1V6H2Zm2 0v7h2.5V6H4Zm3.5 
  										0v7h1V6h-1Zm2 0v7H12V6H9.5ZM13 6v7h1V6h-1Zm2-1V4H1v1h14Zm-.39 9H1.39l-.25 
  										1h13.72l-.25-1Z" />
								</svg>
								
								학원 소개
							</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link active" href="./ProfessorListClient.me">
								<svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
	  									<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 
	  									6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 
	  									8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 
	  									10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
								</svg>
								
								교수 소개
							</a>
						</li>

						<li class="nav-item">
							<a class="nav-link active" href="./usercourseList.me">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-play-btn" viewBox="0 0 16 16">
	  								<path d="M6.79 5.093A.5.5 0 0 0 6 5.5v5a.5.5 0 0 0 .79.407l3.5-2.5a.5.5 0 
	  								0 0 0-.814l-3.5-2.5z" />
	  								<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 
	  								0 0 1-2 2H2a2 2 0 0 1-2-2V4zm15 0a1 1 0 0 0-1-1H2a1 1 
	  								0 0 0-1 1v8a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4z" />
								</svg>
								
								강의실
							</a>
						</li>

						<li class="nav-item">
							<a class="nav-link active" href="./boardList.me">
								<svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-calendar2-minus"
									viewBox="0 0 16 16">
		  								<path d="M5.5 10.5A.5.5 0 0 1 6 10h4a.5.5 0 0 1 0 1H6a.5.5 0 0 1-.5-.5z" />
		  								<path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 
		  								2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 
		  								.5-.5zM2 2a1 1 0 0 0-1 1v11a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H2z" />
		  								<path d="M2.5 4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5V4z" />
								</svg>
								
								게시판
							</a>
						</li>
						
						
					</ul>

					<ul class="navbar-nav">
					
						<li class="nav-item">
							<span class="nav-link">
								${id}님 안녕하세요
							</span>
						</li>
						
						   <li class="nav-item"><a class="nav-link"
                     href='<c:url value="./registList.me"/>'>수강정보</a></li>
						
						<li class="nav-item">
							<a class="nav-link" href='<c:url value="./member_info.me"/>'>
								계정설정
							</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link" href='<c:url value="./memberlogout.me"/>'>
								로그아웃
							</a>
						</li>
						
					</ul>
					
				</div>
				
		</c:otherwise>
		
	</c:choose>
	
</nav>
<!-- 네비게이션 바 끝 -->