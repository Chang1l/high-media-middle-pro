<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage = "true" %>
<!DOCTYPE html>
<html>
<head>
<title>Exception Error</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<style>
body {
    background: #f5f5f5;
    font-family: 'Noto Sans', sans-serif;
    margin: 0;
    color: #4c5667;
    overflow-x: hidden !important;
    padding-top:40px;
}

.message-box h1 {
    color: #252932;
    font-size: 98px;
    font-weight: 700;
    line-height: 98px;
    text-shadow: rgba(61, 61, 61, 0.3) 1px 1px, rgba(61, 61, 61, 0.2) 2px 2px, rgba(61, 61, 61, 0.3) 3px 3px;
}
</style>
</head>
<body>

<div class="ex-page-content bootstrap snippets bootdeys">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <svg class="svg-box" width="380px" height="500px" viewBox="0 0 837 1045" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:sketch="http://www.bohemiancoding.com/sketch/ns">
                    <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" sketch:type="MSPage">
                        <path d="M353,9 L626.664028,170 L626.664028,487 L353,642 L79.3359724,487 L79.3359724,170 L353,9 Z" id="Polygon-1" stroke="#3bafda" stroke-width="6" sketch:type="MSShapeGroup"></path>
                        <path d="M78.5,529 L147,569.186414 L147,648.311216 L78.5,687 L10,648.311216 L10,569.186414 L78.5,529 Z" id="Polygon-2" stroke="#7266ba" stroke-width="6" sketch:type="MSShapeGroup"></path>
                        <path d="M773,186 L827,217.538705 L827,279.636651 L773,310 L719,279.636651 L719,217.538705 L773,186 Z" id="Polygon-3" stroke="#f76397" stroke-width="6" sketch:type="MSShapeGroup"></path>
                        <path d="M639,529 L773,607.846761 L773,763.091627 L639,839 L505,763.091627 L505,607.846761 L639,529 Z" id="Polygon-4" stroke="#00b19d" stroke-width="6" sketch:type="MSShapeGroup"></path>
                        <path d="M281,801 L383,861.025276 L383,979.21169 L281,1037 L179,979.21169 L179,861.025276 L281,801 Z" id="Polygon-5" stroke="#ffaa00" stroke-width="6" sketch:type="MSShapeGroup"></path>
                    </g>
                </svg>
            </div>
    
            <div class="col-sm-6">
                <div class="message-box">
                    <h1 class="m-b-0">Sorry</h1><br>
                    <strong>요청 처리 과정에서 에러가 발생하였습니다.</strong>
                    <p>빠른 시간 내에 문제를 해결하도록 하겠습니다.</p>
                    <p>에러 타입: <%= exception.getClass().getName() %> <br>
					  에러 메시지: <b><%= exception.getMessage() %></b>
					</p>
                    <div class="buttons-con">
                        <div class="action-link-wrap">
                            <a href="javascript:history.back();" class="btn btn-custom btn-info waves-effect waves-light m-t-20">Go Back</a>
                            <a href="index.jsp" class="btn btn-custom btn-info waves-effect waves-light m-t-20">Go to Home Page</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<!--
서버가 처리 방법을 모르는 상황이 발생했습니다. 서버는 아직 처리 방법을 알 수 없습니다.
서버가 처리 방법을 모르는 상황이 발생했습니다. 서버는 아직 처리 방법을 알 수 없습니다.
-->
