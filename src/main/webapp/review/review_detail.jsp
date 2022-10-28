<%@ page import="vo.ReviewBean,java.util.*" %>  

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	ReviewBean article = (ReviewBean)request.getAttribute("article");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 상세보기</title>
<%@ include file="/header.jsp" %>
<style>
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
</head>
<body>
<div class="wrap">

<!-- 여기까지 header -->
    
<!-- 여기부터 아래를 수정하세요 -->
<!-- 여기부터 아래를 수정하세요 -->
<%
ArrayList<ReviewBean> reviewList = (ArrayList<ReviewBean>)request.getAttribute("articleList");
%>

<br>순번: <%=article.getReview_id() %> 
<br>작성자: <%=article.getReview_name() %>
<br>
<br>후기: <br><div style="background-color:gray;">
<%=article.getReview_contents() %></div>
     



<!-- 여기부터 위를 수정하세요 -->
<!-- 여기부터 위를 수정하세요 -->


<!-- 여기부터 footer --> 
     
<%@ include file="/footer.jsp" %>
</div>

</body>
</html>