<%@page import="vo.PageInfo"%>
<%@page import="vo.CourseBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.SimpleDateFormat" %>

<%

   CourseBean course = (CourseBean)request.getAttribute("course");
   PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 상세보기 origin</title>
<style type="text/css">
#courseForm {
   width: 75%;
   margin: auto;
}

h2 {
   text-align: center;
}

img {
   width: 303px;
   height:250px; 
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

#commandList {
   text-align: center;
}

#C_CONTENT{
	width: 100%;
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
}
</style>
<%@ include file="../header.jsp" %>
</head>

<body>
   <div id="courseForm" class="pc">
   	<br><br><br>		
      <h2>강의 상세보기</h2>
      <hr>
         <table class="table">
            <tr>
               <td class="td_left"><label for="C_NO">강의번호</label></td>
               <td class="td_right"><%=course.getC_NO()%></td>
            </tr>
            <tr>
               <td class="td_left"><label for="C_TITLE">강의명</label></td>
               <td class="td_right"><%=course.getC_TITLE()%></td>
            </tr>
            <tr>
               <td class="td_left"><label for="P_NAME">교수명</label></td>
               <td class="td_right"><%=course.getP_NAME()%></td>
            </tr>
            <tr>
               <td class="td_left"><label for="C_DATE">개강일자</label></td>
               <td class="td_right"><%=course.getC_DATE()%></td>
            </tr>
            <tr>
               <td class="td_left"><label for="C_VOL">강좌수</label></td>
               <td class="td_right"><%=course.getC_VOL()%></td>
            </tr>
            <tr>
               <td class="td_left"><label for="C_CONTENT">강의설명</label></td>
               <td><textarea style="resize: none;" id="C_CONTENT" name="C_CONTENT"
                     cols="40" rows="15" readonly><%=course.getC_CONTENT()%></textarea></td>
            </tr>
            <tr>
               <td class="td_left"><label for="C_IMG"> 강의 썸네일 </label></td>
               <td class="td_right"><img src="./courseUpload/<%=course.getC_IMG()%>" alt="<%=course.getC_IMG()%>"></td>
            </tr>
         </table>
         
   <form name="deleteForm" method="post" id="delsub">
   <div id="commandList">
            <a href="courseList.me?page=${page}"><input type="button" class="btn btn-outline-primary" value="목록"></a>&nbsp;&nbsp; 
			<a href="courseModifyForm.me?c_no=<%=course.getC_NO()%>&page=${page}"><input type="button" class="btn btn-outline-primary" value="수정"></a>&nbsp;&nbsp;  
            <input type="button" class="btn btn-outline-primary" onclick="del()" value="삭제">
         </div>
   </form>
   </div>
   
<!-- 			모바일 뷰 -->
   <div id="courseForm" class="mobile">
   	<br><br><br>		
      <h2>강의 상세보기</h2>
      <hr>
         <table class="table">
            <tr>
               <td><label for="C_NO">강의번호<br>
               <%=course.getC_NO()%>
               </label></td>
            </tr>
            <tr>
               <td><label for="C_TITLE">강의명<br>
               <%=course.getC_TITLE()%>
               </label></td>
            </tr>
            <tr>
               <td><label for="P_NAME">교수명<br>
               <%=course.getP_NAME()%>
               </label></td>
            </tr>
            <tr>
               <td><label for="C_DATE">개강일자<br>
               <%=course.getC_DATE()%>
               </label></td>
            </tr>
            <tr>
               <td><label for="C_VOL">강좌수<br>
               <%=course.getC_VOL()%>
               </label></td>
            </tr>
            <tr>
               <td><label for="C_CONTENT">강의설명<br>
               <textarea style="resize: none;" id="C_CONTENT" name="C_CONTENT"
                     cols="40" rows="15" readonly><%=course.getC_CONTENT()%></textarea>
               </label></td>
            </tr>
            <tr>
               <td><label for="C_IMG">강의 썸네일
               <img src="./courseUpload/<%=course.getC_IMG()%>" alt="<%=course.getC_IMG()%>">
               </label></td>
            </tr>
         </table>
         
   <form name="deleteForm" method="post" id="delsub">
   <div id="commandList">
            <a href="courseList.me?page=${page}"><input type="button" class="btn btn-outline-primary" value="목록"></a>&nbsp;&nbsp; 
			<a href="courseModifyForm.me?c_no=<%=course.getC_NO()%>&page=${page}"><input type="button" class="btn btn-outline-primary" value="수정"></a>&nbsp;&nbsp;  
            <input type="button" class="btn btn-outline-primary" onclick="del()" value="삭제">
         </div>
   </form>
   </div>
   

   
      <script>
       function del(){
          var delConfirm = confirm('정말 삭제하시겠습니까?');
       
         if (delConfirm) {

            alert('삭제되었습니다.');
            location.href = 'courseDeletePro.me?c_no=<%=course.getC_NO() %>&page=<%=request.getParameter("page")%>';
            
         }
         else {
            alert('삭제가 취소되었습니다.');
         }
       }
       
      </script>
<br><br><br>   
<%@ include file="../footer.jsp" %>
</body>
</html>