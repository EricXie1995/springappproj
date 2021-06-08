<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css'  />">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align='center'>
   <h2>${helloMessage}</h2>
   <hr>
   
   <a href="<c:url value='/' />">回首頁</a>
</div>
</body>
</html>