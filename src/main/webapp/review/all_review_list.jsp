<%@page import="dao.ReviewDAO"%>
<%@page import="vo.PageInfo"%>
<%@ page import="vo.ReviewBean,java.util.*" %>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
ArrayList<ReviewBean> reviewList = (ArrayList<ReviewBean>)request.getAttribute("reviewList");

//PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");

ReviewDAO reviewListDAO = ReviewDAO.getInstance();

int pageNumber = 1;
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든 수강후기 관리</title>
<style>

body {
	background: ffe4e1;
}

button:hover{
   color: #62b6cb; 
   background: #fff;
   border: 2px solid #62b6cb;
}

button{
   color: #fff;
   background: #62b6cb; 
    cursor: pointer;
    border: 2px solid #62b6cb; 
}

.button2:hover{
   border-radius: 2px;
   border: 2px solid #62b6cb;
   color: #62b6cb; 
   background: #fff;
   padding: 4px 14px;
   margin: 4px;
   

}


.button2{
    border-radius: 2px;
   color: #fff;
   background: #62b6cb; 
    cursor: pointer;
    border: 2px solid #62b6cb;
    width: 80px;
   height: 30px;
    padding: 4px 14px;
    margin: 4px;
     
}

.button3:hover a{
   color: #DC3545; 
}


.button3:hover{
   border-radius: 2px;
   border: 2px solid #DC3545;
   color: #DC3545; 
   background: #fff;
   padding: 4px 14px;
   margin: 4px;
   

}


.button3{
    border-radius: 2px;
   color: #fff;
   background: #DC3545; 
    cursor: pointer;
    border: 2px solid #DC3545;
    width: 80px;
   height: 30px;
    padding: 4px 14px;
    margin: 4px;
    text-align: right;
    
}



.tableTitle{
   background: #b2dbe5;
   color: #ffffff;
   text-align: center;
}

tr{
   border-bottom: 2px solid #b2dbe5 !important;
}

td{
   margin: 5px;
   padding: 5px;
   overflow: hidden;
   word-break: break-all;
   text-align: center; 
   border-collapse: collapse;   
}

.tableContent{
   text-align: left;
   padding: 13px 0px;
}

.tableManager{
   text-align: center;
}

tr{
   border-top: 2px solid #b2dbe5; 
   border-bottom: 2px solid #b2dbe5;
}

table{ 
   border-bottom: 2px solid #b2dbe5;
}

.doit:hover{
   border-radius: 100px;
   color: #62b6cb !important;
   background: #fff !important;
   width: 87px;
   height: 87px;
   border: 2px solid #62b6cb;
   padding: 15px;
}

.doit:hover a{
   border-radius: 100px;
   color: #62b6cb !important;
   background: transparent !important;
}


.doit{
   border-radius: 100px;
   color: white;
   background: #62b6cb;
   width: 87px;
   height: 87px;
   border: 2px solid #62b6cb;
   padding: 15px;
}



/* 호버 시 후기 슬라이드 멈춤*/
div:hover {animation-play-state: paused;}

/* 슬라이드 CSS */
#slidebox2 {
   overflow:hidden;
   position:relative;
   width:1440px;  /* 이미지 보여지는 뷰 부분 */
   height:200px;
}
.bonobono {
   width:2550px; /* 원본+클론의 총 합 */
   height:100%;
   display:flex;
   flex-wrap:nowrap;
   animation: bannermove 26s linear infinite;
}
@keyframes bannermove {
  0% {
      transform: translate(0, 0);
  }
  100% {
      transform: translate(-50%, 0);
  }
}



img{
   margin: 10px;
   width: 300px;
   height: 180px;
   border-radius: 10px;
   box-shadow: 0 5px 18px -7px rgba(0,0,0,1);
}
/* 슬라이드 CSS */


/* a 태그 하얗게 */

a:hover{
   color: #62b6cb !important;
}

a{
   color:black;
   text-decoration-line: none!important;
}

@media screen and (max-width: 725px) {
   #hidden_725{
   display: none;
   }
   .button2{
   height: auto;
   width: auto;
   }
      .button3{
   height: auto;
   width: auto;
   }
}

@media screen and (max-width: 1265px) {

   .button2{
   height: 30px;
   width: 100%;
   display: block;
   text-align: center;
   }
   
      .button3{
   height: 30px;
   width: 100%;
   display: block;
   text-align: center;
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
<style>
td {border-bottom: 2px solid #b2dbe5 !important;}
.button3:hover a{color: #DC3545 !important;}
</style>
<script>
function allReviewDeleteCheck(all_review_id) {
    if (confirm("정말 삭제하시겠습니까??") == true){  
       
       $('#allReviewDeleteForm'+all_review_id).submit();   
    }else{ 
        return false;
    }
   }
   
function allReviewSend(all_review_id){
   $('#allReviewSendForm'+all_review_id).submit();
}
</script>
<!-- 후기 전송 삭제 -->
<%@ include file="/header.jsp" %>
</head>
<body>
<!-- 여기까지 header -->
   
<!-- 여기부터 아래를 수정하세요 -->
<!-- 여기부터 아래를 수정하세요 -->

<div class="wrap">
<br><br>
<h3 style="text-align: center;">모든 후기 관리</h3>
<div style="color:gray; text-align: center;">사용자들의 모든 후기 <b>원본</b>입니다. <br>선정 버튼을 눌러 우수 후기 영역으로 복사할 수 있습니다.</div>


<!-- 후기 전송 삭제 -->



<!-- 돌아가기 버튼 -->
<a href="./review_list.me" style="color:white; font-size:13;"><div class="doit" style="text-align: center; position: fixed; bottom:144px; right:28px; z-index:1000; box-shadow: 0 5px 18px -7px rgba(0,0,0,1);">
<svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-truck-flatbed" viewBox="0 0 16 16">
  <path d="M11.5 4a.5.5 0 0 1 .5.5V5h1.02a1.5 1.5 0 0 1 1.17.563l1.481 1.85a1.5 1.5 0 0 1 .329.938V10.5a1.5 1.5 0 0 1-1.5 1.5H14a2 2 0 1 1-4 0H5a2 2 0 1 1-4 0 1 1 0 0 1-1-1v-1h11V4.5a.5.5 0 0 1 .5-.5zM3 11a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm9 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm1.732 0h.768a.5.5 0 0 0 .5-.5V8.35a.5.5 0 0 0-.11-.312l-1.48-1.85A.5.5 0 0 0 13.02 6H12v4a2 2 0 0 1 1.732 1z"/>
</svg>
<br><b>나가기</b>

</div></a>  
<!-- 돌아가기 버튼 -->




<%
if (request.getParameter("pageNumber") != null) {
   pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
}
%>
<br>
<div style="margin:0 auto; width:68%; font-size:13px;">
<table style="vertical-align: middle; width:100%">
<%
if(reviewList != null){
%>
<tr>
	<td class="col-2 tableTitle">순번</td>
	<td class="col-1 tableTitle" id="hidden_725">아이디</td>
	<td class="col-1 tableTitle" id="hidden_725">이름</td>
	<td class="col-2 tableTitle" id="hidden_725">직업</td>
	<td class="col-4 tableTitle">내용</td>
	<td class="col-2 tableTitle">관리</td>
</tr>
<%
for(int i=0; i<reviewList.size(); i++){
	String str1 = reviewList.get(i).getReview_contents();
	String str2 = str1.replace("\r\n", "<br>");
%>
<tr>
<td><%=reviewList.get(i).getAll_review_id() %></td>
<td id="hidden_725"><%=reviewList.get(i).getM_id() %></td>
<td id="hidden_725"><%=reviewList.get(i).getReview_name() %></td>
<td id="hidden_725"><%=reviewList.get(i).getReview_job() %></td>
<td class="tableContent"><%=str2 %></td>
<td class="tableManager"><span class="button2"><a onclick="allReviewSend(<%=reviewList.get(i).getAll_review_id()%>)">선정</a></span>
<span class="button3"><a onclick="allReviewDeleteCheck(<%=reviewList.get(i).getAll_review_id()%>)">삭제</a></span></td>
</tr>

<!-- 후기 전송 폼 -->
<form id="allReviewSendForm<%=reviewList.get(i).getAll_review_id()%>" action="allReviewSend.me" method="post" style="display: none"><input type="hidden" name="all_review_id" value="<%=reviewList.get(i).getAll_review_id()%>"></form>

<!-- 후기 삭제 폼 -->
<form id="allReviewDeleteForm<%=reviewList.get(i).getAll_review_id()%>" action="allReviewDelete.me" method="post" style="display: none">
<input type="hidden" name="all_review_id" value="<%=reviewList.get(i).getAll_review_id()%>">
</form>



<% } %>
</table>
</div>

<% }else{ %>
<div>등록된 후기가 없습니다.</div>
<% } %>




<br><br><br>
<!-- 보노보노 자바스크립트 -->
<script type="text/javascript">
var bDisplay = true;
function bono() {
   var con = document.getElementById("slidebox2");
   if (con.style.display == "none") {
      con.style.display = "block";
   } else {
      con.style.display = "none";
   }
}
</script>
<!-- 보노보노 자바스크립트 -->




<!-- 여기부터 위를 수정하세요 -->
<!-- 여기부터 위를 수정하세요 -->


<!-- 여기부터 footer -->    
<%@ include file="/footer.jsp" %>
</div>
</body>
</html>
