<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.CourseBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.SimpleDateFormat" %>

<%
	int rc= (int)request.getAttribute("registc_no");


   CourseBean course = (CourseBean)request.getAttribute("course");
   PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
%>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title><%=course.getC_TITLE()%></title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <%@ include file="../header.jsp" %>
<style type="text/css">
   .con{
   padding: 1rem 3rem;
   }
   .btn{
   margin-top: 8px;
   cursor : pointer;
   }
    .row{  
    flex-direction: column;  
       flex-wrap: wrap;
    align-content: center;  
   }
   </style>
        
   
    <script>
    $(document).ready(function() {
        $('#btn_notlogin').click(notlogin);
     });
     function notlogin() {
        alert("로그인 후 진행 해 주시기 바랍니다.");
        location.href ="memberLogin.me"

     };
    </script>
     </head>
    <body>
    
        <!-- Product section-->
     <div class="container py-4">

    <div class="row align-items-md-stretch">
      <div class="col-md-6">
        <div class="h-100 p-1 text-white rounded-3">
          <img class="card-img-top mb-5 mb-md-0" style="margin-bottom:1rem!important;" src="./courseUpload/<%=course.getC_IMG()%>" alt="<%=course.getC_IMG()%>" />
        </div>
      </div>
      <div class="col-md-6">
        <div class=" con h-100 border rounded-3">
          <h2><%=course.getC_TITLE()%></h2>
          <p><%=course.getP_NAME()%></p>
          <p>총 <%=course.getC_VOL()%> 강</p>
          <p>개강일자&nbsp;&nbsp;<%=course.getC_DATE()%></p>
          <p><%=course.getC_CONTENT()%></p>
        <div class= row>
        <%if(session.getAttribute("id")!=null && (course.getC_NO()==rc) ) { %>
                     <button class="btn btn-primary flex-shrink-0" type="button"  onclick="location.href='./RegistInsert.me?c_no=<%=course.getC_NO()%>' ">
                                신청 완료</button>
        <%}else if(session.getAttribute("id")!=null)  {%>
               <button class="btn btn-primary flex-shrink-0" type="button"  onclick="location.href='./RegistInsert.me?c_no=<%=course.getC_NO()%>' ">
                                수강 신청</button>
                        
    				    <%} else{ %>
                       
                               <input id="btn_notlogin" class="btn btn-primary" type="button" value="수강신청">
  
                       
                       <%} %>
      	<input class="btn btn-outline-primary" type="button" value="강의목록" onclick="location.href='usercourseList.me?page=${page}'">
        </div>
        </div>
      </div>
    </div>
    </div>
     <!-- 여기부터 footer --> 
     
<%@ include file="../footer.jsp" %>   
    </body>
</html>
