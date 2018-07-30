<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="output"></div>
<script type="text/javascript">
	
	var str = "안녕하세요.__ 반갑습니다.__안녕하세요.__ 반갑습니다.__안녕하세요.__ 반갑습니다.__안녕하세요.__ 반갑습니다.__";
	str = str.replace(/__/g, "<br>");
	document.getElementById('output').innerHTML = str;	
	
</script>

</body>
</html>