<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<!-- CDN方式 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- 去WebJars網站抓Maven檔的方式 -->
<%-- 	<script type="text/javascript" src="<c:url value='/webjars/jquery/3.6.0/jquery.js' />"></script> --%>
<!-- 直接去jq官網或Maven下載至本機方式 -->
<%-- <script type="text/javascript" src="<c:url value='/javascript/jquery-3.6.0.min.js' />"></script> --%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/style.css'  />">
<meta charset="UTF-8">
<title>Spring Boot 範例</title>
</head>
<body>
	<div align='center'>
		<h2>Spring Boot 範例 03-29</h2>
		<h2>${pageContext.request.contextPath}</h2>
		<h2>
			<c:url value="/" />
		</h2>
		<hr>
		<a href="<c:url value='/hello' />?name=Lisa"> Hello </a><br> <a
			href="<c:url value='/ch02/getWebImages' />">Penelope_Cruz </a><br>
		<p>jquery測試</p>
		<input type="button" id="btn2" value="h標籤變色"> <img alt="img"
			src="<c:url value='/images/img1.jpg' />">

		<script type="text/javascript">
			$("#btn2").click(function() {
				$("p").css("background-color", "pink");
			});
		</script>
	</div>
</body>
</body>
</html>
