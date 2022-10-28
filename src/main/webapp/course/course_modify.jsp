<%@page import="vo.PageInfo"%>
<%@page import="vo.CourseBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
CourseBean course = (CourseBean) request.getAttribute("course");
PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
%>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>강의 수정</title>

<%@ include file= "../header.jsp"%>

<style type="text/css">
#writeForm {
   width: 75%;
   margin: auto;
}

h2 {
   text-align: center;
}

img {
   width: 303px;
   height: 250px;
}

table {
   margin: auto;
   width: 70%;
}

.td_left {
   width: 150px;
}

.td_right {
   width: 300px;
}

#commandCell {
   text-align: center;
}
#C_IMG{
display:none;
}

#C_CONTENT{
	width: 100%;
}
#C_DATE{
	width: 224px;
}
input::file-selector-button {
   width: 100px; 
   height: 30px; 
   color: #62b6cb; 
   background: #fff; 
   border: 1px solid #62b6cb; 
   border-radius: 5px; 
   cursor: pointer; 
}

/* medium 이상(태블릿, 768px 이상) */
@media ( min-width : 768px) {
.mobile {
	display: none;
}
}
@media ( max-width : 767px) {
.pc {
	display: none;
}
#C_NO, #C_TITLE, #P_NAME, #C_DATE, #C_VOL{
	width: 303px
}
}
</style>

<script>
	$(function(){
		$("#thImgBtn").on("click", function(){
			$(this).prev().prev().toggle();
			$(this).prev().toggle();
			$(this).toggle();
		});
		
	});
	$(function(){
		$("#ImgBtn").on("click", function(){
			$(this).prev().prev().toggle();
			$(this).prev().toggle();
			$(this).toggle();
		});
		
	});
</script>
</head>
<body>
   <!-- 강의 수정 -->
   <div id="writeForm" class="pc">
   <br><br><br>
      <h2>강의 수정</h2>
      <hr>
      <form action="courseModifyPro.me" method="post" enctype="multipart/form-data" name="modifyform">
         <input type="hidden" name="C_NO" value="<%=course.getC_NO()%>">
         <input type="hidden" name="page" value="${page}">
         <table class="table">
            <tr>
               <td class="td_left"><label for="C_NO">강의번호</label></td>
               <td class="td_right"><input type="number" max="9999" name="C_NO" id="C_NO" readonly
                  value="<%=course.getC_NO()%>"></td>
            </tr>
            <tr>
               <td class="td_left"><label for="C_TITLE">강의명</label></td>
               <td class="td_right"><input type="text" name="C_TITLE"
                  id="C_TITLE" value="<%=course.getC_TITLE()%>"></td>
            </tr>
            <tr>
               <td class="td_left"><label for="P_NAME">교수명</label></td>
               <td class="td_right"><input type="text" name="P_NAME"
                  id="P_NAME" value="<%=course.getP_NAME()%>"></td>
            </tr>
            <tr>
               <td class="td_left"><label for="C_DATE">개강일자</label></td>
               <td class="td_right"><input type="date" name="C_DATE"
                  id="C_DATE" value="<%=course.getC_DATE()%>"></td>
            </tr>
            <tr>
               <td class="td_left"><label for="C_VOL">강좌수</label></td>
               <td class="td_right"><input type="number" max="9999" name="C_VOL"
                  id="C_VOL" value="<%=course.getC_VOL()%>"></td>
            </tr>
            <tr>
               <td class="td_left"><label for="C_CONTENT">강의설명</label></td>
               <td><textarea style="resize: none;" id="C_CONTENT"
                     name="C_CONTENT" cols="40" rows="15"><%=course.getC_CONTENT()%></textarea>
               </td>
            </tr>
            <tr>
               <td class="td_left"><label for="C_IMG"> 파일첨부 </label></td>
               <td class="td_right">
                  <img src="./courseUpload/<%=course.getC_IMG()%>" alt="<%=course.getC_IMG()%>">
                  <input type="file" name="C_IMG" id="C_IMG">
                  <button type="button" class="btn btn-outline-primary" id="thImgBtn">이미지 변경</button>
                     <span id="show_C_IMG">
                  <%=course.getC_IMG()%>
                  </span>
                  </td>
            </tr>
         </table>
        
         <div id="commandCell">
            <a href='courseList.me?page=<%=request.getParameter("page")%>'><input type="button" class="btn btn-outline-primary" value="목록"></a>&nbsp;&nbsp;
            <input type="submit" class="btn btn-outline-primary" value="수정">&nbsp;&nbsp; 
            <a href="javascript:history.go(-1)"><input type="button" class="btn btn-outline-primary" value="뒤로가기"></a>
         </div>
      </form>
   </div>
   
<!--  			모바일 뷰 -->
 <div id="writeForm" class="mobile">
   <br><br><br>
      <h2>강의 수정</h2>
      <hr>
      <form action="courseModifyPro.me" method="post" enctype="multipart/form-data" name="modifyform">
         <input type="hidden" name="C_NO" value="<%=course.getC_NO()%>">
         <input type="hidden" name="page" value="${page}">
         <table class="table">
            <tr>
               <td><label for="C_NO">강의번호<br>
               <input type="number" max="9999" name="C_NO" id="C_NO"
                  value="<%=course.getC_NO()%>" readonly>
               </label>
                  </td>
            </tr>
            <tr>
               <td><label for="C_TITLE">강의명<br>
               <input type="text" name="C_TITLE"
                  id="C_TITLE" value="<%=course.getC_TITLE()%>">
               </label>
                  </td>
            </tr>
            <tr>
               <td><label for="P_NAME">교수명<br>
               <input type="text" name="P_NAME"
                  id="P_NAME" value="<%=course.getP_NAME()%>">
               </label>
                  </td>
            </tr>
             <tr>
               <td><label for="C_DATE">개강일자<br>
               <input type="date" name="C_DATE"
                  id="C_DATE" value="<%=course.getC_DATE()%>">
               </label>
                  </td>
            </tr>
            <tr>
               <td><label for="C_VOL">강좌수<br> 
               <input type="number" max="9999" name="C_VOL"
                  id="C_VOL" value="<%=course.getC_VOL()%>">
               </label>
                  </td>
            </tr>
            <tr>
               <td><label for="C_CONTENT">강의설명
               <textarea style="resize: none;" id="C_CONTENT"
                     name="C_CONTENT" cols="30" rows="15"><%=course.getC_CONTENT()%></textarea>
               </label>
               </td>
            </tr>
            <tr>
               <td><label for="C_IMG"> 파일첨부
                  <img src="./courseUpload/<%=course.getC_IMG()%>" alt="<%=course.getC_IMG()%>">
                  <br>
                  <input type="file" name="C_IMG" id="C_IMG">
                  <button type="button" class="btn btn-outline-primary" id="ImgBtn">이미지 변경</button>
                     <span id="show_C_IMG">
                  <%=course.getC_IMG()%>
                  </span>
               </label>
               </td>
            </tr>
         </table>
        <br>
         <div id="commandCell">
            <a href='courseList.me?page=<%=request.getParameter("page")%>'><input type="button" class="btn btn-outline-primary" value="목록"></a>&nbsp;&nbsp;
            <input type="submit" class="btn btn-outline-primary" value="수정">&nbsp;&nbsp; 
            <a href="javascript:history.go(-1)"><input type="button" class="btn btn-outline-primary" value="뒤로가기"></a>
         </div>
      </form>
   </div>
	<br>
	<br>
   <%@ include file="../footer.jsp"%>
</body>
</html>